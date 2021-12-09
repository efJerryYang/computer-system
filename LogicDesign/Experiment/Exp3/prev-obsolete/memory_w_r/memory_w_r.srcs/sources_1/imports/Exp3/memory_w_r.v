module memory_w_r (input clk_fnl,
                   input rst,
                   input on_button,
                   output write,
                   output enable,
                   output[3:0] address,
                   output[15:0] data_in);
    parameter CNT_CLK_MAX = 4'b1111;
    reg write_reg         = 1'b1;
    reg [3:0] addr        = 4'b0000;
    reg [15:0] data_write [15:0];
    reg [3:0]  cnt_clk = 0;
    
    always @(posedge clk_fnl,posedge rst) begin
        if (rst)
            cnt_clk <= 0;
        else if (cnt_clk < CNT_CLK_MAX)
            cnt_clk <= cnt_clk+1;
        else
            cnt_clk <= cnt_clk;  // 当加�???????????15的时候保持不�???????????
    end
    
    always @(*) begin  // write enable
        if (rst)
            write_reg = 1;
        else if (cnt_clk > 0)
            write_reg = 0;
        else
            write_reg = write_reg;
    end
    
    always @(*) begin
        if (rst || write_reg) begin
            data_write[0]  = 16'd0;
            data_write[1]  = 16'd1;
            data_write[2]  = 16'd2;
            data_write[3]  = 16'd3;
            data_write[4]  = 16'd4;
            data_write[5]  = 16'd5;
            data_write[6]  = 16'd6;
            data_write[7]  = 16'd7;
            data_write[8]  = 16'd8;
            data_write[9]  = 16'd9;
            data_write[10] = 16'd10;
            data_write[11] = 16'd11;
            data_write[12] = 16'd12;
            data_write[13] = 16'd13;
            data_write[14] = 16'd14;
            data_write[15] = 16'd15;
        end
    end
    always @(posedge clk_fnl, posedge rst) begin  // handle addr
        if (rst)
            addr <= 4'b0000;
        else
            addr <= cnt_clk;
    end
    assign write   = write_reg;
    assign enable  = on_button;
    assign data_in = data_write[addr];
    assign address = addr;
endmodule
    
