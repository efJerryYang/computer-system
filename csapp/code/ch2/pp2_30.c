#include <stdio.h>

int tadd_ok(int x, int y)
{

    if (x > 0 && y > 0) // positive overflow
        return x + y > 0;
    if (x < 0 && y < 0) // negative overflow
        return x + y < 0;
    return 1; // normal
}

/*
int tadd_ok_new(int x, int y)
{
    int flag;
    flag = x + y > 0 ? (x > 0 && y > 0) : (x < 0 && y < 0);
    // flag = 
}
*/

int tsub_ok(int x, int y)
{
    // we should not compute x - y as x + (-y) due to the asymmetric property of two's complement
    // so, what's the correct way of doing such thing?
    /*
    pos - nonneg will not cause overflow
    neg - nonpos will not cause overflow,
    things go wrong when operating pos - neg or neg - pos
    */
    if (x > 0 && y < 0)
        return -y == y ? 0 : tadd_ok(x, -y);
    if (x < 0 && y > 0)
        return tadd_ok(x, -y); // the code is buggy
    return 1;
    // if (x > 0 && y < 0)
    // {

    //     if (-y != y)
    //         return tadd_ok(x, -y);
    //     else // that is, y == TMIN == -y // y = 0x8000_0000
    //         return 0;
    //     // -8 ~ +7, (+8 == -8)
    // }
}
