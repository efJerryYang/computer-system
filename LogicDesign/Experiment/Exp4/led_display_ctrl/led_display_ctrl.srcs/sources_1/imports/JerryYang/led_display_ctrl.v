module led_display_ctrl (input wire clk,
                         input wire rst,
                         input wire button,
                         output reg [7:0] led_en,
                         output reg led_ca,
                         output reg led_cb,
                         output reg led_cc,
                         output reg led_cd,
                         output reg led_ce,
                         output reg led_cf,
                         output reg led_cg,
                         output reg led_dp);
    
   parameter SCND_CNT_MAX    = 29'd1_0000_0000;
    //  parameter SCND_CNT_MAX = 29'd15;
   parameter SCAN_CNT_MAX    = 20'd20_0000;
    //  parameter SCAN_CNT_MAX = 20'd5;
    parameter CNT_DOWN_START  = 4'd10;
    
    reg on_button = 0;
//    reg scnd_clk  = 0;
//    reg scan_clk  = 0;
    
    reg [28:0] scnd_cnt = 0;
    reg [3:0] cnt_down  = 0;
    reg [19:0] scan_cnt = 0;
    reg [2:0] scan_pos  = 0;
    reg [7:0] led_r;  // r means reg
    
    always @(*) {led_dp,led_cg,led_cf,led_ce,led_cd,led_cc,led_cb,led_ca} = led_r;
    always @(posedge clk, posedge rst) begin  // on_button
        if (rst)
            on_button <= 0;
        else if (button)
            on_button <= 1;
        else
            on_button <= on_button;
    end
    always @(posedge clk, posedge rst) begin  // 1s_cnt
        if (rst || !on_button)
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
    always @(posedge clk, posedge rst) begin  // scan_cnt
        if (rst || !on_button)
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
//    always @(posedge clk, posedge rst) begin // scan_clk
//        if (rst || !on_button)
//            scan_clk <= 0;
//        else if (on_button && scan_cnt == SCAN_CNT_MAX-1)
//            scan_clk <= ~scan_clk;
//        else if (on_button && scan_cnt < SCAN_CNT_MAX-1)
//            scan_clk <= scan_clk;
//        else
//            scan_clk <= 0;
//    end
//    always @(posedge clk, posedge rst) begin  // 1s_clk
//        if (rst||!on_button)
//            scnd_clk <= 0;
//        else if (on_button && scnd_cnt == SCND_CNT_MAX-1)
//            scnd_clk <= ~scnd_clk;
//        else if (on_button && scnd_cnt < SCND_CNT_MAX-1)
//            scnd_clk <= scnd_clk;
//        else
//            scnd_clk <= 0;
//    end
    always @(posedge clk, posedge rst) begin  // cnt_down
        if (rst || !on_button || button)
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
    always @(posedge clk, posedge rst) begin  // scan_pos
        if (rst || !on_button)
            scan_pos <= 0;
        else if (on_button && scan_cnt == SCAN_CNT_MAX-1)
            scan_pos <= scan_pos + 1;
        else if (on_button && scan_cnt< SCAN_CNT_MAX-1)
            scan_pos <= scan_pos;
        else
            scan_pos <= 0;
    end
    always @(posedge clk, posedge rst) begin  // led_en
        if (rst || !on_button)
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
    always @(posedge clk, posedge rst) begin // led_r
        if (rst || !on_button)
            led_r <= 8'hff;
        else if (on_button) begin
            case(scan_pos) // [2:0]
                3'd5: led_r <= 8'ha4;  // 2
                3'd4: led_r <= 8'hc0;  // 0
                3'd3: led_r <= 8'hc0;  // 0
                3'd2: led_r <= 8'h99;  // 4
                3'd1: led_r <= 8'ha4;  // 2
                3'd0: led_r <= 8'h80;  // 8
                3'd7: led_r <= (cnt_down == 10) ? 8'hf9 : 8'hc0;  // (cnt_down == 10) ? 1 : 0;
                3'd6: begin
                    case(cnt_down)  // count down, from 10 to 0
                        4'd9: led_r    <= 8'h98;  // 9
                        4'd8: led_r    <= 8'h80;  // 8
                        4'd7: led_r    <= 8'hf8;  // 7
                        4'd6: led_r    <= 8'h82;  // 6
                        4'd5: led_r    <= 8'h92;  // 5
                        4'd4: led_r    <= 8'h99;  // 4
                        4'd3: led_r    <= 8'hb0;  // 3
                        4'd2: led_r    <= 8'ha4;  // 2
                        4'd1: led_r    <= 8'hf9;  // 1
                        // 4'd0: led_r <= 8'hc0;  // 0
                        default: led_r <= 8'hc0;  // convert 10 or 0 to 0
                    endcase
                end
            endcase
        end
        else
            led_r <= 8'hff;
    end
endmodule
