	.file	"dec2hex.c"
	.option pic
	.text
	.align	1
	.globl	dec2hex
	.type	dec2hex, @function
dec2hex:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	sw	zero,-28(s0)
	sw	zero,-24(s0)
.L2:
	lw	a5,-36(s0)
	andi	a5,a5,15
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	srliw	a5,a5,4
	sw	a5,-36(s0)
	lw	a5,-28(s0)
	srliw	a5,a5,4
	sext.w	a4,a5
	lw	a5,-20(s0)
	slliw	a5,a5,28
	sext.w	a5,a5
	or	a5,a4,a5
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,8
	bne	a4,a5,.L2
	lw	a5,-28(s0)
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	dec2hex, .-dec2hex
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,200110080
	addiw	a5,a5,348
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	call	dec2hex
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
