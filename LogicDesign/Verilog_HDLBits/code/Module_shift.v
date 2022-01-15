module top_module (input clk,
                   input d,
                   output q);
    wire a,b,c;
    my_dff mod_1(
    .clk(clk),
    .d(d),
    .q(a)
    );
    my_dff mod_2(
    .clk(clk),
    .d(a),
    .q(b)
    );
    my_dff mod_3(
    .clk(clk),
    .d(b),
    .q(q)
    );
endmodule
