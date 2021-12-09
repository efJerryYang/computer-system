module memory_top (input wire clk,
                   input wire rst,
                   input wire button,
                   output wire [15:0] led);
    wire clk_out1, clk_fnl;
    wire locked, on_button;
    wire enable, write;
    wire [3:0] address;
    wire [15:0] data_in;
    wire [15:0] data_out;
    
    state_work working(
    .button(button),
    .clk(clk),
    .rst(rst),
    .working(on_button)
    );
    // assign locked = on_button;
    clk_div u_clk_div (
    .clk_out1(clk_out1),
    .reset(rst),
    .locked(locked),
    .clk_in1(clk)
    );
    
    clk_div_final u_clk_div_final (
    .clk_in(clk_out1),
    .rst(rst),
    .locked(locked),
    .clk_out(clk_fnl)
    );
    
    memory_w_r u_memory_w_r (
    .clk_fnl(clk_fnl),
    .rst(rst),
    .on_button(on_button),
    .write(write),
    .enable(enable),
    .address(address),
    .data_in(data_in)
    );
    
    led_mem u_led_mem (
    .clka(clk_fnl),
    .ena(enable),      // input wire ena
    .wea(write),      // input wire [0 : 0] wea
    .addra(address),  // input wire [3 : 0] addra
    .dina(data_in),    // input wire [15 : 0] dina
    .douta(data_out)
    );
    
    assign led = data_out;
endmodule
