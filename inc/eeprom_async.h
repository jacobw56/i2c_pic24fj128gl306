/**
 * @file eeprom_async.h
 * @author Walt
 * @brief eeprom async driver
 * @version 0.1
 * @date 2025-10-22
 *
 * @copyright Copyright (c) 2025
 *
 */

#ifndef __EEPROM_ASYNC_H__
#define __EEPROM_ASYNC_H__

#include <stdint.h>
#include <stdbool.h>
#include "i2c_async.h"

typedef enum
{
    EEPROMA_OK = 0,
    EEPROMA_ERR_NACK,
    EEPROMA_ERR_TIMEOUT
} eeproma_result_t;

typedef void (*eeproma_callback_t)(void *ctx, eeproma_result_t res);

typedef struct
{
    bool init;
    uint8_t address;
    i2c_async_t *i2c;
} eeproma_t;

void eeproma_init(eeproma_t *e, i2c_async_t *bus, uint8_t addr);
bool eeproma_read_block_async(eeproma_t *e, uint8_t start_addr, uint8_t *buf, uint8_t len,
                              eeproma_callback_t cb, void *ctx);

#endif
