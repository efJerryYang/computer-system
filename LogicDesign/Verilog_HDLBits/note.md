1. 按位与或非

2. 逻辑与或

3. 对一个向量各个位做**按位与或非(bitwise)**

   ```verilog
   assign vector = & vector;
   ```

4. 向量的用法

   ```verilog
   assign vector = {{{{{{vector}}}}}};  // 可以任意的嵌套而不改变它的意义
   
   wire [31:0] out_vect = {a,b,c,d,e,f,2'b11};  // 向量赋值本质上是内存的直接拼接
   assign {w,x,y,z} = out_vect;  // 也可以赋值给多个向量
   
   assign out = {{24{in[7]}} , in };  // 语法允许生成重复字段的向量，两个花括号都不能少
   assign out = ~{{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}} ^ { {5{a,b,c,d,e}} };
   ```

5. loop

   ```verilog
   // 循环的使用
   // 这种不能被综合，是不被建议的用法
   always @(*) begin	
       for (integer i=0; i<8; i++)
           out[i] = in[8-i-1];
   end
   
   // 这种循环，本质上是代码的嵌入，是建议的做法
   // This is not a procedure block, so use assign statement
   generate
       genvar i;
       for (i=0; i<8; i = i+1) begin: my_block_name
           assign out[i] = in[8-i-1];
       end
   endgenerate
   ```
   
6. module

   > 模块是一整块板子，而不是函数

   ```verilog
   // 实例化一个模块mod_a是模块类型，这里要自定义一个名字
   mod_a by_name (
       .in1(a),
       .in2(b),
       .in3(c),
       .in4(d),
       .out1(out1),
       .out2(out2)
   );
   ```

7. condition 

   ``` verilog
   assign out = sel ? b : a;
   ```

8. 多路选择器

   ```verilog
   module top_module (
   	input [255:0] in,
   	input [7:0] sel,
   	output  out
   );
   
   	// Select one bit from vector in[]. The bit being selected can be variable.
   	assign out = in[sel];
   	
   endmodule
   ```

9. *多路

   ```verilog
   module top_module (
   	input [1023:0] in,
   	input [7:0] sel,
   	output [3:0] out
   );
   
   	// We can't part-select multiple bits without an error, but we can select one bit at a time,
   	// four times, then concatenate them together.
   	assign out = {in[sel*4+3], in[sel*4+2], in[sel*4+1], in[sel*4+0]};
   
   	// Alternatively, "indexed vector part select" works better, but has an unfamiliar syntax:
   	// assign out = in[sel*4 +: 4];		// Select starting at index "sel*4", then select a total width of 4 bits with increasing (+:) index number.
   	// assign out = in[sel*4+3 -: 4];	// Select starting at index "sel*4+3", then select a total width of 4 bits with decreasing (-:) index number.
   	// Note: The width (4 in this case) must be constant.
   
   endmodule
   
   ```

10. 对于译码器的简洁写法

    ![Module_shift8](img\Module_shift8.png)

    ```verilog
    module top_module (input clk,
                       input [7:0] d,
                       input [1:0] sel,
                       output [7:0] q);
        wire [7:0] jud[3:0];
        assign jud[0] = d;
        my_dff8 d1(clk,d,jud[1]);
        my_dff8 d2(clk,jud[1],jud[2]);
        my_dff8 d3(clk,jud[2],jud[3]);
        assign q = jud[sel];
    endmodule
    
    ```

11. 全加器

    ```verilog
    module add1 (input a, input b, input cin, output sum, output cout);
        assign sum  = a ^ b ^ cin;
        assign cout = (a&b)|((a ^ b)& cin);
        // assign cout = (a&b)|((a | b)& cin); // or coded like this
    endmodule
    ```

    

12. 16位加法器组合成32位加法器

    ```verilog
    module top_module (input [31:0] a,
                       input [31:0] b,
                       output [31:0] sum);
    wire[15:0] low_cout, high_cout;
    reg [15:0] zeros = '0;
    add16 add_lo(a[15:0], b[15:0],  zeros, sum[15:0], low_cout);
    add16 add_hi(a[31:16],b[31:16], low_cout, sum[31:16], high_cout);
    endmodule
    
    module add1 (input a, input b, input cin,   output sum, output cout);
        assign sum  = a ^ b ^ cin;
        assign cout = (a&b)|((a ^ b)& cin);
    endmodule
    ```

13. combinational always block & assign statements

    > assign statements and combinational always blocks function identically

    ```verilog
    // synthesis verilog_input_version verilog_2001
    module top_module(
        input a, 
        input b,
        output wire out_assign,
        output reg out_alwaysblock
    );
        assign out_assign = a & b;
        always @(*) out_alwaysblock = a & b;
    //    always @(*) begin
    //        out_alwaysblock = a & b;
    //    end
    
    endmodule
    ```

