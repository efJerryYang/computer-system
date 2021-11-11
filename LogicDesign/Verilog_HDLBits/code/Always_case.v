// synthesis verilog_input_version verilog_2001
module top_module (input [2:0] sel,
                   input [3:0] data0,
                   input [3:0] data1,
                   input [3:0] data2,
                   input [3:0] data3,
                   input [3:0] data4,
                   input [3:0] data5,
                   output reg [3:0] out);

wire tmp = {8'd0,data5,data4,data3,data2,data1,data0};
always@(*) begin  // This is a combinational circuit
    out = (sel > -1 && sel < 6) ? tmp[sel*4 +: 4] : 4'd0;
    // case(sel)
    // 3'd0: out = data0;
    // 3'd1: out = data1;
    // 3'd2: out = data2;
    // 3'd3: out = data3;
    // 3'd4: out = data4;
    // 3'd5: out = data5;
    // endcase
end

endmodule
