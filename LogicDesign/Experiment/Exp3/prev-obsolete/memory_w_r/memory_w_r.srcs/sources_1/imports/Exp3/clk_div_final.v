module clk_div_final (input wire clk_in,
                      input wire rst,
                      input wire locked,
                      output wire clk_out);
    parameter CNT_MAX    = 32'd3;
    // parameter CNT_MAX = 32'd20_000_000;
    parameter CNT_ZEROS  = 32'd0;
    
    reg clk_tmp    = 0;
    reg [31:0] cnt = CNT_ZEROS;
    // 使用??3分频不是占空??1/3??
    always @(posedge clk_in, posedge rst) begin
        if (rst)
            cnt <= CNT_ZEROS;
        else if (locked) begin
            if (cnt < CNT_MAX)
                cnt <= cnt + 1;
            else
                cnt <= CNT_ZEROS;
        end
        else
            cnt <= CNT_ZEROS;
    end
    
    always @(posedge clk_in, posedge rst) begin
        if (rst)
            clk_tmp <= 0;
        else if (locked) begin
            if (cnt < CNT_MAX)
                clk_tmp <= clk_tmp;
            else
                clk_tmp <= ~clk_tmp;
        end
        else
            clk_tmp <= 0;
    end
    
    assign clk_out = clk_tmp;
endmodule
