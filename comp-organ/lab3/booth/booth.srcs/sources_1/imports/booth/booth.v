module booth (
    input  wire        clk  ,
	input  wire        rst_n,
	input  wire [15:0] x    ,
	input  wire [15:0] y    ,
	input  wire        start,
	output reg  [31:0] z    ,
	output wire        busy 
);
reg [15:0] x_reg;
reg [15:0] y_reg;
reg [15:0] nx_reg;
reg [1:0] comparator; 					   // y_n, y_n+1
reg [4:0] cnt;
reg busy_reg;

wire [1:0] t = (comparator<<1)|(z & 2'b1);			// ! just used for examine signals
wire tmp = comparator[1]<comparator[0] ? 1 : 0;			// ! just used for examine signals

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

always @(posedge clk, negedge rst_n) begin // handle busy signal
	if (~rst_n)
		busy_reg <= 0;
	else if(start)
		busy_reg <= 1;
	else if(cnt == 14)
		busy_reg <= 0;
	else								 // Todo: busy not correct, more condition should be added here
		busy_reg <= 1;
end

always @(posedge clk, negedge rst_n) begin // handle z and comparator
// z index: [ 31 | 30 ... 15 | 14 ... 0 ], 31 and 30 should be regarded as operands
// z index: [ 31  30 ... 15 | 14 ... 0 ], and 1-bit of sign should be appended to the most significant bit of x (or negative x)
	if(~rst_n) begin
		z <= 0;
		comparator <= 0;
	end
	else if(start) begin
		z <= (y >> 1); 				   // >>> shift right arithemtical, >> shift right logical
		comparator <= (y & 1'b1);	   // index: [ 1 | 0 ] --- [ yn+1 | yn ]
	end
	else if (cnt !=14) begin 							   // booth algorithm, 15 time operations in total
		if(comparator[1]==comparator[0]) begin   // yn+1 == yn
			z <= (z >>> 1);						 // z shift right arithmetical
			comparator <= {comparator[0], (z & 1'b1)};
		end
		else if (comparator[1] > comparator[0]) begin
			z <= {(({x_reg[15], x_reg} + z[31:15])>>16) & 1'b1, 
				  {x_reg[15], x_reg} + z[31:15],    
				  z[14:1]}; // {x_reg[15], x_reg} + z[31:15],    is a 17-bit operand
			comparator <= {comparator[0], (z & 1'b1)};
		end
		else begin
			z <= {(({nx_reg[15], nx_reg} + z[31:15])>>16) & 1'b1, 
				  {nx_reg[15], nx_reg} + z[31:15],    
				  z[14:1]};
			comparator <= {comparator[0], (z & 1'b1)};  		// Todo: even the first period is not correct
		end
	end
	else begin  // finish
		z <= (z & 32'hbfff); // the 4 most significant bits mask = 4'b1011 // Todo: z not correct
		comparator <= {comparator[0], comparator[1]};
	end

end

always @(posedge clk, negedge rst_n) begin
	if(~rst_n)
		cnt <= 0;
	else if (start)
		cnt <= 0; 
	else if (cnt != 14)
		cnt <= cnt+1;
	else 
		cnt <= 0;
end
assign busy = busy_reg;
endmodule