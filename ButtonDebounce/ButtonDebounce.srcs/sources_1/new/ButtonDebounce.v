`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Justin Wymore
// 
// Create Date: 07/26/2025 02:50:08 PM
// Design Name: Button Debounce
// Module Name: ButtonDebounce
// Project Name: 
// Target Devices: Zybo Z7-10
// Tool Versions: Vivado 2025.1
// Description: Implementing a debouncing function on a physical button
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Modified from "Getting Started with FPGA's" by Russell Merrick
// 
//////////////////////////////////////////////////////////////////////////////////

module ButtonDebounce(
    input 	iClk,		//clock
    input 	iButton,	//button to be debounced
    output 	oLED		//LED to be lit
    );
    
    parameter DEBOUNCE_LIMIT = 10;	//number of clock cycles to debounce the signal
	wire DebouncedButton;			//the conditioned signal after being debounced
	
	Debouncer #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_Inst
		(.iClk(i_clk),						//pass in the clock signal
		 .iBounce(i_Button),				//pass in the unconditioned signal
		 .oDebounced(DebouncedButton));	//return the conditioned signal
		 
	LED_Button LED_Button_Inst(
		.iClk(iClk),						//pass in the clock signal
		.iButton(iButton),			//pass in the debounced signal
		.oLED(oLED));						//return the LED assignment

endmodule

