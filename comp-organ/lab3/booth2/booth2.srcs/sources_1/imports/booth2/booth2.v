module booth2 (
    input  wire        clk  ,
	input  wire        rst_n,
	input  wire [15:0] x    ,
	input  wire [15:0] y    ,
	input  wire        start,
	output wire [31:0] z    ,
	output wire        busy 
);
reg [15:0] x_reg;
reg [15:0] y_reg;
reg [15:0] nx_reg;
reg [15:0] dx_reg; // double x
reg [15:0] ndx_reg; // negative double x
reg [31:0] z_reg;
reg [2:0] comparator; 					   // y_n, y_n+1
reg [4:0] cnt;
reg busy_reg;
reg on_button;

wire [16:0] z_part_mul = 
			comparator == 3'b000 ? z[31:15] : 
			comparator == 3'b100 ? {x_reg[15], x_reg} + z[31:15]: 
			comparator == 3'b010 ? {x_reg[15], x_reg} + z[31:15]:
			comparator == 3'b110 ? {dx_reg[15], dx_reg} + z[31:15]:
			comparator == 3'b110 ? {ndx_reg[15], ndx_reg} + z[31:15]:
			comparator == 3'b101 ? {nx_reg[15], nx_reg} + z[31:15]:
			comparator == 3'b011 ? {nx_reg[15], nx_reg} + z[31:15]:z[31:15];
wire [2:0] comparator_new = {comparator[1:0], (z[0] & 1'b1)};

wire [1:0] check_zsign = z[31:30];
always @(posedge clk, negedge rst_n) begin // on_button
	if (~rst_n)
		on_button <= 0;
	else if(start)
		on_button <= 1;
	else
		on_button <= on_button;
end
always @(posedge clk, negedge rst_n) begin // get input signal for x, y and negative x
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

assign busy = busy_reg;
always @(posedge clk, negedge rst_n) begin // handle busy signal
	if (~rst_n)
		busy_reg <= 0;
	else if(start || (on_button && cnt < 15))
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
		z_reg <= (y >> 1); 				   // >>> shift right arithemtical, >> shift right logical
		comparator <= (y & 1'b1);	   // index: [ 1 | 0 ] --- [ yn+1 | yn ]
	end
	else if (cnt < 15) begin 							   // booth algorithm, 15 time operations in total
		z_reg <= {z_part_mul[16], z_part_mul, z[14:1]};						 // signed(z) shift right arithmetical
		comparator <= comparator_new;
	end
	else if (cnt == 15) begin  // finish
		/*
		[1 1] 0 => 10 => (sign extension) [1 1] 0
		[1 1] 1 => 11 => (sign extension) [1 1] 1
		[0 0] 0 => 00 => (sign extension) [0 0] 0
		[0 0] 1 => 01 => (sign extension) [0 0] 1

		[1 0] 0 => 10 => (sign extension) [1 1] 0
		[1 0] 1 => 11 => (sign extension) [1 1] 1
		[0 1] 0 => 00 => (sign extension) [0 0] 0
		[0 1] 1 => 01 => (sign extension) [0 0] 1
		*/
		if(comparator[1]==comparator[0])
			z_reg <= {z[31], z[31], z[29:0]}; 
		else
			z_reg <= {z_part_mul[16], z_part_mul[16], z_part_mul[14:0], z[14:0]};
		comparator <= {comparator[0], comparator[1], comparator[2]};  // Todo: why this?
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
	else if (cnt != 15)
		cnt <= cnt+1;
	else 
		cnt <= cnt;
end
endmodule