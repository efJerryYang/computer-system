	.file	"fibonacci.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
	.text
	.globl	fibonacci_while
	.type	fibonacci_while, @function
fibonacci_while:
.LFB0:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	je	.L8
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	jg	.L11
.L3:
	cmpl	$1, %ebx
	jg	.L12
.L4:
	movl	$1, %ebp
	movl	$1, %eax
	jmp	.L5
.L11:
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L12:
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L4
.L6:
	leal	(%rax,%rbp), %r12d
	movl	%r12d, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	subl	$1, %ebx
	movl	%ebp, %eax
	movl	%r12d, %ebp
.L5:
	cmpl	$2, %ebx
	jg	.L6
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE0:
	.size	fibonacci_while, .-fibonacci_while
	.globl	fibonacci_for
	.type	fibonacci_for, @function
fibonacci_for:
.LFB1:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	je	.L20
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	jg	.L23
.L15:
	cmpl	$1, %ebx
	jg	.L24
.L16:
	movl	$1, %ebp
	movl	$1, %eax
	jmp	.L17
.L23:
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L15
.L24:
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L16
.L18:
	leal	(%rax,%rbp), %r12d
	movl	%r12d, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	subl	$1, %ebx
	movl	%ebp, %eax
	movl	%r12d, %ebp
.L17:
	cmpl	$2, %ebx
	jg	.L18
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L20:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE1:
	.size	fibonacci_for, .-fibonacci_for
	.globl	fibonacci_goto
	.type	fibonacci_goto, @function
fibonacci_goto:
.LFB2:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	je	.L31
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
.L27:
	endbr64
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$2, %ebx
	jle	.L25
	movl	$1, %ebp
	movl	$1, %eax
	jmp	.L28
.L29:
	movl	%r12d, %ebp
.L28:
	leal	(%rax,%rbp), %r12d
	movl	%r12d, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	subl	$1, %ebx
	movl	%ebp, %eax
	cmpl	$2, %ebx
	jg	.L29
.L26:
.L25:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L31:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE2:
	.size	fibonacci_goto, .-fibonacci_goto
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
