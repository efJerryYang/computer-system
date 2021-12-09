// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Dec  4 20:01:06 2021
// Host        : PA05 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/JerryYang/led_display_ctrl/led_display_ctrl.sim/sim_1/synth/func/xsim/testbench_func_synth.v
// Design      : led_display_ctrl
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CNT_MAX = "100000000" *) (* CNT_START = "4'b1010" *) (* SCAN_CNT_MAX = "200000" *) 
(* NotValidForBitStream *)
module led_display_ctrl
   (clk,
    rst,
    button,
    led_en,
    led_ca,
    led_cb,
    led_cc,
    led_cd,
    led_ce,
    led_cf,
    led_cg,
    led_dp);
  input clk;
  input rst;
  input button;
  output [7:0]led_en;
  output led_ca;
  output led_cb;
  output led_cc;
  output led_cd;
  output led_ce;
  output led_cf;
  output led_cg;
  output led_dp;

  wire button;
  wire button_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire led_ca;
  wire led_cb;
  wire led_cc;
  wire led_cd;
  wire led_ce;
  wire led_cf;
  wire led_cg;
  wire led_cg_OBUF;
  wire led_dp;
  wire [7:0]led_en;
  wire \led_en[0]_i_1_n_0 ;
  wire on_button;
  wire rst;
  wire rst_IBUF;

  IBUF button_IBUF_inst
       (.I(button),
        .O(button_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF led_ca_OBUF_inst
       (.I(led_cg_OBUF),
        .O(led_ca));
  OBUF led_cb_OBUF_inst
       (.I(led_cg_OBUF),
        .O(led_cb));
  OBUF led_cc_OBUF_inst
       (.I(led_cg_OBUF),
        .O(led_cc));
  OBUF led_cd_OBUF_inst
       (.I(led_cg_OBUF),
        .O(led_cd));
  OBUF led_ce_OBUF_inst
       (.I(led_cg_OBUF),
        .O(led_ce));
  OBUF led_cf_OBUF_inst
       (.I(led_cg_OBUF),
        .O(led_cf));
  OBUF led_cg_OBUF_inst
       (.I(led_cg_OBUF),
        .O(led_cg));
  OBUF led_dp_OBUF_inst
       (.I(1'b1),
        .O(led_dp));
  LUT1 #(
    .INIT(2'h1)) 
    \led_en[0]_i_1 
       (.I0(on_button),
        .O(\led_en[0]_i_1_n_0 ));
  OBUF \led_en_OBUF[0]_inst 
       (.I(led_cg_OBUF),
        .O(led_en[0]));
  OBUF \led_en_OBUF[1]_inst 
       (.I(1'b1),
        .O(led_en[1]));
  OBUF \led_en_OBUF[2]_inst 
       (.I(1'b1),
        .O(led_en[2]));
  OBUF \led_en_OBUF[3]_inst 
       (.I(1'b1),
        .O(led_en[3]));
  OBUF \led_en_OBUF[4]_inst 
       (.I(1'b1),
        .O(led_en[4]));
  OBUF \led_en_OBUF[5]_inst 
       (.I(1'b1),
        .O(led_en[5]));
  OBUF \led_en_OBUF[6]_inst 
       (.I(1'b1),
        .O(led_en[6]));
  OBUF \led_en_OBUF[7]_inst 
       (.I(1'b1),
        .O(led_en[7]));
  FDPE #(
    .INIT(1'b1)) 
    \led_en_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_en[0]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_cg_OBUF));
  FDCE #(
    .INIT(1'b0)) 
    on_button_reg
       (.C(clk_IBUF_BUFG),
        .CE(button_IBUF),
        .CLR(rst_IBUF),
        .D(button_IBUF),
        .Q(on_button));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
