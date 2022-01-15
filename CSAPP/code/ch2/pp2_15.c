#include <stdio.h>
#include <stdint.h>
#define FULL_ONES ~0
typedef unsigned char *bytePtr;
typedef unsigned char byte;

int isEqual(int x, int y)
{
    // only bit-level and logical operations, to yield the result of x == y
    // nxor
    return !(x ^ y);
}