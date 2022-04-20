/*
(e)dx = 1
(e)ax = 65
L10:
(r)cx = (r)di // (r)cx = x;
ecx &= 1  //
rax += rax
rax |= rcx
rdi >>= 1
rdx += 1
goto L10
*/

short test_two(unsigned short x)
{
    short val = 0; // ax
    short i;       //65 // dx
    for (;;)
    {
    }
    return val;
}