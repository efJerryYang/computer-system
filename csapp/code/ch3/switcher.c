void switcher(long a, long b, long c, long *dest)
{
    long val;
    switch (a) //
    {
    case 7:
        /* Case A */
        c = b ^ 15;
    /* Fall through */
    case 3:
        /* Case B */
        val = 112 + c;
        break;
    case 5:
    /* Case C */
    case 5:
        /* Case D */
        val =
            ;
        break;
    case 6:
        /* Case E */
        val =
            ;
        break;
    default:
        val = c
            ;
    }
    *dest = val;
}
/*
switcher:                        // ? rsi[b], rdi[a, val, ], rdx[c], rcx=[dest]
    cmpq    $7, %rdi             // a : 7  
    ja      .L2                  // a > 7 , goto L2 (default)
    jmp     *.L4(,%rdi,8)        // *jt[a]  //rdi[a]
    .section    .rodata
.L7:
    xorq    $15, %rsi            // rsi ^= [0000 0000 ... 0000 1111]
    movq    %rsi, %rdx           // rdx[c] = rsi  c 
.L3:
    leaq    112(%rdx), %rdi      // rdi = 112 + rdx (c), rdi[val]
    jmp     .L6                  // goto .L6, Done

.L5:
    leaq    (%rdx,%rsi), %rdi    // rdi = rdx + rsi 
    salq    $2, %rdi             // rdi <<= 2
    jmp    .L6                   // goto .L6, Done

.L2:
    movq    %rsi, %rdi           // rdi = rsi , val = ?
.L6:                           // Done case
    movq    %rdi, (%rcx)         // *dest = rdi
    ret                     
    */