short test(short x, short y, short z)
{
    short val = z + y - x; // Done
    if (z > 5)
    {
        if (y > 2)
            val = x / z;
        else
            val = x / y;
    }
    else if (z < 3) // Done
        val = z / y;
    return val;
    // if (z <= 5)
    // {
    //     if (z >= 3)
    //         return;
    //     val = z / y;
    // }
    // if (y <= 2)
    // {
    //     val = x / y;
    //     return val;
    // }
    // val = x / z;
    // return val;
}
/* x in %rdi, y in %rsi, z in %rdx
test:
    leaq    (%rdx,%rsi), %rax   // compute %rax = z + y
    subq    %rdi, %rax          // %rax -= x, that is, %rax = z + y - x;
    cmpq    $5, %rdx            // compute z - 5
    jle     .L2                 // if z<=5, goto .L2
    cmpq    $2, %rsi            // compute y - 2
    jle     .L3                 // if y<=2, goto .L3
    movq    %rdi, %rax          // %rax = x; that is, x is divident
    idivq   %rdx, %rax          // %rax /= z; this is equivalent to  this statement: return x / z;
    ret
.L3:
    movq    %rdi, %rax          // %rax = x,
    idivq   %rsi, %rax          
    ret                         // return x / y;
.L2:
    cmpq    $3, %rdx            // %rdx-3
    jge     .L4                 // if (z>=3) goto .L4
    movq    %rdx, %rax          // ? no return value here
    idivq   %rsi, %rax          // %rax = z / y
.L4:
    rep; ret                    
*/
/* Real compilation result:
test:
.LFB0:
        .cfi_startproc
        endbr64
        leal    (%rdx,%rsi), %eax
        subl    %edi, %eax
        cmpw    $5, %dx
        jle     .L2
        cmpw    $2, %si
        jle     .L3
        movswl  %di, %eax
        movswl  %dx, %ecx
        cltd
        idivl   %ecx
        ret
.L3:
        movswl  %di, %eax
        movswl  %si, %esi
        cltd
        idivl   %esi
        ret
.L2:
        cmpw    $2, %dx
        jg      .L1
        movswl  %dx, %eax
        movswl  %si, %esi
        cltd
        idivl   %esi
.L1:
        ret
        .cfi_endproc
*/