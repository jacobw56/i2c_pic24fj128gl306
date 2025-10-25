/**
 * @file pod_manager_async.h
 * @author Walt
 * @brief pod manager async
 * @version 0.1
 * @date 2025-10-22
 *
 * @copyright Copyright (c) 2025
 * 
 * Note that the i2c addess and relay pin mapping goes:
 * 
 * Pod:         1R      2R      3R      1L      2L      3L
 * ---------------------------------------------------------
 * Pod number:  0       1       2       3       4       5
 * E2,E1,E0:    001     011     111     110     101     100
 * i2c Address: 0x51    0x53    0x57    0x56    0x55    0x54
 * Pin:         RB7     RB8     RB9     RE1     RE0     RF1
 *
 */

#ifndef __POD_MANAGER_ASYNC_H__
#define __POD_MANAGER_ASYNC_H__

#include <stdbool.h>
#include <stdint.h>
#include <xc.h>
#include <libpic30.h>
#include "eeprom_async.h"
#include "relay_pwm_manager.h"

#define POD_BAY_COUNT 6
#define POD_EEPROM_BLOCK_SIZE 22

typedef struct
{
    bool active;
    uint8_t bay;
    uint8_t uid[16];
    uint16_t scent;
    uint16_t remaining;
    uint16_t frequency;
    eeproma_t eeprom;
    uint8_t buf[POD_EEPROM_BLOCK_SIZE];
} poda_t;

typedef struct
{
    i2c_async_t *bus;
    poda_t pods[POD_BAY_COUNT];
} pod_manager_async_t;

void pod_manager_async_init(pod_manager_async_t *pm, i2c_async_t *bus);
void pod_manager_async_poll(pod_manager_async_t *pm);
void pod_manager_fire(pod_manager_async_t *pm, uint8_t bay, uint16_t duration_ms, uint8_t intensity);

#endif
