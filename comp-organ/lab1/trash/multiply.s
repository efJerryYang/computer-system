	.file	"multiply.c"
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
.L4:
	lhu	a5,-36(s0)
	sext.w	a5,a5
	andi	a5,a5,1
	sext.w	a5,a5
	beqz	a5,.L3
	lhu	a4,-18(s0)
	lhu	a5,-34(s0)
	addw	a5,a4,a5
	sh	a5,-18(s0)
.L3:
	lhu	a5,-36(s0)
	srliw	a5,a5,1
	sh	a5,-36(s0)
	lhu	a5,-34(s0)
	slliw	a5,a5,1
	sh	a5,-34(s0)
.L2:
	lhu	a5,-36(s0)
	sext.w	a5,a5
	bnez	a5,.L4
	lhu	a5,-18(s0)
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	multiply, .-multiply
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
