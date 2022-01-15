module top_module (input clk,
                   input reset,     // Synchronous active-high reset
                   output [3:0] q);
    initial begin
        q = 0;
    end
    always@(posedge clk) begin
        if (reset || q == 4'd9) q < = 0;
        else q <= q + 4'b1;
    end
endmodule
    
    // count10
    module top_module (
        input clk,
        input reset,
        output [3:0] q);
        initial begin
            q = 4'b1;
        end
        always @(posedge clk) begin
            if (reset || q == 4'd10)
                q <= 1;
            else
                q <= q + 1;
        end
    endmodule
        
        //countslow
        module top_module (
            input clk,
            input slowena,
            input reset,
            output [3:0] q);

            always @(posedge clk) begin
                if(reset)
                    q <= 0;
                else if (slowena)
                    q <= (q == 4'd9) ? 0 : q + 1;
                else 
                    q <= q;
            end
        endmodule
