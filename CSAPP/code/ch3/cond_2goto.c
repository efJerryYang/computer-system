void cond_2goto(short a, short *p)
{
    if (a == 0)
        goto LABEL;
    if (*p >= a)
        goto LABEL;
    *p = a;
LABEL:
    return;
}

void cond_2if(short a, short *p)
{
    if (a == 0)
        return;
    if (*p >= a)
        return;
    *p = a;
}

/*
cond_2goto:
.LFB0:
        .cfi_startproc
        endbr64
        testw   %di, %di
        je      .L1
        cmpw    %di, (%rsi)
        jge     .L1
        movw    %di, (%rsi)
.L2:
.L1:
        ret
        .cfi_endproc
        
cond_2if:
.LFB1:
        .cfi_startproc
        endbr64
        testw   %di, %di
        je      .L3
        cmpw    %di, (%rsi)
        jge     .L3
        movw    %di, (%rsi)
.L3:
        ret
        .cfi_endproc
4:*/