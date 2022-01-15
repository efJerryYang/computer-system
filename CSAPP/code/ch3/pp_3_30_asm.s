switch2:
    addq    $2, %rdi        // x += 2;  
    cmpq    $8, %rdi        // x : 8
    ja      .L2             // if x > 8, jump to L2 (guess default)
    jmp     *.L4(,%rdi,8)   // jump to the address of .L4-base labels, 8-byte unit
.L4:    
    .quad   .L9
    .quad   .L5
    .quad   .L6
    .quad   .L7
    .quad   .L2
    .quad   .L7
    .quad   .L8
    .quad   .L2
    .quad   .L5             // multiple labes: L5, L7