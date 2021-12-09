`timescale 1ns / 1ps

module holiday_lights (input wire clk,
                       input wire rst,
                       input wire button,
                       input wire [2:0] switch,
                       output reg [15:0] led);
    
    parameter CNT_ZEROS = 32'd0;
    parameter POS_ZEROS = 4'd0;
    parameter LED_ZEROS = 16'd0;
    `ifdef SIMULATION
    parameter CNT_MAX = 32'd4;
    `else
    parameter CNT_MAX = 32'd1_0000_0000;
    `endif
    reg [31:0] cnt = CNT_ZEROS;
    reg on_button  = 1'b0;
    reg [3:0] pos  = POS_ZEROS;
    
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

    always @(posedge rst or posedge clk) begin        // 处理pos
        if (rst)
            pos <= POS_ZEROS;
        else if (on_button && cnt == (CNT_MAX - 1))
            pos <= pos + 1;
        else
            pos <= pos;
    end
    
    always @(posedge clk or posedge rst) begin      // 处理led
        if (rst)
            led <= LED_ZEROS;
        else if (on_button) begin         // led 已经启动
            if (cnt < (CNT_MAX - 1)) begin
                led <= LED_ZEROS;
                case(switch)
                    3'd0: led[pos +: 1] <= {1{1'b1}};
                    3'd1: led[pos +: 2] <= {2{1'b1}};
                    3'd2: led[pos +: 3] <= {3{1'b1}};
                    3'd3: led[pos +: 4] <= {4{1'b1}};
                    3'd4: led[pos +: 5] <= {5{1'b1}};
                    3'd5: led[pos +: 6] <= {6{1'b1}}
                    3'd6: led[pos +: 7] <= {7{1'b1}};
                    3'd7: led[pos +: 8] <= {8{1'b1}};
                endcase
                case ((switch + pos) - 15)
                    3'd1: led[0 +: 1]                  <= {1{1'b1}};
                    3'd2: led[0 +: 2]                  <= {2{1'b1}};
                    3'd3: led[0 +: 3]                  <= {3{1'b1}};
                    3'd4: led[0 +: 4]                  <= {4{1'b1}};
                    3'd5: led[0 +: 5]                  <= {5{1'b1}};
                    3'd6: led[0 +: 6]                  <= {6{1'b1}};
                    3'd7: led[0 +: 7]                  <= {7{1'b1}};
                    //                    default: led <= led;
                    // 这里不能有这�??????语句，否则会导致之前的led值被赋�?�给现在的led
                endcase
            end
            else begin
                led <= {led[14:0], led[15]};
            end
        end
        else
            led <= led;
    end
endmodule
