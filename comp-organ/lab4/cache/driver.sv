module driver (
    input  wire        clk_in,
    input  wire        reset_in,
    input  wire [12:0] end_addr,
    output reg  [11:0] count,
    output reg         rd_test_success,
    output reg         test_success,
    output reg         test_fail
);

wire reset = reset_in;
wire clk   = clk_in;

reg [12:0] test_addr;
reg        cache_rreq;
reg [ 5:0] test_cache_idx;
reg        cache_wreq;
reg        cache_whit;

wire [ 5:0] end_cache_index  = 6'h3F;
wire [ 7:0] cache_wdata      = 8'hFF;

reg [31:0] random_num;
reg [12:0] cache_line_addr0;
reg [12:0] cache_line_addr1;

wire       cache_hit;
wire [7:0] cache_rdata;
wire [7:0] trace_rdata;

wire        rreq_cache2mem;
wire        wreq_cache2mem;
wire [12:0] raddr_cache2mem;
wire [12:0] waddr_cache2mem;
wire [ 7:0] wdata_cache2mem;
wire [31:0] rdata_mem2cache;
wire        rvalid_mem2cache;

reg [7:0] data_from_trace;
reg [7:0] data_from_cache;

blk_mem trace (
    .clka   (clk        ),
    .addra  (test_addr  ),
    .dina   (0          ),
    .wea    (0          ),
    .douta  (trace_rdata)
);

cache cache0 (
    .clk                (clk             ),
    .reset              (reset           ),
    .addr_from_cpu      (test_addr       ),
    .rreq_from_cpu      (cache_rreq      ),
    .wreq_from_cpu      (cache_wreq      ),
    .wdata_from_cpu     (cache_wdata     ),
    .rdata_to_cpu       (cache_rdata     ),
    .hit_to_cpu         (cache_hit       ),
    .rreq_to_mem        (rreq_cache2mem  ),
    .raddr_to_mem       (raddr_cache2mem ),
    .wreq_to_mem        (wreq_cache2mem  ),
    .waddr_to_mem       (waddr_cache2mem ),
    .wdata_to_mem       (wdata_cache2mem ),
    .rdata_from_mem     (rdata_mem2cache ),
    .rvalid_from_mem    (rvalid_mem2cache)
);

mem_wrap mem0 (
    .clk    (clk             ),
    .reset  (reset           ),
    .rreq   (rreq_cache2mem  ),
    .raddr  (raddr_cache2mem ),
    .rdata  (rdata_mem2cache ),
    .rvalid (rvalid_mem2cache),
    .wreq   (wreq_cache2mem  ),
    .waddr  (waddr_cache2mem ),
    .wdata  (wdata_cache2mem )
);
                
