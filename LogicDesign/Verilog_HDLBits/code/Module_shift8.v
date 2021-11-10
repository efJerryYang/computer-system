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
