	.file	"test_2.c"
	.text
	.globl	test
	.type	test, @function
test:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %edx
	movl	%esi, %eax
	movw	%dx, -20(%rbp)
	movw	%ax, -24(%rbp)
	movzwl	-24(%rbp), %eax
	addl	$12, %eax
	movw	%ax, -2(%rbp)
	cmpw	$0, -20(%rbp)
	jns	.L2
	movzwl	-20(%rbp), %eax
	cmpw	-24(%rbp), %ax
	jge	.L3
	movzwl	-20(%rbp), %edx
	movzwl	-24(%rbp), %eax
	imull	%edx, %eax
	movw	%ax, -2(%rbp)
	jmp	.L4
.L3:
	movzwl	-20(%rbp), %eax
	orw	-24(%rbp), %ax
	movw	%ax, -2(%rbp)
	jmp	.L4
.L2:
	cmpw	$9, -24(%rbp)
	jle	.L4
	movswl	-20(%rbp), %eax
	movswl	-24(%rbp), %ecx
	cltd
	idivl	%ecx
	movw	%ax, -2(%rbp)
.L4:
	movzwl	-2(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
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
