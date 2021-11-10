//module name : switch_to_led 
//function    : switch control led
//author      : masy
//date        : 2021.10.14

module switch_to_led (
    input  wire       clk   ,
	input  wire       rst   ,
	input  wire [1:0] switch,
    output wire [1:0] led 
);

//register define
reg [1:0] switch0_ff;
reg [1:0] switch1_ff;

wire rst_n = ~rst;

//Asynchronous signal processing
always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) switch0_ff[0] <= 1'b0;
	else        switch0_ff[0] <= switch[0];
end

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) switch0_ff[1] <= 1'b0;
	else        switch0_ff[1] <= switch0_ff[0];
end

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) switch1_ff[0] <= 1'b0;
	else        switch1_ff[0] <= switch[1];
end

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) switch1_ff[1] <= 1'b0;
	else        switch1_ff[1] <= switch1_ff[0];
end

assign led = {switch1_ff[1],switch0_ff[1]};

endmodule