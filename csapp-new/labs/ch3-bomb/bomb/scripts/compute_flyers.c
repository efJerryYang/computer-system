#include <stdio.h>
#include <string.h>

int main()
{
    char *pat = "maduiersnfotvbyl";
    size_t n = strlen(pat);
    size_t i;
    printf("\n");
    for (i = 0; i < n; i++)
    {
        printf("%u %c %u\n", i, pat[i], pat[i]);
    }
    unsigned offset[6] = {9, 15, 14, 5, 6, 7};
    for (i = 0; i < 6u; i++)
    {
        unsigned j = 0;
        for (j = 0; j < 8; j++)
            printf("[%c]-", offset[i] + 16 * j);
        printf("\n");
        // printf("[%c]-[%c]-[%c]-[%c]-[%c]\n", offset[i], 16 + offset[i], 32 + offset[i], 48 + offset[i], 64 + offset[i]);
    }
    // IONEFG
}