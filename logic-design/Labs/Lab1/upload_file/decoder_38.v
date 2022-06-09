`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/11/05 15:04:31
// Design Name:
// Module Name: decoder_38
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


module decoder_38 (input wire clk,
                   input wire rst,
                   input wire [2:0] enable,
                   input wire [2:0] switch,
                   output reg [7:0] led);
    
    always @(*) begin
        if (rst) led <= 8'b11111111;        // If rst is true, light all LEDs
        led = 8'b11111111;                  // Initialize led with 8'b11111111, if enable is 3'b100, change its value in 'case block'
        if (enable == 3'b100)
            case (switch)
                3'b000:led = 8'b11111110;
                3'b001:led = 8'b11111101;
                3'b010:led = 8'b11111011;
                3'b011:led = 8'b11110111;
                3'b100:led = 8'b11101111;
                3'b101:led = 8'b11011111;
                3'b110:led = 8'b10111111;
                3'b111:led = 8'b01111111;
            endcase                         // Without default case
        
    end
    
endmodule
    
