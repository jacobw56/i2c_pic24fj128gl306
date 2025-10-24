/*
 * File:   main.c
 * Author: gregorytidanian
 *
 * Created on October 17, 2025, 8:38 PM
 */

#define FCY 16000000UL /*   Adjust if using different oscillator. \
                            Needs to be before xc or libpic30, don't know which */
#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <libpic30.h>
#include "i2c_async.h"
#include "pod_manager_async.h"

static i2c_async_t i2c1_async;
static pod_manager_async_t podman;

void system_init(void)
{
    static const i2c_regs_t i2c1_regs = {
        &I2C1CONL, &I2C1STAT, &I2C1BRG, &I2C1TRN, &I2C1RCV};
    i2c_async_init(&i2c1_async, &i2c1_regs, 0x12);
    pod_manager_async_init(&podman, &i2c1_async);
    T3CON = 0;
    TMR3 = 0;
    PR3 = (uint16_t)((16000000UL / 256UL) * 0.1);
    T3CONbits.TCKPS = 0b11;
    IFS0bits.T3IF = 0;
    IEC0bits.T3IE = 1;
    T3CONbits.TON = 1;
    INTCON2bits.GIE = 1;
}

void __attribute__((__interrupt__, no_auto_psv)) _T3Interrupt(void)
{
    IFS0bits.T3IF = 0;
    pod_manager_async_poll(&podman);
}

int main(void)
{
    system_init();
    while (1)
    {
        uint8_t active = 0;
        for (uint8_t i = 0; i < POD_BAY_COUNT; i++)
            if (podman.pods[i].active)
            {
                active++;
            }
        __delay_ms(50);
    }
}