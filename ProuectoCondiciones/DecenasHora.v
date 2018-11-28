`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:48:28 11/24/2018 
// Design Name: 
// Module Name:    DecenasHora 
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
module DecenasHora(
	input clk,
	input stay,
	input add,
	input rst,
	input [3:0] decimas,
	input [3:0] centesimas,
	input [3:0] unidadesSegundo,
	input [2:0] decenasSegundo,
	input [3:0] unidadesMinuto,
	input [3:0] decenasMinuto,
	input [3:0] unidadesHora,
	output reg[1:0] decenasHora
    );
	 
	  always @ (posedge clk)
		begin
			if (rst == 1 || (decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					decenasHora <=0;
				end
			else if ((unidadesHora == 9 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1))
				begin
					decenasHora <= decenasHora + 1;
				end
		end
		
		


endmodule
