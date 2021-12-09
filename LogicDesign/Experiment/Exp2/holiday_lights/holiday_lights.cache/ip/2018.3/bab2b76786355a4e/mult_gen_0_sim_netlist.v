// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Nov 25 19:14:45 2021
// Host        : LAPTOP-GOHVDH8E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [7:0]P;

  wire [3:0]A;
  wire [3:0]B;
  wire CLK;
  wire [7:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "7" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "7" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [3:0]A;
  input [3:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [7:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]B;
  wire CLK;
  wire [7:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "7" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
g7azmhtm6FcP7uNFjuXJjN8Z6yccOPk3SSjzvKB27peFKmnPmQmov5+YTGwYqqN9LpdyiUExk8K6
vPnJqontvQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MFrqn2K0Cr7TmQ5al162oDGiY83d+AkTWOgFyXPYrTNznygR/tx44RAp24ytphNK9p6shs2EFMg/
Qqz0l8DCWiVEoJ/T8vMpnAn7Y+poGVGS1qAR3qE2njrl81VcGBZJeFaWIudhfr/DLTuuf2T/dWDU
YpelM3KbfYNPPiPy8PU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FZca5XZouG+/BYoQ8qrJTmnJanku4IprIWRkO6VciHehE5WehR0wsZJhfKlqLEeY1oTPA4bXaxmY
NjYkrop4EOwW8t47/hj2kFLI1OKUAE/TAhCGg/aNSOViUbB3dUomG/y+TBuDt9L6g0Arj1vb/5Pt
IChc5ZdEfRr1lJMTpFfP+5qmEH6lePPdzgPZATPB4Zrj0P6EyiEsU1FKBuAKd9iYNGiLCxVomaz0
3/RwK2Nl+/l4mc7PJt5Hso+4s1qHb4s2wD+OgbIwdH26ZkEnKVFpaLiuWQKu9uhDLGnsBMPf7XDE
p29f+mrvP9Zi/3nonA2aBKrTwR7XuH+ZYoakxA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jP68OjlYJglq3zpmKrXOhq7Sex8XNW8fQKp4hUNmuw06OOoKhQASNTnjtyVjAIk/VXb64ViBu1ds
cNMJybDSWBhnChfJq4h9PNybShGJXxSm3NDOo5wUHKf10Eti3fSotB9rVks+tNdTEZo4O97kgfdD
G1FNOqlsYcQiShEGLLiEQ2yYtgJBxJ+jc8mFjIEfPhAYy1ElrvtFEpnhkNS2LfE7xdWOQdO/XoKK
ibeY08pgncTI3pvO6TMbXushf0AX2S7hgfk8ysZrT+0gktqFrJnyR6oljS6VVPLtRNW2vo/cC8XQ
Bzvwwt4cpSo5KLS4XxB6qClZipItck2AUEdIbQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
o7jAZIoXlFbFtDYmtXhfRBlb07dhBb6Wp03mlT4T0FXtvccSHWhWZgc+VUNwt6TohLihOwvSipPP
XVXpGL4pUVYNdQBCVpFzhMkt6jhyUgsF5t10yI5Of6YEfQrDHigceoBukM3+/zJHPprrPQE6FUvC
wXSGhBCXnHJs1R+n4l0714w8/WftPQhlD9QGQp1qT2VARQXUKBRxcRjxe9TcLfs0P4xnN7uHu0R6
JTmV+MHmhGpetSZGx+B2Wa1MQofUPURqwE70IwBoUhdXH8+39DT5I6x2+wMY6RcVATnhNd2BCgPd
RzAhwfrcqRiU9aB+eNNdFR8ve9M2nGMmV2JxZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Cl1Dz+fZIDYEIQuUd0pSg+5jknmtX/JERd+yOZ2SRaVra/4pU/eCTjEXMzhz4VFGYB6dgUxMsGBk
nL2WNdn/uaSPpi6mNF0UHQvZik4pUkYPrnRbFveVqW8i1t95SG0RW96uD19206lWrp5U1lqc4fH7
sfKHi8ZpU3MAg0DOO0E=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Qqp76m2aV9ue8Qai7QUavb+lhRYdu/txrnwYLzwTe0vS0S2OD1vxr8VeIT3bF/ZuXlTGm4S/UCSF
bgOPp7VqEOeGNfsSPK+VpQ+foQMENCQYccwKquBDSg/sLjpPK9uuoGLBLxjw2OwsRzplVFXiPcRN
LYK1/FmCP7RJBNgmhh/ti99a+WSl6i2YIIRGocNplQlG8FXq8ZTTHd/x2Gtdf/zGvJOy/fNsos6S
Oq9yJ0rMmbGeWbri5c04gZM08pUmXBsivgOHm2IVEZZFM4SBqrsi0xa52hs2kelc3iKJcWiTvU3X
0fJP9qNFuIjXBPPZvEYwhVtIh6DwiIC2viSscQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
V27mWbRd1rMIx2iEiDCXE+MgHS5JttyK5doWBTaLZZx9dsdX8mziE3CzaZVJ11t4NtCOY/7t3Hxx
iz8rFESOpojzNKEj20YkJ9//5DVTz1XgXd8QC/QHxlpZuWO/e6J2Vty4FJ0ZD23i1itHoWbFLd1S
Baj6XWmNFM77bvYylQHGGWHZ5x6wmZiep/bZ1z3kKY0Z0CDdKthyO0G1aF4Ku7fZewMTycj3d4YP
PXf/wpC6hzyU7pXgKezaQiqdg7FHEI4KTb9k/irOqhu9gHI9cctNm/7vvZ+kEqbPZ8U+BT1Z4Ug+
gnQNVa/jT33SDhLRtFtlYbqCPUn4VGU16egfXw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wyBPjPLxWK1aKtWKSWMPoqMKKrM4Itjjh8DMdupBKTj1FD7DCIdZu8ftESMRSFgt/Iowp0meF6xT
xyJhZ5FLn/XbvejcWOKSfjzOyC3AXVvuAticiYjUSzGIxZjYKXHdo+LC+dgT7MBAXxTCAlaeMN1j
H8yboEsYpN4Lpm0c82eo9tzOTx7P2qUO80f12vUNL58MeWdEm5CUgehCGY8qefheJS399AVlSxTD
6XFbdXlBV0TlSEUDIS7Bhd26W+qawnTHuh9gYeLMN1Q2i4eryhDeRuVjNyOjnyyFBE/eyUccD95M
NOQJN09Nogmzo4aQbqAb1s953w+xCLo5r3wH5A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19872)
`pragma protect data_block
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
`pragma protect end_protected
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
