#define N 16
typedef int fix_matrix[N][N];
void fix_set_diag(fix_matrix A, int val)
{
    int *Aptr = &A[0][0];
    long cnt = 0;
    long end = N * (N + 1);
    do
    {
        // *((*A)+cnt) = val;
        *(Aptr + cnt) = val;
        cnt += N + 1;
    } while (cnt != end);
}
/*
fix_set_diag:
.LFB0:
        .cfi_startproc
        endbr64
        movl    $0, %eax
.L2:
        movl    %esi, (%rdi,%rax,4)
        addq    $17, %rax
        cmpq    $272, %rax
        jne     .L2
        ret
        .cfi_endproc
*/