module clk_div_final (input wire clk_in,
                      input wire rst,
                      input wire locked,
                      output wire clk_out);
    parameter CNT_MAX    = 32'd3;
    // parameter CNT_MAX = 32'd10_000_000;
    parameter CNT_ZEROS  = 32'd0;
    
    reg clk_tmp    = 0;
    reg [31:0] cnt = CNT_ZEROS;
    // div_3: pos2neg1
    always @(posedge clk_in, posedge rst) begin  // handle cnt
        if (rst)
            cnt <= CNT_ZEROS;
        else if (locked) begin
            if (cnt == (CNT_MAX - 1))
                cnt <= CNT_ZEROS;
            else
                cnt <= cnt + 1;
        end
        else
            cnt <= CNT_ZEROS;
    end
    // Todo: fix bugs in clk shifting
    always @(posedge clk_in, posedge rst) begin  // handle clk_out
        if (rst)
            clk_tmp <= 0;
        else if (locked) begin
            if (cnt == 0)
                clk_tmp  <= clk_tmp;
            else
                clk_tmp <= ~clk_tmp;
        end
        else
            clk_tmp <= 0;
    end
    
    assign clk_out = ~clk_tmp;
endmodule
