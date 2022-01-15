#include <stdio.h>

int floatFloat2Int(unsigned uf)
{
    unsigned sgn = uf >> 31;            // => ...01 or ...00
    int exp = (uf & ~(1u << 31)) >> 23; // 32 bits but only use the least significant 8 bits (1 byte)
    unsigned frac = uf & 0x7fFFFF;      // set 31~23 to 0
    if (exp <= 0)                       // 0.f[22]f[21]...f[0]
        return 0;
    else if (exp != 0xff)
    {
        int E = exp - 127;   // 1.f[22]f[21]...f[0] X 2^(E)
        int offset = E - 23; // 1f[22]f[21]...f[0]. X 2^(E-23)
        if (E < 0)
            return 0;
        else if (offset > 7) //[s] | ([7][6][5][4][3][2][1]) ([0] | [22][21]...[0])
            return 0x80000000;
        else
        {
            // -23 <= offset <= 7
            frac |= 0x800000; // set [23] bit to 1=> (1 | 000....0000)
            frac = offset < 0 ? (frac >> -offset) : (frac << offset);
        }
        if (sgn)
            return ~frac + 1;
        else
            return frac;
    }
    else
        return 0x80000000;
}
int main()
{
    printf("%#x", floatFloat2Int(0x7f000000));
}