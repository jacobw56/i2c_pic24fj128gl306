/**
 * @file pod.h
 * @author Walt
 * @brief pod driver
 * @version 0.1
 * @date 2025-10-22
 *
 * @copyright Copyright (c) 2025
 *
 */

#ifndef __POD_H__
#define __POD_H__

#include <stdbool.h>
#include <stdint.h>

#include "eeprom.h"

typedef struct
{
    bool init;
} pod_t;

void pod_init(eeprom_t *e);
void pod_deinit(eeprom_t *e);

#endif /* __POD_H__ */