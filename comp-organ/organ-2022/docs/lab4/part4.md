## 1. 直接映射Cache的结构

Cache由存储体和控制机构两大主要部分构成。

### 1.1 **Cache的存储体**

 <center><img src="../s4-1.png" width = 550></center>

Ø 有效位（Valid）：标识该行内存储的数据是否有效，未装入任何数据之前无效。

Ø 标记（Tag）：用以唯一地标识某个地址，判断是否访问命中。

Ø 数据域（Data）：连续存储的k个相邻的在主存中连续的数据。

- **映射机制**

如上所示的地址映射机制，低2位为字块内偏移，代表一个Cache行存储有4个字节。中间10位为Cache字块地址，代表Cache有1024个Cache行。高20位为Tag，用以唯一地标识某个主存地址，与Cache中的标记位比对，判断是否访问命中。

- **地址分解**

 <center><img src="../s4-2.png" width = 550></center>

例如，我们系统的主存容量为256KB，则主存地址宽度为18位；我们设计Cache每个字块中存储4个字节，则每个块中需要用2位去寻址相应的字节；Cache容量为256行（256*4B=1024B），且设计的方式是直接相联，则Cache字块地址为8位；剩余的18-8-2=8位，则作为Tag使用。此时，我们即完成了地址的分解工作。

如上图所示，一个典型的直接映射Cache访问主要完成几项工作：

Ø Cache寻址：根据主存地址中的Cache索引，选出对应的Cache块（行）

Ø 标记比对：主存中的标记位和取出行中的标记位对比，加上Valid位，判断是否命中

Ø 选出数据：如果命中，根据地址的低位偏移，在读出的Cache Line的数据域中，选择相应的数据，回送给主设备，并采取相应的机制通知主设备，在本次实验中，我们要求拉高Cache模块的hit信号，同时将数据输出到data_out上。

Ø 缺失处理：如果不命中的话，还需要进行缺失的处理，在下一部分将会提到。

### 1.2 Cache控制机构

- **缺失处理机制**

当Cache的访问发生缺失时，应要有相应的机制，确定缺失的位置，并向下一级存储器发出读字块的请求。

- **缺失动作**

在缺失时，Cache向下一级存储器（本实验中为mem_wrap）发起读请求，请求读取4个连续存储的字，待下级存储器响应后，将返回的数据采集、打上相应的标签，然后写入自身的存储体中。

缺失分为读缺失和写缺失。本实验<span style="border-bottom:2px dashed blue;">只要求实现读缺失的处理，不需实现写缺失的处理</span>。

- **实现原理**

在时序电路中，如果要执行顺序发生的动作，并带有条件跳转，状态机是通用的做法。我们使用状态机生成控制信号，对数据通路进行操纵，从而达到处理各种情况的目的。



## 2. 项目概览

### 2.1 项目框架概览

Ø 设计文件

driver (driver.sv) ----- 顶层模块，模拟CPU的访存行为，并进行数据正确性检查，可以看作是CPU

trace (IP核) ----- 存储标准答案

cache (cache.v) ----- Cache模块（需要完成）

mem_wrap(mem_wrap.v) ----- 主存存储器模型

模块间的关系如下图所示：

 <center><img src="../s5-3.png" width = 450></center>

### 2.2 Cache模块接口

| 序号 | 属性 |      名称       |          含义           | 位宽 |
| :-:  | :--: | :-------------: | :---------------------: | :--: |
|   1  | 输入 |       clk       |          时钟           |  1   |
|   2  | 输入 |      reset      |   复位（高电平有效）    |  1   |
|   3  | 输入 |  addr_from_cpu  |     CPU的读/写地址      |  13  |
|   4  | 输入 |  rreq_from_cpu  |       CPU的读请求       |  1   |
|   5  | 输入 |  wreq_from_cpu  |       CPU的写请求       |  1   |
|   6  | 输入 |  wdata_from_cpu |       CPU的写数据       |  8   |
|   7  | 输出 |  rdata_to_cpu   |     Cache读出的数据     |  8   |
|   8  | 输出 |   hit_to_cpu    |        命中标记         |  1   |
|   9  | 输入 | rdata_from_mem  | 主存模块读取的连续4字节 |  32  |
|  10  | 输入 | rvalid_from_mem |    主存读取完毕标记     |  1   |
|  11  | 输出 |   rreq_to_mem   |       读主存请求        |  1   |
|  12  | 输出 |  raddr_to_mem   |      读主存首地址       |  13  |
|  13  | 输出 |   wreq_to_mem   |       写主存请求        |  1   |
|  14  | 输出 |  waddr_to_mem   |       写主存地址       |  13  |
|  15  | 输出 |  wdata_to_mem   |       写主存数据       |  8  |

### 2.3 Cache时序要求

