/*
 * File:   main.c
 * Author: gregorytidanian
 *
 * Created on October 17, 2025, 8:38 PM
 */

#define FCY 16000000UL /*   Adjust if using different oscillator. \
                            Needs to be before xc or libpic30, don't know which */
#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <libpic30.h>
#include "i2c.h"

int main(void)
{
    uint8_t read_value;

    I2C1_Init();

    // Write test value
    EEPROM_WriteByte(TEST_ADDR, TEST_VALUE);

    // Read it back
    read_value = EEPROM_ReadByte(TEST_ADDR);

    while (1)
    {
        __delay_ms(500);
        // Inspect `read_value` in debugger or send over UART
    }
}