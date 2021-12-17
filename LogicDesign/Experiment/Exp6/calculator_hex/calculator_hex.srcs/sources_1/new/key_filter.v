`timescale 1ns / 1ps

module key_filter(input wire rst,
                  input wire clk,
                  input wire button,
                  output reg button_f);
    // parameter CNT_MAX = 32'd1000;
    parameter CNT_MAX    = 32'd3;  // simulation
    
    wire rst_n     = ~rst;
    reg [31:0] cnt = 0;
    
    always @(*) begin
        if (~rst_n)
            button_f = 0;
        else if (cnt == CNT_MAX && button)
            button_f = 1;
        else
            button_f = 0;
    end
    // always @(posedge clk, negedge rst_n) begin
    //     if (~rst_n)
    //         cnt <= 0;
    //     else if (cnt < CNT_MAX)
    //         cnt <= cnt + 1;
    //     else if (cnt == CNT_MAX)
    //         if (button)
    //             cnt <= 0;
    //         else
    //             cnt <= cnt;
    //     else
    //         cnt <= cnt;
    // end
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
