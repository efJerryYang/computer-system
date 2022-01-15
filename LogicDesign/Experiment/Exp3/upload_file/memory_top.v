module memory_top (input wire clk,
                   input wire rst,
                   input wire button,
                   output wire [15:0] led);
    
    wire [1:0] state;
    wire locked;
    wire clk_20mhz,clk_fnl;
    wire wea,ena;
    wire [3:0] addr;
    wire [15:0] data_in;
    wire [15:0] data_out;
    reg flag = 0;
    
    clk_div u_clk_div (
    .clk_out1(clk_20mhz),
    .reset(rst),
    .locked(locked),
    .clk_in1(clk)
    );
    
    memory_w_r u_memory_w_r (
    .clk_in(clk_20mhz),
    .locked(locked),
    .rst(rst),
    .button(button),
    .state(state),
    .clk_out(clk_fnl),
    .wea(wea),
    .ena(ena),
    .addr(addr),
    .data(data_in)
    );
    
    led_mem u_led_mem (
    .clka(clk_fnl),    // input wire clka
    .ena(ena),      // input wire ena
    .wea(wea),      // input wire [0 : 0] wea
    .addra(addr),  // input wire [3 : 0] addra
    .dina(data_in),    // input wire [15 : 0] dina
    .douta(data_out)  // output wire [15 : 0] douta
    );
    always @(posedge clk_fnl or posedge rst) begin
        if (rst)
            flag <= 0;
        else if (data_out == {16{1'b1}})
            flag <= 1;
        else
            flag <= flag;
    end
    
    assign led = 
    state == 2 &&  flag ? data_out :
    state == 2 && !flag ? 16'b0    :
    16'b0;
endmodule
