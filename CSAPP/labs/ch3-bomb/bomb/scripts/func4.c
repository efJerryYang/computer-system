// 3 parameters(32 bits), 1 return value(32 bits)
int edi, esi, edx, ecx;
int eax;
int func4_goto_direct(void)
{
    eax = edx;
    eax -= esi;
    ecx = eax;
    ecx = (unsigned)ecx >> 0x1f; // logic right shift
    eax += ecx;
    eax >>= 1;           // arithmetic right shift
    ecx = eax + esi * 1; // lea    (%rax,%rsi,1),%ecx

    if (ecx <= edi)
        goto func4_36;
    edx = ecx - 1; //lea    -0x1(%rcx),%edx
    eax = func4();
    eax += eax;
    goto done;

func4_36:
    eax = 0;
    if (ecx >= edi)
        goto done;
    esi = ecx + 1;
    eax = func4();
    eax = 0x1 + eax + eax * 1;

done:
    return eax;
}

int func4_goto_modified(void)
{
    eax = edx - esi;
    ecx = (unsigned)eax >> 0x1f; // logic right shift
    eax = (eax + ecx) >> 1;      // arithmetic right shift
    // it is just doing "/ 2" operation.
    ecx = eax + esi;             // lea    (%rax,%rsi,1),%ecx

    if (ecx > edi)
    {
        edx = ecx - 1; //lea    -0x1(%rcx),%edx
        eax = func4();
        eax += eax;
    }
    else
    {
        eax = 0;
        if (ecx == edi)
            return eax;
        esi = ecx + 1;
        eax = func4();
        eax = 0x1 + eax + eax * 1;
    }
// done:
    return eax;
}