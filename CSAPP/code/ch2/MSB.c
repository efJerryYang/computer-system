#define MSB(i) ((i) & (((~0U) >> 1) ^ (~0U)))
#define issetMSB(i) (!!MSB(i))

int main(void)
{
    printf("%x\n", MSB(0x7fffffff));
    printf("%x\n", issetMSB(-1));
}