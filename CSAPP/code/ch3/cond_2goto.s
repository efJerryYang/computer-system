	.file	"cond_2goto.c"
	.text
	.globl	cond_2goto
	.type	cond_2goto, @function
cond_2goto:
.LFB0:
	.cfi_startproc
	endbr64
	testw	%di, %di
	je	.L1
	cmpw	%di, (%rsi)
	jge	.L1
	movw	%di, (%rsi)
.L2:
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	cond_2goto, .-cond_2goto
	.globl	cond_2if
	.type	cond_2if, @function
cond_2if:
.LFB1:
	.cfi_startproc
	endbr64
	testw	%di, %di
	je	.L3
	cmpw	%di, (%rsi)
	jge	.L3
	movw	%di, (%rsi)
.L3:
	ret
	.cfi_endproc
.LFE1:
	.size	cond_2if, .-cond_2if
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
