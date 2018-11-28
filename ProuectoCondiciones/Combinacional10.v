`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:27 10/22/2018 
// Design Name: 
// Module Name:    Combinacional10 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Combinacional10(
    input [3:0]Q,
    input sw,
    output [3:0]Qnext
    );

	assign Qnext = (sw==0)? Q:
						(sw==1 && Q!=9)? Q+1:0;
	
						
endmodule
