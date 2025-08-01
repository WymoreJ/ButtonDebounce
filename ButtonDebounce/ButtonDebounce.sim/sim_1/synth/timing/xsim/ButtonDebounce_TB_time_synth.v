// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Jul 31 19:51:29 2025
// Host        : DESKTOP-I3S8TM1 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {E:/Verilog
//               Practice/Project_4/ButtonDebounce/ButtonDebounce.sim/sim_1/synth/timing/xsim/ButtonDebounce_TB_time_synth.v}
// Design      : ButtonDebounce
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* DEBOUNCE_LIMIT = "20" *) 
(* NotValidForBitStream *)
module ButtonDebounce
   (iClk,
    iButton,
    oLED);
  input iClk;
  input iButton;
  output oLED;

  wire iButton;
  wire iButton_IBUF;
  wire iClk;
  wire iClk_IBUF;
  wire iClk_IBUF_BUFG;
  wire oLED;
  wire oLED_OBUF;

initial begin
 $sdf_annotate("ButtonDebounce_TB_time_synth.sdf",,,,"tool_control");
end
  LED_Button LED_Button_Inst
       (.iButton(iButton_IBUF),
        .iClk_IBUF_BUFG(iClk_IBUF_BUFG),
        .oLED_OBUF(oLED_OBUF));
  IBUF iButton_IBUF_inst
       (.I(iButton),
        .O(iButton_IBUF));
  BUFG iClk_IBUF_BUFG_inst
       (.I(iClk_IBUF),
        .O(iClk_IBUF_BUFG));
  IBUF iClk_IBUF_inst
       (.I(iClk),
        .O(iClk_IBUF));
  OBUF oLED_OBUF_inst
       (.I(oLED_OBUF),
        .O(oLED));
endmodule

module LED_Button
   (oLED_OBUF,
    iButton,
    iClk_IBUF_BUFG);
  output oLED_OBUF;
  input iButton;
  input iClk_IBUF_BUFG;

  wire iButton;
  wire iClk_IBUF_BUFG;
  wire oLED_OBUF;
  wire rButton;
  wire rLED_i_1_n_0;

  FDRE #(
    .INIT(1'b0)) 
    rButton_reg
       (.C(iClk_IBUF_BUFG),
        .CE(1'b1),
        .D(iButton),
        .Q(rButton),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB4)) 
    rLED_i_1
       (.I0(iButton),
        .I1(rButton),
        .I2(oLED_OBUF),
        .O(rLED_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rLED_reg
       (.C(iClk_IBUF_BUFG),
        .CE(1'b1),
        .D(rLED_i_1_n_0),
        .Q(oLED_OBUF),
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
