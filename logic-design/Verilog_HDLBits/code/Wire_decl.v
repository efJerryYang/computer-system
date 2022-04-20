`default_nettype none
module top_module(input a,
                  input b,
                  input c,
                  input d,
                  output out,
                  output out_n);
    
    wire tmp = (a & b) | (c & d); // 能不能这样赋值初始化
    
    assign {out, out_n} = {tmp, ~tmp};
    
endmodule
