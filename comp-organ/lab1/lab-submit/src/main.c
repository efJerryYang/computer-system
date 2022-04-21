#include "multiply.h"
uint16_t multiply(uint16_t x, uint16_t y)
{
    uint16_t result = 0;
    while (y != 0)
    {
        result += (y & 1) ? x : 0;
        y >>= 1;
        x <<= 1;
    }
    return result;
}

int main()
{
    uint8_t x = 28;
    uint16_t y = multiply(x, x);
    uint16_t result = multiply(y, x);
    printf("%u\n", result);
    return 0;
}