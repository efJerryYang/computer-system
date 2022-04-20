int array_sizeof(int val)
{
    int a[19];
    int b = sizeof(a);
    int c = array_sizeof(b);
    return c + b;
}
/*
.LFB0:
        .cfi_startproc
        endbr64
        subq    $8, %rsp
        .cfi_def_cfa_offset 16
        movl    $76, %edi
        call    array_sizeof
        addl    $76, %eax
        addq    $8, %rsp
        .cfi_def_cfa_offset 8
        ret
*/
