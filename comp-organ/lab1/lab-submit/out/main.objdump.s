
out/main.o:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <multiply>:
   0:	00050793          	mv	a5,a0
   4:	00000513          	li	a0,0
   8:	0200006f          	j	28 <.L2>

000000000000000c <.L3>:
   c:	00e5053b          	addw	a0,a0,a4
  10:	03051513          	slli	a0,a0,0x30
  14:	03055513          	srli	a0,a0,0x30
  18:	0015d593          	srli	a1,a1,0x1
  1c:	0017979b          	slliw	a5,a5,0x1
  20:	03079793          	slli	a5,a5,0x30
  24:	0307d793          	srli	a5,a5,0x30

0000000000000028 <.L2>:
  28:	00058a63          	beqz	a1,3c <.L6>
  2c:	0015f713          	andi	a4,a1,1
  30:	fc070ee3          	beqz	a4,c <.L3>
  34:	00078713          	mv	a4,a5
  38:	fd5ff06f          	j	c <.L3>

000000000000003c <.L6>:
  3c:	00008067          	ret

0000000000000040 <main>:
  40:	ff010113          	addi	sp,sp,-16
  44:	00113423          	sd	ra,8(sp)
  48:	01c00593          	li	a1,28
  4c:	01c00513          	li	a0,28
  50:	00000097          	auipc	ra,0x0
  54:	000080e7          	jalr	ra # 50 <main+0x10>
  58:	01c00593          	li	a1,28
  5c:	00000097          	auipc	ra,0x0
  60:	000080e7          	jalr	ra # 5c <main+0x1c>
  64:	0005059b          	sext.w	a1,a0
  68:	00000517          	auipc	a0,0x0
  6c:	00050513          	mv	a0,a0
  70:	00000097          	auipc	ra,0x0
  74:	000080e7          	jalr	ra # 70 <main+0x30>
  78:	00000513          	li	a0,0
  7c:	00813083          	ld	ra,8(sp)
  80:	01010113          	addi	sp,sp,16
  84:	00008067          	ret

Disassembly of section .rodata.str1.8:

0000000000000000 <.LC0>:
   0:	7525                	lui	a0,0xfffe9
   2:	000a                	c.slli	zero,0x2

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	4700                	lw	s0,8(a4)
   2:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
   6:	5528                	lw	a0,104(a0)
   8:	7562                	ld	a0,56(sp)
   a:	746e                	ld	s0,248(sp)
   c:	2075                	0x2075
   e:	2e39                	addiw	t3,t3,14
  10:	2e34                	fld	fa3,88(a2)
  12:	2d30                	fld	fa2,88(a0)
  14:	7531                	lui	a0,0xfffec
  16:	7562                	ld	a0,56(sp)
  18:	746e                	ld	s0,248(sp)
  1a:	3175                	addiw	sp,sp,-3
  1c:	327e                	fld	ft4,504(sp)
  1e:	2e30                	fld	fa2,88(a2)
  20:	3430                	fld	fa2,104(s0)
  22:	2029                	0x2029
  24:	2e39                	addiw	t3,t3,14
  26:	2e34                	fld	fa3,88(a2)
  28:	0030                	addi	a2,sp,8
