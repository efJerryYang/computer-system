`timescale 1ns / 1ps
module flowing_water_lights (input wire clk,
                             input wire rst,
                             input wire button,
                             output reg [7:0] led);
    parameter CNT_ZEROS = 32'd0;
    parameter POS_ZEROS = 3'd0;
    parameter LED_ZEROS = 8'd0;
    `ifdef SIMULATION
    parameter CNT_MAX = 32'd4;
    `else
    parameter CNT_MAX = 32'd1_0000_0000;
    reg [31:0] cnt    = CNT_ZEROS;
    reg [2:0]  pos    = POS_ZEROS;
    reg on_button     = 1'b0;
    
    always @(posedge clk, posedge rst, posedge button) begin
        if (rst) begin
            cnt       <= CNT_ZEROS;
            pos       <= POS_ZEROS;
            on_button <= 1'b0;
            led       <= LED_ZEROS;
        end
        else if (button) begin
            on_button <= 1'b1;
            if (led == LED_ZEROS)begin
                led[pos] <= 1'b1;
            end
            else begin
                led <= led;
            end
        end
            else if (on_button) begin
            if (cnt == CNT_MAX) begin
                cnt <= CNT_ZEROS;
                pos <= pos + 1'b1;
            end
            else begin
                cnt <= cnt + 1'b1;
            end
            end
        else begin
            cnt <= cnt;
            pos <= pos;
        end
    end
endmodule
