module booth (
    input  wire        clk  ,
    input  wire        rst_n,
    input  wire [15:0] x    ,
    input  wire [15:0] y    ,
    input  wire        start,
    output reg  [31:0] z    ,
    output wire        busy 
);
parameter PERIOD_NUM = 16;
parameter CNT_MAX = PERIOD_NUM-1;

reg [15:0] x_reg;
reg [15:0] y_reg;
reg [15:0] nx_reg;
reg [1:0] comparator; // yn, yn+1 but in reversed position [ yn+1 | yn ]
reg [4:0] cnt;
reg busy_reg;
reg on_button;        // a flag for start working

// compute partial product (z_pp) of z
wire [16:0] z_pp =
   comparator[1] == comparator[0] ? z[31:15]:                          // yn+1 == yn
   comparator[1] > comparator[0] ? {x_reg[15], x_reg} + z[31:15] :     // yn+1 > yn
   {nx_reg[15], nx_reg} + z[31:15];                                    // yn+1 < yn

// compute comparator for next step
wire [1:0] comparator_new = {comparator[0], z[0]};
// wire [1:0] check_zsign = z[31:30];

// assign given wire with reg
assign busy = busy_reg;

always @(posedge clk, negedge rst_n) begin // on_button, a flag for start working
    if (~rst_n)
        on_button <= 0;
    else if(start)
        on_button <= 1;
    else
        on_button <= on_button;
end

always @(posedge clk, negedge rst_n) begin // x, y and negative x (nx_reg)
    if(~rst_n) begin
        x_reg <= 0;
        y_reg <= 0;
        nx_reg <= 0;
    end
    else if(start) begin
        x_reg <= x;
        y_reg <= y;
        nx_reg <= ~x+1;
    end
    else begin
        x_reg <= x_reg;
        y_reg <= y_reg;
        nx_reg <= nx_reg;
    end
end

always @(posedge clk, negedge rst_n) begin // busy
    if (~rst_n)
        busy_reg <= 0;
    else if(start || (on_button && cnt < CNT_MAX))
        busy_reg <= 1;
    else
        busy_reg <= 0;
end

// z index: [ 31 | 30 ... 15 | 14 ... 0 ]
// sign bits: 31, 30
// 1-bit of sign should be appended to the most significant bit of x (or negative x)
always @(posedge clk, negedge rst_n) begin // z and comparator
    if(~rst_n) begin
        z <= 0;
        comparator <= 0;
    end
    else if(start) begin
        z <= (y >> 1);
        comparator <= {1'b0, y[0]};             // index: [ 1 | 0 ] --- [ yn+1 | yn ]
    end
    else if (on_button && cnt < CNT_MAX) begin  // booth algorithm, 15 time operations in total
        z <= {z_pp[16], z_pp, z[14:1]};         // z_pp: do sign extension, z: discard right most 1 bit
        comparator <= comparator_new;
    end
    else if (on_button && cnt == CNT_MAX && busy) begin  // finish
        z <= {z_pp, z[14:0]};                            // do not shift right
        comparator <= comparator_new;
    end
    else begin                                  // do nothing
        z <= z;
        comparator <= comparator;
    end
end

always @(posedge clk, negedge rst_n) begin
    if(~rst_n || ~on_button)
        cnt <= 0;
    else if (start)
        cnt <= 0; 
    else if (cnt != CNT_MAX)
        cnt <= cnt+1;
    else 
        cnt <= cnt;
end

endmodule