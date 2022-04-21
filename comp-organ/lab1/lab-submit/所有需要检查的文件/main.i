# 1 "src/main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 32 "<command-line>" 2
# 1 "src/main.c"
# 1 "src/multiply.h" 1



typedef unsigned char uint8_t;
typedef short unsigned int uint16_t;

int printf (const char *__format, ...);
# 2 "src/main.c" 2
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
