`timescale 1ns / 1ps

module cache (
    // 全局信号
    input             clk,
    input             reset,
    // 从CPU来的访问信号
    input wire [12:0] addr_from_cpu,    // CPU來的地址
    input wire        rreq_from_cpu,    // CPU来的读请求
    input wire        wreq_from_cpu,    // CPU来的写请求
    input wire [ 7:0] wdata_from_cpu,   // CPU来的写数据
    // 从下层内存模块来的信号
    input wire [31:0] rdata_from_mem,   // 内存读取的数据
    input wire        rvalid_from_mem,  // 内存读取数据可用标志
    // 输出给CPU的信号
    output wire [7:0] rdata_to_cpu,     // 输出给CPU的数据
    output wire       hit_to_cpu,       // 输出给CPU的命中标志
    // 输出给下层内存模块的信号
    output reg        rreq_to_mem,      // 输出给下层内存模块的读请求
    output reg [12:0] raddr_to_mem,     // 输出给下层模块的突发传输首地址
    output reg        wreq_to_mem,      // 输出给下层内存模块的写请求
    output reg [12:0] waddr_to_mem,     // 输出给下层内存模块的写地址
    output reg [ 7:0] wdata_to_mem      // 输出给下层内存模块的写数据
);

reg [3:0] current_state, next_state;
localparam READY     = 4'b0000,
           TAG_CHECK = 4'b0010,
           REFILL    = 4'b0001;

wire        wea;                        // Cache写使能信号
wire [37:0] cache_line_r = /* TODO */   // 待写入Cache的Cache行数据
wire [37:0] cache_line;                 // 从Cache中读出的Cache行数据

wire [ 5:0] cache_index    = /* TODO */         // 主存地址中的Cache索引/Cache地址
wire [ 4:0] tag_from_cpu   = /* TODO */         // 主存地址的Tag
wire [ 1:0] offset         = /* TODO */         // Cache行内的字节偏移
wire        valid_bit      = /* TODO */         // Cache行的有效位
wire [ 4:0] tag_from_cache = /* TODO */         // Cache行的Tag

wire hit  = /* TODO */ && /* TODO */ && /* TODO */;
wire miss = (tag_from_cache != tag_from_cpu) | (~valid_bit);

// 根据Cache行的字节偏移，从Cache块中选取CPU所需的字节数据
assign rdata_to_cpu = (offset == 2'b00) ? cache_line[7:0] :
                      (offset == 2'b01) ? cache_line[15:8] :
                      (offset == 2'b10) ? cache_line[23:16] : cache_line[31:24];

assign hit_to_cpu = hit;

// 使用Block RAM IP核作为Cache的物理存储体
blk_mem_gen_0 u_cache (
    .clka   (clk         ),
    .wea    (wea         ),
    .addra  (cache_index ),
    .dina   (cache_line_r),
    .douta  (cache_line  )
);


always @(posedge clk) begin
    if (reset) begin
        current_state <= READY;
    end else begin
        current_state <= next_state;
    end
end

// 根据指导书/PPT的状态转换图，实现控制Cache读取的状态转移
always @(*) begin
    case(current_state)
        READY: begin
            if (/* TODO */) begin
                next_state = /* TODO */;
            end else begin
                next_state = /* TODO */;
            end
        end
        TAG_CHECK: begin
            if (/* TODO */) begin
                next_state = /* TODO */;
            end else begin
                next_state = /* TODO */;
            end
        end
        REFILL: begin
            if (/* TODO */) begin
                next_state = /* TODO */;
            end else begin 
                next_state = /* TODO */;
            end
        end
        default: begin
            next_state = READY;
        end
    endcase
end

// 生成Block RAM的写使能信号
assign wea = (current_state == /* TODO */) && /* TODO */;

// 生成读取主存所需的信号，即读请求信号rreq_to_mem和读地址信号raddr_to_mem
always @(posedge clk) begin
    if (reset) begin
        raddr_to_mem <= 0;
        rreq_to_mem <= 0;
    end else begin
        case (next_state)
            READY: begin
                raddr_to_mem <= /* TODO */
                rreq_to_mem  <= /* TODO */
            end
            TAG_CHECK: begin
                raddr_to_mem <= /* TODO */
                rreq_to_mem  <= /* TODO */
            end
            REFILL: begin
                raddr_to_mem <= /* TODO */
                rreq_to_mem  <= /* TODO */
            end
            default: begin
                raddr_to_mem <= 0;
                rreq_to_mem  <= 0;
            end
        endcase
    end
end



// 写命中处理（写直达法）：写命中时，既要更新Cache块，也要更新内存数据
/* TODO */

endmodule
