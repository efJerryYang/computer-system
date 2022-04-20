int main()
{
    char a[53] = "Border relations with Canada have never been better.";
    for (int i = 0; i < 53; i++)
    {
        // printf("%c_%x\n", a[i],a[i]);
        printf("%x ", a[i]);
    }
    printf("\n");
}