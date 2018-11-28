`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:23:30 11/24/2018 
// Design Name: 
// Module Name:    DecenasMes 
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
module DecenasMes(
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
	input [1:0] decenasHora,
	input [3:0] unidadesDia,
	input [1:0] decenasDia,
	input [3:0] unidadesMes,
	output reg decenasMes
    );
	 

	 
	 always @ (posedge clk)
		begin					////////////////////////MESES SON DE 0-11//////////////////////////////
			if (rst == 1 || (decenasMes == 1 && unidadesMes == 2 && decenasDia == 3 && unidadesDia == 1 &&//ultimo dia del año Diciembre 31 (30)
															decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					decenasMes <=0;
				end

			//agregar decenasMes
			else if ((unidadesMes == 8 && decenasDia == 3 && unidadesDia == 0) //septiembre 30 (29)
											&&(decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1))
				begin
					decenasMes <= decenasMes + 1;
				end
			
			
		end
		


endmodule

