#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include "mybyte.h"

int main()
{
    int32_t x = 12345;
    float y = x;
    byte *px = &x;
    printf("hexadecimal\ttype\tnumeric value\taddress\n");
    printf("%8x\tint32\t%10d\t%#p\n", x, x, &x);
    printf("%8x\tint32\t%10d\t%#p\n", *(px + 0), x, &x); // I meet a strange case that it just indicates printf used the type information, I can only print every byte of x one time.
    printf("%8x\tint32\t%10d\t%#p\n", *(px + 1), x, &x);
    printf("%8x\tint32\t%10d\t%#p\n", *(uint32_t *)&x, x, &x);
    printf("%8x\tfloat\t%10.1f\t%#p\n", *(uint32_t *)&y, y, &y);

    uint32_t z = x; // z = 123456
    byte *pz = &z;
    printf("%8x\tuint32\t%10u\t%#p\n", z, z, &z);
    // us2f
    // byte: 8 bit
    // but here, it is expected to operate only 4 bit at once
    // 建议，每次操作数值至少操作8 bits，也就是16进制数2个
    z = z & 0x1fff;
    z <<= 11U;
    pz += 3;
    *pz = 0x8C;
    z >>= 1U;
    // printf("%x\n", z);
    printf("%8x\tuint32\t%10u\t%#p\n", z, z, &z);
    printf("%8x\tfloat\t%10.1f\t%#p\n", z, *(float *)(&z), &z);
    printf("\nJudge:%d\n", (float)x == *(float *)&z);

    // show_bytes((byte *)&y, sizeof(y));
    // show_float(y);
    // show_int(x);
}