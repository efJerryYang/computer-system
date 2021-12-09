// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Dec  5 11:01:17 2021
// Host        : PA05 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/Administrator/Desktop/led_display_ctrl/led_display_ctrl.sim/sim_1/impl/timing/xsim/testbench_time_impl.v
// Design      : led_display_ctrl
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* CNT_DOWN_START = "4'b1010" *) (* ECO_CHECKSUM = "24b00b2c" *) (* SCAN_CNT_MAX = "19'b0011000011010100000" *) 
(* SCND_CNT_MAX = "28'b0010111110101111000010000000" *) 
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
  wire [3:0]cnt_down;
  wire \cnt_down[0]_i_1_n_0 ;
  wire \cnt_down[1]_i_1_n_0 ;
  wire \cnt_down[2]_i_1_n_0 ;
  wire \cnt_down[3]_i_1_n_0 ;
  wire led_ca;
  wire led_ca_OBUF;
  wire led_cb;
  wire led_cb_OBUF;
  wire led_cc;
  wire led_cc_OBUF;
  wire led_cd;
  wire led_cd_OBUF;
  wire led_ce;
  wire led_ce_OBUF;
  wire led_cf;
  wire led_cf_OBUF;
  wire led_cg;
  wire led_cg_OBUF;
  wire led_dp;
  wire [7:0]led_en;
  wire \led_en[0]_i_1_n_0 ;
  wire \led_en[1]_i_1_n_0 ;
  wire \led_en[2]_i_1_n_0 ;
  wire \led_en[3]_i_1_n_0 ;
  wire \led_en[4]_i_1_n_0 ;
  wire \led_en[5]_i_1_n_0 ;
  wire \led_en[6]_i_1_n_0 ;
  wire \led_en[7]_i_1_n_0 ;
  wire [7:0]led_en_OBUF;
  wire \led_r[0]_i_1_n_0 ;
  wire \led_r[1]_i_1_n_0 ;
  wire \led_r[1]_i_2_n_0 ;
  wire \led_r[2]_i_1_n_0 ;
  wire \led_r[3]_i_1_n_0 ;
  wire \led_r[4]_i_1_n_0 ;
  wire \led_r[4]_i_2_n_0 ;
  wire \led_r[4]_i_3_n_0 ;
  wire \led_r[5]_i_1_n_0 ;
  wire \led_r[5]_i_2_n_0 ;
  wire \led_r[5]_i_3_n_0 ;
  wire \led_r[5]_i_4_n_0 ;
  wire \led_r[6]_i_1_n_0 ;
  wire \led_r[6]_i_2_n_0 ;
  wire on_button;
  wire rst;
  wire rst_IBUF;
  wire scan_clk_i_1_n_0;
  wire scan_clk_i_2_n_0;
  wire scan_clk_i_3_n_0;
  wire scan_clk_i_4_n_0;
  wire scan_clk_i_5_n_0;
  wire scan_clk_i_6_n_0;
  wire scan_clk_i_7_n_0;
  wire scan_clk_i_8_n_0;
  wire scan_clk_reg_n_0;
  wire \scan_cnt[0]_i_1_n_0 ;
  wire \scan_cnt[10]_i_1_n_0 ;
  wire \scan_cnt[11]_i_1_n_0 ;
  wire \scan_cnt[12]_i_1_n_0 ;
  wire \scan_cnt[13]_i_1_n_0 ;
  wire \scan_cnt[14]_i_1_n_0 ;
  wire \scan_cnt[15]_i_1_n_0 ;
  wire \scan_cnt[16]_i_1_n_0 ;
  wire \scan_cnt[17]_i_1_n_0 ;
  wire \scan_cnt[18]_i_1_n_0 ;
  wire \scan_cnt[18]_i_2_n_0 ;
  wire \scan_cnt[18]_i_4_n_0 ;
  wire \scan_cnt[18]_i_5_n_0 ;
  wire \scan_cnt[18]_i_6_n_0 ;
  wire \scan_cnt[18]_i_7_n_0 ;
  wire \scan_cnt[1]_i_1_n_0 ;
  wire \scan_cnt[2]_i_1_n_0 ;
  wire \scan_cnt[3]_i_1_n_0 ;
  wire \scan_cnt[4]_i_1_n_0 ;
  wire \scan_cnt[5]_i_1_n_0 ;
  wire \scan_cnt[6]_i_1_n_0 ;
  wire \scan_cnt[7]_i_1_n_0 ;
  wire \scan_cnt[8]_i_1_n_0 ;
  wire \scan_cnt[9]_i_1_n_0 ;
  wire \scan_cnt_reg[12]_i_2_n_0 ;
  wire \scan_cnt_reg[12]_i_2_n_4 ;
  wire \scan_cnt_reg[12]_i_2_n_5 ;
  wire \scan_cnt_reg[12]_i_2_n_6 ;
  wire \scan_cnt_reg[12]_i_2_n_7 ;
  wire \scan_cnt_reg[16]_i_2_n_0 ;
  wire \scan_cnt_reg[16]_i_2_n_4 ;
  wire \scan_cnt_reg[16]_i_2_n_5 ;
  wire \scan_cnt_reg[16]_i_2_n_6 ;
  wire \scan_cnt_reg[16]_i_2_n_7 ;
  wire \scan_cnt_reg[18]_i_3_n_6 ;
  wire \scan_cnt_reg[18]_i_3_n_7 ;
  wire \scan_cnt_reg[4]_i_2_n_0 ;
  wire \scan_cnt_reg[4]_i_2_n_4 ;
  wire \scan_cnt_reg[4]_i_2_n_5 ;
  wire \scan_cnt_reg[4]_i_2_n_6 ;
  wire \scan_cnt_reg[4]_i_2_n_7 ;
  wire \scan_cnt_reg[8]_i_2_n_0 ;
  wire \scan_cnt_reg[8]_i_2_n_4 ;
  wire \scan_cnt_reg[8]_i_2_n_5 ;
  wire \scan_cnt_reg[8]_i_2_n_6 ;
  wire \scan_cnt_reg[8]_i_2_n_7 ;
  wire \scan_cnt_reg_n_0_[0] ;
  wire \scan_cnt_reg_n_0_[10] ;
  wire \scan_cnt_reg_n_0_[11] ;
  wire \scan_cnt_reg_n_0_[12] ;
  wire \scan_cnt_reg_n_0_[13] ;
  wire \scan_cnt_reg_n_0_[14] ;
  wire \scan_cnt_reg_n_0_[15] ;
  wire \scan_cnt_reg_n_0_[16] ;
  wire \scan_cnt_reg_n_0_[17] ;
  wire \scan_cnt_reg_n_0_[18] ;
  wire \scan_cnt_reg_n_0_[1] ;
  wire \scan_cnt_reg_n_0_[2] ;
  wire \scan_cnt_reg_n_0_[3] ;
  wire \scan_cnt_reg_n_0_[4] ;
  wire \scan_cnt_reg_n_0_[5] ;
  wire \scan_cnt_reg_n_0_[6] ;
  wire \scan_cnt_reg_n_0_[7] ;
  wire \scan_cnt_reg_n_0_[8] ;
  wire \scan_cnt_reg_n_0_[9] ;
  wire \scan_pos[0]_i_1_n_0 ;
  wire \scan_pos[1]_i_1_n_0 ;
  wire \scan_pos[2]_i_1_n_0 ;
  wire scnd_clk_i_1_n_0;
  wire scnd_clk_i_2_n_0;
  wire scnd_clk_i_3_n_0;
  wire scnd_clk_i_4_n_0;
  wire scnd_clk_reg_n_0;
  wire \scnd_cnt[0]_i_1_n_0 ;
  wire \scnd_cnt[10]_i_1_n_0 ;
  wire \scnd_cnt[11]_i_1_n_0 ;
  wire \scnd_cnt[12]_i_1_n_0 ;
  wire \scnd_cnt[13]_i_1_n_0 ;
  wire \scnd_cnt[14]_i_1_n_0 ;
  wire \scnd_cnt[15]_i_1_n_0 ;
  wire \scnd_cnt[16]_i_1_n_0 ;
  wire \scnd_cnt[17]_i_1_n_0 ;
  wire \scnd_cnt[18]_i_1_n_0 ;
  wire \scnd_cnt[19]_i_1_n_0 ;
  wire \scnd_cnt[1]_i_1_n_0 ;
  wire \scnd_cnt[20]_i_1_n_0 ;
  wire \scnd_cnt[21]_i_1_n_0 ;
  wire \scnd_cnt[22]_i_1_n_0 ;
  wire \scnd_cnt[23]_i_1_n_0 ;
  wire \scnd_cnt[24]_i_1_n_0 ;
  wire \scnd_cnt[25]_i_1_n_0 ;
  wire \scnd_cnt[26]_i_1_n_0 ;
  wire \scnd_cnt[27]_i_1_n_0 ;
  wire \scnd_cnt[27]_i_2_n_0 ;
  wire \scnd_cnt[27]_i_3_n_0 ;
  wire \scnd_cnt[27]_i_5_n_0 ;
  wire \scnd_cnt[27]_i_6_n_0 ;
  wire \scnd_cnt[27]_i_7_n_0 ;
  wire \scnd_cnt[27]_i_8_n_0 ;
  wire \scnd_cnt[27]_i_9_n_0 ;
  wire \scnd_cnt[2]_i_1_n_0 ;
  wire \scnd_cnt[3]_i_1_n_0 ;
  wire \scnd_cnt[4]_i_1_n_0 ;
  wire \scnd_cnt[5]_i_1_n_0 ;
  wire \scnd_cnt[6]_i_1_n_0 ;
  wire \scnd_cnt[7]_i_1_n_0 ;
  wire \scnd_cnt[8]_i_1_n_0 ;
  wire \scnd_cnt[9]_i_1_n_0 ;
  wire \scnd_cnt_reg[12]_i_2_n_0 ;
  wire \scnd_cnt_reg[12]_i_2_n_4 ;
  wire \scnd_cnt_reg[12]_i_2_n_5 ;
  wire \scnd_cnt_reg[12]_i_2_n_6 ;
  wire \scnd_cnt_reg[12]_i_2_n_7 ;
  wire \scnd_cnt_reg[16]_i_2_n_0 ;
  wire \scnd_cnt_reg[16]_i_2_n_4 ;
  wire \scnd_cnt_reg[16]_i_2_n_5 ;
  wire \scnd_cnt_reg[16]_i_2_n_6 ;
  wire \scnd_cnt_reg[16]_i_2_n_7 ;
  wire \scnd_cnt_reg[20]_i_2_n_0 ;
  wire \scnd_cnt_reg[20]_i_2_n_4 ;
  wire \scnd_cnt_reg[20]_i_2_n_5 ;
  wire \scnd_cnt_reg[20]_i_2_n_6 ;
  wire \scnd_cnt_reg[20]_i_2_n_7 ;
  wire \scnd_cnt_reg[24]_i_2_n_0 ;
  wire \scnd_cnt_reg[24]_i_2_n_4 ;
  wire \scnd_cnt_reg[24]_i_2_n_5 ;
  wire \scnd_cnt_reg[24]_i_2_n_6 ;
  wire \scnd_cnt_reg[24]_i_2_n_7 ;
  wire \scnd_cnt_reg[27]_i_4_n_5 ;
  wire \scnd_cnt_reg[27]_i_4_n_6 ;
  wire \scnd_cnt_reg[27]_i_4_n_7 ;
  wire \scnd_cnt_reg[4]_i_2_n_0 ;
  wire \scnd_cnt_reg[4]_i_2_n_4 ;
  wire \scnd_cnt_reg[4]_i_2_n_5 ;
  wire \scnd_cnt_reg[4]_i_2_n_6 ;
  wire \scnd_cnt_reg[4]_i_2_n_7 ;
  wire \scnd_cnt_reg[8]_i_2_n_0 ;
  wire \scnd_cnt_reg[8]_i_2_n_4 ;
  wire \scnd_cnt_reg[8]_i_2_n_5 ;
  wire \scnd_cnt_reg[8]_i_2_n_6 ;
  wire \scnd_cnt_reg[8]_i_2_n_7 ;
  wire \scnd_cnt_reg_n_0_[0] ;
  wire \scnd_cnt_reg_n_0_[10] ;
  wire \scnd_cnt_reg_n_0_[11] ;
  wire \scnd_cnt_reg_n_0_[12] ;
  wire \scnd_cnt_reg_n_0_[13] ;
  wire \scnd_cnt_reg_n_0_[14] ;
  wire \scnd_cnt_reg_n_0_[15] ;
  wire \scnd_cnt_reg_n_0_[16] ;
  wire \scnd_cnt_reg_n_0_[17] ;
  wire \scnd_cnt_reg_n_0_[18] ;
  wire \scnd_cnt_reg_n_0_[19] ;
  wire \scnd_cnt_reg_n_0_[1] ;
  wire \scnd_cnt_reg_n_0_[20] ;
  wire \scnd_cnt_reg_n_0_[21] ;
  wire \scnd_cnt_reg_n_0_[22] ;
  wire \scnd_cnt_reg_n_0_[23] ;
  wire \scnd_cnt_reg_n_0_[24] ;
  wire \scnd_cnt_reg_n_0_[25] ;
  wire \scnd_cnt_reg_n_0_[26] ;
  wire \scnd_cnt_reg_n_0_[27] ;
  wire \scnd_cnt_reg_n_0_[2] ;
  wire \scnd_cnt_reg_n_0_[3] ;
  wire \scnd_cnt_reg_n_0_[4] ;
  wire \scnd_cnt_reg_n_0_[5] ;
  wire \scnd_cnt_reg_n_0_[6] ;
  wire \scnd_cnt_reg_n_0_[7] ;
  wire \scnd_cnt_reg_n_0_[8] ;
  wire \scnd_cnt_reg_n_0_[9] ;
  wire [2:0]sel0;
  wire [2:0]\NLW_scan_cnt_reg[12]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_scan_cnt_reg[16]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_scan_cnt_reg[18]_i_3_CO_UNCONNECTED ;
  wire [3:2]\NLW_scan_cnt_reg[18]_i_3_O_UNCONNECTED ;
  wire [2:0]\NLW_scan_cnt_reg[4]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_scan_cnt_reg[8]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_scnd_cnt_reg[12]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_scnd_cnt_reg[16]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_scnd_cnt_reg[20]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_scnd_cnt_reg[24]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_scnd_cnt_reg[27]_i_4_CO_UNCONNECTED ;
  wire [3:3]\NLW_scnd_cnt_reg[27]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_scnd_cnt_reg[4]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_scnd_cnt_reg[8]_i_2_CO_UNCONNECTED ;

