	.file	"fibonacci.c"
	.option pic
	.text
	.align	1
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	li	a5,1
	beq	a0,a5,.L2
	li	a5,2
	beq	a0,a5,.L4
	addiw	a0,a0,-2
	call	fibonacci
	mv	s1,a0
	addiw	a0,s0,-1
	call	fibonacci
	addw	a0,s1,a0
.L2:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L4:
	li	a0,1
	j	.L2
	.size	fibonacci, .-fibonacci
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a0,20
	call	fibonacci
	li	a0,0
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
