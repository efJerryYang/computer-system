module top_module (input [2:0] vec,
                   output [2:0] outv,
                   output o2,
                   output o1,
                   output o0);        // Module body starts after module declaration

    assign {outv, {o2,o1,o0}} = {vec, vec};
    
endmodule
