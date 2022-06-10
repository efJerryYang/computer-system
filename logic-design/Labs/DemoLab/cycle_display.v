module crossing (
    input wire clk,
    input wire rst,
    output reg [3:0] light
);

parameter CNT_MAX = 1_0000_0000; // 具体是多少我记不得了，就是这么多个周期凑够1s
localparam  STATE0 = 3'b000,
            STATE1 = 3'b001,
            STATE2 = 3'b010,
            STATE3 = 3'b100;

wire rst_n = ~rst;

reg [31:0] cnt;          // 若是上面的 CNT_MAX 改了相应的计数器宽度也要改
reg [3:0] cnt_second;    // 数秒
reg [2:0] state;         // 状态


// 任何变量都只能在一个always块里面赋值
// 题目没有要求启动按键，可以自己设一个，我这里就没写了

always @(posedge clk, negedge rst_n) begin // cnt 和 cnt_second
    if(~rst_n) begin
        cnt <= 0;
        cnt_second <= 0;
    end
    else if (cnt < CNT_MAX) begin
        cnt <= cnt + 1;
        cnt_second <= cnt_second;
    end
    else if (cnt == CNT_MAX) begin
        cnt <= 0;
        cnt_second <= (cnt_second == 3) ? 0 : cnt_second + 1;
    end
    else begin   // 这个 else 语句通常在有启动按键时才有意义
        cnt <= cnt; 
        cnt_second <= cnt_second;
    end
end

always @(posedge clk, negedge rst_n) begin // 时序逻辑用来写状态机的状态跳转
    if(~rst_n) begin
        state <= STATE0;
    end 
    else if (cnt == CNT_MAX) begin
        case (state)
            STATE0: if(cnt_second == 3) begin // 计时部分移动到上面的计时模块里面了
                state <= STATE2;
            end else begin
                state <= state;
            end
            STATE1: if(cnt_second == 3) begin
                state <= STATE2;
            end else begin
                state <= state;
            end
            STATE2: if (cnt_second == 3) begin
                state <= STATE3;
            end else begin
                state <= state;
            end
            STATE3: if (cnt_second == 3) begin
                state <= STATE1;
            end else begin
                state <= state;
            end
            default: begin
                state <= state;
            end
        endcase
    end
end

always @(*) begin // 处理 light
    case (state)
        STATE0: begin
            light = cnt_second == 0 ? 4'b0001:
                    cnt_second == 1 ? 4'b0011:
                    cnt_second == 2 ? 4'b0111:
                    cnt_second == 3 ? 4'b1111: 4'b0000;
        end 
        STATE1: begin
            light = cnt_second == 0 ? 4'b0001:
                    cnt_second == 1 ? 4'b0011:
                    cnt_second == 2 ? 4'b0111:
                    cnt_second == 3 ? 4'b1111: 4'b0000;
        end
        STATE2: begin
            light = cnt_second == 0 ? 4'b0111:
                    cnt_second == 1 ? 4'b0011:
                    cnt_second == 2 ? 4'b0001:
                    cnt_second == 3 ? 4'b0000: 4'b1111;
        end
        STATE3: begin
            light = cnt_second == 0 ? 4'b1111:
                    cnt_second == 1 ? 4'b0000:
                    cnt_second == 2 ? 4'b1111:
                    cnt_second == 3 ? 4'b0000: 4'b0000;
        end
        default: begin
            light = 4'b0000;
        end
    endcase
end

endmodule