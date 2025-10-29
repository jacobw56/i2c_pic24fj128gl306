#include "pod_manager_async.h"
#include <string.h>

/**
 * Note that the i2c addess and relay pin mapping goes
 * Pod:         1R      2R      3R      1L      2L      3L
 * Pod number:  0       1       2       3       4       5
 * E2,E1,E0:    001     011     111     110     101     100
 * i2c Address: 0x51    0x53    0x57    0x56    0x55    0x54
 * Pin:         RB7     RB8     RB9     RE1     RE0     RF1
 */
static const uint8_t POD_ADDRS[POD_BAY_COUNT] = {0x51, 0x53, 0x57, 0x56, 0x55, 0x54};

static void pod_read_done(void *ctx, eeproma_result_t res);
static inline uint16_t u16_from_buf(uint8_t *b) { return ((uint16_t)b[0] << 8) | b[1]; }

void pod_manager_async_init(pod_manager_async_t *pm, i2c_async_t *bus)
{
    memset(pm, 0, sizeof(*pm));
    pm->bus = bus;
    for (uint8_t i = 0; i < POD_BAY_COUNT; i++)
    {
        pm->pods[i].bay = i;
        eeproma_init(&pm->pods[i].eeprom, bus, POD_ADDRS[i]);
    }
}

void pod_manager_async_poll(pod_manager_async_t *pm)
{
    for (uint8_t i = 0; i < POD_BAY_COUNT; i++)
    {
        poda_t *p = &pm->pods[i];
        eeproma_read_block_async(&p->eeprom, 0x00, p->buf, POD_EEPROM_BLOCK_SIZE,
                                 pod_read_done, p);
    }
}

static void pod_read_done(void *ctx, eeproma_result_t res)
{
    poda_t *p = (poda_t *)ctx;
    if (res == EEPROMA_OK)
    {
        memcpy(p->uid, &p->buf[0], 16);
        p->scent = u16_from_buf(&p->buf[16]);
        p->remaining = u16_from_buf(&p->buf[18]);
        p->active = true;
    }
    else
    {
        p->active = false;
    }
}

void pod_manager_fire(pod_manager_async_t *pm, uint8_t bay, uint16_t duration_ms, uint8_t intensity)
{
    if (bay >= POD_BAY_COUNT)
    {
        return;
    }
    poda_t *p = &pm->pods[bay];
    if (!p->active)
    {
        return;
    }
    relay_pwm_fire(bay, duration_ms, intensity);
}
