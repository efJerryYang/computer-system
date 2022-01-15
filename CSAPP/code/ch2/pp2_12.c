#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

typedef unsigned char *bytePtr;
typedef unsigned char byte;

int main()
{
    int w = 32;
    int32_t x = 0x87654321;
    int32_t y = x;
    int32_t z = x;

    bytePtr p = (bytePtr)&y;
    bytePtr q = (bytePtr)&z;

    printf("x=%#" PRIx32 "\n", x);
    // 1
    printf("case 1:%#.8x\n", x & 0xff);
    // 2, little-endian
    int i = 0;
    while (++i < w / 8) // sizeof(y)
        p[i] = ~(p[i]);
    printf("case 2:%#.8x\n", y);
    // 3
    // printf("\nz addr:%X\nz val: %x\n",&z, z);
    // printf("\nq obj :%X\n", q);
    *q = 0xff;
    printf("case 3:%#.8x\n", z);
    printf("Answer:\n");
    printf("case 1:%#.8x\n", x & 0xff);
    printf("case 2:%#.8x\n", x ^ ~0xff);
    printf("case 3:%#.8x\n", x | 0xff);
    return 0;
}
