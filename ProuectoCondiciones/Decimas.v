`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:37 11/23/2018 
// Design Name: 
// Module Name:    Decimas 
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
module Decimas(
	input clk,
	input add,
	input stay,
	input rst,
	input [3:0] centesimas,
	output reg[3:0] decimas
    );
	 
	 always @ (posedge clk)
		begin
			if(rst == 1 || decimas == 9 && centesimas == 9)
				begin
					decimas <= 0;
				end
			else if (centesimas == 9 && stay == 1)
				begin
					decimas <= decimas + 1;
				end
		end
		
		


endmodule
