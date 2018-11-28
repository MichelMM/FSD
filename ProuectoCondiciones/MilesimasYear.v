`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:31:39 11/26/2018 
// Design Name: 
// Module Name:    MilesimasYear 
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
module MilesimasYear(
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
	input decenasMes,
	input [3:0] unidadesYear,
	input [3:0] decenasYear,
	input [3:0] centesimasYear,
	output reg [3:0] milesimasYear
    );
	 

	 
	 always @ (posedge clk)
		begin					////////////////////////MESES SON DE 0-11//////////////////////////////
			if (rst == 1 || (milesimasYear == 9 && centesimasYear == 9 && decenasYear == 9 && unidadesYear == 9 && decenasMes == 1 && unidadesMes == 1 && decenasDia == 3 && unidadesDia == 1 &&
															decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					milesimasYear <=0;
				end

			//agregar unidadesMes
			else if ((centesimasYear == 9 && decenasYear == 9 && unidadesYear == 9 && decenasMes == 1 && unidadesMes == 2 && decenasDia == 3 && unidadesDia == 1) //ultimo dia del año 0999
											&&(decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1))
				begin
					milesimasYear <= milesimasYear + 1;
				end
			
			
		end
		


endmodule
