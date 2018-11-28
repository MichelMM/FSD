`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:06 11/24/2018 
// Design Name: 
// Module Name:    UnidadesDia 
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
module UnidadesDia(
	input clk,
	input stay,
	input add,
	input rst,
	input [1:0] bst,
	input [3:0] decimas,
	input [3:0] centesimas,
	input [3:0] unidadesSegundo,
	input [2:0] decenasSegundo,
	input [3:0] unidadesMinuto,
	input [3:0] decenasMinuto,
	input [3:0] unidadesHora,
	input [1:0] decenasHora,
	input [2:0] decenasDia,
	input [3:0] unidadesMes,
	input decenasMes,
	output reg[3:0] unidadesDia
    );
	 
	 always @ (posedge clk)
		begin					////////////////////////MESES SON DE 0-11//////////////////////////////
								////////////////////////DIAS SON DE 0-8 y de 10-31 //////////////////////////////
			if (rst == 1 || (decenasDia == 0 && unidadesDia == 8 || decenasDia != 0 && unidadesDia == 9 ||
								(decenasMes == 0 && unidadesMes == 1 && decenasDia == 2 && unidadesDia == 8 && bst != 0)) &&//febrero (28) no bisiesto
															(decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					unidadesDia <=0;
				end
			else if (rst == 1 || (decenasDia == 0 && unidadesDia == 8 || decenasDia != 0 && unidadesDia == 9 ||
								(decenasMes == 0 && unidadesMes == 1 && decenasDia == 2 && unidadesDia == 9 && bst == 0)) &&//febrero (28) bisiesto
															(decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					unidadesDia <=0;
				end
							
			else if (rst == 1 || (decenasDia == 0 && unidadesDia == 8 || decenasDia != 0 && unidadesDia == 9 ||
								(decenasDia == 3 && unidadesDia == 0)) && //meses con 30 dias (29)
															((unidadesMes == 3 || unidadesMes == 5 || unidadesMes == 8 || (decenasMes == 1 && unidadesMes == 1)) &&
															decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					unidadesDia <=0;
				end
				
			else if (rst == 1 || (decenasDia == 0 && unidadesDia == 8 || decenasDia != 0 && unidadesDia == 9 ||
								(decenasDia == 3 && unidadesDia == 1)) &&//meses con 31 dias (30)
															((unidadesMes == 0 || unidadesMes == 2 || unidadesMes == 4 || unidadesMes == 6 || unidadesMes == 7 || unidadesMes == 9 || (decenasMes == 1 && unidadesMes ==0)|| (decenasMes == 1 && unidadesMes ==2)) &&
															decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					unidadesDia <=0;
				end
				//agregar unidadesDia
			else if ((decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1))
				begin
					unidadesDia <= unidadesDia + 1;
				end
		end
		
		


endmodule
