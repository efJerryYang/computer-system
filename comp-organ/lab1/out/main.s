	.file	"main.c"
	.option pic
	.text
	.align	1
	.globl	multiply
	.type	multiply, @function
multiply:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	mv	a4,a1
	sh	a5,-34(s0)
	mv	a5,a4
	sh	a5,-36(s0)
	sh	zero,-18(s0)
	j	.L2
.L5:
	lhu	a5,-36(s0)
	sext.w	a5,a5
	andi	a5,a5,1
	sext.w	a5,a5
	beqz	a5,.L3
	lhu	a5,-34(s0)
	j	.L4
.L3:
	li	a5,0
.L4:
	lhu	a4,-18(s0)
	addw	a5,a5,a4
	sh	a5,-18(s0)
	lhu	a5,-36(s0)
	srliw	a5,a5,1
	sh	a5,-36(s0)
	lhu	a5,-34(s0)
	slliw	a5,a5,1
	sh	a5,-34(s0)
.L2:
	lhu	a5,-36(s0)
	sext.w	a5,a5
	bnez	a5,.L5
	lhu	a5,-18(s0)
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	multiply, .-multiply
	.section	.rodata
	.align	3
.LC0:
	.string	"%u\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,28
	sb	a5,-21(s0)
	lbu	a5,-21(s0)
	slli	a5,a5,48
	srli	a5,a5,48
	lbu	a4,-21(s0)
	slli	a4,a4,48
	srli	a4,a4,48
	mv	a1,a4
	mv	a0,a5
	call	multiply
	mv	a5,a0
	sh	a5,-20(s0)
	lbu	a5,-21(s0)
	slli	a4,a5,48
	srli	a4,a4,48
	lhu	a5,-20(s0)
	mv	a1,a4
	mv	a0,a5
	call	multiply
	mv	a5,a0
	sh	a5,-18(s0)
	lhu	a5,-18(s0)
	sext.w	a5,a5
	mv	a1,a5
	lla	a0,.LC0
	call	printf@plt
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
