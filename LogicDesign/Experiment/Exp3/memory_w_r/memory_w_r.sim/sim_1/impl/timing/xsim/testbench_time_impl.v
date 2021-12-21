// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Fri Dec 17 19:33:50 2021
// Host        : PA05 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               E:/GitHub/ComputerSystem/LogicDesign/Experiment/Exp3/memory_w_r/memory_w_r.sim/sim_1/impl/timing/xsim/testbench_time_impl.v
// Design      : memory_top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module clk_div
   (clk_out1,
    reset,
    locked,
    clk_in1);
  output clk_out1;
  input reset;
  output locked;
  input clk_in1;

  (* IBUF_LOW_PWR *) wire clk_in1;
  wire clk_out1;
  wire locked;
  wire reset;

  clk_div_clk_div_clk_wiz inst
       (.clk_in1(clk_in1),
        .clk_out1(clk_out1),
        .locked(locked),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "clk_div_clk_wiz" *) 
module clk_div_clk_div_clk_wiz
   (clk_out1,
    reset,
    locked,
    clk_in1);
  output clk_out1;
  input reset;
  output locked;
  input clk_in1;

  wire clk_in1;
  wire clk_out1;
  wire clk_out1_clk_div;
  wire clkfbout_buf_clk_div;
  wire clkfbout_clk_div;
  wire locked;
  wire reset;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_clk_div),
        .O(clkfbout_buf_clk_div));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT " *) 
  BUFG clkout1_buf
       (.I(clk_out1_clk_div),
        .O(clk_out1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO BUFG_OPT " *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(8.500000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(10.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(42.500000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(1),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
    mmcm_adv_inst
       (.CLKFBIN(clkfbout_buf_clk_div),
        .CLKFBOUT(clkfbout_clk_div),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk_in1),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(clk_out1_clk_div),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(locked),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(reset));
endmodule

(* CHECK_LICENSE_TYPE = "led_mem,blk_mem_gen_v8_4_2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
module led_mem
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [3:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_clkb_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_deepsleep_UNCONNECTED;
  wire NLW_U0_eccpipece_UNCONNECTED;
  wire NLW_U0_enb_UNCONNECTED;
  wire NLW_U0_injectdbiterr_UNCONNECTED;
  wire NLW_U0_injectsbiterr_UNCONNECTED;
  wire NLW_U0_regcea_UNCONNECTED;
  wire NLW_U0_regceb_UNCONNECTED;
  wire NLW_U0_rsta_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_aclk_UNCONNECTED;
  wire NLW_U0_s_aresetn_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_arvalid_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_awvalid_UNCONNECTED;
  wire NLW_U0_s_axi_bready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_injectdbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_injectsbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rready_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wlast_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axi_wvalid_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_shutdown_UNCONNECTED;
  wire NLW_U0_sleep_UNCONNECTED;
  wire [3:0]NLW_U0_addrb_UNCONNECTED;
  wire [15:0]NLW_U0_dinb_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_arlen_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_arsize_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_awlen_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_awsize_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_web_UNCONNECTED;

  (* C_ADDRA_WIDTH = "4" *) 
  (* C_ADDRB_WIDTH = "4" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.87285 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "led_mem.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "16" *) 
  (* C_WRITE_DEPTH_B = "16" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  led_mem_blk_mem_gen_v8_4_2 U0
       (.addra(addra),
        .addrb(NLW_U0_addrb_UNCONNECTED[3:0]),
        .clka(clka),
        .clkb(NLW_U0_clkb_UNCONNECTED),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(NLW_U0_deepsleep_UNCONNECTED),
        .dina(dina),
        .dinb(NLW_U0_dinb_UNCONNECTED[15:0]),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(NLW_U0_eccpipece_UNCONNECTED),
        .ena(ena),
        .enb(NLW_U0_enb_UNCONNECTED),
        .injectdbiterr(NLW_U0_injectdbiterr_UNCONNECTED),
        .injectsbiterr(NLW_U0_injectsbiterr_UNCONNECTED),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
        .regcea(NLW_U0_regcea_UNCONNECTED),
        .regceb(NLW_U0_regceb_UNCONNECTED),
        .rsta(NLW_U0_rsta_UNCONNECTED),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(NLW_U0_rstb_UNCONNECTED),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(NLW_U0_s_aclk_UNCONNECTED),
        .s_aresetn(NLW_U0_s_aresetn_UNCONNECTED),
        .s_axi_araddr(NLW_U0_s_axi_araddr_UNCONNECTED[31:0]),
        .s_axi_arburst(NLW_U0_s_axi_arburst_UNCONNECTED[1:0]),
        .s_axi_arid(NLW_U0_s_axi_arid_UNCONNECTED[3:0]),
        .s_axi_arlen(NLW_U0_s_axi_arlen_UNCONNECTED[7:0]),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize(NLW_U0_s_axi_arsize_UNCONNECTED[2:0]),
        .s_axi_arvalid(NLW_U0_s_axi_arvalid_UNCONNECTED),
        .s_axi_awaddr(NLW_U0_s_axi_awaddr_UNCONNECTED[31:0]),
        .s_axi_awburst(NLW_U0_s_axi_awburst_UNCONNECTED[1:0]),
        .s_axi_awid(NLW_U0_s_axi_awid_UNCONNECTED[3:0]),
        .s_axi_awlen(NLW_U0_s_axi_awlen_UNCONNECTED[7:0]),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize(NLW_U0_s_axi_awsize_UNCONNECTED[2:0]),
        .s_axi_awvalid(NLW_U0_s_axi_awvalid_UNCONNECTED),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(NLW_U0_s_axi_bready_UNCONNECTED),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(NLW_U0_s_axi_injectdbiterr_UNCONNECTED),
        .s_axi_injectsbiterr(NLW_U0_s_axi_injectsbiterr_UNCONNECTED),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[3:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(NLW_U0_s_axi_rready_UNCONNECTED),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata(NLW_U0_s_axi_wdata_UNCONNECTED[15:0]),
        .s_axi_wlast(NLW_U0_s_axi_wlast_UNCONNECTED),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(NLW_U0_s_axi_wstrb_UNCONNECTED[0]),
        .s_axi_wvalid(NLW_U0_s_axi_wvalid_UNCONNECTED),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(NLW_U0_shutdown_UNCONNECTED),
        .sleep(NLW_U0_sleep_UNCONNECTED),
        .wea(wea),
        .web(NLW_U0_web_UNCONNECTED[0]));
endmodule

(* ECO_CHECKSUM = "6afa7c19" *) (* POWER_OPT_BRAM_CDC = "0" *) (* POWER_OPT_BRAM_SR_ADDR = "2" *) 
(* POWER_OPT_LOOPED_NET_PERCENTAGE = "0" *) 
(* NotValidForBitStream *)
module memory_top
   (clk,
    rst,
    button,
    led);
  input clk;
  input rst;
  input button;
  output [15:0]led;

  wire [3:0]addr;
  wire button;
  wire button_IBUF;
  wire clk;
  wire clk_20mhz;
  wire clk_IBUF;
  wire clk_fnl;
  wire [15:0]data_in;
  wire [15:0]data_out;
  wire ena;
  wire flag;
  wire [15:0]led;
  wire [15:0]led_OBUF;
  wire locked;
  wire rst;
  wire rst_IBUF;
  wire u_memory_w_r_n_12;
  wire u_memory_w_r_n_16;
  wire u_memory_w_r_n_18;
  wire u_memory_w_r_n_3;
  wire u_memory_w_r_n_5;
  wire wea;

initial begin
 $sdf_annotate("testbench_time_impl.sdf",,,,"tool_control");
end
  IBUF button_IBUF_inst
       (.I(button),
        .O(button_IBUF));
  (* OPT_INSERTED *) 
  (* OPT_MODIFIED = "MLO " *) 
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  FDCE #(
    .INIT(1'b0)) 
    flag_reg
       (.C(clk_fnl),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(u_memory_w_r_n_3),
        .Q(flag));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  OBUF \led_OBUF[10]_inst 
       (.I(led_OBUF[10]),
        .O(led[10]));
  OBUF \led_OBUF[11]_inst 
       (.I(led_OBUF[11]),
        .O(led[11]));
  OBUF \led_OBUF[12]_inst 
       (.I(led_OBUF[12]),
        .O(led[12]));
  OBUF \led_OBUF[13]_inst 
       (.I(led_OBUF[13]),
        .O(led[13]));
  OBUF \led_OBUF[14]_inst 
       (.I(led_OBUF[14]),
        .O(led[14]));
  OBUF \led_OBUF[15]_inst 
       (.I(led_OBUF[15]),
        .O(led[15]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
  OBUF \led_OBUF[2]_inst 
       (.I(led_OBUF[2]),
        .O(led[2]));
  OBUF \led_OBUF[3]_inst 
       (.I(led_OBUF[3]),
        .O(led[3]));
  OBUF \led_OBUF[4]_inst 
       (.I(led_OBUF[4]),
        .O(led[4]));
  OBUF \led_OBUF[5]_inst 
       (.I(led_OBUF[5]),
        .O(led[5]));
  OBUF \led_OBUF[6]_inst 
       (.I(led_OBUF[6]),
        .O(led[6]));
  OBUF \led_OBUF[7]_inst 
       (.I(led_OBUF[7]),
        .O(led[7]));
  OBUF \led_OBUF[8]_inst 
       (.I(led_OBUF[8]),
        .O(led[8]));
  OBUF \led_OBUF[9]_inst 
       (.I(led_OBUF[9]),
        .O(led[9]));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  clk_div u_clk_div
       (.clk_in1(clk_IBUF),
        .clk_out1(clk_20mhz),
        .locked(locked),
        .reset(rst_IBUF));
  (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
  led_mem u_led_mem
       (.addra(addr),
        .clka(clk_fnl),
        .dina({data_in[15],u_memory_w_r_n_5,data_in[13:8],u_memory_w_r_n_12,data_in[6:4],u_memory_w_r_n_16,data_in[2],u_memory_w_r_n_18,data_in[0]}),
        .douta(data_out),
        .ena(ena),
        .wea(wea));
  memory_w_r u_memory_w_r
       (.CLK(clk_20mhz),
        .Q(addr),
        .button_IBUF(button_IBUF),
        .clk(clk_IBUF),
        .clk_0(clk_fnl),
        .dina({data_in[15],u_memory_w_r_n_5,data_in[13:8],u_memory_w_r_n_12,data_in[6:4],u_memory_w_r_n_16,data_in[2],u_memory_w_r_n_18,data_in[0]}),
        .douta(data_out),
        .ena(ena),
        .ena_reg_0(u_memory_w_r_n_3),
        .flag(flag),
        .led_OBUF(led_OBUF),
        .locked(locked),
        .rst_IBUF(rst_IBUF),
        .wea(wea));
endmodule

module memory_w_r
   (wea,
    ena,
    clk_0,
    ena_reg_0,
    dina,
    Q,
    led_OBUF,
    clk,
    rst_IBUF,
    CLK,
    locked,
    button_IBUF,
    douta,
    flag);
  output [0:0]wea;
  output ena;
  output clk_0;
  output ena_reg_0;
  output [15:0]dina;
  output [3:0]Q;
  output [15:0]led_OBUF;
  input clk;
  input rst_IBUF;
  input CLK;
  input locked;
  input button_IBUF;
  input [15:0]douta;
  input flag;

  wire CLK;
  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_2_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire [3:0]Q;
  wire \addr[3]_i_2_n_0 ;
  wire button_IBUF;
  wire clk;
  wire clk_0;
  wire clk_1s_i_1_n_0;
  wire clk_1s_reg_n_0;
  wire [26:0]cnt_1s;
  wire \cnt_1s[26]_i_10_n_0 ;
  wire \cnt_1s[26]_i_1_n_0 ;
  wire \cnt_1s[26]_i_3_n_0 ;
  wire \cnt_1s[26]_i_4_n_0 ;
  wire \cnt_1s[26]_i_5_n_0 ;
  wire \cnt_1s[26]_i_7_n_0 ;
  wire \cnt_1s[26]_i_8_n_0 ;
  wire \cnt_1s[26]_i_9_n_0 ;
  wire [26:0]cnt_1s_1;
  wire \cnt_1s_reg[12]_i_2_n_0 ;
  wire \cnt_1s_reg[16]_i_2_n_0 ;
  wire \cnt_1s_reg[20]_i_2_n_0 ;
  wire \cnt_1s_reg[24]_i_2_n_0 ;
  wire \cnt_1s_reg[4]_i_2_n_0 ;
  wire \cnt_1s_reg[8]_i_2_n_0 ;
  wire [26:1]data0;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire ena_reg_0;
  wire flag;
  wire flag_i_1__0_n_0;
  wire flag_reg_n_0;
  wire [15:0]led_OBUF;
  wire locked;
  wire [3:0]p_0_in;
  wire p_0_in_0;
  wire rst_IBUF;
  wire [1:0]state;
  wire [0:0]wea;
  wire [2:0]\NLW_cnt_1s_reg[12]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_1s_reg[16]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_1s_reg[20]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_1s_reg[24]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_cnt_1s_reg[26]_i_6_CO_UNCONNECTED ;
  wire [3:2]\NLW_cnt_1s_reg[26]_i_6_O_UNCONNECTED ;
  wire [2:0]\NLW_cnt_1s_reg[4]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_1s_reg[8]_i_2_CO_UNCONNECTED ;

  LUT3 #(
    .INIT(8'h4F)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(button_IBUF),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(locked),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCC500000)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(\FSM_onehot_state[2]_i_2_n_0 ),
        .I1(button_IBUF),
        .I2(state[0]),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(locked),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00AC0000)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(\FSM_onehot_state[2]_i_2_n_0 ),
        .I1(state[1]),
        .I2(state[0]),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(locked),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[0]),
        .O(\FSM_onehot_state[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "STATE_INIT:001,STATE_WRITE:010,STATE_READ:100" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "STATE_INIT:001,STATE_WRITE:010,STATE_READ:100" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "STATE_INIT:001,STATE_WRITE:010,STATE_READ:100" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(state[1]));
  LUT5 #(
    .INIT(32'h44440EE0)) 
    \addr[0]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(Q[0]),
        .I3(flag_reg_n_0),
        .I4(\FSM_onehot_state[2]_i_2_n_0 ),
        .O(p_0_in[0]));
  LUT6 #(
    .INIT(64'h444444440EEEE000)) 
    \addr[1]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(Q[0]),
        .I3(flag_reg_n_0),
        .I4(Q[1]),
        .I5(\FSM_onehot_state[2]_i_2_n_0 ),
        .O(p_0_in[1]));
  LUT6 #(
    .INIT(64'hA888888828888888)) 
    \addr[2]_i_1 
       (.I0(\addr[3]_i_2_n_0 ),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(flag_reg_n_0),
        .I5(Q[3]),
        .O(p_0_in[2]));
  LUT6 #(
    .INIT(64'hAAAAAAAA80000000)) 
    \addr[3]_i_1 
       (.I0(\addr[3]_i_2_n_0 ),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(flag_reg_n_0),
        .I5(Q[3]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'h7FFF7FFFFFFF0000)) 
    \addr[3]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(state[1]),
        .I5(state[0]),
        .O(\addr[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \addr_reg[0] 
       (.C(clk_0),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(p_0_in[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \addr_reg[1] 
       (.C(clk_0),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(p_0_in[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \addr_reg[2] 
       (.C(clk_0),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(p_0_in[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \addr_reg[3] 
       (.C(clk_0),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(p_0_in[3]),
        .Q(Q[3]));
  LUT4 #(
    .INIT(16'hFE01)) 
    clk_1s_i_1
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(clk_1s_reg_n_0),
        .O(clk_1s_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    clk_1s_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(\cnt_1s[26]_i_1_n_0 ),
        .D(clk_1s_i_1_n_0),
        .Q(clk_1s_reg_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_1s[0]_i_1 
       (.I0(cnt_1s[0]),
        .O(cnt_1s_1[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[10]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[10]),
        .O(cnt_1s_1[10]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[11]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[11]),
        .O(cnt_1s_1[11]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[12]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[12]),
        .O(cnt_1s_1[12]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[13]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[13]),
        .O(cnt_1s_1[13]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[14]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[14]),
        .O(cnt_1s_1[14]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[15]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[15]),
        .O(cnt_1s_1[15]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[16]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[16]),
        .O(cnt_1s_1[16]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[17]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[17]),
        .O(cnt_1s_1[17]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[18]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[18]),
        .O(cnt_1s_1[18]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[19]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[19]),
        .O(cnt_1s_1[19]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[1]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[1]),
        .O(cnt_1s_1[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[20]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[20]),
        .O(cnt_1s_1[20]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[21]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[21]),
        .O(cnt_1s_1[21]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[22]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[22]),
        .O(cnt_1s_1[22]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[23]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[23]),
        .O(cnt_1s_1[23]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[24]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[24]),
        .O(cnt_1s_1[24]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[25]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[25]),
        .O(cnt_1s_1[25]));
  LUT4 #(
    .INIT(16'hFF57)) 
    \cnt_1s[26]_i_1 
       (.I0(locked),
        .I1(state[0]),
        .I2(state[1]),
        .I3(rst_IBUF),
        .O(\cnt_1s[26]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1s[26]_i_10 
       (.I0(cnt_1s[18]),
        .I1(cnt_1s[17]),
        .I2(cnt_1s[20]),
        .I3(cnt_1s[19]),
        .O(\cnt_1s[26]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[26]_i_2 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[26]),
        .O(cnt_1s_1[26]));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    \cnt_1s[26]_i_3 
       (.I0(cnt_1s[26]),
        .I1(cnt_1s[25]),
        .I2(cnt_1s[0]),
        .I3(\cnt_1s[26]_i_7_n_0 ),
        .I4(\cnt_1s[26]_i_8_n_0 ),
        .O(\cnt_1s[26]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cnt_1s[26]_i_4 
       (.I0(cnt_1s[7]),
        .I1(cnt_1s[8]),
        .I2(cnt_1s[5]),
        .I3(cnt_1s[6]),
        .I4(\cnt_1s[26]_i_9_n_0 ),
        .O(\cnt_1s[26]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cnt_1s[26]_i_5 
       (.I0(cnt_1s[15]),
        .I1(cnt_1s[16]),
        .I2(cnt_1s[13]),
        .I3(cnt_1s[14]),
        .I4(\cnt_1s[26]_i_10_n_0 ),
        .O(\cnt_1s[26]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1s[26]_i_7 
       (.I0(cnt_1s[22]),
        .I1(cnt_1s[21]),
        .I2(cnt_1s[24]),
        .I3(cnt_1s[23]),
        .O(\cnt_1s[26]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \cnt_1s[26]_i_8 
       (.I0(cnt_1s[2]),
        .I1(cnt_1s[1]),
        .I2(cnt_1s[4]),
        .I3(cnt_1s[3]),
        .O(\cnt_1s[26]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_1s[26]_i_9 
       (.I0(cnt_1s[10]),
        .I1(cnt_1s[9]),
        .I2(cnt_1s[12]),
        .I3(cnt_1s[11]),
        .O(\cnt_1s[26]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[2]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[2]),
        .O(cnt_1s_1[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[3]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[3]),
        .O(cnt_1s_1[3]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[4]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[4]),
        .O(cnt_1s_1[4]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[5]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[5]),
        .O(cnt_1s_1[5]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[6]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[6]),
        .O(cnt_1s_1[6]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[7]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[7]),
        .O(cnt_1s_1[7]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[8]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[8]),
        .O(cnt_1s_1[8]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \cnt_1s[9]_i_1 
       (.I0(\cnt_1s[26]_i_3_n_0 ),
        .I1(\cnt_1s[26]_i_4_n_0 ),
        .I2(\cnt_1s[26]_i_5_n_0 ),
        .I3(data0[9]),
        .O(cnt_1s_1[9]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[0] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[0]),
        .Q(cnt_1s[0]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[10] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[10]),
        .Q(cnt_1s[10]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[11] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[11]),
        .Q(cnt_1s[11]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[12] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[12]),
        .Q(cnt_1s[12]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \cnt_1s_reg[12]_i_2 
       (.CI(\cnt_1s_reg[8]_i_2_n_0 ),
        .CO({\cnt_1s_reg[12]_i_2_n_0 ,\NLW_cnt_1s_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(cnt_1s[12:9]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[13] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[13]),
        .Q(cnt_1s[13]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[14] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[14]),
        .Q(cnt_1s[14]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[15] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[15]),
        .Q(cnt_1s[15]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[16] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[16]),
        .Q(cnt_1s[16]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \cnt_1s_reg[16]_i_2 
       (.CI(\cnt_1s_reg[12]_i_2_n_0 ),
        .CO({\cnt_1s_reg[16]_i_2_n_0 ,\NLW_cnt_1s_reg[16]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(cnt_1s[16:13]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[17] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[17]),
        .Q(cnt_1s[17]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[18] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[18]),
        .Q(cnt_1s[18]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[19] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[19]),
        .Q(cnt_1s[19]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[1] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[1]),
        .Q(cnt_1s[1]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[20] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[20]),
        .Q(cnt_1s[20]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \cnt_1s_reg[20]_i_2 
       (.CI(\cnt_1s_reg[16]_i_2_n_0 ),
        .CO({\cnt_1s_reg[20]_i_2_n_0 ,\NLW_cnt_1s_reg[20]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(cnt_1s[20:17]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[21] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[21]),
        .Q(cnt_1s[21]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[22] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[22]),
        .Q(cnt_1s[22]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[23] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[23]),
        .Q(cnt_1s[23]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[24] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[24]),
        .Q(cnt_1s[24]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \cnt_1s_reg[24]_i_2 
       (.CI(\cnt_1s_reg[20]_i_2_n_0 ),
        .CO({\cnt_1s_reg[24]_i_2_n_0 ,\NLW_cnt_1s_reg[24]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(cnt_1s[24:21]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[25] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[25]),
        .Q(cnt_1s[25]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[26] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[26]),
        .Q(cnt_1s[26]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \cnt_1s_reg[26]_i_6 
       (.CI(\cnt_1s_reg[24]_i_2_n_0 ),
        .CO(\NLW_cnt_1s_reg[26]_i_6_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_1s_reg[26]_i_6_O_UNCONNECTED [3:2],data0[26:25]}),
        .S({1'b0,1'b0,cnt_1s[26:25]}));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[2] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[2]),
        .Q(cnt_1s[2]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[3] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[3]),
        .Q(cnt_1s[3]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[4] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[4]),
        .Q(cnt_1s[4]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \cnt_1s_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\cnt_1s_reg[4]_i_2_n_0 ,\NLW_cnt_1s_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(cnt_1s[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(cnt_1s[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[5] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[5]),
        .Q(cnt_1s[5]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[6] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[6]),
        .Q(cnt_1s[6]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[7] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[7]),
        .Q(cnt_1s[7]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[8] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[8]),
        .Q(cnt_1s[8]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \cnt_1s_reg[8]_i_2 
       (.CI(\cnt_1s_reg[4]_i_2_n_0 ),
        .CO({\cnt_1s_reg[8]_i_2_n_0 ,\NLW_cnt_1s_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(cnt_1s[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[9] 
       (.C(CLK),
        .CE(state[1]),
        .D(cnt_1s_1[9]),
        .Q(cnt_1s[9]),
        .R(\cnt_1s[26]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    ena_i_1
       (.I0(state[1]),
        .I1(state[0]),
        .O(p_0_in_0));
  FDCE #(
    .INIT(1'b0)) 
    ena_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(p_0_in_0),
        .Q(ena));
  LUT2 #(
    .INIT(4'h6)) 
    flag_i_1
       (.I0(ena),
        .I1(wea),
        .O(ena_reg_0));
  LUT5 #(
    .INIT(32'hFFFF1110)) 
    flag_i_1__0
       (.I0(\FSM_onehot_state[2]_i_2_n_0 ),
        .I1(rst_IBUF),
        .I2(state[1]),
        .I3(state[0]),
        .I4(flag_reg_n_0),
        .O(flag_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    flag_reg
       (.C(clk_0),
        .CE(1'b1),
        .D(flag_i_1__0_n_0),
        .Q(flag_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[0]_inst_i_1 
       (.I0(douta[0]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[0]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[10]_inst_i_1 
       (.I0(douta[10]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[10]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[11]_inst_i_1 
       (.I0(douta[11]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[11]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[12]_inst_i_1 
       (.I0(douta[12]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[12]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[13]_inst_i_1 
       (.I0(douta[13]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[13]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[14]_inst_i_1 
       (.I0(douta[14]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[14]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[15]_inst_i_1 
       (.I0(douta[15]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[15]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[1]_inst_i_1 
       (.I0(douta[1]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[1]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[2]_inst_i_1 
       (.I0(douta[2]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[2]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[3]_inst_i_1 
       (.I0(douta[3]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[3]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[4]_inst_i_1 
       (.I0(douta[4]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[4]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[5]_inst_i_1 
       (.I0(douta[5]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[5]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[6]_inst_i_1 
       (.I0(douta[6]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[6]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[7]_inst_i_1 
       (.I0(douta[7]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[7]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[8]_inst_i_1 
       (.I0(douta[8]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[8]));
  LUT4 #(
    .INIT(16'h0800)) 
    \led_OBUF[9]_inst_i_1 
       (.I0(douta[9]),
        .I1(flag),
        .I2(state[0]),
        .I3(state[1]),
        .O(led_OBUF[9]));
  LUT3 #(
    .INIT(8'hB8)) 
    u_led_mem_i_1
       (.I0(clk),
        .I1(state[0]),
        .I2(clk_1s_reg_n_0),
        .O(clk_0));
  LUT6 #(
    .INIT(64'h2222222220000000)) 
    u_led_mem_i_10
       (.I0(state[0]),
        .I1(rst_IBUF),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(dina[7]));
  LUT5 #(
    .INIT(32'h00F80000)) 
    u_led_mem_i_11
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(rst_IBUF),
        .I4(state[0]),
        .O(dina[6]));
  LUT6 #(
    .INIT(64'h3020302030203000)) 
    u_led_mem_i_12
       (.I0(Q[2]),
        .I1(rst_IBUF),
        .I2(state[0]),
        .I3(Q[3]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(dina[5]));
  LUT4 #(
    .INIT(16'h2220)) 
    u_led_mem_i_13
       (.I0(state[0]),
        .I1(rst_IBUF),
        .I2(Q[3]),
        .I3(Q[2]),
        .O(dina[4]));
  LUT6 #(
    .INIT(64'h2222222022202220)) 
    u_led_mem_i_14
       (.I0(state[0]),
        .I1(rst_IBUF),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(dina[3]));
  LUT5 #(
    .INIT(32'h00FE0000)) 
    u_led_mem_i_15
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(rst_IBUF),
        .I4(state[0]),
        .O(dina[2]));
  LUT6 #(
    .INIT(64'h2222222222222220)) 
    u_led_mem_i_16
       (.I0(state[0]),
        .I1(rst_IBUF),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(dina[1]));
  LUT2 #(
    .INIT(4'h2)) 
    u_led_mem_i_17
       (.I0(state[0]),
        .I1(rst_IBUF),
        .O(dina[0]));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    u_led_mem_i_2
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(state[0]),
        .I5(rst_IBUF),
        .O(dina[15]));
  LUT5 #(
    .INIT(32'h40000000)) 
    u_led_mem_i_3
       (.I0(rst_IBUF),
        .I1(state[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(dina[14]));
  LUT6 #(
    .INIT(64'h0000A80000000000)) 
    u_led_mem_i_4
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(state[0]),
        .I4(rst_IBUF),
        .I5(Q[3]),
        .O(dina[13]));
  LUT4 #(
    .INIT(16'h0800)) 
    u_led_mem_i_5
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(rst_IBUF),
        .I3(state[0]),
        .O(dina[12]));
  LUT6 #(
    .INIT(64'h0000F80000000000)) 
    u_led_mem_i_6
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(rst_IBUF),
        .I5(state[0]),
        .O(dina[11]));
  LUT5 #(
    .INIT(32'h20202000)) 
    u_led_mem_i_7
       (.I0(Q[3]),
        .I1(rst_IBUF),
        .I2(state[0]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(dina[10]));
  LUT6 #(
    .INIT(64'h0000FE0000000000)) 
    u_led_mem_i_8
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(state[0]),
        .I4(rst_IBUF),
        .I5(Q[3]),
        .O(dina[9]));
  LUT3 #(
    .INIT(8'h20)) 
    u_led_mem_i_9
       (.I0(Q[3]),
        .I1(rst_IBUF),
        .I2(state[0]),
        .O(dina[8]));
  FDCE #(
    .INIT(1'b0)) 
    wea_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(state[0]),
        .Q(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module led_mem_blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [15:0]douta;
  input clka;
  input ena;
  input [3:0]addra;
  input [15:0]dina;
  input [0:0]wea;

  wire [3:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;

  led_mem_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module led_mem_blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [15:0]douta;
  input clka;
  input ena;
  input [3:0]addra;
  input [15:0]dina;
  input [0:0]wea;

  wire [3:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;

  led_mem_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module led_mem_blk_mem_gen_prim_wrapper
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [15:0]douta;
  input clka;
  input ena;
  input [3:0]addra;
  input [15:0]dina;
  input [0:0]wea;

  wire [3:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;
  wire [15:4]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:4]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,addra,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,addra,1'b1,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,dina[7:4],1'b0,1'b0,1'b0,1'b0,dina[3:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,dina[15:12],1'b0,1'b0,1'b0,1'b0,dina[11:8]}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOADO_UNCONNECTED [15:12],douta[7:4],\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOADO_UNCONNECTED [7:4],douta[3:0]}),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOBDO_UNCONNECTED [15:12],douta[15:12],\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOBDO_UNCONNECTED [7:4],douta[11:8]}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(ena),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,wea,wea}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module led_mem_blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [15:0]douta;
  input clka;
  input ena;
  input [3:0]addra;
  input [15:0]dina;
  input [0:0]wea;

  wire [3:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;

  led_mem_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* C_ADDRA_WIDTH = "4" *) (* C_ADDRB_WIDTH = "4" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.87285 mW" *) 
(* C_FAMILY = "artix7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "led_mem.mem" *) 
(* C_INIT_FILE_NAME = "no_coe_file_loaded" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "0" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "16" *) (* C_READ_DEPTH_B = "16" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "16" *) (* C_READ_WIDTH_B = "16" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "16" *) 
(* C_WRITE_DEPTH_B = "16" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "16" *) (* C_WRITE_WIDTH_B = "16" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
module led_mem_blk_mem_gen_v8_4_2
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [3:0]addra;
  input [15:0]dina;
  output [15:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [3:0]addrb;
  input [15:0]dinb;
  output [15:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [3:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [15:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [15:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [3:0]s_axi_rdaddrecc;

  wire [3:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;

  led_mem_blk_mem_gen_v8_4_2_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module led_mem_blk_mem_gen_v8_4_2_synth
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [15:0]douta;
  input clka;
  input ena;
  input [3:0]addra;
  input [15:0]dina;
  input [0:0]wea;

  wire [3:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;

  led_mem_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
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
