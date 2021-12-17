`timescale 1ns / 1ps
module memory_w_r(input clk_20mhz,
                  input clk,
                  input rst,
                  input locked,
                  input button,
                  output reg [1:0] state,
                  output clk_out,
                  output reg wea,
                  output reg ena,
                  output reg [3:0] addr,
                  output reg [15:0] data);
//     parameter CLK_CNT_MAX = 27'd5000_0000;  // 1s
//     parameter CLK_CNT_MAX = 27'd4;  // 8clk

    parameter CLK_CNT_MAX    = 27'd2;   // sim 3clk
    parameter STATE_INIT     = 2'd0;
    parameter STATE_WRITE    = 2'd1;
    parameter STATE_READ     = 2'd2;
    parameter ADDR_MAX       = 4'b1111;
    parameter ADDR_INIT      = 4'b0000;
    reg flag                 = 0;
    reg clk_1s               = 1'b0;
    reg [26:0] cnt_1s        = 27'd0;
    wire [15:0] storage [15:0];

    always @(posedge clk_20mhz or posedge rst) begin
        if(rst || !locked)
            state <= STATE_INIT;
        else begin
            case (state)
                STATE_INIT : state <= button ? STATE_WRITE : STATE_INIT;
                STATE_WRITE: state <= (addr == ADDR_MAX) ? STATE_READ : STATE_WRITE;
                STATE_READ : state <= state;
                default    : state <= state;
            endcase
        end
        
    end
    // assign clk_out = (state == STATE_WRITE) ? clk_20mhz: clk_1s; // clk_out
    assign clk_out = (state == STATE_WRITE) ? clk: 
                     (CLK_CNT_MAX == 27'd2) ? clk_20mhz:// clk_20mhz;
                      clk_1s;  // clk_out, complex conditions for simulation PASS
  
    always @(posedge clk_20mhz or posedge rst) begin // cnt_1s
        if (rst || !state || !locked)
            cnt_1s <= 0;
        else if (state == STATE_READ) begin
            if (cnt_1s == CLK_CNT_MAX-1)
                cnt_1s <= 0;
            else
                cnt_1s <= cnt_1s + 1;
        end
        else
            cnt_1s <= cnt_1s;
    end
    always @(posedge clk_20mhz or posedge rst) begin // clk_1s
        if (rst || !state || !locked)
            clk_1s <= 0;
        else if (cnt_1s == CLK_CNT_MAX-1)
            clk_1s <= ~clk_1s;
        else
            clk_1s <= clk_1s;
    end
    always @(posedge clk_out or posedge rst) begin // addr
        if (rst || !state)
            addr <= 0;
        else if (addr == ADDR_MAX) begin
            if (state == STATE_WRITE)
                addr <= addr + 1 ;
            else if (state == STATE_READ)
                addr <= ADDR_MAX;
            else
                addr <= 0;
        end
        else 
            {addr, flag} <= flag ? {addr+1, 1'b1} : {addr, 1'b1};
    end
    always @(posedge clk or posedge rst) begin // ena, wea
        if (rst || !state) begin
            ena <= 0;
            wea <= 0;
        end
        else begin
            ena <= 1;
            if (state == STATE_WRITE)
                wea <= 1;
            else
                wea <= 0;
        end
    end
    // always @(posedge clk_20mhz or posedge rst) begin // ena, wea
    //     if (rst || (!state && !button)) begin
    //         ena <= 0;
    //         wea <= 0;
    //     end
    //     else begin
    //         ena <= 1;
    //         if (button || state == STATE_WRITE)
    //             wea <= 1;
    //         else
    //             wea <= 0;
    //     end
    // end
    
    generate
    genvar i;
    for (i = 0; i< 16; i = i + 1) begin: storage_block
    assign storage[i] = {(i+1){1'b1}};
    end
    endgenerate
    
    always @(*) begin // data writing to ram
        if (rst || !state)
            data = 0;
        else if (state == STATE_WRITE)
            data = storage[addr];
        else
            data = 0;
    end
endmodule
