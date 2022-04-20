	.file	"fix_set_diag_eg.c"
	.text
	.p2align 4
	.globl	fix_set_diag_opt
	.type	fix_set_diag_opt, @function
fix_set_diag_opt:
.LFB0:
	.cfi_startproc
	endbr64
	leaq	1088(%rdi), %rax
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%esi, (%rdi)
	addq	$68, %rdi
	cmpq	%rax, %rdi
	jne	.L2
	ret
	.cfi_endproc
.LFE0:
	.size	fix_set_diag_opt, .-fix_set_diag_opt
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
