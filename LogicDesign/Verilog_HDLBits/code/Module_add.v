module top_module(input [31:0] a,
                  input [31:0] b,
                  output [31:0] sum);
wire[15:0] low_cout, low_sum;
add16 add_low(
.a(a[15:0]),
.b(b[15:0]),
.cin({16{1'b0}}),
.sum(low_sum),
.cout(low_cout)
);

wire [15:0] high_cout,high_sum;
add16 add_high(
.a(a[31:16]),
.b(b[31:16]),
.cin(low_cout),
.sum(high_sum),
.cout(high_cout)
);
assign sum = {high_sum,low_sum};
endmodule
