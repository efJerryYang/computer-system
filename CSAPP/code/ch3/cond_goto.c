void cond_goto(short a, short *p)
{
    if (!a || *p >= a)
        goto LABEL;
    *p = a;
    return;
LABEL:
    return;
}

/*
cond_goto:
.LFB0:
        .cfi_startproc      // p in %rsi, a in %rdi
        endbr64
        testw   %di, %di    // compute a & a
        je      .L1         // if !a is 1, goto L1
        cmpw    %di, (%rsi) // compute *p - a, get FLAG
        jge     .L1         // if *p >= a, goto L1
        movw    %di, (%rsi) // copy value a to *p
.L1:
        ret                 // return
        .cfi_endproc        // end
 */