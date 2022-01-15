void fibonacci_while(int n)
{
    int i = 1;
    int j = 1;
    if (n == 0)
        return;
    if (n >= 1)
        printf("%d\n", i);
    if (n >= 2)
        printf("%d\n", i);
    // printf("%d %d ", i, j);
    while (n > 2)
    {
        int t = i + j;
        printf("%d\n", t);
        i = j;
        j = t;
        n--;
    }
    return;
}
void fibonacci_for(int n)
{
    int i = 1;
    int j = 1;
    if (n == 0)
        return;
    if (n >= 1)
        printf("%d\n", i);
    if (n >= 2)
        printf("%d\n", i);
    for (i = 1, j = 1; n > 2; n--)
    {
        int t = i + j;
        printf("%d\n", t);
        i = j;
        j = t;
    }
}
void fibonacci_goto(int n)
{
    if (n == 0)
        goto done;
    if (n >= 1)
        goto cond1or2;
    if (n >= 2)
        goto cond1or2;

    int t;
    int i, j;
cond1or2:
    printf("%d\n", 1);
    i = j = 1;
    if (n <= 2)
        goto done;
loop:
    t = i + j;
    printf("%d\n", t);
    i = j;
    j = t;
    n--;
test:
    if (n > 2)
        goto loop;
done:
    return;
}

/*
fibonacci_while:
.LFB0:
        testl   %edi, %edi
        je      .L8
        pushq   %r12
        pushq   %rbp
        pushq   %rbx
        movl    %edi, %ebx
        jg      .L11
.L3:
        cmpl    $1, %ebx
        jg      .L12
.L4:
        movl    $1, %ebp
        movl    $1, %eax
        jmp     .L5
.L11:
        movl    $1, %esi
        leaq    .LC0(%rip), %rdi
        movl    $0, %eax
        call    printf@PLT
        jmp     .L3
.L12:
        movl    $1, %esi
        leaq    .LC0(%rip), %rdi
        movl    $0, %eax
        call    printf@PLT
        jmp     .L4
.L6:
        leal    (%rax,%rbp), %r12d
        movl    %r12d, %esi
        leaq    .LC0(%rip), %rdi
        movl    $0, %eax
        call    printf@PLT
        subl    $1, %ebx
        movl    %ebp, %eax
        movl    %r12d, %ebp
.L5:
        cmpl    $2, %ebx
        jg      .L6
        popq    %rbx
        popq    %rbp
        popq    %r12
        ret
.L8:
        ret

fibonacci_for:
.LFB1:
        testl   %edi, %edi
        je      .L20
        pushq   %r12
        pushq   %rbp
        pushq   %rbx
        movl    %edi, %ebx
        jg      .L23
.L15:
        cmpl    $1, %ebx
        jg      .L24
.L16:
        movl    $1, %ebp
        movl    $1, %eax
        jmp     .L17
.L23:
        movl    $1, %esi
        leaq    .LC0(%rip), %rdi
        movl    $0, %eax
        call    printf@PLT
        jmp     .L15
.L24:
        movl    $1, %esi
        leaq    .LC0(%rip), %rdi
        movl    $0, %eax
        call    printf@PLT
        jmp     .L16
.L18:
        leal    (%rax,%rbp), %r12d
        movl    %r12d, %esi
        leaq    .LC0(%rip), %rdi
        movl    $0, %eax
        call    printf@PLT
        subl    $1, %ebx
        movl    %ebp, %eax
        movl    %r12d, %ebp
.L17:
        cmpl    $2, %ebx
        jg      .L18
        popq    %rbx
        popq    %rbp
        popq    %r12
        ret
.L20:
        ret

fibonacci_goto:
.LFB2:
        testl   %edi, %edi
        je      .L31
        pushq   %r12
        pushq   %rbp
        pushq   %rbx
        movl    %edi, %ebx
.L27:
        movl    $1, %esi
        leaq    .LC0(%rip), %rdi
        movl    $0, %eax
        call    printf@PLT
        cmpl    $2, %ebx
        jle     .L25
        movl    $1, %ebp
        movl    $1, %eax
        jmp     .L28
.L29:
        movl    %r12d, %ebp
.L28:
        leal    (%rax,%rbp), %r12d
        movl    %r12d, %esi
        leaq    .LC0(%rip), %rdi
        movl    $0, %eax
        call    printf@PLT
        subl    $1, %ebx
        movl    %ebp, %eax
        cmpl    $2, %ebx
        jg      .L29
.L26:
.L25:
        popq    %rbx
        popq    %rbp
        popq    %r12
        ret
.L31:
        ret

*/