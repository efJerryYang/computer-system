#include "multiply.h"

uint16_t multiply(uint8_t x, uint8_t y)
{
    // cast uint8_t to uint16_t to store 16-bit result
    uint16_t result = x; 
    while (y != 0)
    {
        result += (y & 1) ? x : 0;
        y >>= 1;
        x <<= 1;
    }
}