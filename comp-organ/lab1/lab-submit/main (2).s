	.file	"main.c"
	.option pic
	.text
	.align	1
	.globl	multiply
	.type	multiply, @function
multiply:
	addi	sp,sp,-48	# 将堆栈指针寄存器sp与立即数(-48)相加，再存入堆栈指针寄存器sp，即sp = sp + (-48)
	sd	s0,40(sp)		# 将s0寄存器的内容写入sp所指向地址加40的偏移量，即将s0的值写入方才分配的栈空间最高的双字中（栈空间总共分配了6个双字，当前最高位的空间写入了s0）
	addi	s0,sp,48	# 将sp的值（即栈顶地址，已分配栈空间的最低位）与立即数48相加，获得栈空间最高位的地址，写入s0寄存器中（s0寄存器frame pointer的功能）
	mv	a5,a0			# 将寄存器a0的值复制到寄存器a5中，即第1个参数x的值从a0写入了a5中，均为16 bits，即半字长
	mv	a4,a1			# 将寄存器a1的值复制到寄存器a4中，即第2个参数y的值从a1写入了a4中，均为16 bits，即半字长
	sh	a5,-34(s0)		# 将a5寄存器的内容，截取低位半字(half word, 16 bits)写入到s0-34的地址，即从fp指向位置向下，跳过3个双字，从第4个双字空间的后半字写入a5的值
	mv	a5,a4			# 将寄存器a4的值复制到寄存器a5中
	sh	a5,-36(s0)		# 将a5寄存器的内容，截取低位半字写入到s0-36的地址，即紧贴着上一次写入的半字低位的半字进行写入，当前内存中(fp-34)=x,(fp-36)=y
	sh	zero,-18(s0)	# 将zero寄存器的内容（即x0寄存器，值恒为零），截取低位半字写入s0-18的地址，即从fp指向位置向下，跳过2个双字，从第3个双字空间的后半字写入0，即初始化result=0
	j	.L2				# 无条件跳转到.L2标签处
.L5:
	lhu	a5,-36(s0)		# !(是否要扩展？)加载无符号半字，将s0-36地址的值（即y）以无符号扩展复制到a5寄存器
	sext.w	a5,a5		# !(是否要扩展？)等价于addiw x15,x15,0，
	andi	a5,a5,1		# 将a5的值与立即数1进行按位与，即源代码中(y&1)
	sext.w	a5,a5		# 等价于addiw x15,x15,0
	beqz	a5,.L3		# 等价于beq x15,x0,.L3
	lhu	a5,-34(s0)		# 
	j	.L4				# 
.L3:
	li	a5,0
.L4:
	lhu	a4,-18(s0)		# 
	addw	a5,a5,a4	# 
	sh	a5,-18(s0)		# 
	lhu	a5,-36(s0)		# 
	srliw	a5,a5,1		# 
	sh	a5,-36(s0)		# 
	lhu	a5,-34(s0)		# 
	slliw	a5,a5,1		# 
	sh	a5,-34(s0)		# 
.L2:
	lhu	a5,-36(s0)		# 
	sext.w	a5,a5		# 
	bnez	a5,.L5		# 
	lhu	a5,-18(s0)		# 
	mv	a0,a5			# 
	ld	s0,40(sp)		# 
	addi	sp,sp,48	# 
	jr	ra				# 
	.size	multiply, .-multiply
	.section	.rodata
	.align	3
.LC0:
	.string	"%u\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32	# 
	sd	ra,24(sp)		# 
	sd	s0,16(sp)		# 
	addi	s0,sp,32	# 
	li	a5,28			# 
	sb	a5,-21(s0)		# 
	lbu	a5,-21(s0)		# 
	slli	a5,a5,48	# 
	srli	a5,a5,48	# 
	lbu	a4,-21(s0)		# 
	slli	a4,a4,48	# 
	srli	a4,a4,48	# 
	mv	a1,a4			# 
	mv	a0,a5			# 
	call	multiply	# 
	mv	a5,a0			# 
	sh	a5,-20(s0)		# 
	lbu	a5,-21(s0)		# 
	slli	a4,a5,48	# 
	srli	a4,a4,48	# 
	lhu	a5,-20(s0)		# 
	mv	a1,a4			# 
	mv	a0,a5			# 
	call	multiply	# 
	mv	a5,a0			# 
	sh	a5,-18(s0)		# 
	lhu	a5,-18(s0)		# 
	sext.w	a5,a5		# 
	mv	a1,a5			# 
	lla	a0,.LC0			# 
	call	printf@plt	# 
	li	a5,0			# 
	mv	a0,a5			# 
	ld	ra,24(sp)		# 
	ld	s0,16(sp)		# 
	addi	sp,sp,32	# 
	jr	ra				# 
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
