`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 03:31:22 PM
// Design Name: Button Debounce
// Module Name: Debouncer
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


module Debouncer #(parameter DEBOUNCE_LIMIT = 10)(
    input 	iClk,			//clock
    input 	iBounce,		//input signal to be conditioned
    output  oDebounced		//conditioned signal
    );
    
    reg [DEBOUNCE_LIMIT:0] rCount = 0;		//size and initialize the register
    reg rState = 0;						//initialize the register
    
    always @(posedge iClk)
    begin
    	if (iBounce !== rState && rCount < DEBOUNCE_LIMIT-1)		//if the signals has not been debounced
    		rCount <= rCount + 1;									//increment the counter
    	else if (rCount == DEBOUNCE_LIMIT-1)						//if the signal has been stable long enough
    	begin
    		rState <= iBounce;									//set the state register to the value of the input signal
    		rCount <= 0;											//reset the counter
    	end
    	else rCount <= 0;											//preventing a latch
    end
    
    assign oDebounced = rState;									//return the conditioned signal
    
endmodule