14. For hardware synthesis, there are two types of `always` blocks that are relevant:

    - Combinational: `always @(*)`
    - Clocked: `always @(posedge clk)`

    Clocked always blocks create a blob of combinational logic just like combinational always blocks, but also creates a set of flip-flops (or "registers") at the output of the blob of combinational logic. Instead of the outputs of the blob of logic being visible immediately, the outputs are visible only immediately after the next (posedge clk).

    > pos-edge and neg-edge

    **Blocking vs. Non-Blocking Assignment**

    There are three types of assignments in Verilog:

    - **Continuous** assignments (`assign x = y;`). Can only be used when **not** inside a procedure ("always block").
    - Procedural **blocking** assignment: (`x = y;`). Can only be used inside a procedure.
    - Procedural **non-blocking** assignment: (`x <= y;`). Can only be used inside a procedure.

    In a **combinational** always block, use **blocking** assignments. In a **clocked** always block, use **non-blocking** assignments. A full understanding of why is not particularly useful for hardware design and requires a good understanding of how Verilog simulators keep track of events. Not following this rule results in extremely hard to find errors that are both non-deterministic and differ between simulation and synthesized hardware.

    ### A bit of practice

    Build an XOR gate three ways, using an assign statement, a combinational always block, and a clocked always block. Note that the clocked always block produces a different circuit from the other two: There is a flip-flop so the output is delayed.

    ![Alwaysff.png](.\img\Alwaysff.png)

    my code here

    ```verilog
    // synthesis verilog_input_version verilog_2001
    module top_module(
        input clk,
        input a,
        input b,
        output wire out_assign,
        output reg out_always_comb,
        output reg out_always_ff   );
    
        assign out_assign = a ^ b;
        always @(*) out_always_comb = a ^ b;
        always @(posedge clk) out_always_ff <= a ^ b;
    endmodule
    ```

