`timescale 1ns / 1ps

module mem_wrap #(
    parameter LATENCY = 10
)(
    input wire        clk,
    input wire        reset,
    input wire        rreq,
    input wire [12:0] raddr,
    output reg [31:0] rdata,
    output reg        rvalid,
    
    input wire        wreq,
    input wire [12:0] waddr,
    input wire [ 7:0] wdata
);

localparam IDLE      = 4'b0001, 
           WAIT      = 4'b0010,
           BURST     = 4'b0100,
           RESP      = 4'b1000,
           BURST_LEN = 2'd3;
reg [ 3:0] current_state, next_state;

reg [ 1:0] burst_cnt;
reg [12:0] raddr_latch;
reg [31:0] wait_count;

wire wait_end  = (wait_count == LATENCY);
wire burst_end = (burst_cnt == BURST_LEN);
wire rlast     = burst_end & (current_state == BURST);

reg  [12:0] raddr_to_ram;
wire [ 7:0] data_from_ram;
reg  [31:0] reg4b;
wire [31:0] reg4b_shift = { data_from_ram, reg4b[31:24], reg4b[23:16], reg4b[15:8] };

always @(posedge clk) begin
    if (reset) begin
        current_state <= IDLE;
    end else begin
        current_state <= next_state;
    end
end
always @(*) begin
    case (current_state)
        IDLE: begin
            if (rreq) begin
                next_state = WAIT;
            end else begin
                next_state = IDLE;
            end
        end
        WAIT: begin
            if (wait_end) begin
                next_state = BURST;
            end else begin
                next_state = WAIT;
            end
        end
        BURST: begin
            if (burst_end) begin
                next_state = RESP;
            end else begin
                next_state = BURST;
            end
        end
        RESP: begin
            next_state = IDLE;
        end
    endcase
end

always @(posedge clk) begin
    if (reset) begin
        raddr_latch <= 0;
        burst_cnt   <= 0;
        wait_count  <= 0;
    end else begin
        if (current_state == IDLE) begin
            raddr_latch <= raddr;
            burst_cnt   <= 0;
            wait_count  <= 0;
        end else if (current_state == WAIT && next_state == WAIT) begin
            wait_count  <= wait_count + 1;
            raddr_latch <= raddr_latch;
            burst_cnt   <= 0;
        end else if (current_state == WAIT && next_state == BURST) begin
            raddr_latch <= raddr_latch + 1;
            burst_cnt   <= 0;
            wait_count  <= 0;
        end else if (current_state == BURST) begin
            raddr_latch <= raddr_latch + 1;
            burst_cnt   <= burst_cnt + 1;
            wait_count  <= 0;
        end else if (current_state == RESP) begin
            raddr_latch <= raddr_latch;
            burst_cnt   <= 0;
            wait_count  <= 0;
        end
    end
end

always @(posedge clk) begin
    if (reset) begin
        reg4b <= 0;
    end else if ((current_state == WAIT && next_state == BURST) || current_state == BURST) begin
        reg4b <= reg4b_shift;
    end else begin
        reg4b <= 0;
    end
end

always @(*) begin
    case (current_state)
        IDLE: begin
            raddr_to_ram = 0;
            rdata        = 0;
            rvalid       = 0;
        end
        WAIT: begin
            raddr_to_ram = raddr_latch;
            rdata        = 0;
            rvalid       = 0;
        end
        BURST: begin
            raddr_to_ram = raddr_latch;
            rdata        = 0;
            rvalid       = 0;
        end
        RESP: begin
            raddr_to_ram = 0;
            rdata        = reg4b;
            rvalid       = 1;
        end
    endcase
end

localparam W_IDLE = 3'b001,
           W_WMEM = 3'b010;
reg [ 2:0] w_current_state, w_next_state;
reg        wen_to_ram;
reg [12:0] waddr_to_ram;
reg [ 7:0] wdata_to_ram;

always @(posedge clk) begin
    if (reset) begin
        w_current_state <= W_IDLE;
    end else begin
        w_current_state <= w_next_state;
    end
end

always @(*) begin
    case (w_current_state)
        W_IDLE: begin
            if (wreq) begin
                w_next_state = W_WMEM;
            end else begin
                w_next_state = W_IDLE;
            end
        end
        W_WMEM: begin
            w_next_state = W_IDLE;
        end
        default: begin
            w_next_state = W_IDLE;
        end
    endcase
end

always @(posedge clk) begin
    if (reset) begin
        wen_to_ram   <= 0;
        waddr_to_ram <= 13'h0;
        wdata_to_ram <= 8'h0;
    end else if (w_current_state == W_IDLE && w_next_state == W_WMEM) begin
        wen_to_ram   <= 1;
        waddr_to_ram <= waddr;
        wdata_to_ram <= wdata;
    end else begin
        wen_to_ram   <= 0;
        waddr_to_ram <= 13'h0;
        wdata_to_ram <= 8'h0;
    end
end

wire [12:0] addr_to_ram = wen_to_ram ? waddr_to_ram : raddr_to_ram;

blk_mem u_mem (
    .clka   (clk          ),
    .addra  (addr_to_ram  ),
    .dina   (wdata_to_ram ),
    .wea    (wen_to_ram   ),
    .douta  (data_from_ram)
);

endmodule
