module crossing (
    input wire clk,
    input wire rst,
    output reg [2:0] south_north, // 约束文件如何分配受到下面的颜色分配影响
    output reg [2:0] east_west
);

parameter CNT_MAX = 1_0000_0000; // 具体是多少我记不得了，就是这么多个周期凑够1s
localparam  STATE0 = 4'b0000,    // STATE0 和 STATE1 在这里没有太大区别，处理的基本是同一状态
            STATE1 = 4'b0001,
            STATE2 = 4'b0010,
            STATE3 = 4'b0100,
            STATE4 = 4'b1000;

localparam  GREEN  = 3'b001,
            YELLOW = 3'b010,
            RED    = 3'b100,
            NO_LIGHT = 3'b000;
wire rst_n = ~rst;

reg [31:0] cnt;          // 若是上面的 CNT_MAX 改了相应的计数器宽度也要改
reg [3:0] cnt_second;    // 数秒
reg [3:0] state;         // 状态


// 任何变量都只能在一个always块里面赋值
// 题目没有要求启动按键，可以自己设一个，我这里就没写了

always @(posedge clk, negedge rst_n) begin // cnt
    if(~rst_n) begin
        cnt <= 0;
    end
    else if (cnt < CNT_MAX) begin
        cnt <= cnt + 1;
    end
    else if (cnt == CNT_MAX) begin
        cnt <= 0;
    end
    else begin
        cnt <= cnt; // 这一句通常在有启动按键时才有意义
    end
end

always @(posedge clk, negedge rst_n) begin // 时序逻辑用来写状态机的状态跳转
    if(~rst_n) begin
        state <= STATE0;
        cnt_second <= 0;
    end 
    else if (cnt == CNT_MAX) begin
        case (state)
            STATE0: if(cnt_second == 3) begin
                state <= STATE2;
                cnt_second <= 0;
            end else begin
                state <= state;
                cnt_second <= cnt_second + 1;
            end
            STATE1: if(cnt_second == 3) begin
                state <= STATE2;
                cnt_second <= 0;
            end else begin
                state <= state;
                cnt_second <= cnt_second + 1;
            end
            STATE2: if (cnt_second == 1) begin
                state <= STATE3;
                cnt_second <= 0;
            end else begin
                state <= state;
                cnt_second <= cnt_second + 1;
            end
            STATE3: if (cnt_second == 3) begin
                state <= STATE4;
                cnt_second <= 0;
            end else begin
                state <= state;
                cnt_second <= cnt_second + 1;
            end
            STATE4: if (cnt_second == 1) begin
                state <= STATE1;
                cnt_second <= 0;
            end else begin
                state <= state;
                cnt_second <= cnt_second + 1;
            end
            default: begin
                state <= state;
                cnt_second <= cnt_second;
            end
        endcase
    end
end

always @(*) begin // 处理south_north, east_west
    case (state)
        STATE0: begin
            south_north = RED;
            east_west = GREEN;
        end 
        STATE1: begin
            south_north = RED;
            east_west = GREEN;
        end
        STATE2: begin
            south_north = RED;
            east_west = YELLOW;
        end
        STATE3: begin
            south_north = GREEN;
            east_west = RED;            
        end
        STATE4: begin
            south_north = YELLOW;
            east_west = RED;
        end
        default: begin
            south_north = NO_LIGHT;
            east_west = NO_LIGHT;
        end
    endcase
end

endmodule