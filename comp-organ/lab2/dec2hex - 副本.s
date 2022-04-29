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
	add	a5,a0,x0
	sw	a5,-36(s0)
	sw	x0,-28(s0)
	sw	x0,-24(s0)
.L2:
	lw	a5,-36(s0)
	andi	a5,a5,15
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	srliw	a5,a5,4
	sw	a5,-36(s0)
	lw	a5,-28(s0)
	srliw	a5,a5,4
	addiw	a4,a5,0
	lw	a5,-20(s0)
	slliw	a5,a5,28
	addiw	a5,a5,0
	or	a5,a4,a5
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	addiw	a4,a5,0
	li	a5,8
	bne	a4,a5,.L2
	lw	a5,-28(s0)
	add	a0,a5,x0
	ld	s0,40(sp)
	addi	sp,sp,48
	jalr	x0,ra,0
	.size	dec2hex, .-dec2hex
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	lui	a5,200110080
	addiw	a5,a5,348
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	add	a0,a5,x0
	call dec2hex
	add s3,a0,x0
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jalr	x0,ra,0
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
