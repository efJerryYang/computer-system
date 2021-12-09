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
    
    reg [15:0] led_reg = 16'b0;
    
    state_work working(
    .button(button),
    .clk(clk),  // unused port
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
    // .rst_flag(rst_flag)
    );
    
    led_mem u_led_mem (
    .clka(clk_fnl),
    .ena(enable),      // input wire ena
    .wea(write),      // input wire [0 : 0] wea
    .addra(address),  // input wire [3 : 0] addra
    .dina(data_in),    // input wire [15 : 0] dina
    .douta(data_out)
    );
    
    always @(posedge rst, posedge clk_fnl) begin
        if (rst||!on_button)
            led_reg <= 16'b0;
        else
            led_reg <= data_out;
    end
    assign led = led_reg;
endmodule
    // Todo: fix bugs:
    // 1.(DONE) before starting, the 0 led remain unlightened for 2 seconds
    // 2.(DONE) all leds go off after 16 seconds
    // 3.(DONE) reset does not work properly
    //  -(DONE) remain current state rather than turn off all leds
    //  -(DONE) restart in that state, all leds go off after next led lightened
    //  -(DONE) then rst, and then restart, the lights will continue from the cut point
    
    // To sum up,
    // 1. clk bug: cannot count second precisely
    // 2.(DONE) rst bug: cannot reset leds in a correct way
    // 3.(DONE) led bugs:
    //  -(DONE) cannot remain previous state after lightening 16 leds
    //  -(DONE) cannot start with the right number of leds
    
    // Now, what to do next?
    // 1.(DONE) rst problem handling.
    // 2.(DONE) enable and write enable insert into code.
    // 3. correct the clk period into precise 1 second
    // 3. write the report, check the simulation result in comparison with Chiro's

    // Remember: when judging current working state, should use 'on_button' rather than 'rst'
    