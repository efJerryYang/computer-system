int main()
{
    long local;
    printf("local at %p\n",&local);
    return 0;
}
/* wsl2 run ./stack_addr
0x7fffd40cb3c0
0x7ffff861bf90
0x7fffca0ce850
*/
/* wsl2 run ./stack_addr.exe
000000000061FE1C
000000000061FE1C
000000000061FE1C
*/