void switch_eg_impl(long x, long n,
                    long *dest)
{
    /* Table of code pointers */
    static void *jt[7] = {
        &&loc_A, &&loc_def, &&loc_B,
        &&loc_C, &&loc_D, &&loc_def,
        &&loc_D};
    unsigned long index = n - 100;
    long val;
    if (index > 6)
        goto loc_def;
    /* Multiway branch */
    goto *jt[index];
loc_A:
    /* Case 100 */
    val = x * 13;
    goto done;
loc_B:
    /* Case 102 */
    x = x + 10;
/* Fall through */
loc_C:
    /* Case 103 */
    val = x + 11;
    goto done;
loc_D:
    /* Cases 104, 106 */
    val = x * x;
    goto done;
loc_def:
    /* Default case */
    val = 0;
done:
    *dest = val;
}
/*
switch_eg_impl:
.LFB0:
        subq    $100, %rsi
        cmpq    $6, %rsi
        ja      .L2
        leaq    jt.1915(%rip), %rax
        jmp     *(%rax,%rsi,8)
.L3:
        leaq    (%rdi,%rdi,2), %rax
        leaq    (%rdi,%rax,4), %rdi
        jmp     .L4
.L5:
        addq    $10, %rdi
.L6:
        addq    $11, %rdi
        jmp     .L4
.L7:
        imulq   %rdi, %rdi
        jmp     .L4
.L2:
        movl    $0, %edi
.L4:
        movq    %rdi, (%rdx)
        ret
jt.1915:
        .quad   .L3
        .quad   .L2
        .quad   .L5
        .quad   .L6
        .quad   .L7
        .quad   .L2
        .quad   .L7
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
        .section        .note.gnu.property,"a"
        .align 8
        .long    1f - 0f
        .long    4f - 1f
        .long    5
*/