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
