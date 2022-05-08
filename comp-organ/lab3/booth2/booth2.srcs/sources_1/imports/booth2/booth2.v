module booth2 (
    input  wire        clk  ,
    input  wire        rst_n,
    input  wire [15:0] x    ,
    input  wire [15:0] y    ,
    input  wire        start,
    output wire [31:0] z    ,
    output wire        busy 
);
parameter PERIOD_NUM = 8;
parameter CNT_MAX = PERIOD_NUM-1;

reg [15:0] x_reg;
reg [15:0] y_reg;
reg [15:0] nx_reg;
reg [15:0] dx_reg; // double x
reg [15:0] ndx_reg; // negative double x
reg [31:0] z_reg;
reg [2:0] comparator;                        // y_n, y_n+1
reg [4:0] cnt;
reg busy_reg;
reg on_button;

wire [16:0] z_part_mul = 
            comparator == 3'b000 ? z[30:14] : 
            comparator == 3'b100 ? {x_reg[15], x_reg} + z[30:14]: 
            comparator == 3'b010 ? {x_reg[15], x_reg} + z[30:14]:
            comparator == 3'b110 ? {x_reg[15], x_reg} + {x_reg[15], x_reg} + z[30:14]:
            comparator == 3'b001 ? {nx_reg[15], nx_reg} + {nx_reg[15], nx_reg} + z[30:14]:
            comparator == 3'b101 ? {nx_reg[15], nx_reg} + z[30:14]:
            comparator == 3'b011 ? {nx_reg[15], nx_reg} + z[30:14]:z[30:14];
wire [2:0] comparator_new = {comparator[0], z[0], z[1]};

assign busy = busy_reg;
assign z = z_reg;

// wire [1:0] check_zsign = z[31:30];
always @(posedge clk, negedge rst_n) begin // on_button
    if (~rst_n)
        on_button <= 0;
    else if(start)
        on_button <= 1;
    else
        on_button <= on_button;
end

always @(posedge clk, negedge rst_n) begin // x, y and nx, dx, ndx
    if(~rst_n) begin
        x_reg <= 0;
        y_reg <= 0;
        nx_reg <= 0;
		dx_reg <= 0;
		ndx_reg <= 0;
    end
    else if(start) begin
        x_reg <= x;
        y_reg <= y;
        nx_reg <= ~x+1;
		dx_reg <= x<<1;
		ndx_reg <= ~(x<<1)+1;
    end
    else begin
        x_reg <= x_reg;
        y_reg <= y_reg;
        nx_reg <= nx_reg;
		dx_reg <= dx_reg;
		ndx_reg <= ndx_reg;
    end
end

always @(posedge clk, negedge rst_n) begin // handle busy signal
    if (~rst_n)
        busy_reg <= 0;
    else if(start || (on_button && cnt < CNT_MAX))
        busy_reg <= 1;
    else
        busy_reg <= 0;
end

always @(posedge clk, negedge rst_n) begin // handle z and comparator
// z index: [ 31 | 30 ... 15 | 14 ... 0 ], 31 and 30 should be regarded as operands
// z index: [ 31  30 ... 15 | 14 ... 0 ], and 1-bit of sign should be appended to the most significant bit of x (or negative x)
    if(~rst_n) begin
        z_reg <= 0;
        comparator <= 0;
    end
    else if(start) begin
        z_reg <= (y >> 2);                    // >>> shift right arithemtical, >> shift right logical
        comparator <= {1'b0, y[0], y[1]};       // index: [ 1 | 0 ] --- [ yn+1 | yn ]
    end
    else if (on_button && cnt < CNT_MAX) begin                                // booth algorithm, 7 time operations in total
        z_reg <= {z_part_mul[16], z_part_mul[16], z_part_mul, z[13:2]};                         // signed(z) shift right arithmetical
        comparator <= comparator_new;
    end
    else if (on_button && cnt == CNT_MAX && busy) begin  // finish
		z_reg <= {z_part_mul[16], z_part_mul, z[13:0]}; // do not shift right
        comparator <= comparator_new;
    end
    else begin // do nothing
        z_reg <= z;
        comparator <= comparator;
    end
end

always @(posedge clk, negedge rst_n) begin
    if(~rst_n||~on_button)
        cnt <= 0;
    else if (start)
        cnt <= 0; 
    else if (cnt != CNT_MAX)
        cnt <= cnt+1;
    else 
        cnt <= cnt;
end

endmodule