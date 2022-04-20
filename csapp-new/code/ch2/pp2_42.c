#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
typedef unsigned char byte;

int div16(int32_t x)
{
    float y = x;
    byte *p = &x;
    byte sx = (*(p + 3)) >> 1;
    /*sx
    00 >> 00
    01 >> 00
    10 >> 11
    11 >> 11
    */
    int32_t sx_new = (x >> 31) & 0x1;
    sx = sx & 0x1;
    /*sx
    00 => 00
    11 => 01
    */
    printf("%d\t", x);
    // x = (x + ((int32_t)sx << 4) - sx) >> 4;
    x = (x + (sx_new << 4) - sx_new) >> 4;
    //compute bias
    // bias =  (x >> 31) & 0xf; // 目的就是为了得到那从低位开始的全1
    // x = (x + bias) >> 4;
    printf("%d", x);
    printf("\t%f", y / 16);
    printf("\n");
    return x;
}
int main()
{
    for (int i = -200; i <= 200; i++)
        div16(i);
}