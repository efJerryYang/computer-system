.text
dec2hex:
    # a0 has value of dec_num
    addi    sp, sp, -48
    sd      s0, 40(sp)
    addi    s0, sp, 48
    addi    a5, a0, x0
    
