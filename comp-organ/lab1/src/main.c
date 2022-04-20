#include "multiply.h"

int main()
{
    uint8_t x = 28;
    uint8_t y = multiply(x, x);
    y = multiply(y,x);
    printf("%u\n", y);
    return 0;
}