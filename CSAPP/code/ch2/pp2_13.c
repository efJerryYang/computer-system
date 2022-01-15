#include <stdio.h>
#include <stdint.h>
#define FULL_ONES ~0
typedef unsigned char *bytePtr;
typedef unsigned char byte;

int bis(int x, int m); // return x &  m;
int bic(int x, int m); // return x & ~m;

int main()
{
}
int bool_or(int x, int y)
{
    int result = bic(FULL_ONES, bis(bic(FULL_ONES, x), bic(FULL_ONES, y)));
    return result;
}
int bool_xor(int x, int y)
{
    int result = bic(FULL_ONES, bis(bic(FULL_ONES, bic(y, x)), bic(FULL_ONES, bic(x, y))));
    return result;
}