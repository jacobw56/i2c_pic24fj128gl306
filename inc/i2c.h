/**
 * @file i2c.h
 * @author Walt
 * @brief i2c driver
 * @version 0.1
 * @date 2025-10-22
 *
 * @copyright Copyright (c) 2025
 *
 * Ideally, the queue would be broken out to it's own module. Here it's coupled
 * this i2c driver (obviously) but it is also coupled to the presence of pods.
 * It would be nice to break that coupling.
 *
 */

#ifndef __I2C_H__
#define __I2C_H__

#include <stdbool.h>
#include <stdint.h>

typedef enum
{
    I2C_MESSAGE_FAIL,
    I2C_MESSAGE_PENDING,
    I2C_MESSAGE_COMPLETE,
    I2C_STUCK_START,
    I2C_MESSAGE_ADDRESS_NO_ACK,
    I2C_DATA_NO_ACK,
    I2C_LOST_STATE
} i2c_message_status_t;

typedef enum
{
    I2C_IDX1 = 0,
    I2C_IDX2 = 1
} i2c_idx_t;

typedef struct
{
    i2c_idx_t instance;
    volatile uint16_t *CONL;
    volatile uint16_t *CONH;
    volatile uint16_t *STAT;
    volatile uint16_t *ADD;
    volatile uint16_t *MSK;
    volatile uint16_t *BRG;
    volatile uint16_t *TRN;
    volatile uint16_t *RCV;
} i2c_regs_t;

typedef struct
{
    unsigned int pod;   // Pod number
    i2c_idx_t instance; // i2c instance
    uint8_t address;    // Bits <10:1> are the 10 bit address.
                        // Bits <7:1> are the 7 bit address
                        // Bit 0 is R/W (1 for read)
    uint8_t length;     // the # of bytes in the buffer
    uint8_t *pbuffer;   // a pointer to a buffer of length bytes
} i2c_xfer_t;

typedef struct
{
    i2c_idx_t instance;
    bool init;
    i2c_regs_t *regs;
} i2c_t;

void i2c_init(i2c_idx_t idx, i2c_regs_t *r);
void i2c_deinit(i2c_regs_t *r);
void i2c_start(const i2c_regs_t *r);
void i2c_restart(const i2c_regs_t *r);
void i2c_stop(const i2c_regs_t *r);
bool i2c_write(const i2c_regs_t *r, uint8_t b);
uint8_t i2c_read(const i2c_regs_t *r, uint8_t ak);
void writebyte(uint8_t memAddr, uint8_t data);
uint8_t readbyte(uint8_t memAddr);
// void waitforwrite(void);

static inline void i2c_start(const i2c_regs_t *r)
{
    *r->CONL |= (1u << 0); // SEN
    while (*r->CONL & (1u << 0))
        ;
}

static inline void i2c_restart(const i2c_regs_t *r)
{
    *r->CONL |= (1u << 1); // RSEN
    while (*r->CONL & (1u << 1))
        ;
}

static inline void i2c_stop(const i2c_regs_t *r)
{
    *r->CONL |= (1u << 2); // PEN
    while (*r->CONL & (1u << 2))
        ;
}

static inline bool i2c_write(const i2c_regs_t *r, uint8_t b)
{
    *r->TRN = b;
    while (*r->STAT & (1u << 0))
        ; // TBF
    while (*r->STAT & (1u << 14))
        ;                                           // TRSTAT
    return (bool)((*r->STAT & (1u << 15)) ? 1 : 0); // ACKSTAT (1 => NACK)
}

static inline void i2c_deinit(i2c_regs_t *r)
{
    *r->CONL = 0; // Clear config
}

#endif /* __I2C_H__ */
