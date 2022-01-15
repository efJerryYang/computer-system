// synthesis verilog_input_version verilog_2001
module top_module (input [15:0] scancode,
                   output reg left,
                   output reg down,
                   output reg right,
                   output reg up);

always @(*) begin
    {left,right,down,up} = 4'b0;
    case(scancode)
        16'he06b:	left  = 1'b1;
        16'he072:	down  = 1'b1;
        16'he074:	right = 1'b1;
        16'he075:	up    = 1'b1;
    endcase
end

endmodule


//error!
// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );
    
    always@(*) begin
        reg flag = 1'b0;
        pos      = 3'd0;
        integer i=0;
        for(i = 0; i < 8; i = i + 1) begin
            if (~flag && in[i])begin
                flag = 1'b1;
                pos  = i;
            end
        end
    end
endmodule
