// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Nov 25 19:14:46 2021
// Host        : LAPTOP-GOHVDH8E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/JerryYang/Documents/GitHub/ComputerSystem/LogicDesign/Experiment/Exp2/holiday_lights/holiday_lights.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module mult_gen_0
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
  mult_gen_0_mult_gen_v12_0_14 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_14
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
  mult_gen_0_mult_gen_v12_0_14_viv i_mult
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
J9sSFwNsGyG6ZuLfL9EwjN2LaJfHnzWNMKppUUBfEU47ngirly6cmF6RIfEjL4NVIwQ0uSRkgZUq
ULEWBBV0A7ghuBG6liYkT4L41i8hgUayvrMgRKxnSUHhj3RQrKOJ4zM/luC1PI6WcOYsCfK59mGc
2CcpTJW4PxwQBrkeONxBJ8Pi0l6hWEQBvlWb5Qh8Ql/FxCHy+vq0EID/TTMiOIlN81PHlzRcX2FX
pThCpxK0GpYoD5XAwti0gZNw7gBX3Oqo1f6RUPvI1fyPGGNJGlIveuDBk0dKgeIxpwRT7NR0xMQM
fMC7ZicwKFCTrbVCxBhwLefks0TOY9NFB8iXJg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uMQklft+sJm+k/FOZUu4fU4cd21HMFFylJeSC4SkXkxGUIS/jfJ9CEgPlnHrjdsba7KyhCbrOjgV
zWrdN08ngooa4+NaMwUH6/18zMBxap0o+o9OnhTgw0KgpDCjVF1Gbp+nZJpZnQmld3+uTUM59hDU
/F9tjD3gGCoB+VP+JNBjaiDGzchspzNw6v0XPuqtvFcgRNv2rYgixR1fFpBFV76OkiIHdDJfpz2B
KI9MAdgbtJxZmnAbbmXfISohibHL17ajrkcfMQ1kdyzk0nd929AjbMBgA/J7eWDYp2zYi7Bly7SE
zxQkdxoDsUzp+zIc4Vz4cKV4ah4mHGzf8DEWjg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19856)
`pragma protect data_block
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
i2AW07KaLg+fN+izwOMoL9ruQTA=
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
