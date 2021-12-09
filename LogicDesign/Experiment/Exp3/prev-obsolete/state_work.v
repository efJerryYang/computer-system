module state_work (input clk,
                   input rst,
                   input button,
                   output working);
    reg work_tmp = 1'b0;
    
    always @(*) begin
        if (rst)
            work_tmp = 1'b0;
        else if (button)
            work_tmp = 1'b1;
        else
            work_tmp = work_tmp;
    end

    assign working = work_tmp;
endmodule
