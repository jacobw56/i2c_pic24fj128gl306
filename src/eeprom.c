#include "eeprom.h"

#define EEPROM_ADDR 0x51 // 7-bit device address (A2..A0 = 100)
#define TEST_ADDR 0x00   // Memory location to test
#define TEST_VALUE 0x31  // Value to write/read

void eeprom_init(eeprom_t *e)
{
    //
}

void epprom_deinit(eeprom_t *e)
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

void eeprom_write_byte(eeprom_t *e, uint8_t memAddr, uint8_t data)
{
    i2c_regs_t *r = e->i2c;

    start(r);
    write(r, (EEPROM_ADDR << 1) | 0); // Write mode
    write(r, memAddr);
    write(r, data);
    stop(r);

    // wait_for_write(r); // Wait for internal write cycle
    __delay_ms(10);
}

uint8_t eeprom_read_byte(eeprom_t *e, uint8_t memAddr)
{
    uint8_t data;
    i2c_regs_t *r = e->i2c;

    start(r);
    write(r, (EEPROM_ADDR << 1) | 0); // Write mode
    write(r, memAddr);
    restart(r);
    write(r, (EEPROM_ADDR << 1) | 1); // Read mode
    data = read(r, 1);                // NACK after last byte
    stop(r);

    return data;
}