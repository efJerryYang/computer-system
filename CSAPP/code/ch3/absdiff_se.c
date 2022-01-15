long lt_cnt = 0;
long ge_cnt = 0;

long absdiff_se(long x, long y)
{
    long result;
    if (x < y)
    {
        lt_cnt++;
        result = y - x;
    }
    else
    {
        ge_cnt++;
        result = x - y;
    }
    return result;
}

long absdiff_new(long x, long y)
{
    long result;
    if (x < y)
        goto label;
    ge_cnt++;
    result = x - y;
    return result;
label:
    lt_cnt++;
    result = y - x;
    return result;
}

/*
absdiff_se:
.LFB0:
        .cfi_startproc
        endbr64
        movq    %rsi, %rax
        cmpq    %rsi, %rdi
        jge     .L2
        addq    $1, lt_cnt(%rip)
        subq    %rdi, %rax
        ret
.L2:
        addq    $1, ge_cnt(%rip)
        subq    %rsi, %rdi
        movq    %rdi, %rax
        ret
        .cfi_endproc

absdiff_new:
.LFB1:
        .cfi_startproc
        endbr64
        movq    %rsi, %rax
        cmpq    %rsi, %rdi
        jl      .L7
        addq    $1, ge_cnt(%rip)
        subq    %rsi, %rdi
        movq    %rdi, %rax
        ret
.L7:
        addq    $1, lt_cnt(%rip)
        subq    %rdi, %rax
        ret
        .cfi_endproc
*/