15. **A common source of errors: How to avoid making latches**

    When designing circuits, you *must* think first in terms of circuits:

    - I want this logic gate
    - I want a *combinational* blob of logic that has these inputs and produces these outputs
    - I want a combinational blob of logic followed by a set of flip-flops

    What you *must not* do is write the code first, then hope it generates a proper circuit.

    - If (cpu_overheated) then shut_off_computer = 1;
    - If (~arrived) then keep_driving = ~gas_tank_empty;

    Syntactically-correct code does not necessarily result in a reasonable circuit (combinational logic + flip-flops). The usual reason is: "What happens in the cases other than those you specified?". Verilog's answer is: Keep the outputs unchanged.

    This behaviour of "keep outputs unchanged" means the current state needs to be *remembered*, and thus produces a *latch*. Combinational logic (e.g., logic gates) cannot remember any state. Watch out for `Warning (10240): ... inferring latch(es)"` messages. Unless the latch was intentional, it almost always indicates a bug. Combinational circuits must have a value assigned to all outputs under all conditions. This usually means you always need `else` clauses or a default value assigned to the outputs.

    **Demonstration**

    The following code contains incorrect behaviour that creates a latch. Fix the bugs so that you will shut off the computer only if it's really overheated, and stop driving if you've arrived at your destination or you need to refuel.

    

    [![Always if2.png](https://hdlbits.01xz.net/mw/images/d/d1/Always_if2.png)](https://hdlbits.01xz.net/wiki/File:Always_if2.png)

    ```verilog
    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
    end
    
    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
    end
    ```
    
    my code here
    
    ```verilog
    // synthesis verilog_input_version verilog_2001
    module top_module (input cpu_overheated,
                       output reg shut_off_computer,
                       input arrived,
                       input gas_tank_empty,
                       output reg keep_driving);     //
        
        always @(*) begin
            shut_off_computer = cpu_overheated ? 1'b1 : 1'b0;
            keep_driving      = (~arrived) ? ~gas_tank_empty : 1'b0;
        end
        
    endmodule
    ```
    
16. **Case statement**

    Case statements in Verilog are nearly equivalent to a sequence of if-elseif-else that compares one expression to a list of others. Its syntax and functionality differs from the `switch` statement in C.

    ```verilog
    always @(*) begin     // This is a combinational circuit
        case (in)
          1'b1: begin 
                   out = 1'b1;  // begin-end if >1 statement
                end
          1'b0: out = 1'b0;
          default: out = 1'bx;
        endcase
    end
    ```

    - The case statement begins with `case` and each "case item" ends with a colon. There is no "switch".
    - Each case item can execute *exactly one* statement. This makes the "break" used in C unnecessary. But this means that if you need more than one statement, you must use `begin ... end`.
    - Duplicate (and partially overlapping) case items are permitted. The first one that matches is used. C does not allow duplicate case items.

17. casez

    ```verilog
    // synthesis verilog_input_version verilog_2001
    module top_module (
        input [7:0] in,
        output reg [2:0] pos  );
        
        always@(*)begin
            pos = 3'b0;
            casez(in)
                8'bzzzzzzz1:pos = 3'd0;
                8'bzzzzzz10:pos = 3'd1;
                8'bzzzzz10z:pos = 3'd2;
                8'bzzzz1000:pos = 3'd3;
                8'bzzz100zz:pos = 3'd4;
                8'bzz10zz00:pos = 3'd5;
                8'bz1zzz000:pos = 3'd6;
                8'b10000000:pos = 3'd7;
            endcase
        end
    endmodule
    ```

18. **Reminder:** The logic synthesizer generates a combinational circuit that *behaves* equivalently to what the code describes. Hardware does not "execute" the lines of code in sequence.

    > 那么，17的写法就有问题，并行会导致同一位置被多个值赋值。为什么能通过？我的问题，还是样例的输入不够？

19. **Conditional**

    Verilog has a ternary conditional operator ( ? : ) much like C:

    ```verilog
    (condition ? if_true : if_false)
    ```

    This can be used to choose one of two values based on *condition* (a mux!) on one line, without using an if-then inside a combinational always block.

    Examples:

    ```verilog
    (0 ? 3 : 5)     // This is 5 because the condition is false.
    (sel ? b : a)   // A 2-to-1 multiplexer between a and b selected by sel.
    
    always @(posedge clk)         // A T-flip-flop.
      q <= toggle ? ~q : q;
    
    always @(*)                   // State transition logic for a one-input FSM
      case (state)
        A: next = w ? B : A;
        B: next = w ? A : B;
      endcase
    
    assign out = ena ? q : 1'bz;  // A tri-state buffer
    
    ((sel[1:0] == 2'h0) ? a :     // A 3-to-1 mux
     (sel[1:0] == 2'h1) ? b :
                          c )
    ```

20. D flip-flop 

    ```verilog
    module top_module (
        input clk,    // Clocks are used in sequential circuits
        input d,
        output reg q );//
    
        always@(posedge clk) q <=d; // copy d to q at every positive edge of clk
    endmodule
    
    // Undefined simulation behaviour can occur if there is more than one edge-triggered
    // always block and blocking assignment is used. Which always block is simulated first?
    
    ```

21. 复位

    ```verilog
    // 同步复位
    module top_module (
        input clk,
        input reset,
        input [7:0] d,
        output [7:0] q
    );
        always@(negedge clk)
            q <= reset ? 8'h34 : d;
    endmodule
    
    // 异步复位
    module top_module (
        input clk,
        input areset,   // active high asynchronous reset
        input [7:0] d,
        output [7:0] q
    );
        always@(posedge clk, posedge areset)
            q <= areset ? 8'b0 : d;
    
    endmodule
    
    
    	// In Verilog, the sensitivity list looks strange. The FF's reset is sensitive to the
    	// *level* of areset, so why does using "posedge areset" work?
    	// To see why it works, consider the truth table for all events that change the input 
    	// signals, assuming clk and areset do not switch at precisely the same time:
    	
    	//  clk		areset		output
    	//   x		 0->1		q <= 0; (because areset = 1)
    	//   x		 1->0		no change (always block not triggered)
    	//  0->1	   0		q <= d; (not resetting)
    	//  0->1	   1		q <= 0; (still resetting, q was 0 before too)
    	//  1->0	   x		no change (always block not triggered)
    	
    
    ```

22. counter

    ```verilog
    module top_module (
        input clk,
        input reset,      // Synchronous active-high reset
        output [3:0] q);
    
        initial q = 0; // 不是必要的
        always@(posedge clk)
            q <= reset ? 4'b0 : q + 1;
    endmodule
    ```

23. more for counter

    ```verilog
    module top_module (input clk,
                       input reset,
                       input enable,
                       output [3:0] Q,
                       output c_enable,
                       output c_load,
                       output [3:0] c_d);
        
        assign c_enable = enable;
        assign c_load   = reset | ((Q == 4'd12) && enable == 1'b1);
        assign c_d      = c_load ? 4'd1 : 4'd0;
        
        count4 the_counter (clk, c_enable, c_load, c_d, Q);
        
    endmodule
    
    ```

24. https://blog.csdn.net/frank_wff/article/details/43226507 异步复位，同步释放

25. 两段提醒

    ```
    写verilog一定要一个always就只对一个信号赋值，一个信号只在一个always里赋值
    写verilog应该「面向信号编程」，在一个 always 块里面就只针对一个变量，想“它在什么条件下会变成啥”
    这个和写软件的高级语言思维方式有点不一样
    感觉你现在还是按照C语言的思维方式写的，这个不是写 verilog 的思维方式
    硬件就是要拿来并行
    ```

    ```
    不过建议先重构下代码
    一个always模块尽量只对一个变量赋值
    ```

    > 总结：
    >
    > **一个always只对一个信号赋值**，想**它在什么条件下变成什么**，条件直接拿来用
    >
    > 因为是**并行的**，你会在其他的always处理好其他的信号的赋值问题
    >
    > "**面向信号编程**"

