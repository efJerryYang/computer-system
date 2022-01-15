module top_module (input a,
                   input b,
                   output out);
    mod_a k (.out(out), .in1(a), .in2(b));
    
endmodule