本实验中，Cache存储体调用Block RAM的IP核实现，因此，我们需要了解Block RAM的读/写时序。IP核的使用见后文附录。

- **Block RAM的读写时序：**

 <center><img src="../s5-6.png" width = 700></center>

Ø 读时序：上一周期给出地址，下一周期输出数据，可连续读取。（周期1，2，3）

Ø 写时序：上一周期给数据、写地址，拉高wea信号，下一周期成功写入数据，刚刚写入的数据出现在douta口上。

- **Cache的读时序**

 <center><img src="../s5-7.png" width = 600></center>  

下面以 Cyc# 代表周期号，详细叙述Cache和CPU之间的通信约定。

Ø CPU发来rreq信号，同时把地址放在addr端口上(Cyc #0、Cyc #3)，代表启动一次读操作。在得到Cache的hit响应(Cyc #1、Cyc #5)之前，CPU会保证：rreq_from_cpu信号不会撤下，且地址线addr_from_cpu上的地址不会改变(Cyc #0 - Cyc #1、Cyc #3 - Cyc #5)。

Ø 在得到Cache的hit响应之后(Cyc #1、Cyc #5)，CPU会保证：在hit信号到来的下一个周期(Cyc #2、Cyc #6)，rreq信号马上撤下。Cache需要做到：hit响应信号和读出的数据只需持续一个周期(Cyc #1 - Cyc #2、Cyc #5 - Cyc #6)，同时有效。

Ø CPU未发rreq信号的时候，Cache需要做到：hit信号始终为0，不得置高，数据输出可以是任意值。

- **Cache的写时序**

 <center><img src="../s5-8.png" width = 530></center>

Ø CPU发来wreq信号，同时把写地址放在addr端口上(Cyc #0)，代表启动一次写操作。与读操作不同的是：不管Cache是否写命中，CPU的写请求信号wreq_from_cpu和地址信号addr_from_cpu都将仅保持2个时钟周期(Cys #0 - Cyc #2、Cyc #3 - Cyc #5)，而CPU的写数据信号wdata_from_cpu则将在写请求信号wreq_from_cpu有效后的下一个周期前有效(Cyc #1、Cyc #4)。

Ø 如果Cache写命中，则Cache将在收到wreq的下一个周期输出hit响应信号(Cyc #1)。由于采用写直达的写策略，此时Cache除了需要更新相应的Cache数据外，还需按照Block RAM的写时序，向内存输出写数据信号。

Ø 如果Cache写缺失，则Cache需要保证hit信号始终保持低电平(Cyc #4)，并且此时Cache不得修改相应的Cache数据，也不得修改主存的数据。

### 2.4 主存访问时序要求

本次实验采用的<span style="border-bottom:2px dashed blue;">存储系统大小为8K，地址宽度为13，字长为1字节</span>，对应的源文件为mem_wrap.v。

Cache发生读缺失时，需将当前访问地址所在的数据块从内存中读取进入到Cache内，该过程称为Cache的重填。本实验中，一个Cache块包含4个字节的数据，因此Cache重填时，需一次从内存中读取连续的4个字节数据。为降低难度，mem_wrap模块已将Cache重填时连续读取4个字并拼接的工作完成，具体时序图如下图所示。

 <center><img src="../s5-1.png" width = 420></center>  

在主存空闲阶段，Cache将地址放在raddr端口上，并将rreq信号拉高，代表一次的读请求。若干个周期后，主存将返回4个字拼接而成的数据，并将rvalid信号拉高，代表数据已经准备好，此时可以取走数据。注意，上图中返回的data0是32位的数据。此外，还需注意，读请求信号rreq需一直保持高电平，直到主存成功地返回了数据（即直到rvalid有效）。

向内存中写数据的时序如下图所示。

 <center><img src="../s5-2.png" width = 340></center>  

在上图中，Cache将写地址、写数据分别从waddr、wdata端口输出，同时将wreq信号拉高1个时钟周期。当内存模块mem_wrap接收到这些信号后，将自动完成写数据操作。

### 2.5 仿真说明

完成设计后，运行testbench.v文件中的仿真。运行仿真时，Vivado下方的Tcl Console窗口将打印调试信息，帮助定位出错点。

 <center><img src="../s5-4.png" width = 280></center>  

如果测试全部通过，控制台会显示相应字样，同时仿真将会停止在对应位置。

 <center><img src="../s5-5.png"></center>  

提供的Testbench将对Cache的读命中、读缺失、写命中、写缺失进行测试。对于写缺失的情形，Testbench将检测发生写缺失时，主存中的相应数据是否被不正确地修改。

另外，仿真波形应使用cache工程目录下的testbench_behav.wcfg文件。一般情况下，进行仿真时，Vivado将自动选取该文件以显示波形，故不需额外的操作。但如果发现仿真时，Vivado没有使用该文件，则需要手动导入。
