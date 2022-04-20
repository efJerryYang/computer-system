# 实验准备

#### 1 熟悉存储系统模型

本次实验采用的存储系统大小为8K，地址宽度为13，字长为1字节。

存储器模块为mem_wrap.v，为简化实验流程，我们已将Cache缺失时连续读取4个字并拼接的工作完成，具体时序图如下：

 <center><img src="../s5-1.png" width = 650></center>  

在主存空闲阶段，Cache将地址放在raddr口上，并将rreq信号拉高，代表一次的读请求。等待若干个周期，主存将返回4个字拼接而成的数据，并将rvalid信号拉高，代表数据已经准备好，此时可以取走数据。

#### 2 项目框架概览

Ø 设计文件

driver (driver.sv) ----- 顶层模块，模拟CPU的访存行为，并进行数据正确性检查，可以看作是CPU

trace (IP核) ----- 存储标准答案

cache (cache.v) ----- Cache模块（需要完成）

mem_wrap(mem_wrap.v) ----- 主存存储器模型

模块间的关系如下图所示：

 <center><img src="../s5-2.png" width = 250></center>  

Ø 仿真文件

使用说明

完成设计后，可以运行all_sim.v文件中的仿真，运行仿真时，下方的Tcl Console也会打印相应的调试信息，帮助你定位出错点。

 <center><img src="../s5-3.png" width = 250></center>  

如果测试全部通过，控制台会显示相应字样，同时仿真将会停止在对应位置。

 <center><img src="../s5-4.png" width = 550></center>  

#### 3 模块接口规范

| 属性 |      名称       |          含义           | 位宽 |
| :--: | :-------------: | :---------------------: | :--: |
| 输入 |       clk       |          时钟           |  1   |
| 输入 |      reset      |   复位（高电平有效）    |  1   |
| 输入 | raddr_from_cpu  |       CPU的读地址       |  13  |
| 输入 |  rreq_from_cpu  |       CPU的读请求       |  1   |
| 输出 |  rdata_to_cpu   |     Cache读出的数据     |  8   |
| 输出 |   hit_to_cpu    |        命中标记         |  1   |
| 输入 | rdata_from_mem  | 主存模块读取的连续4字节 |  32  |
| 输入 | rvalid_from_mem |    主存读取完毕标记     |  1   |
| 输出 |   rreq_to_mem   |       读主存请求        |  1   |
| 输出 |  raddr_to_mem   |      读主存首地址       |  13  |

#### 4 Cache模块时序规范

Cache存储体调用Block RAM的IP核实现，因此，我们需要了解Block RAM的读时序。IP核的使用见后文附录。

**Block RAM的读写时序：**

 <center><img src="../s5-5.png" width = 600></center>  

Ø 读时序：上一周期给出地址，下一周期输出数据，可连续读取。（周期1，2，3）

Ø 写时序：上一周期给数据、写地址，拉高wea信号，下一周期成功写入数据，刚刚写入的数据出现在douta口上。

**Cache的读时序**

 <center><img src="../s5-6.png" width = 600></center>  

下面以 Cyc# 代表周期号，详细叙述Cache和CPU之间的通信约定。

Ø CPU发来rreq信号，同时把地址放在raddr上(Cyc #1)，代表启动一次读取，在得到Cache的hit响应(Cyc #2)之前，CPU会保证：rreq_from_cpu信号不会撤下地址线raddr_from_cpu上的地址不会改变.

Ø 在得到Cache的hit响应之后(Cyc #2)，CPU会保证：在hit信号到来的下一个周期(Cyc #3)，rreq信号马上撤下Cache需要做到：hit响应信号和读出的数据只需持续一个周期(Cyc #2 - Cyc #3)，同时有效

Ø CPU未发rreq信号的时候，Cache需要做到：hit信号始终为0，不得置高，数据输出可以是任意值
