#include <stdlib.h>
#include <stdio.h>

typedef __UINT64_TYPE__ uint64_t;
typedef __UINT32_TYPE__ uint32_t;
typedef __UINT8_TYPE__ uint8_t;

uint32_t dec2hex(uint32_t dec_num)
{
    uint32_t r;
    uint32_t hex_num = 0;
    int i = 0;
    do
    {
        r = dec_num & 0xf;
        dec_num >>= 4;
        hex_num = (hex_num >> 4) | (r << 28);
        i++;
    } while (i != 8);
    return hex_num;
}

int main()
{
    // for (uint32_t i = 0; i < 4294967295; i++) // test pass
    // {
    // no optimization
    uint32_t dec_num = 200110428;
    /*uint32_t hex_num = */ dec2hex(dec_num);
    // if (dec_num != hex_num)
    // {
    //     printf("dec: %u\thex: %u\n", dec_num, hex_num);
    //     exit(0);
    // }
    // }
}