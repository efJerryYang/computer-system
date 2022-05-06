`timescale 1ns/1ps

module testbench(
);

reg clk  ;
reg rst_n;
reg start; 
wire busy ;

reg  [15:0] x;
reg  [15:0] y;
wire [31:0] z;

reg        wrong        ;
reg [31:0] result [8:0] ;

initial begin
    clk = 0;
    rst_n = 0;
    start = 0;
    #12;
    rst_n = 1;
    start = 1;
    #200
    start = 0;
    #2000;
    $finish;

end

always #5 clk = ~clk;

reg start_ff;
reg start_ff2;
reg start_ff3;
reg start_r_ff;

reg [3:0] test_cnt1  ;
reg [4:0] test_cnt2  ;
reg       test_period;

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) start_ff <= 1'b0;
    else        start_ff <= start;
end

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) start_ff2 <= 1'b0;
    else        start_ff2 <= start_ff;
end

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) start_ff3 <= 1'b0;
    else        start_ff3 <= start_ff2;
end

wire start_r = start_ff2 & ~start_ff3;

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) start_r_ff <= 1'b0;
    else        start_r_ff <= (test_cnt2 == 5'h01) & test_period;
end

wire test_cnt1_end = (test_cnt1 == 4'h8) & test_cnt2_end;
wire test_cnt2_end = (test_cnt2 == 5'hD);
wire check_point = (test_cnt2 == 5'hC);

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n)             test_period <= 1'b0;
	else if (test_cnt1_end) test_period <= 1'b0;
	else if (start_r)       test_period <= 1'b1;
end

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n)             test_cnt1 <= 4'h0;
	else if (test_cnt1_end) test_cnt1 <= 4'h0;
	else if (test_cnt2_end) test_cnt1 <= test_cnt1 + 4'h1;
end

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n)             test_cnt2 <= 5'h00;
	else if (test_cnt2_end) test_cnt2 <= 5'h00;
	else if (test_period)   test_cnt2 <= test_cnt2 + 5'h01;
end

wire test_cnt2_eq_1 = (test_cnt2 == 5'h01);

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) x <= 16'h0;
	else if (test_cnt2_eq_1) begin
	    case (test_cnt1)
		    4'h0 : x <= 16'h0006;
			4'h1 : x <= 16'hfffa;
			4'h2 : x <= 16'h0000;
			4'h3 : x <= 16'h1234;
			4'h4 : x <= 16'hf100;
			4'h5 : x <= 16'h8001;
			4'h6 : x <= 16'h7658;
			4'h7 : x <= 16'h04f8;
			4'h8 : x <= 16'h0589;
			default : x <= 16'h0;
		endcase
	end
	else x <= 16'h0;
end

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) y <= 16'h0;
	else if (test_cnt2_eq_1) begin
	    case (test_cnt1)
		    4'h0 : y <= 16'h0005;
			4'h1 : y <= 16'h0005;
			4'h2 : y <= 16'hff21;
			4'h3 : y <= 16'h1234;
			4'h4 : y <= 16'hf789;
			4'h5 : y <= 16'h6578;
			4'h6 : y <= 16'h0000;
			4'h7 : y <= 16'h1400;
			4'h8 : y <= 16'hc643;
			default : y <= 16'h0;
		endcase
	end
	else y <= 16'h0;
end

integer i;
always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
	    for (i=0;i<=7;i=i+1)
		   result[i] <= 32'h0;
	end
	else begin
		result[0] <= 32'h0000001e;
		result[1] <= 32'hffffffe2;
		result[2] <= 32'h00000000;
		result[3] <= 32'h014B5A90;
		result[4] <= 32'h007EF900;
		result[5] <= 32'hCD446578;
		result[6] <= 32'h00000000;
		result[7] <= 32'h00636000;
		result[8] <= 32'hFEC068DB;
	end
end

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) wrong <= 1'b0;
	else if (check_point) begin
		wrong <= ~(result[test_cnt1] == z);
    end
end	

always @ (posedge clk) begin
	if (wrong) begin
	    $display("wrong at index %x",test_cnt1);
	    $display("=====================================");
	    $display("Test end!");
        $display("----FAIL!!!");
		$display("x           : %x",x);
		$display("y           : %x",y);
		$display("reference   : %x",result[test_cnt1]);
		$display("test module : %x",z); 
	    $finish;
    end
	else if (test_cnt1_end) begin
	    $display("test %x finished",test_cnt1);
	    $display("====================================");
	    $display("Test end!");
        $display("----PASS!!!");
	    $finish;
    end
end

booth2 u_booth2 (
    .clk    (clk       ),
    .rst_n  (rst_n     ),
    .x      (x         ),
    .y      (y         ),
    .start  (start_r_ff),
    .z      (z         ),
    .busy   (busy      )
);

endmodule
