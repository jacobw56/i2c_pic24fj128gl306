/**
 * @file pod_manager_async.h
 * @author Walt
 * @brief pod manager async
 * @version 0.1
 * @date 2025-10-22
 *
 * @copyright Copyright (c) 2025
 *
 */

#ifndef __POD_MANAGER_ASYNC_H__
#define __POD_MANAGER_ASYNC_H__

#include "eeprom_async.h"
#include <stdbool.h>
#include <stdint.h>

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

#endif
