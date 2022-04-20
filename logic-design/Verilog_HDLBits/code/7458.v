module top_module (input p1a,
                   p1b,
                   p1c,
                   p1d,
                   p1e,
                   p1f,
                   output p1y,
                   input p2a,
                   p2b,
                   p2c,
                   p2d,
                   output p2y);
    wire left_up_and, left_down_and;
    wire right_up_and, right_down_and;
    
    assign {left_up_and, left_down_and, right_up_and, right_down_and} = {p2a & p2b, p2c&p2d, p1a&p1c&p1b, p1f&p1e&p1d};
    assign {p2y,p1y} = {left_up_and | left_down_and, right_up_and|right_down_and};
    
    
endmodule
