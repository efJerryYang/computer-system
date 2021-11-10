`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/11/05 15:06:50
// Design Name:
// Module Name: decoder_38_sim
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module decoder_38_sim ();
    wire [2:0] switch;
    wire [2:0] enable;
    reg [7:0] led;

    decoder_38 U_dec38_0(
    .data_i (switch),
    .en_i (enable),
    .data_o (led)
    );
    initial begin
        #5 begin enable = 3'b100; switch = 3'b000; end
        #5 begin enable = 3'b100; switch = 3'b001; end
        #5 begin enable = 3'b100; switch = 3'b010; end
        #5 begin enable = 3'b100; switch = 3'b011; end
        #5 begin enable = 3'b100; switch = 3'b100; end
        #5 begin enable = 3'b100; switch = 3'b101; end
        #5 begin enable = 3'b100; switch = 3'b110; end
        #5 begin enable = 3'b100; switch = 3'b111; end
        #5 begin enable = 3'b101; switch = 3'b000; end
        #5 $stop;
    end
endmodule
