uremdiv:
    movq    %rdx, %r8
    movq    %rdi, %rax
    xorl    %edx, %edx  @ change: cqto => xorq, operands changed as well 
    divq    %rsi        @ change: idivq => divq, operands remained unchanged
    movq    %rax, (%r8)
    movq    %rdx, (%rcx)
    ret
    
