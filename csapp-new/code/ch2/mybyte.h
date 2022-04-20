#ifndef MYBYTE_H
typedef unsigned char byte;

void show_bytes(byte *start, size_t len)
{
    int i;
    for (i = 0; i < len; i++)
        printf("%.2x", start[i]);
    printf("\n");
}

void show_int(int x)
{
    show_bytes((byte *)&x, sizeof(int));
}

void show_float(float x)
{
    show_bytes((byte *)&x, sizeof(float));
}
void show_pointer(void *x)
{
    show_bytes((byte *)&x, sizeof(void *));
}
#endif