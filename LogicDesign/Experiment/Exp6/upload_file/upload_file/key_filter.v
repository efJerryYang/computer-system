`timescale 1ns / 1ps

module key_filter(input wire rst,
                  input wire clk,
                  input wire button,
                  output reg button_f);
    // parameter CNT_MAX = 32'd1000;  // 计数器最大数值，控制两次按键时间间隔
    parameter CNT_MAX    = 32'd3;  // simulation

    reg [31:0] cnt = 0   ;  // 两次按键最小时间间隔计数，用于消除毛刺信号
    wire rst_n     = ~rst;  // rst_n下降沿复位
    
    always @(*) begin
        if (~rst_n)
            button_f = 0;
        else if (cnt == CNT_MAX && button)
            button_f = 1;
        else
            button_f = 0;
    end
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            cnt <= 0;
        else if (button) begin
            if (cnt == CNT_MAX)
                cnt <= 0;
            else
                cnt <= cnt;
        end
        else  begin
            if (cnt == CNT_MAX)
                cnt <= cnt;
            else
                cnt <= cnt + 1;
        end
    end
endmodule
