`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 03:19:10 PM
// Design Name: Button Debounce
// Module Name: LED_Button
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Modified from "Getting Started with FPGA's" by Russell Merrick
// 
//////////////////////////////////////////////////////////////////////////////////


module LED_Button(
    input 	iClk,		//clock
    input 	iButton,	//button signal
    output 	oLED		//LED assignement
    );
    
    reg rLED = 1'b0;		//LED data
    reg rButton = 1'b0;	//button data
    
    always @(posedge iClk)
    begin
    	rButton <= iButton;	//take signal input and store as data
    
    	if(iButton == 0 && rButton == 1)	//if the input of the button is 0 and the button's register is 1
    		rLED <= ~rLED;				//invert the LED register
    end
    
    assign oLED = rLED;    				//assign the LED register to the LED output

endmodule
