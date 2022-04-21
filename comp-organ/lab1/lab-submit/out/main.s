	.file	"main.c"
	.option pic
	.text
	.align	1
	.globl	multiply
	.type	multiply, @function
multiply:
	mv	a5,a0
	li	a0,0
	j	.L2
.L3:
	addw	a0,a0,a4
	slli	a0,a0,48
	srli	a0,a0,48
	srli	a1,a1,1
	slliw	a5,a5,1
	slli	a5,a5,48
	srli	a5,a5,48
.L2:
	beqz	a1,.L6
	andi	a4,a1,1
	beqz	a4,.L3
	mv	a4,a5
	j	.L3
.L6:
	ret
	.size	multiply, .-multiply
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%u\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,28
	li	a0,28
	call	multiply
	li	a1,28
	call	multiply
	sext.w	a1,a0
	lla	a0,.LC0
	call	printf@plt
	li	a0,0
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
