Minisys开发板是一个以Xilinx Artix-7TM系列 FPGA（XC7A100TFGG484C-1）为主芯片的可用于“数字电路”、“组成原理”等多门课程的实验平台。

<center><img src="../minisys.png" width = 600></center>
<center>图2-1 Minisys开发板</center>

Minisys开发板外设资源包括24个拨码开关、24个LED灯、5个按键开关、1个8位7段数码管、1个4x4键盘等；



Ø **拨码开关**

Minisys开发板上有24个拨码开关，其板上标注为SW23~SW0。在实验中，常将拨码开关作为数据输入，当开关拨到下档时，表示输入为0，否则为1。



Ø **LED灯**

Minisys开发板上有24个LED灯（红、绿、黄分别8个），板上标号为 RLD7~0 ，GLD7~0 和YLD7~0 。当FPGA相应管脚的输出为高电平时，所连接的LED灯被点亮，否则灯熄灭。



#### Ø 拨码开关、LED灯与芯片关系连接如下：

<center><img src="../minisys1.png" width = 600></center>

