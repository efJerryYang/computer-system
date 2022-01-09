#include <inttypes.h>

typedef unsigned __int128 uint128_t;

void store_divident(uint128_t *dest, uint128_t divident, uint64_t divisor)
{
    *dest = divident / divisor;
}
