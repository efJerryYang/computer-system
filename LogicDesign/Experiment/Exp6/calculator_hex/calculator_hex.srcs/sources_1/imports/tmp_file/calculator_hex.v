module calculator_hex (input wire clk,
                       input wire locked,
                       input wire rst,
                       input wire button,
                       input wire [2:0] func,
                       input wire [7:0] num1,
                       input wire [7:0] num2,
                       output reg [31:0] cal_result);
    
    wire rst_n             = ~rst;
    reg on_button          = 0;
    reg flag               = 0;
    reg [31:0] prev_result = 0;
    // reg [7:0] num1_delay   = 0;
    // reg [7:0] num2_delay   = 0;
    // reg [2:0] func_delay   = 0;

    always @(posedge clk, negedge rst_n) begin  // on_button, prev_result
        if (~rst_n || !locked)
            on_button <= 0;
        else if (button)
            on_button <= 1;
        else
            on_button <= on_button;
    end
    // always @(posedge clk) begin  // delay 1 clk period
    //     num1_delay <= num1;
    //     num2_delay <= num2;
    //     func_delay <= func;
    // end
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            flag <= 0;
        else if (button)
            flag <= 1;
        else
            flag <= 0;
    end
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            prev_result <= 0;
        else if (!on_button)
            // prev_result <= (func == 3'd5) ? 0 : num1; // not on_button, prev square = 0, else prev = num1
            prev_result <= num1;  // new requirement given during class
        else if (on_button && flag)
            prev_result <= cal_result;
        else
            prev_result <= prev_result;
    end
    always @(*) begin  // cal_result
        if (~rst_n)
            cal_result = 0;
        else if (button)
            case(func)
                3'd0: cal_result    = prev_result + num2; // add
                3'd1: cal_result    = prev_result - num2; // substract
                3'd2: cal_result    = prev_result * num2; // time
                3'd3: cal_result    = prev_result / num2; // divide
                3'd4: cal_result    = prev_result % num2; // mod
                3'd5: cal_result    = prev_result * prev_result; // square
                default: cal_result = 0;
            endcase
        else
            cal_result = cal_result;
    end
    
endmodule