enum logic [3:0] { IDLE         = 4'h0,
                   READ_TRACE   = 4'h1,
                   READ_CACHE   = 4'h2,
                   RES_COMPARE  = 4'h3,
                   RD_TEST_PASS = 4'h4,
                   WRITE_CACHE  = 4'h5,
                   WR_HIT_TEST  = 4'h6,
                   RECORD_HIT   = 4'h7,
                   FLUSH_CLINE  = 4'h8,
                   WR_TEST_PASS = 4'h9,
                   TEST_FAIL    = 4'hF } current_state, next_state;

// 状态转移逻辑               
always @(posedge clk) begin
    if (reset) begin
        current_state <= IDLE;
    end else begin
        current_state <= next_state;
    end
end

// 如果当前状态是等待Cache，并且Cache数据可用，则可以采集Cache的数据
always @(posedge clk) begin
    if (reset) begin
        data_from_cache <= 0;
    end else begin
        if (current_state == READ_CACHE && cache_hit) begin
            data_from_cache <= cache_rdata;
        end
    end
end

// trace ram一个周期可以读出数据
always @(posedge clk) begin
    if (reset) begin
        data_from_trace <= 0;
    end else begin
        if (current_state == READ_TRACE) begin
            data_from_trace <= trace_rdata;
        end
    end
end

always @(*) begin
    case (current_state)
        IDLE: begin
            next_state = READ_TRACE;
        end
        READ_TRACE: begin
            next_state = READ_CACHE;
        end
        READ_CACHE: begin
            if (cache_hit) begin
                next_state = RES_COMPARE;           // Cache成功返回数据，可以进行下一步比对
            end else begin   
                next_state = READ_CACHE;
            end
        end
        RES_COMPARE: begin
            if (data_from_cache == data_from_trace && !rd_test_success) begin
                if (test_addr == end_addr) begin    // 测试完毕
                    next_state = RD_TEST_PASS;
                end else begin
                    next_state = READ_TRACE;
                end
            end else if (data_from_cache == data_from_trace && rd_test_success && !cache_whit) begin
                if (test_cache_idx == end_cache_index) begin
                    next_state = WR_TEST_PASS;
                end else begin
                    next_state = WRITE_CACHE;
                end
            end else if (data_from_cache == cache_wdata && rd_test_success && cache_whit) begin
                if (test_cache_idx == end_cache_index) begin
                    next_state = WR_TEST_PASS;
                end else begin
                    next_state = WRITE_CACHE;
                end
            end else begin
                next_state = TEST_FAIL;
            end
        end
        RD_TEST_PASS: begin
            // next_state = RD_TEST_PASS;
            next_state = WRITE_CACHE;
        end
        WRITE_CACHE: begin
            next_state = WR_HIT_TEST;
        end
        WR_HIT_TEST: begin
            if (cache_hit) begin
                next_state = RECORD_HIT;
            end else begin
                next_state = FLUSH_CLINE;
            end
        end
        RECORD_HIT: begin
            next_state = FLUSH_CLINE;
        end
        FLUSH_CLINE: begin
            if (cache_hit & !cache_whit) begin
                next_state = IDLE;
            end else if (cache_hit & cache_whit) begin
                next_state = READ_CACHE;
            end else begin
                next_state = FLUSH_CLINE;
            end
        end
        WR_TEST_PASS: begin
            next_state = WR_TEST_PASS;
        end
        TEST_FAIL: begin
            next_state = TEST_FAIL;
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

// 性能计数器
always @(posedge clk) begin
    if (reset) begin  
        count <= 0;
    end else if (current_state == READ_CACHE) begin
        count <= count + 1;
    end else begin
        count <= count;
    end
end

// 生成写Cache测试的地址
always @(posedge clk) begin
    if (reset) begin
        random_num       <= $random;
        cache_line_addr0 <= 0;
        cache_line_addr1 <= 0;
    end else if ((next_state == RES_COMPARE) && (rd_test_success == 1)) begin
        random_num       <= $random;
        cache_line_addr0 <= {{4'hF, random_num[0]}, test_cache_idx, 2'b00};
        cache_line_addr1 <= {5'h0, test_cache_idx, 2'b00};
    end else begin
        cache_line_addr0 <= cache_line_addr0;
        cache_line_addr1 <= cache_line_addr1;
    end
end

// 在二段状态机改写成三段的过程中，需要注意状态机原有的由时序逻辑输出的信号需要改写成组合逻辑
always @(posedge clk) begin
    if (reset) begin
        test_addr       <= 0;
        cache_rreq      <= 0;
        cache_wreq      <= 0;
        cache_whit      <= 0;
        test_cache_idx  <= 0;
        rd_test_success <= 0;
        test_success    <= 0;
        test_fail       <= 0;
    end else begin
        case (next_state)
            IDLE: begin
                test_addr       <= rd_test_success ? cache_line_addr0 : test_addr;
                cache_rreq      <= 0;
                cache_wreq      <= 0;
                cache_whit      <= cache_whit;
                test_cache_idx  <= test_cache_idx;
                rd_test_success <= rd_test_success;
                test_success    <= 0;
                test_fail       <= 0;
            end
            READ_TRACE: begin
                test_addr       <= test_addr;
                cache_rreq      <= 0;
                cache_wreq      <= 0;
                cache_whit      <= cache_whit;
                test_cache_idx  <= test_cache_idx;
                rd_test_success <= rd_test_success;
                test_success    <= 0;
                test_fail       <= 0;
            end
            READ_CACHE: begin
                test_addr       <= rd_test_success & cache_whit ? cache_line_addr0 : test_addr;
                cache_rreq      <= 1;
                cache_wreq      <= 0;
                cache_whit      <= cache_whit;
                test_cache_idx  <= test_cache_idx;
                rd_test_success <= rd_test_success;
                test_success    <= 0;
                test_fail       <= 0;
            end
            RES_COMPARE: begin
                test_addr       <= rd_test_success ? test_addr : test_addr + 1;
                cache_rreq      <= 0;
                cache_wreq      <= 0;
                cache_whit      <= cache_whit;
                test_cache_idx  <= rd_test_success ? test_cache_idx + 1 : test_cache_idx;
                rd_test_success <= rd_test_success;
                test_success    <= 0;
                test_fail       <= 0;
            end
            RD_TEST_PASS: begin
                test_addr       <= test_addr;
                cache_rreq      <= 0;
                cache_wreq      <= 0;
                cache_whit      <= cache_whit;
                test_cache_idx  <= test_cache_idx;
                rd_test_success <= 1;
                test_success    <= 0;
                test_fail       <= 0;
            end
            WRITE_CACHE: begin
                test_addr       <= cache_line_addr0;
                cache_rreq      <= 0;
                cache_wreq      <= 1;
                cache_whit      <= 0;
                test_cache_idx  <= test_cache_idx;
                rd_test_success <= rd_test_success;
                test_success    <= 0;
                test_fail       <= 0;
            end
            WR_HIT_TEST: begin
                test_addr       <= test_addr;
                cache_rreq      <= 0;
                cache_wreq      <= cache_wreq;
                cache_whit      <= 0;
                test_cache_idx  <= test_cache_idx;
                rd_test_success <= rd_test_success;
                test_success    <= 0;
                test_fail       <= 0;
            end
            RECORD_HIT: begin
                test_addr       <= test_addr;
                cache_rreq      <= 0;
                cache_wreq      <= 0;
                cache_whit      <= cache_hit;
                test_cache_idx  <= test_cache_idx;
                rd_test_success <= rd_test_success;
                test_success    <= 0;
                test_fail       <= 0;
            end
            FLUSH_CLINE: begin
                test_addr       <= cache_line_addr1;
                cache_rreq      <= 1;
                cache_wreq      <= 0;
                cache_whit      <= cache_whit;
                test_cache_idx  <= test_cache_idx;
                rd_test_success <= rd_test_success;
                test_success    <= 0;
                test_fail       <= 0;
            end
            WR_TEST_PASS: begin
                test_addr       <= test_addr;
                cache_rreq      <= 0;
                cache_wreq      <= 0;
                cache_whit      <= 0;
                test_cache_idx  <= test_cache_idx;
                rd_test_success <= rd_test_success;
                test_success    <= 1;
                test_fail       <= 0;
            end
            TEST_FAIL: begin
                test_addr       <= 0;
                cache_rreq      <= 0;
                cache_wreq      <= 0;
                cache_whit      <= 0;
                test_cache_idx  <= 0;
                rd_test_success <= 0;
                test_success    <= 0;
                test_fail       <= 1;
            end
            default: begin
                test_addr       <= 0;
                cache_rreq      <= 0;
                cache_wreq      <= 0;
                cache_whit      <= 0;
                test_cache_idx  <= 0;
                rd_test_success <= 0;
                test_success    <= 0;
                test_fail       <= 0;
            end
        endcase
    end
end

endmodule
