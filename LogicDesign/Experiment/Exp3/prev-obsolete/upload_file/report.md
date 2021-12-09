## 实验3 利用IP设计电路

### 提交文件

* Verilog文件列表如下，均需在文件夹下
  `memory_top.v`,`memory_w_r.v`,`clk_div_final.v`,`state_work.v`

> IP核注项
> 
> `clk_div`，分频后时钟为20MHz，再经过`clk_div_final.v`模块得到仿真和上板所需时钟。

### 仿真波形

![sim_fig](.\sim_fig.png)

### 波形分析

本实验主要在于使用IP核完成特定功能，在启动前led全灭，按下button启动后，led逐灯亮起直到全亮，最后保持全亮不变直到rst被按下。实验中使用时钟ip clock_wizard和RAM ip，要求在分频后的时钟下，每次时钟上沿触发后，从ram中读取数值，并对应到led的16位进行亮灯。

波形中，每经过150ns（15个时钟周期），led亮灯盏数增加，在亮灯16盏之后led保持不变，重置后，led亮灯数目清零。在memory_w_r.v中，每次clk_fnl时钟上沿触发的时候，根据条件修改enable_reg和write_reg的值，从而控制led_mem模块控制的RAM的读写。模块中rst触发时，先使led全灭，并分别对各模块所有经处理数据进行清空，回到最初未启动的状态，按下button后重新开始读写过程。

未避免冗余代码的修改，和各模块分工的代码写法，将各模块分别用单独的Verilog文件编写，同时在memory_w_r.v中使用易于综合的generate块来对准备写入的数据进行自动化操作，简化了代码写法。本次实验很好的完成了利用IP设计电路的基本要求，提高了对硬件编程的认识，学习到调用IP来实现功能的策略。
