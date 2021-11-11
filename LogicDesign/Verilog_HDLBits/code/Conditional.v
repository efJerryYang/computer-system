module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] x[1:0];
    min min1(a,b,x[0]);
    min min2(c,d,x[1]);
    min min3(x[0],x[1],min);
    // assign intermediate_result1 = compare? true: false;
endmodule
module min(
    input [7:0] a,b,
    output [7:0] min_num);
    assign min_num = a > b ? b:a;
endmodule
