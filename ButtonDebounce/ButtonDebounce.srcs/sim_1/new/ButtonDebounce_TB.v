`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 04:33:49 PM
// Design Name: 
// Module Name: ButtonDebounce_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ButtonDebounce_TB();

	//input declarations
	reg iClk;
	reg iButton;

	//output declaration
	wire oLED;
	
	//DUT instantiation
	ButtonDebounce DUT(
		.iClk(iClk),
		.iButton(iButton),
		.oLED(oLED)
		);
	initial begin
		//clock generation
		iClk = 1'b0;
		forever #2 iClk = ~iClk;
	end
	
	initial begin
	//initialization
	iButton = 1'b0;
	end
	
	initial begin
		//variation (fixed values/loops)
		#6 iButton = 1'b1;
		#1 iButton = 1'b0;
		#3 iButton = 1'b1;
		#10 iButton = 1'b0;
	end
	
	initial begin
	
		$monitor(" ",);
		$finish;
	end
	

endmodule


