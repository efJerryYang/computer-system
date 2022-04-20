
out/main.o:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <multiply>:
   0:	fd010113          	addi	sp,sp,-48
   4:	02813423          	sd	s0,40(sp)
   8:	03010413          	addi	s0,sp,48
   c:	00050793          	mv	a5,a0
  10:	00058713          	mv	a4,a1
  14:	fcf41f23          	sh	a5,-34(s0)
  18:	00070793          	mv	a5,a4
  1c:	fcf41e23          	sh	a5,-36(s0)
  20:	fe041723          	sh	zero,-18(s0)
  24:	0480006f          	j	6c <.L2>

0000000000000028 <.L5>:
  28:	fdc45783          	lhu	a5,-36(s0)
  2c:	0007879b          	sext.w	a5,a5
  30:	0017f793          	andi	a5,a5,1
  34:	0007879b          	sext.w	a5,a5
  38:	00078663          	beqz	a5,44 <.L3>
  3c:	fde45783          	lhu	a5,-34(s0)
  40:	0080006f          	j	48 <.L4>

0000000000000044 <.L3>:
  44:	00000793          	li	a5,0

0000000000000048 <.L4>:
  48:	fee45703          	lhu	a4,-18(s0)
  4c:	00e787bb          	addw	a5,a5,a4
  50:	fef41723          	sh	a5,-18(s0)
  54:	fdc45783          	lhu	a5,-36(s0)
  58:	0017d79b          	srliw	a5,a5,0x1
  5c:	fcf41e23          	sh	a5,-36(s0)
  60:	fde45783          	lhu	a5,-34(s0)
  64:	0017979b          	slliw	a5,a5,0x1
  68:	fcf41f23          	sh	a5,-34(s0)

000000000000006c <.L2>:
  6c:	fdc45783          	lhu	a5,-36(s0)
  70:	0007879b          	sext.w	a5,a5
  74:	fa079ae3          	bnez	a5,28 <.L5>
  78:	fee45783          	lhu	a5,-18(s0)
  7c:	00078513          	mv	a0,a5
  80:	02813403          	ld	s0,40(sp)
  84:	03010113          	addi	sp,sp,48
  88:	00008067          	ret

000000000000008c <main>:
  8c:	fe010113          	addi	sp,sp,-32
  90:	00113c23          	sd	ra,24(sp)
  94:	00813823          	sd	s0,16(sp)
  98:	02010413          	addi	s0,sp,32
  9c:	01c00793          	li	a5,28
  a0:	fef405a3          	sb	a5,-21(s0)
  a4:	feb44783          	lbu	a5,-21(s0)
  a8:	03079793          	slli	a5,a5,0x30
  ac:	0307d793          	srli	a5,a5,0x30
  b0:	feb44703          	lbu	a4,-21(s0)
  b4:	03071713          	slli	a4,a4,0x30
  b8:	03075713          	srli	a4,a4,0x30
  bc:	00070593          	mv	a1,a4
  c0:	00078513          	mv	a0,a5
  c4:	00000097          	auipc	ra,0x0
  c8:	000080e7          	jalr	ra # c4 <main+0x38>
  cc:	00050793          	mv	a5,a0
  d0:	fef41623          	sh	a5,-20(s0)
  d4:	feb44783          	lbu	a5,-21(s0)
  d8:	03079713          	slli	a4,a5,0x30
  dc:	03075713          	srli	a4,a4,0x30
  e0:	fec45783          	lhu	a5,-20(s0)
  e4:	00070593          	mv	a1,a4
  e8:	00078513          	mv	a0,a5
  ec:	00000097          	auipc	ra,0x0
  f0:	000080e7          	jalr	ra # ec <main+0x60>
  f4:	00050793          	mv	a5,a0
  f8:	fef41723          	sh	a5,-18(s0)
  fc:	fee45783          	lhu	a5,-18(s0)
 100:	0007879b          	sext.w	a5,a5
 104:	00078593          	mv	a1,a5
 108:	00000517          	auipc	a0,0x0
 10c:	00050513          	mv	a0,a0
 110:	00000097          	auipc	ra,0x0
 114:	000080e7          	jalr	ra # 110 <main+0x84>
 118:	00000793          	li	a5,0
 11c:	00078513          	mv	a0,a5
 120:	01813083          	ld	ra,24(sp)
 124:	01013403          	ld	s0,16(sp)
 128:	02010113          	addi	sp,sp,32
 12c:	00008067          	ret

Disassembly of section .rodata:

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
