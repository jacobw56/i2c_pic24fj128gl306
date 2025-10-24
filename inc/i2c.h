/**
 * @file i2c.h
 * @author Walt
 * @brief i2c driver
 * @version 0.1
 * @date 2025-10-22
 *
 * @copyright Copyright (c) 2025
 *
 */

#ifndef __I2C_H__
#define __I2C_H__

#include <stdint.h>
#include <stdbool.h>

typedef enum
{
    I2C_OK = 0,
    I2C_ERR_NACK,
    I2C_ERR_TIMEOUT,
    I2C_ERR_BUSCOLLISION,
    I2C_ERR_WRITE_COLLISION
} i2c_result_t;

typedef enum
{
    I2C_IDX1 = 0,
    I2C_IDX2 = 1
} i2c_idx_t;

typedef struct
{
    volatile uint16_t *CONL;
    volatile uint16_t *STAT;
    volatile uint16_t *BRG;
    volatile uint16_t *TRN;
    volatile uint16_t *RCV;
} i2c_regs_t;

typedef struct
{
    i2c_idx_t index;
    const i2c_regs_t *regs;
    bool initialized;
} i2c_t;

void i2c_init(i2c_t *bus, i2c_idx_t idx, uint32_t fcy, uint32_t fscl);
void i2c_deinit(i2c_t *bus);
i2c_result_t i2c_start(const i2c_t *bus);
i2c_result_t i2c_restart(const i2c_t *bus);
i2c_result_t i2c_stop(const i2c_t *bus);
i2c_result_t i2c_write_byte(const i2c_t *bus, uint8_t data);
i2c_result_t i2c_read_byte(const i2c_t *bus, uint8_t *data, bool ack);

#endif
