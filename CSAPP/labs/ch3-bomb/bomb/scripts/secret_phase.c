#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int rax, rdi, rsi, rdx;
int main()
{
    char **p;
    long num = strtol("1001", NULL, 10);
    printf("%ld\n", num);
}
void fun7(void)
{
    if (rdi == 0)
    {
        rax = -1;
        return;
    }
    rdx = *(int *)rdi; // +9
    if (rdx > rsi)
    {
        rdi = *(int *)(rdi + 0x8);
        fun7();
        rax += rax;
    }
    else
    {
        rax = 0;
        if (rdx == rsi)
            return;
        rdi = *(int *)(rdi + 0x10);
        fun7();
        rax = rax + rax + 0x1;
    }
    return;
}