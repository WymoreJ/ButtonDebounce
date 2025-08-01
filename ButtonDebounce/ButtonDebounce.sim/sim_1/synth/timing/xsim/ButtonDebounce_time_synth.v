// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Sat Jul 26 17:09:37 2025
// Host        : DESKTOP-I3S8TM1 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {E:/Verilog
//               Practice/Project_4/ButtonDebounce/ButtonDebounce.sim/sim_1/synth/timing/xsim/ButtonDebounce_time_synth.v}
// Design      : ButtonDebounce
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* DEBOUNCE_LIMIT = "28" *) 
(* NotValidForBitStream *)
module ButtonDebounce
   (i_clk,
    i_Button,
    o_LED);
  input i_clk;
  input i_Button;
  output o_LED;

  wire DebouncedButton;
  wire i_Button;
  wire i_Button_IBUF;
  wire i_clk;
  wire i_clk_IBUF;
  wire i_clk_IBUF_BUFG;
  wire o_LED;
  wire o_LED_OBUF;

initial begin
 $sdf_annotate("ButtonDebounce_time_synth.sdf",,,,"tool_control");
end
  Debouncer Debounce_Inst
       (.DebouncedButton(DebouncedButton),
        .i_Button_IBUF(i_Button_IBUF),
        .i_clk_IBUF_BUFG(i_clk_IBUF_BUFG));
  LED_Button LED_Button_Inst
       (.DebouncedButton(DebouncedButton),
        .i_clk_IBUF_BUFG(i_clk_IBUF_BUFG),
        .o_LED_OBUF(o_LED_OBUF));
  IBUF i_Button_IBUF_inst
       (.I(i_Button),
        .O(i_Button_IBUF));
  BUFG i_clk_IBUF_BUFG_inst
       (.I(i_clk_IBUF),
        .O(i_clk_IBUF_BUFG));
  IBUF i_clk_IBUF_inst
       (.I(i_clk),
        .O(i_clk_IBUF));
  OBUF o_LED_OBUF_inst
       (.I(o_LED_OBUF),
        .O(o_LED));
endmodule

module Debouncer
   (DebouncedButton,
    i_Button_IBUF,
    i_clk_IBUF_BUFG);
  output DebouncedButton;
  input i_Button_IBUF;
  input i_clk_IBUF_BUFG;

  wire DebouncedButton;
  wire i_Button_IBUF;
  wire i_clk_IBUF_BUFG;
  wire [4:0]p_0_in;
  wire p_0_in_0;
  wire \r_Count[2]_i_1_n_0 ;
  wire [4:0]r_Count_reg;
  wire r_State1_out;
  wire r_State_i_2_n_0;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \r_Count[0]_i_1 
       (.I0(r_Count_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \r_Count[1]_i_1 
       (.I0(r_Count_reg[0]),
        .I1(r_Count_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_Count[2]_i_1 
       (.I0(r_Count_reg[0]),
        .I1(r_Count_reg[1]),
        .I2(r_Count_reg[2]),
        .O(\r_Count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_Count[3]_i_1 
       (.I0(r_Count_reg[1]),
        .I1(r_Count_reg[0]),
        .I2(r_Count_reg[2]),
        .I3(r_Count_reg[3]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hFF9F999999999999)) 
    \r_Count[4]_i_1 
       (.I0(i_Button_IBUF),
        .I1(DebouncedButton),
        .I2(r_State_i_2_n_0),
        .I3(r_Count_reg[2]),
        .I4(r_Count_reg[3]),
        .I5(r_Count_reg[4]),
        .O(p_0_in_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \r_Count[4]_i_2 
       (.I0(r_Count_reg[2]),
        .I1(r_Count_reg[0]),
        .I2(r_Count_reg[1]),
        .I3(r_Count_reg[3]),
        .I4(r_Count_reg[4]),
        .O(p_0_in[4]));
  FDRE #(
    .INIT(1'b0)) 
    \r_Count_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(r_Count_reg[0]),
        .R(p_0_in_0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Count_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(r_Count_reg[1]),
        .R(p_0_in_0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Count_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Count[2]_i_1_n_0 ),
        .Q(r_Count_reg[2]),
        .R(p_0_in_0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Count_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(r_Count_reg[3]),
        .R(p_0_in_0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Count_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(r_Count_reg[4]),
        .R(p_0_in_0));
  LUT4 #(
    .INIT(16'h0008)) 
    r_State_i_1
       (.I0(r_Count_reg[4]),
        .I1(r_Count_reg[3]),
        .I2(r_State_i_2_n_0),
        .I3(r_Count_reg[2]),
        .O(r_State1_out));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    r_State_i_2
       (.I0(r_Count_reg[1]),
        .I1(r_Count_reg[0]),
        .O(r_State_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    r_State_reg
       (.C(i_clk_IBUF_BUFG),
        .CE(r_State1_out),
        .D(i_Button_IBUF),
        .Q(DebouncedButton),
        .R(1'b0));
endmodule

module LED_Button
   (o_LED_OBUF,
    DebouncedButton,
    i_clk_IBUF_BUFG);
  output o_LED_OBUF;
  input DebouncedButton;
  input i_clk_IBUF_BUFG;

  wire DebouncedButton;
  wire i_clk_IBUF_BUFG;
  wire o_LED_OBUF;
  wire r_LED_i_1_n_0;
  wire r_button;

  LUT3 #(
    .INIT(8'hB4)) 
    r_LED_i_1
       (.I0(DebouncedButton),
        .I1(r_button),
        .I2(o_LED_OBUF),
        .O(r_LED_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    r_LED_reg
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(r_LED_i_1_n_0),
        .Q(o_LED_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    r_button_reg
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DebouncedButton),
        .Q(r_button),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
