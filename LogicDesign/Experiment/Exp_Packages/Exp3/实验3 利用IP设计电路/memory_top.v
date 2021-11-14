module memory_top (
    input  wire        clk   ,
	input  wire        rst   ,
	input  wire        button,
	output wire [15:0] led   
);

clk_div u_clk_div (

);

memory_w_r u_memory_w_r (

);

led_mem u_led_mem (

);

endmodule