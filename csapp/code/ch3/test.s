	.file	"test.c"
	.text
	.globl	test
	.type	test, @function
test:
.LFB0:
	.cfi_startproc
	endbr64
	leal	(%rdx,%rsi), %eax
	subl	%edi, %eax
	cmpw	$5, %dx
	jle	.L2
	cmpw	$2, %si
	jle	.L3
	movswl	%di, %eax
	movswl	%dx, %ecx
	cltd
	idivl	%ecx
	ret
.L3:
	movswl	%di, %eax
	movswl	%si, %esi
	cltd
	idivl	%esi
	ret
.L2:
	cmpw	$2, %dx
	jg	.L1
	movswl	%dx, %eax
	movswl	%si, %esi
	cltd
	idivl	%esi
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	test, .-test
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
