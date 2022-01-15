module calculator_display(input wire clk,
                          input wire rst,
                          input wire locked,
                          input wire button,
                          input wire [31:0] cal_result,
                          output reg [7:0] led_en,
                          output wire [7:0] led_w);
    // parameter SCAN_CNT_MAX = 20'd1_0000; // 扫描时间间隔计数最大时钟周期数
    parameter SCAN_CNT_MAX = 20'd5;      // simulation
    
    wire rst_n          = ~rst ;  // rst_n下降沿复位
    reg  on_button      = 0    ;  // 开始计算后，处于工作状态的标记信号
    reg [7:0]  cur_code = 8'hff;  // 当前结果位置数值显示到数码管上对应的编码
    reg [20:0] scan_cnt = 0    ;  // 扫描计数器
    reg [2:0]  scan_pos = 0    ;  // 当前扫描的位置
    wire [3:0] result [7:0]    ;  // 重新分割32位2进制计算结果的位，分割成8个4位数值，只是为了人直接的阅读方面
    
    generate
    genvar i;
    for (i = 0; i< 8; i = i + 1) begin: result_block
    assign result[i] = cal_result[i*4 +: 4];  // just for read convenience
    end
    endgenerate
    always @(posedge clk, negedge rst_n) begin  // on_button
        if (~rst_n || !locked)
            on_button <= 0;
        else if (button)
            on_button <= 1;
        else
            on_button <= on_button;
    end
    always @(posedge clk, negedge rst_n) begin  // scan_cnt
        if (~rst_n || !on_button)
            scan_cnt <= 0;
        else if (on_button) begin
            if (scan_cnt == SCAN_CNT_MAX-1)
                scan_cnt <= 0;
            else
                scan_cnt <= scan_cnt + 1;
        end
        else
            scan_cnt <= 0;
    end
    always @(posedge clk, negedge rst_n) begin  // scan_pos
        if (~rst_n || !on_button)
            scan_pos <= 0;
        else if (on_button && scan_cnt == SCAN_CNT_MAX-1)
            scan_pos <= scan_pos + 1;
        else if (on_button && scan_cnt < SCAN_CNT_MAX-1)
            scan_pos <= scan_pos;
        else
            scan_pos <= 0;
    end
    always @(posedge clk, negedge rst_n) begin  // led_en
        if (~rst_n || !on_button)
            led_en <= 8'd255;
        else if (on_button)
            case (scan_pos)
                3'd0:led_en <= ~8'd1;
                3'd1:led_en <= ~8'd2;
                3'd2:led_en <= ~8'd4;
                3'd3:led_en <= ~8'd8;
                3'd4:led_en <= ~8'd16;
                3'd5:led_en <= ~8'd32;
                3'd6:led_en <= ~8'd64;
                3'd7:led_en <= ~8'd128;
            endcase
        else
            led_en <= 8'd255;
    end
    always @(posedge clk, negedge rst_n) begin  // cur_code
        if (~rst_n || !on_button)
            cur_code <= 8'hff;
        else if (on_button) begin
            case(result[scan_pos])
                4'h0: cur_code <= 8'hc0;
                4'h1: cur_code <= 8'hf9;
                4'h2: cur_code <= 8'ha4;
                4'h3: cur_code <= 8'hb0;
                4'h4: cur_code <= 8'h99;
                4'h5: cur_code <= 8'h92;
                4'h6: cur_code <= 8'h82;
                4'h7: cur_code <= 8'hf8;
                4'h8: cur_code <= 8'h80;
                4'h9: cur_code <= 8'h98;
                4'ha: cur_code <= 8'h88;
                4'hb: cur_code <= 8'h83;
                4'hc: cur_code <= 8'hc6;
                4'hd: cur_code <= 8'ha1;
                4'he: cur_code <= 8'h86;
                4'hf: cur_code <= 8'h8e;
            endcase
        end
        else
            cur_code <= 8'hff;
    end
    
    assign led_w = 
    (~rst_n || !on_button) ? 8'hff    :
    on_button              ? cur_code :
    8'hff;  // using operator ?: directly instead of if-else statement
endmodule
    
