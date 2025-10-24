#include "pod_manager_async.h"
#include <string.h>

static const uint8_t POD_ADDRS[POD_BAY_COUNT] = { 0x51, 0x52, 0x53, 0x54, 0x55, 0x56 };

static void pod_read_done(void *ctx, eeproma_result_t res);
static inline uint16_t u16_from_buf(uint8_t *b) { return ((uint16_t)b[0] << 8) | b[1]; }

void pod_manager_async_init(pod_manager_async_t *pm, i2c_async_t *bus)
{
    memset(pm, 0, sizeof(*pm));
    pm->bus = bus;
    for (uint8_t i = 0; i < POD_BAY_COUNT; i++) {
        pm->pods[i].bay = i;
        eeproma_init(&pm->pods[i].eeprom, bus, POD_ADDRS[i]);
    }
}

void pod_manager_async_poll(pod_manager_async_t *pm)
{
    for (uint8_t i = 0; i < POD_BAY_COUNT; i++) {
        poda_t *p = &pm->pods[i];
        eeproma_read_block_async(&p->eeprom, 0x00, p->buf, POD_EEPROM_BLOCK_SIZE,
                                 pod_read_done, p);
    }
}

static void pod_read_done(void *ctx, eeproma_result_t res)
{
    poda_t *p = (poda_t *)ctx;
    if (res == EEPROMA_OK) {
        memcpy(p->uid, &p->buf[0], 16);
        p->scent = u16_from_buf(&p->buf[16]);
        p->remaining = u16_from_buf(&p->buf[18]);
        p->frequency = u16_from_buf(&p->buf[20]);
        p->active = true;
    } else {
        p->active = false;
    }
}
