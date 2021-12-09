module memory_w_r (input clk_fnl,
                   input rst,
                   input on_button,
                   output write,
                   output enable,
                   output[3:0] address,
                   output[15:0] data_in);
    parameter CNT_CLK_MAX = 4'b1111;
    reg write_reg         = 1'b1;
    reg enable_reg        = 1'b1;
    wire [15:0] data_write [15:0];
    reg [3:0]  cnt_clk     = 0;
    reg [3:0]  addr        = 0;
    reg [15:0] data_in_reg = 0;
    
    always @(posedge clk_fnl,posedge rst) begin
        if (rst || !on_button)
            cnt_clk <= 0;
        else if (cnt_clk == CNT_CLK_MAX)
            cnt_clk <= cnt_clk;
        else
            cnt_clk <= cnt_clk + 1;
    end
    
    generate
    genvar i;
    for (i = 0; i< 16; i = i + 1) begin: data_write_block
    assign data_write[i] = {(i+1){1'b1}};
    end
    endgenerate
    
    //Todo: handle enable and write enable
    always @(posedge clk_fnl, posedge rst) begin
        if (rst || !on_button) begin
            write_reg  <= 0;
            enable_reg <= 0;
        end
        else if (on_button) begin
            write_reg  <= 1;
            enable_reg <= 1;
        end
        else begin
            write_reg  <= 0;
            enable_reg <= 0;
        end
    end
    
    always @(posedge clk_fnl, posedge rst) begin
        if(rst || !on_button) begin
            addr <= 0;
        else 
            addr <= cnt_clk;
        end
    end
    assign write   = write_reg;
    assign enable  = enable_reg;
    assign data_in = data_write[addr];
    assign address = addr;
endmodule
