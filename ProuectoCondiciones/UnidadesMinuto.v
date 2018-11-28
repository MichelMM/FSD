`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:36:55 11/24/2018 
// Design Name: 
// Module Name:    UnidadesMinuto 
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
module UnidadesMinuto(
	input clk,
	input stay,
	input add,
	input rst,
	input [3:0] decimas,
	input [3:0] centesimas,
	input [3:0] unidadesSegundo,
	input [2:0] decenasSegundo,
	output reg[3:0] unidadesMinuto
    );
	 
	 always @ (posedge clk)
		begin
			if (rst == 1 || unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9)
				begin 
					unidadesMinuto <=0;
				end
			else if (decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1)
				begin
					unidadesMinuto <= unidadesMinuto + 1;
				end
		end
		
		


endmodule
