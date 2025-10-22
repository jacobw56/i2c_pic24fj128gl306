#include "i2c.h"

#define _I2C2 // This mcu has an i2c2

#define EEPROM_ADDR 0x51 // 7-bit device address (A2..A0 = 100)
#define TEST_ADDR 0x00   // Memory location to test
#define TEST_VALUE 0x31  // Value to write/read

typedef struct
{
    i2c_xfer_t *xfer;           // pointer to the transfer
    i2c_message_status_t *flag; // set with the error of the last trb sent.
                                // if all trb's are sent successfully,
                                // then this is I2C1_MESSAGE_COMPLETE
} i2c_queue_entry_t;

typedef struct
{
    /* Read/Write Queue */
    i2c_queue_entry_t *tail;     // tail of the queue
    i2c_queue_entry_t *head;     // head of the queue
    i2c_message_status_t status; // status of the last transaction
    uint8_t done_flag;           // flag to indicate the current
                                 // transaction is done
    uint8_t error_count;         // keeps track of errors
} queue_t;

static const i2c_regs_t i2c_instances[] = {
    {&I2C1CONL, &I2C1CONH, &I2C1STAT, &I2C1ADD, &I2C1MSK, &I2C1BRG, &I2C1TRN, &I2C1RCV},
#ifdef _I2C2
    {&I2C2CONL, &I2C2CONH, &I2C2STAT, &I2C2ADD, &I2C2MSK, &I2C2BRG, &I2C2TRN, &I2C2RCV},
#endif
};

static inline void enable(const i2c_regs_t *r, int enable)
{
    if (enable)
    {
        *r->CONL |= (1u << 15); // I2CEN bit in CONL (bit 15 on PIC24)
    }
    else
    {
        *r->CONL &= ~(1u << 15);
    }
}

static inline void set_brg(const i2c_regs_t *r, uint16_t brg)
{
    *r->BRG = brg;
}

static inline void receive_enable(const i2c_regs_t *r, int enable)
{
    *r->CONL |= (1u << 3); // PEN
    while (*r->CONL & (1u << 3))
        ;
}

static inline bool receive_buffer_is_full(const i2c_regs_t *r)
{
    return (bool)(*r->STAT & (1u << 1)); // RBF
}

static inline void ack_set(const i2c_regs_t *r, uint8_t ak)
{
    *r->CONL |= (ak << 5); // 0=ACK, 1=NACK
    while ((*r->CONL & (1u << 5)) != ak)
        ;
}

static inline void ack(const i2c_regs_t *r)
{
    *r->CONL |= (1u << 4); // ACKEN
    while (*r->CONL & (1u << 4))
        ;
}

static inline bool ack_stat(const i2c_regs_t *r)
{
    return (bool)(*r->STAT & (1 << 15));
}

void i2c_init(i2c_idx_t idx, i2c_regs_t *r)
{
    r = &i2c_instances[idx];

    // Ensure TRIS configured as inputs (I2C module will drive them)
    // Ehhhhhh, probably no great way to decouple this other than to move it to system init.
    TRISGbits.TRISG2 = 1; // SCL1
    TRISGbits.TRISG3 = 1; // SDA1

    *r->CONL = 0;     // Clear config
    set_brg(r, 0x12); // set speed mode
    enable(r, 1);     // Enable I2C module
    __delay_ms(10);
}

static inline uint8_t i2c_read(const i2c_regs_t *r, uint8_t ak)
{
    uint8_t data;
    receive_enable(r, 1);
    while (!receive_buffer_is_full(r))
        ; // Wait for receive buffer to fill up

    data = *r->RCV; // get the actual data

    ack_set(r, ak); // 0=ACK, 1=NACK
    ack(r);
    return data;
}
