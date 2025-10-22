/**
 * @file eeprom.h
 * @author Walt
 * @brief eeprom driver
 * @version 0.1
 * @date 2025-10-22
 *
 * @copyright Copyright (c) 2025
 *
 */

#ifndef __EEPROM_H__
#define __EEPROM_H__

#include <stdbool.h>
#include <stdint.h>

#include "i2c.h"

typedef enum
{
    EEPROM_SUCCESS,
    EEPROM_READ_FAIL,
    EEPROM_WRITE_FAIL,
} eeprom_status_t;

typedef struct
{
    bool init;
    i2c_regs_t *i2c;
} eeprom_t;

void eeprom_init(eeprom_t *e);
void epprom_deinit(eeprom_t *e);
void eeprom_write_byte(eeprom_t *e, uint8_t memAddr, uint8_t data);
uint8_t eeprom_read_byte(eeprom_t *e, uint8_t memAddr);

#endif /* __EEPROM_H__ */
