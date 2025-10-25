#include "relay_pwm_manager.h"

#define FCY 16000000UL

typedef struct
{
    volatile uint16_t *tris;
    volatile uint16_t *lat;
    uint16_t mask;
} relay_pin_t;

// Relay mapping (positive logic)
static const relay_pin_t RELAYS[6] = {
    {&TRISB, &LATB, (1u << 7)}, // 1R
    {&TRISB, &LATB, (1u << 8)}, // 2R
    {&TRISB, &LATB, (1u << 9)}, // 3R
    {&TRISE, &LATE, (1u << 1)}, // 1L
    {&TRISE, &LATE, (1u << 0)}, // 2L
    {&TRISF, &LATF, (1u << 1)}  // 3L
};

static uint8_t active_pod = 0xFF;
static uint8_t pulse_intensity = 100;
static uint16_t pulse_duration_ms = 0;
static uint16_t pulse_timer_ms = 0;
static bool pulse_on = false;

// ------------------------------------------------------------
// Relay control
// ------------------------------------------------------------
static inline void relay_on(uint8_t pod)
{
    *RELAYS[pod].lat |= RELAYS[pod].mask;
}

static inline void relay_off(uint8_t pod)
{
    *RELAYS[pod].lat &= ~RELAYS[pod].mask;
}

static inline void all_relays_off(void)
{
    for (uint8_t i = 0; i < 6; i++)
    {
        relay_off(i);
    }
}

// ------------------------------------------------------------
// Initialize relays and CCP PWM modules
// ------------------------------------------------------------
void relay_pwm_init(void)
{
    uint8_t i;

    // --- Relays ---
    for (i = 0; i < 6; i++)
    {
        *RELAYS[i].tris &= ~RELAYS[i].mask; // Output
        relay_off(i);
    }

    // --- Timer2 for PWM timebase ---
    T2CON = 0;
    TMR2 = 0;
    PR2 = 0xFFFF;
    T2CONbits.TCKPS = 0; // 1:1 prescale
    T2CONbits.TON = 0;

    // --- CCP1 (Right) ---
    CCP1CON1L = 0; // Disable
    CCP1CON2H = 0;
    CCP1CON1L = 0x0005;        // Dual edge compare mode
    CCP1CON1L |= (0b000 << 4); // Select Timer2 (TMRPS=0)
    CCP1PRL = 0xFFFF;
    CCP1RA = 0;
    CCP1RB = 0;
    CCP1CON1Lbits.CCPON = 0; // Stay off for now

    // --- CCP2 (Left) ---
    CCP2CON1L = 0;
    CCP2CON2H = 0;
    CCP2CON1L = 0x0005;
    CCP2CON1L |= (0b000 << 4);
    CCP2PRL = 0xFFFF;
    CCP2RA = 0;
    CCP2RB = 0;
    CCP2CON1Lbits.CCPON = 0;

    // --- Timer4 for 1ms tick ---
    T4CON = 0;
    TMR4 = 0;
    PR4 = (uint16_t)(FCY / 1000UL / 256UL);
    T4CONbits.TCKPS = 0b11; // 1:256 prescale
    IEC1bits.T4IE = 1;
    IFS1bits.T4IF = 0;
    T4CONbits.TON = 1;
}

// ------------------------------------------------------------
// PWM start/stop
// ------------------------------------------------------------
static void pwm_start(uint8_t pod, uint16_t freq)
{
    uint16_t pr2 = (uint16_t)((FCY / (2UL * freq)) - 1);
    PR2 = pr2;

    if (pod < 3)
    {
        CCP1PRL = pr2;
        CCP1RA = pr2 / 4;       // rising edge
        CCP1RB = (3 * pr2) / 4; // falling edge (50% duty)
        CCP1CON1Lbits.CCPON = 1;
    }
    else
    {
        CCP2PRL = pr2;
        CCP2RA = pr2 / 4;
        CCP2RB = (3 * pr2) / 4;
        CCP2CON1Lbits.CCPON = 1;
    }

    T2CONbits.TON = 1;
}

static void pwm_stop(void)
{
    CCP1CON1Lbits.CCPON = 0;
    CCP2CON1Lbits.CCPON = 0;
    T2CONbits.TON = 0;
}

// ------------------------------------------------------------
// Fire a pod?s PWM + relay with pulsing
// ------------------------------------------------------------
void relay_pwm_fire(uint8_t pod_index, uint16_t freq_hz, uint16_t duration_ms, uint8_t intensity)
{
    if (pod_index >= 6)
    {
        return;
    }

    all_relays_off();
    relay_on(pod_index);

    pwm_start(pod_index, freq_hz);

    active_pod = pod_index;
    pulse_intensity = intensity;
    pulse_duration_ms = duration_ms;
    pulse_timer_ms = 0;
    pulse_on = true;
}

void relay_pwm_stop(void)
{
    pwm_stop();
    all_relays_off();
    active_pod = 0xFF;
    pulse_duration_ms = 0;
    pulse_on = false;
}

// ------------------------------------------------------------
// Timer4 ISR: handles 1ms tick for pulsing and duration
// ------------------------------------------------------------
void __attribute__((interrupt, no_auto_psv)) _T4Interrupt(void)
{
    IFS1bits.T4IF = 0;

    if (active_pod == 0xFF)
    {
        return;
    }

    pulse_timer_ms++;

    uint16_t on_ms = (pulse_intensity * 1000UL) / 100;
    uint16_t off_ms = 1000UL - on_ms;

    if (pulse_on)
    {
        if (pulse_timer_ms >= on_ms)
        {
            pwm_stop();
            pulse_on = false;
            pulse_timer_ms = 0;
        }
    }
    else
    {
        if (pulse_timer_ms >= off_ms)
        {
            pwm_start(active_pod, 170000); // re-enable PWM at nominal freq
            pulse_on = true;
            pulse_timer_ms = 0;
        }
    }

    // Duration countdown
    if (pulse_duration_ms)
    {
        if (pulse_duration_ms > 1)
        {
            pulse_duration_ms--;
        }
        else
        {
            relay_pwm_stop();
        }
    }
}
