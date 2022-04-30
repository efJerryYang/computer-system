.text
main: 
    addi    sp, sp, -16
    sd      ra, 8(sp)
    addi    a0, x0, 20      # arg reg 0 = 20
    jal     x1, fibonacci
    addi    s3, a0, 0
    ld      ra, 8(sp)
    addi    sp, sp, 16
    jalr    x0, 0(ra)

fibonacci:
    addi    sp, sp, -32
    sd      ra, 24(sp)
    sd      s0, 16(sp)
    sd      s1, 8(sp)
    add     s0, a0, x0
    addi    a5, x0, 1
    beq     a0, a5, return1 #  if (n == 1)
    addi    a5, x0, 2
    beq     a0, a5, return2 # if (n == 2)
    addiw   a0, a0, -2
    jal     x1, fibonacci  # recursive call
    add     s1, a0, x0
    addiw   a0, s0, -1
    jal     x1, fibonacci  # recursive call
    addw    a0, s1, a0
return1:
    ld      ra, 24(sp)
    ld      s0, 16(sp)
    ld      s1, 8(sp)
    addi    sp, sp, 32
    jalr    x0, 0(ra)
return2: 
    addi    a0, x0, 1
    jal     x0, return1