module calculator_display(
    input wire        clk,
    input wire        rst,
    input wire        locked,
    input wire        button,
    input wire [31:0] cal_result,
    output wire [7:0] led_en,
    output wire [7:0] led_w
);
    // parameter SCAN_CNT_MAX    = 20'd20_0000;
    parameter SCAN_CNT_MAX = 20'd5;
    wire rst_n          = ~rst;
    reg  on_button      = 0;
    reg [3:0]  cnt_down = 0;
    reg [7:0]  cur_code = 8'hff;
    reg [19:0] scan_cnt = 0;
    reg [2:0]  scan_pos = 0;
    // reg [7:0]  led_r;  // r means reg
    wire [3:0] result [7:0];
    // assign led_w = led_r;

    generate
    genvar i;
    for (i = 0; i< 8; i = i + 1) begin: result_block
    assign result[i] = cal_result[i*4 +: 4];
    end
    endgenerate
    
    always @(posedge clk, negedge rst_n) begin  // on_button
        if (rst_n || locked)
            on_button <= 0;
        else if (button)
            on_button <= 1;
        else
            on_button <= on_button;
    end
        always @(posedge clk, negedge rst_n) begin  // 1s_cnt
        if (rst_n || !on_button)
            scnd_cnt <= 0;
        else if (on_button) begin
            if (scnd_cnt == SCND_CNT_MAX -1)
                scnd_cnt <= 0;
            else
                scnd_cnt <= scnd_cnt + 1;
        end
        else
            scnd_cnt <= 0;
    end
    always @(posedge clk, negedge rst_n) begin  // scan_cnt
        if (rst_n || !on_button)
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
    always @(posedge clk, negedge rst_n) begin  // cnt_down
        if (rst_n || !on_button)
            cnt_down <= CNT_DOWN_START;
        else if (on_button) begin
            if (scnd_cnt == SCND_CNT_MAX-1 && cnt_down > 0)
                cnt_down <= cnt_down - 1;
            else if (scnd_cnt == SCND_CNT_MAX-1 && cnt_down == 0)
                cnt_down <= CNT_DOWN_START;
            else
                cnt_down <= cnt_down;
        end
        else
            cnt_down <= CNT_DOWN_START;
    end
    always @(posedge clk, negedge rst_n) begin  // scan_pos
        if (rst_n || !on_button)
            scan_pos <= 0;
        else if (on_button && scan_cnt == SCAN_CNT_MAX-1)
            scan_pos <= scan_pos + 1;
        else if (on_button && scan_cnt< SCAN_CNT_MAX-1)
            scan_pos <= scan_pos;
        else
            scan_pos <= 0;
    end
    always @(posedge clk, negedge rst_n) begin  // led_en
        if (rst_n || !on_button)
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
        if(rst_n || !on_button)
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
    end

    assign led_w = (rst_n || !on_button) ? 8'hff    :
                    on_button            ? cur_code : 8'hff;
endmodule

