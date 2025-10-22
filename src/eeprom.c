#include "eeprom.h"

void eeprom_init()
{
    //
}

void epprom_deinit()
{
    //
}

/*
void wait_for_write(i2c_regs_t *r)
{
    // Poll device until it ACKs (write complete)
    do
    {
        start(r);
        write(r, (EEPROM_ADDR << 1) | 0); // Write control byte
        stop(r);
    } while (ack_stat(r));
}
    */

void eeprom_write_byte(i2c_regs_t *r, uint8_t memAddr, uint8_t data)
{
    start(r);
    write(r, (EEPROM_ADDR << 1) | 0); // Write mode
    write(r, memAddr);
    write(r, data);
    stop(r);

    // wait_for_write(r); // Wait for internal write cycle
    __delay_ms(10);
}

uint8_t eeprom_read_byte(i2c_regs_t *r, uint8_t memAddr)
{
    uint8_t data;

    start(r);
    write(r, (EEPROM_ADDR << 1) | 0); // Write mode
    write(r, memAddr);
    restart(r);
    write(r, (EEPROM_ADDR << 1) | 1); // Read mode
    data = read(r, 1);                // NACK after last byte
    stop(r);

    return data;
}