module moduleName (
    input wire [3:0] a
);
    assign a = 2'hff; // [VRFC 10-986] literal value truncated to fit in 2 bitsxvlog(VRFC 10-986)
    // 也就是说，是截断得到2位的作用
endmodule