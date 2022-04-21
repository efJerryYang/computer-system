	.file	"main.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%u"
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
	sb	a5,-19(s0)
	lbu	a5,-19(s0)
	slli	a5,a5,48
	srli	a5,a5,48
	lbu	a4,-19(s0)
	slli	a4,a4,48
	srli	a4,a4,48
	mv	a1,a4
	mv	a0,a5
	call	multiply@plt
	mv	a5,a0
	sh	a5,-18(s0)
	lbu	a5,-19(s0)
	slli	a4,a5,48
	srli	a4,a4,48
	lhu	a5,-18(s0)
	mv	a1,a4
	mv	a0,a5
	call	multiply@plt
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
