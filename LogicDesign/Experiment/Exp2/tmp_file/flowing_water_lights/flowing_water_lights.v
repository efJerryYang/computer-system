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
    `endif
    reg [31:0] cnt      = CNT_ZEROS;
    reg on_button       = 1'b0;
    
    always @(posedge clk or posedge rst) begin      // 处理cnt
        if (rst || !on_button)
            cnt <= CNT_ZEROS;
        else if (cnt < (CNT_MAX-1))
            cnt <= cnt + 1;
        else
            cnt <= CNT_ZEROS;
    end

    always @(posedge button or posedge rst) begin   // 处理 on_button
        if (rst)
            on_button <= 1'b0;
        else if (button)
            on_button <= 1'b1;
        else
            on_button <= on_button;
    end

    always @(posedge clk or posedge rst) begin      // 处理led
        if (rst)
            led <= LED_ZEROS;
        else if (on_button) begin
            if (led == LED_ZEROS)
                led[0] = 1'b1;
            else if (cnt == (CNT_MAX-1))
                led <= {led[6:0],led[7]};
            else
                led <= led;
        end
        else
            led <= led;
    end
    
endmodule
