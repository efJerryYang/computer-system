module sequence_detection (input wire clk,
                           input wire rst,
                           input wire button,
                           input wire [7:0] switch,
                           output reg led);
    parameter STATE_INIT    = 0;
    parameter STATE_1       = 1;
    parameter STATE_2       = 2;
    parameter STATE_3       = 3;
    parameter STATE_4       = 4;
    parameter STATE_MATCHED = 5;
    parameter ADDR_INIT     = 0;
    
    reg [3:0] state = 0;
    reg [3:0] addr  = 0;
    reg matched     = 0;
    reg on_button   = 0;
    
    always @(*) led = (rst || !on_button || button) ? 0 : matched;  // led
    always @(posedge clk or posedge rst) begin         // matched
        if (rst || !on_button || button)
            matched <= 0;
        else if (state == STATE_MATCHED)
            matched <= 1;
        else if (matched)
            matched <= 1;
        else
            matched <= 0;
    end
    always @(posedge clk or posedge rst) begin         // on_button
        if (rst)
            on_button <= 0;
        else if (button)
            on_button <= 1;
        else
            on_button <= on_button;
    end
    always @(posedge clk or posedge rst) begin         // state, finite-state automaton
        if (rst || !on_button || button) begin
            state <= STATE_INIT;
        end
        else if (on_button) begin
            case(state)
                STATE_INIT: state    <= switch[7-addr]  ? state + 1 : STATE_INIT;
                STATE_1:    state    <= !switch[7-addr] ? state + 1 : STATE_1;
                STATE_2:    state    <= !switch[7-addr] ? state + 1 : STATE_1;
                STATE_3:    state    <= switch[7-addr]  ? state + 1 : STATE_INIT;
                STATE_4:    state    <= !switch[7-addr] ? state + 1 : STATE_1;
                STATE_MATCHED: state <= state;
                default:       state <= state;
            endcase
        end
        else
            state <= state;
    end
    always @(posedge clk or posedge rst) begin        // addr
        if (rst || !on_button || button)
            addr <= ADDR_INIT;
        else if (on_button) begin
            if (addr == 7)
                addr <= addr;
            else
                addr <= addr + 1;
        end
        else
            addr <= addr;
    end
endmodule
