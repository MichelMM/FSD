`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:57 11/27/2018 
// Design Name: 
// Module Name:    Bisiesto 
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
module Bisiesto(
		input [15:0] year,
		input clk,
		output reg [1:0] bst
		
    );
	 
	reg [13:0] bisiesto;
	
	always @ (posedge clk)
		begin 
			bisiesto <= year[15:12]*1000 + year[11:8]*100 + year[7:4]*10 + year[3:0];
			
			bst <= bisiesto [1:0];
		end

endmodule
