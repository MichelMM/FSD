`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:58 11/23/2018 
// Design Name: 
// Module Name:    UnidadesSegundo 
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
module UnidadesSegundo(
	input clk,
	input stay,
	input add,
	input rst,
	input [3:0] decimas,
	input [3:0] centesimas,
	output reg[3:0] unidadesSegundo
    );
	 
	 always @ (posedge clk)
		begin
			if (rst == 1 || unidadesSegundo == 9 && decimas == 9 && centesimas == 9)
				begin 
					unidadesSegundo <=0;
				end
			else if (decimas == 9 && centesimas == 9 && stay == 1)
				begin
					unidadesSegundo <= unidadesSegundo + 1;
				end
		end
		
		


endmodule
