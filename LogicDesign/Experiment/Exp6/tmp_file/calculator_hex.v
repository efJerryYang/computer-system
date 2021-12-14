module calculator_hex (
    input wire         clk,
    input wire         locked,
    input wire         rst,
    input wire         on_button,
    input wire  [2:0]  func,
    input wire  [7:0]  num1,
    input wire  [7:0]  num2,    
    output wire [31:0] cal_result
);
    wire rst_n = ~rst;
    reg on_button = 0;
    always @(posedge clk, negedge rst_n) begin  // on_button
        if (rst_n || locked)
            on_button <= 0;
        else if (button)
            on_button <= 1;
        else
            on_button <= on_button;
    end
    always @(posedge clk, negedge rst_n) begin  // cal_result
        if (rst_n || on_button)
            cal_result <= 0;
        else if (on_button) begin
            case(func)
                3'd0: cal_result <= num1 + num2; // add
                3'd1: cal_result <= num1 - num2; // substract
                3'd2: cal_result <= num1 * num2; // time
                3'd3: cal_result <= num1 / num2; // divide
                3'd4: cal_result <= num1 % num2; // mod
                3'd5: cal_result <= num2 * num2; // square
                defualt: cal_result <= 0;
            endcase
        end
        else 
            cal_result <= cal_result;
    end
    
endmodule