initial begin
 $sdf_annotate("testbench_time_impl.sdf",,,,"tool_control");
end
  IBUF button_IBUF_inst
       (.I(button),
        .O(button_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0000F0E0)) 
    \cnt_down[0]_i_1 
       (.I0(cnt_down[1]),
        .I1(cnt_down[2]),
        .I2(on_button),
        .I3(cnt_down[3]),
        .I4(cnt_down[0]),
        .O(\cnt_down[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h9F)) 
    \cnt_down[1]_i_1 
       (.I0(cnt_down[0]),
        .I1(cnt_down[1]),
        .I2(on_button),
        .O(\cnt_down[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hF000C020)) 
    \cnt_down[2]_i_1 
       (.I0(cnt_down[3]),
        .I1(cnt_down[0]),
        .I2(on_button),
        .I3(cnt_down[2]),
        .I4(cnt_down[1]),
        .O(\cnt_down[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hAAA9FFFF)) 
    \cnt_down[3]_i_1 
       (.I0(cnt_down[3]),
        .I1(cnt_down[2]),
        .I2(cnt_down[1]),
        .I3(cnt_down[0]),
        .I4(on_button),
        .O(\cnt_down[3]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_down_reg[0] 
       (.C(scnd_clk_reg_n_0),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\cnt_down[0]_i_1_n_0 ),
        .Q(cnt_down[0]));
  FDPE #(
    .INIT(1'b0)) 
    \cnt_down_reg[1] 
       (.C(scnd_clk_reg_n_0),
        .CE(1'b1),
        .D(\cnt_down[1]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(cnt_down[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_down_reg[2] 
       (.C(scnd_clk_reg_n_0),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\cnt_down[2]_i_1_n_0 ),
        .Q(cnt_down[2]));
  FDPE #(
    .INIT(1'b0)) 
    \cnt_down_reg[3] 
       (.C(scnd_clk_reg_n_0),
        .CE(1'b1),
        .D(\cnt_down[3]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(cnt_down[3]));
  OBUF led_ca_OBUF_inst
       (.I(led_ca_OBUF),
        .O(led_ca));
  OBUF led_cb_OBUF_inst
       (.I(led_cb_OBUF),
        .O(led_cb));
  OBUF led_cc_OBUF_inst
       (.I(led_cc_OBUF),
        .O(led_cc));
  OBUF led_cd_OBUF_inst
       (.I(led_cd_OBUF),
        .O(led_cd));
  OBUF led_ce_OBUF_inst
       (.I(led_ce_OBUF),
        .O(led_ce));
  OBUF led_cf_OBUF_inst
       (.I(led_cf_OBUF),
        .O(led_cf));
  OBUF led_cg_OBUF_inst
       (.I(led_cg_OBUF),
        .O(led_cg));
  OBUF led_dp_OBUF_inst
       (.I(1'b1),
        .O(led_dp));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \led_en[0]_i_1 
       (.I0(sel0[1]),
        .I1(sel0[0]),
        .I2(on_button),
        .I3(sel0[2]),
        .O(\led_en[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \led_en[1]_i_1 
       (.I0(sel0[0]),
        .I1(sel0[1]),
        .I2(on_button),
        .I3(sel0[2]),
        .O(\led_en[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \led_en[2]_i_1 
       (.I0(on_button),
        .I1(sel0[2]),
        .I2(sel0[1]),
        .I3(sel0[0]),
        .O(\led_en[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \led_en[3]_i_1 
       (.I0(on_button),
        .I1(sel0[2]),
        .I2(sel0[1]),
        .I3(sel0[0]),
        .O(\led_en[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hEFFF)) 
    \led_en[4]_i_1 
       (.I0(sel0[1]),
        .I1(sel0[0]),
        .I2(on_button),
        .I3(sel0[2]),
        .O(\led_en[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \led_en[5]_i_1 
       (.I0(sel0[0]),
        .I1(sel0[1]),
        .I2(on_button),
        .I3(sel0[2]),
        .O(\led_en[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \led_en[6]_i_1 
       (.I0(on_button),
        .I1(sel0[2]),
        .I2(sel0[1]),
        .I3(sel0[0]),
        .O(\led_en[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \led_en[7]_i_1 
       (.I0(on_button),
        .I1(sel0[2]),
        .I2(sel0[1]),
        .I3(sel0[0]),
        .O(\led_en[7]_i_1_n_0 ));
  OBUF \led_en_OBUF[0]_inst 
       (.I(led_en_OBUF[0]),
        .O(led_en[0]));
  OBUF \led_en_OBUF[1]_inst 
       (.I(led_en_OBUF[1]),
        .O(led_en[1]));
  OBUF \led_en_OBUF[2]_inst 
       (.I(led_en_OBUF[2]),
        .O(led_en[2]));
  OBUF \led_en_OBUF[3]_inst 
       (.I(led_en_OBUF[3]),
        .O(led_en[3]));
  OBUF \led_en_OBUF[4]_inst 
       (.I(led_en_OBUF[4]),
        .O(led_en[4]));
  OBUF \led_en_OBUF[5]_inst 
       (.I(led_en_OBUF[5]),
        .O(led_en[5]));
  OBUF \led_en_OBUF[6]_inst 
       (.I(led_en_OBUF[6]),
        .O(led_en[6]));
  OBUF \led_en_OBUF[7]_inst 
       (.I(led_en_OBUF[7]),
        .O(led_en[7]));
  FDPE #(
    .INIT(1'b1)) 
    \led_en_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_en[0]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_en_OBUF[0]));
  FDPE #(
    .INIT(1'b1)) 
    \led_en_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_en[1]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_en_OBUF[1]));
  FDPE #(
    .INIT(1'b1)) 
    \led_en_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_en[2]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_en_OBUF[2]));
  FDPE #(
    .INIT(1'b1)) 
    \led_en_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_en[3]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_en_OBUF[3]));
  FDPE #(
    .INIT(1'b1)) 
    \led_en_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_en[4]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_en_OBUF[4]));
  FDPE #(
    .INIT(1'b1)) 
    \led_en_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_en[5]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_en_OBUF[5]));
  FDPE #(
    .INIT(1'b1)) 
    \led_en_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_en[6]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_en_OBUF[6]));
  FDPE #(
    .INIT(1'b1)) 
    \led_en_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_en[7]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_en_OBUF[7]));
  LUT5 #(
    .INIT(32'hABAAAEAA)) 
    \led_r[0]_i_1 
       (.I0(\led_r[4]_i_2_n_0 ),
        .I1(cnt_down[0]),
        .I2(cnt_down[1]),
        .I3(\led_r[1]_i_2_n_0 ),
        .I4(cnt_down[2]),
        .O(\led_r[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5555D555D5555555)) 
    \led_r[1]_i_1 
       (.I0(on_button),
        .I1(\led_r[1]_i_2_n_0 ),
        .I2(cnt_down[2]),
        .I3(sel0[2]),
        .I4(cnt_down[1]),
        .I5(cnt_down[0]),
        .O(\led_r[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \led_r[1]_i_2 
       (.I0(sel0[1]),
        .I1(sel0[0]),
        .I2(cnt_down[3]),
        .O(\led_r[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h75757575757D7575)) 
    \led_r[2]_i_1 
       (.I0(on_button),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(cnt_down[3]),
        .I4(\led_r[5]_i_4_n_0 ),
        .I5(cnt_down[0]),
        .O(\led_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCDCCCCCCCCCDCFCC)) 
    \led_r[3]_i_1 
       (.I0(cnt_down[3]),
        .I1(\led_r[4]_i_2_n_0 ),
        .I2(\led_r[4]_i_3_n_0 ),
        .I3(cnt_down[0]),
        .I4(cnt_down[2]),
        .I5(cnt_down[1]),
        .O(\led_r[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F1F0F0F0FFF4)) 
    \led_r[4]_i_1 
       (.I0(cnt_down[1]),
        .I1(cnt_down[2]),
        .I2(\led_r[4]_i_2_n_0 ),
        .I3(cnt_down[0]),
        .I4(\led_r[4]_i_3_n_0 ),
        .I5(cnt_down[3]),
        .O(\led_r[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8F0F0F0F8F0FFF0F)) 
    \led_r[4]_i_2 
       (.I0(\led_r[5]_i_4_n_0 ),
        .I1(\led_r[5]_i_3_n_0 ),
        .I2(on_button),
        .I3(sel0[1]),
        .I4(sel0[0]),
        .I5(sel0[2]),
        .O(\led_r[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \led_r[4]_i_3 
       (.I0(sel0[0]),
        .I1(sel0[1]),
        .O(\led_r[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEAFFFFFFAAFFAAFF)) 
    \led_r[5]_i_1 
       (.I0(\led_r[5]_i_2_n_0 ),
        .I1(\led_r[5]_i_3_n_0 ),
        .I2(\led_r[5]_i_4_n_0 ),
        .I3(on_button),
        .I4(sel0[1]),
        .I5(sel0[0]),
        .O(\led_r[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hA0202000)) 
    \led_r[5]_i_2 
       (.I0(\led_r[1]_i_2_n_0 ),
        .I1(cnt_down[2]),
        .I2(sel0[2]),
        .I3(cnt_down[1]),
        .I4(cnt_down[0]),
        .O(\led_r[5]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \led_r[5]_i_3 
       (.I0(cnt_down[3]),
        .I1(cnt_down[0]),
        .O(\led_r[5]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \led_r[5]_i_4 
       (.I0(sel0[2]),
        .I1(cnt_down[1]),
        .I2(cnt_down[2]),
        .O(\led_r[5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFAFAFEF)) 
    \led_r[6]_i_1 
       (.I0(\led_r[6]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(on_button),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(\led_r[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E090A090)) 
    \led_r[6]_i_2 
       (.I0(cnt_down[3]),
        .I1(cnt_down[1]),
        .I2(sel0[2]),
        .I3(cnt_down[2]),
        .I4(cnt_down[0]),
        .I5(sel0[0]),
        .O(\led_r[6]_i_2_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \led_r_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_r[0]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_ca_OBUF));
  FDPE #(
    .INIT(1'b1)) 
    \led_r_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_r[1]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_cb_OBUF));
  FDPE #(
    .INIT(1'b1)) 
    \led_r_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_r[2]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_cc_OBUF));
  FDPE #(
    .INIT(1'b1)) 
    \led_r_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_r[3]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_cd_OBUF));
  FDPE #(
    .INIT(1'b1)) 
    \led_r_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_r[4]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_ce_OBUF));
  FDPE #(
    .INIT(1'b1)) 
    \led_r_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_r[5]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(led_cf_OBUF));
  FDPE #(
    .INIT(1'b1)) 
    \led_r_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\led_r[6]_i_1_n_0 ),
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
  LUT6 #(
    .INIT(64'h00000C0011001100)) 
    scan_clk_i_1
       (.I0(scan_clk_i_2_n_0),
        .I1(scan_clk_i_3_n_0),
        .I2(scan_clk_i_4_n_0),
        .I3(on_button),
        .I4(scan_clk_i_5_n_0),
        .I5(scan_clk_reg_n_0),
        .O(scan_clk_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    scan_clk_i_2
       (.I0(scan_clk_i_6_n_0),
        .I1(\scan_cnt_reg_n_0_[17] ),
        .I2(\scan_cnt_reg_n_0_[18] ),
        .I3(\scan_cnt_reg_n_0_[8] ),
        .I4(\scan_cnt_reg_n_0_[5] ),
        .I5(\scan_cnt_reg_n_0_[6] ),
        .O(scan_clk_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF7FFFFFFF)) 
    scan_clk_i_3
       (.I0(\scan_cnt_reg_n_0_[1] ),
        .I1(\scan_cnt_reg_n_0_[2] ),
        .I2(\scan_cnt_reg_n_0_[4] ),
        .I3(\scan_cnt_reg_n_0_[3] ),
        .I4(\scan_cnt_reg_n_0_[0] ),
        .I5(\scan_cnt[18]_i_5_n_0 ),
        .O(scan_clk_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    scan_clk_i_4
       (.I0(\scan_cnt_reg_n_0_[17] ),
        .I1(\scan_cnt_reg_n_0_[18] ),
        .O(scan_clk_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFAEAFAEAFAEAEAE)) 
    scan_clk_i_5
       (.I0(scan_clk_i_7_n_0),
        .I1(\scan_cnt_reg_n_0_[8] ),
        .I2(scan_clk_i_8_n_0),
        .I3(\scan_cnt_reg_n_0_[7] ),
        .I4(\scan_cnt_reg_n_0_[5] ),
        .I5(\scan_cnt_reg_n_0_[6] ),
        .O(scan_clk_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    scan_clk_i_6
       (.I0(\scan_cnt_reg_n_0_[12] ),
        .I1(\scan_cnt_reg_n_0_[11] ),
        .I2(\scan_cnt_reg_n_0_[14] ),
        .I3(\scan_cnt_reg_n_0_[13] ),
        .O(scan_clk_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFE000000000000)) 
    scan_clk_i_7
       (.I0(\scan_cnt_reg_n_0_[13] ),
        .I1(\scan_cnt_reg_n_0_[14] ),
        .I2(\scan_cnt_reg_n_0_[11] ),
        .I3(\scan_cnt_reg_n_0_[12] ),
        .I4(\scan_cnt_reg_n_0_[16] ),
        .I5(\scan_cnt_reg_n_0_[15] ),
        .O(scan_clk_i_7_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    scan_clk_i_8
       (.I0(\scan_cnt_reg_n_0_[10] ),
        .I1(\scan_cnt_reg_n_0_[9] ),
        .I2(\scan_cnt_reg_n_0_[16] ),
        .I3(\scan_cnt_reg_n_0_[15] ),
        .O(scan_clk_i_8_n_0));
  FDCE #(
    .INIT(1'b0)) 
    scan_clk_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(scan_clk_i_1_n_0),
        .Q(scan_clk_reg_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \scan_cnt[0]_i_1 
       (.I0(on_button),
        .I1(\scan_cnt_reg_n_0_[0] ),
        .O(\scan_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[10]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[12]_i_2_n_6 ),
        .O(\scan_cnt[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[11]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[12]_i_2_n_5 ),
        .O(\scan_cnt[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[12]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[12]_i_2_n_4 ),
        .O(\scan_cnt[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[13]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[16]_i_2_n_7 ),
        .O(\scan_cnt[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[14]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[16]_i_2_n_6 ),
        .O(\scan_cnt[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[15]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[16]_i_2_n_5 ),
        .O(\scan_cnt[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[16]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[16]_i_2_n_4 ),
        .O(\scan_cnt[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[17]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[18]_i_3_n_7 ),
        .O(\scan_cnt[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[18]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[18]_i_3_n_6 ),
        .O(\scan_cnt[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \scan_cnt[18]_i_2 
       (.I0(\scan_cnt[18]_i_4_n_0 ),
        .I1(\scan_cnt[18]_i_5_n_0 ),
        .I2(\scan_cnt[18]_i_6_n_0 ),
        .I3(\scan_cnt_reg_n_0_[8] ),
        .I4(\scan_cnt[18]_i_7_n_0 ),
        .I5(on_button),
        .O(\scan_cnt[18]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \scan_cnt[18]_i_4 
       (.I0(\scan_cnt_reg_n_0_[0] ),
        .I1(\scan_cnt_reg_n_0_[3] ),
        .I2(\scan_cnt_reg_n_0_[4] ),
        .I3(\scan_cnt_reg_n_0_[2] ),
        .I4(\scan_cnt_reg_n_0_[1] ),
        .O(\scan_cnt[18]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \scan_cnt[18]_i_5 
       (.I0(\scan_cnt_reg_n_0_[15] ),
        .I1(\scan_cnt_reg_n_0_[16] ),
        .I2(\scan_cnt_reg_n_0_[9] ),
        .I3(\scan_cnt_reg_n_0_[10] ),
        .I4(\scan_cnt_reg_n_0_[7] ),
        .O(\scan_cnt[18]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \scan_cnt[18]_i_6 
       (.I0(\scan_cnt_reg_n_0_[18] ),
        .I1(\scan_cnt_reg_n_0_[17] ),
        .I2(\scan_cnt_reg_n_0_[13] ),
        .I3(\scan_cnt_reg_n_0_[14] ),
        .I4(\scan_cnt_reg_n_0_[11] ),
        .I5(\scan_cnt_reg_n_0_[12] ),
        .O(\scan_cnt[18]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \scan_cnt[18]_i_7 
       (.I0(\scan_cnt_reg_n_0_[5] ),
        .I1(\scan_cnt_reg_n_0_[6] ),
        .O(\scan_cnt[18]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[1]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[4]_i_2_n_7 ),
        .O(\scan_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[2]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[4]_i_2_n_6 ),
        .O(\scan_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[3]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[4]_i_2_n_5 ),
        .O(\scan_cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[4]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[4]_i_2_n_4 ),
        .O(\scan_cnt[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[5]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[8]_i_2_n_7 ),
        .O(\scan_cnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[6]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[8]_i_2_n_6 ),
        .O(\scan_cnt[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[7]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[8]_i_2_n_5 ),
        .O(\scan_cnt[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[8]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[8]_i_2_n_4 ),
        .O(\scan_cnt[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \scan_cnt[9]_i_1 
       (.I0(\scan_cnt[18]_i_2_n_0 ),
        .I1(\scan_cnt_reg[12]_i_2_n_7 ),
        .O(\scan_cnt[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[0]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[10]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[11]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[12]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[12] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scan_cnt_reg[12]_i_2 
       (.CI(\scan_cnt_reg[8]_i_2_n_0 ),
        .CO({\scan_cnt_reg[12]_i_2_n_0 ,\NLW_scan_cnt_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\scan_cnt_reg[12]_i_2_n_4 ,\scan_cnt_reg[12]_i_2_n_5 ,\scan_cnt_reg[12]_i_2_n_6 ,\scan_cnt_reg[12]_i_2_n_7 }),
        .S({\scan_cnt_reg_n_0_[12] ,\scan_cnt_reg_n_0_[11] ,\scan_cnt_reg_n_0_[10] ,\scan_cnt_reg_n_0_[9] }));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[13]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[13] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[14]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[14] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[15]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[15] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[16]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[16] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scan_cnt_reg[16]_i_2 
       (.CI(\scan_cnt_reg[12]_i_2_n_0 ),
        .CO({\scan_cnt_reg[16]_i_2_n_0 ,\NLW_scan_cnt_reg[16]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\scan_cnt_reg[16]_i_2_n_4 ,\scan_cnt_reg[16]_i_2_n_5 ,\scan_cnt_reg[16]_i_2_n_6 ,\scan_cnt_reg[16]_i_2_n_7 }),
        .S({\scan_cnt_reg_n_0_[16] ,\scan_cnt_reg_n_0_[15] ,\scan_cnt_reg_n_0_[14] ,\scan_cnt_reg_n_0_[13] }));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[17]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[17] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[18]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[18] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scan_cnt_reg[18]_i_3 
       (.CI(\scan_cnt_reg[16]_i_2_n_0 ),
        .CO(\NLW_scan_cnt_reg[18]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_scan_cnt_reg[18]_i_3_O_UNCONNECTED [3:2],\scan_cnt_reg[18]_i_3_n_6 ,\scan_cnt_reg[18]_i_3_n_7 }),
        .S({1'b0,1'b0,\scan_cnt_reg_n_0_[18] ,\scan_cnt_reg_n_0_[17] }));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[1]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[2]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[3]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[4]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[4] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scan_cnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\scan_cnt_reg[4]_i_2_n_0 ,\NLW_scan_cnt_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\scan_cnt_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\scan_cnt_reg[4]_i_2_n_4 ,\scan_cnt_reg[4]_i_2_n_5 ,\scan_cnt_reg[4]_i_2_n_6 ,\scan_cnt_reg[4]_i_2_n_7 }),
        .S({\scan_cnt_reg_n_0_[4] ,\scan_cnt_reg_n_0_[3] ,\scan_cnt_reg_n_0_[2] ,\scan_cnt_reg_n_0_[1] }));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[5]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[6]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[7]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[8]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[8] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scan_cnt_reg[8]_i_2 
       (.CI(\scan_cnt_reg[4]_i_2_n_0 ),
        .CO({\scan_cnt_reg[8]_i_2_n_0 ,\NLW_scan_cnt_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\scan_cnt_reg[8]_i_2_n_4 ,\scan_cnt_reg[8]_i_2_n_5 ,\scan_cnt_reg[8]_i_2_n_6 ,\scan_cnt_reg[8]_i_2_n_7 }),
        .S({\scan_cnt_reg_n_0_[8] ,\scan_cnt_reg_n_0_[7] ,\scan_cnt_reg_n_0_[6] ,\scan_cnt_reg_n_0_[5] }));
  FDCE #(
    .INIT(1'b0)) 
    \scan_cnt_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_cnt[9]_i_1_n_0 ),
        .Q(\scan_cnt_reg_n_0_[9] ));
  LUT2 #(
    .INIT(4'h2)) 
    \scan_pos[0]_i_1 
       (.I0(on_button),
        .I1(sel0[0]),
        .O(\scan_pos[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \scan_pos[1]_i_1 
       (.I0(sel0[1]),
        .I1(sel0[0]),
        .I2(on_button),
        .O(\scan_pos[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \scan_pos[2]_i_1 
       (.I0(sel0[0]),
        .I1(sel0[1]),
        .I2(on_button),
        .I3(sel0[2]),
        .O(\scan_pos[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \scan_pos_reg[0] 
       (.C(scan_clk_reg_n_0),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_pos[0]_i_1_n_0 ),
        .Q(sel0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \scan_pos_reg[1] 
       (.C(scan_clk_reg_n_0),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_pos[1]_i_1_n_0 ),
        .Q(sel0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \scan_pos_reg[2] 
       (.C(scan_clk_reg_n_0),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scan_pos[2]_i_1_n_0 ),
        .Q(sel0[2]));
  LUT6 #(
    .INIT(64'h00000F0000220022)) 
    scnd_clk_i_1
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(scnd_clk_i_2_n_0),
        .I3(\scnd_cnt[27]_i_3_n_0 ),
        .I4(scnd_clk_i_3_n_0),
        .I5(scnd_clk_reg_n_0),
        .O(scnd_clk_i_1_n_0));
  LUT6 #(
    .INIT(64'hDDDDDFDDDDDDDDDD)) 
    scnd_clk_i_2
       (.I0(on_button),
        .I1(scnd_clk_i_4_n_0),
        .I2(\scnd_cnt[27]_i_9_n_0 ),
        .I3(\scnd_cnt_reg_n_0_[17] ),
        .I4(\scnd_cnt[27]_i_8_n_0 ),
        .I5(\scnd_cnt[27]_i_5_n_0 ),
        .O(scnd_clk_i_2_n_0));
  LUT6 #(
    .INIT(64'h88FF88F888F888F8)) 
    scnd_clk_i_3
       (.I0(\scnd_cnt_reg_n_0_[24] ),
        .I1(\scnd_cnt_reg_n_0_[25] ),
        .I2(\scnd_cnt_reg_n_0_[18] ),
        .I3(\scnd_cnt[27]_i_8_n_0 ),
        .I4(\scnd_cnt_reg_n_0_[17] ),
        .I5(\scnd_cnt_reg_n_0_[16] ),
        .O(scnd_clk_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    scnd_clk_i_4
       (.I0(\scnd_cnt_reg_n_0_[26] ),
        .I1(\scnd_cnt_reg_n_0_[27] ),
        .O(scnd_clk_i_4_n_0));
  FDCE #(
    .INIT(1'b0)) 
    scnd_clk_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(scnd_clk_i_1_n_0),
        .Q(scnd_clk_reg_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \scnd_cnt[0]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt_reg_n_0_[0] ),
        .O(\scnd_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[10]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[12]_i_2_n_6 ),
        .O(\scnd_cnt[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[11]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[12]_i_2_n_5 ),
        .O(\scnd_cnt[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[12]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[12]_i_2_n_4 ),
        .O(\scnd_cnt[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[13]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[16]_i_2_n_7 ),
        .O(\scnd_cnt[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[14]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[16]_i_2_n_6 ),
        .O(\scnd_cnt[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[15]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[16]_i_2_n_5 ),
        .O(\scnd_cnt[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[16]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[16]_i_2_n_4 ),
        .O(\scnd_cnt[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[17]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[20]_i_2_n_7 ),
        .O(\scnd_cnt[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[18]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[20]_i_2_n_6 ),
        .O(\scnd_cnt[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[19]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[20]_i_2_n_5 ),
        .O(\scnd_cnt[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[1]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[4]_i_2_n_7 ),
        .O(\scnd_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[20]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[20]_i_2_n_4 ),
        .O(\scnd_cnt[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[21]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[24]_i_2_n_7 ),
        .O(\scnd_cnt[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[22]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[24]_i_2_n_6 ),
        .O(\scnd_cnt[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[23]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[24]_i_2_n_5 ),
        .O(\scnd_cnt[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[24]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[24]_i_2_n_4 ),
        .O(\scnd_cnt[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[25]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[27]_i_4_n_7 ),
        .O(\scnd_cnt[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[26]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[27]_i_4_n_6 ),
        .O(\scnd_cnt[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[27]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[27]_i_4_n_5 ),
        .O(\scnd_cnt[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \scnd_cnt[27]_i_2 
       (.I0(\scnd_cnt_reg_n_0_[18] ),
        .I1(\scnd_cnt_reg_n_0_[24] ),
        .I2(\scnd_cnt_reg_n_0_[27] ),
        .I3(\scnd_cnt_reg_n_0_[26] ),
        .I4(\scnd_cnt_reg_n_0_[16] ),
        .I5(\scnd_cnt[27]_i_5_n_0 ),
        .O(\scnd_cnt[27]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \scnd_cnt[27]_i_3 
       (.I0(\scnd_cnt[27]_i_6_n_0 ),
        .I1(\scnd_cnt[27]_i_7_n_0 ),
        .I2(\scnd_cnt[27]_i_8_n_0 ),
        .I3(\scnd_cnt_reg_n_0_[17] ),
        .I4(\scnd_cnt[27]_i_9_n_0 ),
        .O(\scnd_cnt[27]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \scnd_cnt[27]_i_5 
       (.I0(\scnd_cnt_reg_n_0_[7] ),
        .I1(\scnd_cnt_reg_n_0_[10] ),
        .I2(\scnd_cnt_reg_n_0_[11] ),
        .I3(\scnd_cnt_reg_n_0_[9] ),
        .I4(\scnd_cnt_reg_n_0_[8] ),
        .O(\scnd_cnt[27]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \scnd_cnt[27]_i_6 
       (.I0(\scnd_cnt_reg_n_0_[6] ),
        .I1(\scnd_cnt_reg_n_0_[5] ),
        .I2(\scnd_cnt_reg_n_0_[0] ),
        .O(\scnd_cnt[27]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \scnd_cnt[27]_i_7 
       (.I0(\scnd_cnt_reg_n_0_[2] ),
        .I1(\scnd_cnt_reg_n_0_[1] ),
        .I2(\scnd_cnt_reg_n_0_[4] ),
        .I3(\scnd_cnt_reg_n_0_[3] ),
        .O(\scnd_cnt[27]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \scnd_cnt[27]_i_8 
       (.I0(\scnd_cnt_reg_n_0_[23] ),
        .I1(\scnd_cnt_reg_n_0_[25] ),
        .I2(\scnd_cnt_reg_n_0_[21] ),
        .I3(\scnd_cnt_reg_n_0_[22] ),
        .I4(\scnd_cnt_reg_n_0_[20] ),
        .I5(\scnd_cnt_reg_n_0_[19] ),
        .O(\scnd_cnt[27]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \scnd_cnt[27]_i_9 
       (.I0(\scnd_cnt_reg_n_0_[13] ),
        .I1(\scnd_cnt_reg_n_0_[12] ),
        .I2(\scnd_cnt_reg_n_0_[15] ),
        .I3(\scnd_cnt_reg_n_0_[14] ),
        .O(\scnd_cnt[27]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[2]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[4]_i_2_n_6 ),
        .O(\scnd_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[3]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[4]_i_2_n_5 ),
        .O(\scnd_cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[4]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[4]_i_2_n_4 ),
        .O(\scnd_cnt[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[5]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[8]_i_2_n_7 ),
        .O(\scnd_cnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[6]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[8]_i_2_n_6 ),
        .O(\scnd_cnt[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[7]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[8]_i_2_n_5 ),
        .O(\scnd_cnt[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[8]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[8]_i_2_n_4 ),
        .O(\scnd_cnt[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hA800)) 
    \scnd_cnt[9]_i_1 
       (.I0(on_button),
        .I1(\scnd_cnt[27]_i_2_n_0 ),
        .I2(\scnd_cnt[27]_i_3_n_0 ),
        .I3(\scnd_cnt_reg[12]_i_2_n_7 ),
        .O(\scnd_cnt[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[0]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[10]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[11]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[12]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[12] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scnd_cnt_reg[12]_i_2 
       (.CI(\scnd_cnt_reg[8]_i_2_n_0 ),
        .CO({\scnd_cnt_reg[12]_i_2_n_0 ,\NLW_scnd_cnt_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\scnd_cnt_reg[12]_i_2_n_4 ,\scnd_cnt_reg[12]_i_2_n_5 ,\scnd_cnt_reg[12]_i_2_n_6 ,\scnd_cnt_reg[12]_i_2_n_7 }),
        .S({\scnd_cnt_reg_n_0_[12] ,\scnd_cnt_reg_n_0_[11] ,\scnd_cnt_reg_n_0_[10] ,\scnd_cnt_reg_n_0_[9] }));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[13]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[13] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[14]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[14] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[15]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[15] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[16]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[16] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scnd_cnt_reg[16]_i_2 
       (.CI(\scnd_cnt_reg[12]_i_2_n_0 ),
        .CO({\scnd_cnt_reg[16]_i_2_n_0 ,\NLW_scnd_cnt_reg[16]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\scnd_cnt_reg[16]_i_2_n_4 ,\scnd_cnt_reg[16]_i_2_n_5 ,\scnd_cnt_reg[16]_i_2_n_6 ,\scnd_cnt_reg[16]_i_2_n_7 }),
        .S({\scnd_cnt_reg_n_0_[16] ,\scnd_cnt_reg_n_0_[15] ,\scnd_cnt_reg_n_0_[14] ,\scnd_cnt_reg_n_0_[13] }));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[17]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[17] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[18]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[18] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[19]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[19] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[1]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[20]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[20] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scnd_cnt_reg[20]_i_2 
       (.CI(\scnd_cnt_reg[16]_i_2_n_0 ),
        .CO({\scnd_cnt_reg[20]_i_2_n_0 ,\NLW_scnd_cnt_reg[20]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\scnd_cnt_reg[20]_i_2_n_4 ,\scnd_cnt_reg[20]_i_2_n_5 ,\scnd_cnt_reg[20]_i_2_n_6 ,\scnd_cnt_reg[20]_i_2_n_7 }),
        .S({\scnd_cnt_reg_n_0_[20] ,\scnd_cnt_reg_n_0_[19] ,\scnd_cnt_reg_n_0_[18] ,\scnd_cnt_reg_n_0_[17] }));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[21]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[21] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[22]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[22] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[23]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[23] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[24]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[24] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scnd_cnt_reg[24]_i_2 
       (.CI(\scnd_cnt_reg[20]_i_2_n_0 ),
        .CO({\scnd_cnt_reg[24]_i_2_n_0 ,\NLW_scnd_cnt_reg[24]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\scnd_cnt_reg[24]_i_2_n_4 ,\scnd_cnt_reg[24]_i_2_n_5 ,\scnd_cnt_reg[24]_i_2_n_6 ,\scnd_cnt_reg[24]_i_2_n_7 }),
        .S({\scnd_cnt_reg_n_0_[24] ,\scnd_cnt_reg_n_0_[23] ,\scnd_cnt_reg_n_0_[22] ,\scnd_cnt_reg_n_0_[21] }));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[25]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[25] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[26]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[26] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[27]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[27] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scnd_cnt_reg[27]_i_4 
       (.CI(\scnd_cnt_reg[24]_i_2_n_0 ),
        .CO(\NLW_scnd_cnt_reg[27]_i_4_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_scnd_cnt_reg[27]_i_4_O_UNCONNECTED [3],\scnd_cnt_reg[27]_i_4_n_5 ,\scnd_cnt_reg[27]_i_4_n_6 ,\scnd_cnt_reg[27]_i_4_n_7 }),
        .S({1'b0,\scnd_cnt_reg_n_0_[27] ,\scnd_cnt_reg_n_0_[26] ,\scnd_cnt_reg_n_0_[25] }));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[2]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[3]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[4]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[4] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scnd_cnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\scnd_cnt_reg[4]_i_2_n_0 ,\NLW_scnd_cnt_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\scnd_cnt_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\scnd_cnt_reg[4]_i_2_n_4 ,\scnd_cnt_reg[4]_i_2_n_5 ,\scnd_cnt_reg[4]_i_2_n_6 ,\scnd_cnt_reg[4]_i_2_n_7 }),
        .S({\scnd_cnt_reg_n_0_[4] ,\scnd_cnt_reg_n_0_[3] ,\scnd_cnt_reg_n_0_[2] ,\scnd_cnt_reg_n_0_[1] }));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[5]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[6]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[7]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[8]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[8] ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \scnd_cnt_reg[8]_i_2 
       (.CI(\scnd_cnt_reg[4]_i_2_n_0 ),
        .CO({\scnd_cnt_reg[8]_i_2_n_0 ,\NLW_scnd_cnt_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\scnd_cnt_reg[8]_i_2_n_4 ,\scnd_cnt_reg[8]_i_2_n_5 ,\scnd_cnt_reg[8]_i_2_n_6 ,\scnd_cnt_reg[8]_i_2_n_7 }),
        .S({\scnd_cnt_reg_n_0_[8] ,\scnd_cnt_reg_n_0_[7] ,\scnd_cnt_reg_n_0_[6] ,\scnd_cnt_reg_n_0_[5] }));
  FDCE #(
    .INIT(1'b0)) 
    \scnd_cnt_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\scnd_cnt[9]_i_1_n_0 ),
        .Q(\scnd_cnt_reg_n_0_[9] ));
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
