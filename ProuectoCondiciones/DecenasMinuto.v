`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:42:42 11/24/2018 
// Design Name: 
// Module Name:    DecenasMinuto 
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
module DecenasMinuto(
	input clk,
	input stay,
	input add,
	input rst,
	input [3:0] decimas,
	input [3:0] centesimas,
	input [3:0] unidadesSegundo,
	input [2:0] decenasSegundo,
	input [3:0] unidadesMinuto,
	output reg[2:0] decenasMinuto
    );
	 
	always @ (posedge clk)
		begin
			if (rst == 1 || decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9)
				begin 
					decenasMinuto <=0;
				end
			else if (unidadesMinuto == 9 &&decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1)
				begin
					decenasMinuto <= decenasMinuto + 1;
				end
		end
		
		


endmodule
