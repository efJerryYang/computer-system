# 实验原理

### 1 C语言的执行过程

一段C语言程序的执行过程主要包括如下：编译、汇编、链接、加载执行；

 <center><img src="../s4-1.png" width = 500></center>    

#### **1.1** **编译**

编译由 .c转为汇编语言，形式是 .s，分为两步：预处理和编译；

 

A、预处理

预处理的过程主要包括以下过程：

将所有的#define删除，并且展开所有的宏定义，并且处理所有的条件预编译指令，比如#if #ifdef #elif #else #endif等。

处理#include预编译指令，将被包含的文件插入到该预编译指令的位置。

删除所有注释“//”和“/* */”。

添加行号和文件标识，以便编译时产生调试用的行号及编译错误警告行号。

保留所有的#pragma编译器指令，后续编译过程需要使用它们。

 

B、编译

编译过程就是对预处理完的文件进行一系列的词法分析，语法分析，语义分析及优化后生成相应的汇编代码。



#### **1.2** **汇编**

将汇编语言生成ELF（Executable and Linkable Format）的object file,，object file属于machine language；

汇编过程调用对汇编代码进行处理，生成处理器能识别的指令，保存在后缀为.o的目标文件中。由于每一个汇编语句几乎都对应一条处理器指令，因此，汇编相对于编译过程比较简单，通过调用汇编器，根据汇编指令和处理器指令的对照表一一翻译即可。

当程序由多个源代码文件构成时，每个文件都要先完成汇编工作，生成.o目标文件后，才能进入下一步的链接工作。注意：目标文件已经是最终程序的某一部分了，但是在链接之前还不能执行。

**ELF 文件内容：**

ELF Header, 以一个 16byte 的序列开始，描述系统 word 大小、字节顺序等；

.text：text segment, 编译程序的机器代码

.data：已初始化的 global/static C variable, 即源代码的 static 部分。

.symtab：符号表，存放定义、引用的函数、全局变量和不可被 reference 的 static 变量

.debug：调试符号表，包含原始文件; .line 同样，包含行号和 .text 的映射。只有 -g 编译才会产生

.strtab：字符串表，包含定义的 string 和 section 的名字。

#### **1.3** **链接**

将ELF的objective code转化为可执行文件，这一过程被称为linking，这一过程有逻辑上如下的流程：

- 从 `.o` 文件把 text segment 合在一起
- 拿到 data segment, 拼接到一起
- resolve reference, 解决掉跨文件的符号、依赖问题，用绝对的地址填充

经过汇编以后的目标文件还不能直接运行，为了变成能够被加载的可执行文件，文件中必须包含固定格式的信息头，还必须与系统提供的启动代码链接起来才能正常运行，这些工作都是由链接器来完成的。



#### **1.4** **加载**

通常是OS会加载可执行文件、运行程序

它需要：

1. 读 executable 文件，加载 ELF，来知道 text 和 data 的大小

2. 创建带 stack、text 的地址空间

3. 把 instruction 和 data 拷贝到新的地址空间

4. 拷贝用户的参数，传到栈上，供程序运行

5. 初始化寄存器

6. 跳转到用户程序，并设置 PC

   

#### **1.5** **反汇编**

由于ELF文件无法被当做普通文本文件打开，如果希望直接查看一个ELF文件包含的指令和数据，需要使用反汇编的方法。

反汇编是用于调试和定位处理器问题时最常用的手段。



### 2 实例说明

以Hello World的C语言程序为例，简单的说明其执行过程。

 

#### 2.1 **编写hello.c**

 <center><img src="../s4-2.png" width = 300></center>   

使用文本编辑器Text Editor（使用方式见附录）或GVim编写，C语言程序代码可以在Windows系统中调试完成，使用剪切板拷贝到文件中，按照下图所示的目录保存为hello.c文件。

GVim创建文件命令：gvim hello.c

 <center><img src="../s4-8.png" width = 500></center>   

#### 2.2 **预编译**

打开终端terminal（快捷键Ctrl+Alt+T），在命令行内，执行如下指令进行预编译，得到预编译文件hello.i

riscv64-unknown-elf-gcc -E hello.c -o hello.i

 <center><img src="../s4-9.png" width = 600></center>   

查看预编译文件

gvim hello.i &

 <center><img src="../s4-3.png" width = 500></center>   

#### 2.3 **编译**

在命令行内，执行如下指令进行编译，得到汇编文件hello.s

riscv64-unknown-elf-gcc -S hello.i -o hello.s

查看汇编文件

gvim hello.s &

 <center><img src="../s4-4.png" width = 500></center>   

#### 2.4 **汇编**

在命令行内，执行如下指令进行汇编，得到elf文件hello.o

riscv64-unknown-elf-gcc -c hello.s -o hello.o

查看机器码

riscv64-unknown-elf-objdump -D hello.o

 <center><img src="../s4-5.png" width = 500></center>   

#### 2.5 **生成可执行文件**

在命令行内，执行如下指令进行生成可执行文件

riscv64-unknown-elf-gcc hello.c -o hello

执行可执行文件

spike pk hello

 <center><img src="../s4-6.png" width = 500></center>   

#### 2.6 **反汇编**

在命令行内，执行如下指令进行反汇编

riscv64-unknown-elf-objdump -S hello > hello.txt

查看反汇编文件

gvim hello.txt &

 <center><img src="../s4-7.png" width = 500></center>   
