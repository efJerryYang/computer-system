.text
main:
    addi    sp, sp, -16
    sd      ra, 8(sp)
    # 200110428
    # [0000 1011 1110 1101 0111] 0001 0101 1100
    #     0    b    e    d    7     1    5    c   
    # uper 20 bits: 
    # [0000 1011 1110 1101 0111] 0000 0000 0000
    # lui     a0, 0x0bed7
    # addiw   a0, a0, 0x15c
    lw      a0, dec_num
    auipc   t1, 0
    jal    t1, dec2hex # call dec2hex
    addiw   s3, a0, 0
    ld      ra, 8(sp)
    addi    sp, sp, 16
    jalr    x0, ra, 0
dec2hex:
    addi    sp, sp, -32
    sd      s0, 24(sp)
    addi    s0, sp, 32      # s0 = sp + 32, s0 is frame pointer
    # initially, a0 has value of dec_num
    sw       a0, -28(s0)    # dec_num store into -28(fp)
    sw       x0, -24(s0)    # i store into -24(fp)
    sw       x0, -32(s0)    # hex_num store into -32(fp)
loop:
    lw      a5, -28(s0)
    andi    a5, a5, 0xf     # r = dec_num & 0xf;
    sw      a5, -20(s0)     # r store into -20(fp)
    lw      a5, -28(s0)     # [load] dec_num to a5
    srliw   a5, a5, 4       # dec_num >>= 4;
    sw      a5, -28(s0)     # [store] dec_num
    lw      a5, -32(s0)     # [load] hex_num to a5
    srliw   a5, a5, 4       # hex_num >> 4
    lw      a4, -20(s0)     # [load] r to a4
    slliw   a4, a4, 28      # r << 28
    or      a5, a5, a4      # (hex_num >> 4) | (r << 28)
    sw      a5, -32(s0)     # [store] hex_num
    lw      a5, -24(s0)     
    addiw    a5, a5, 1      # i++;
    sw       a5, -24(s0)
    addiw    a4, x0, 8      # li a4, 8
    bne     a5, a4, loop    # if a5 != a4 then loop
    lw      a0, -32(s0)     # [load] hex_num as return value
    addi    sp, sp, 32
    jalr    x0, x1, 0       # jump to ra+0, copy pc+4 to x0

.data
    dec_num: .word 0xbed715c