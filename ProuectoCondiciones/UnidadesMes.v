`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:55:24 11/24/2018 
// Design Name: 
// Module Name:    UnidadesMes 
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
module UnidadesMes(
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
	input [3:0] unidadesDia,
	input [1:0] decenasDia,
	input decenasMes,
	output reg[3:0] unidadesMes
    );
	 

	 
	 always @ (posedge clk)
		begin					////////////////////////MESES SON DE 0-11//////////////////////////////
								////////////////////////DIAS SON DE 0-30/29/27 //////////////////////////////
			if (rst == 1 || (decenasMes == 0 && unidadesMes == 8 && decenasDia == 3 && unidadesDia == 0 &&//ultimo mes con una cifra Septiembre 30 (29)
															decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					unidadesMes <=0;
				end
							
			else if (rst == 1 || (decenasMes == 1 && unidadesMes == 2 && decenasDia == 3 && unidadesDia == 1 &&//ultimo mes del year con ultimo dia Diciembre 31 (30)
															decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					unidadesMes <=0;
				end

			//agregar unidadesMes
			else if (((decenasMes == 0 && unidadesMes == 1 && decenasDia == 2 && unidadesDia ==  8 && bst != 0) //febrero (28) no bisiesto
						||(decenasMes == 0 && unidadesMes == 1 && decenasDia == 2 && unidadesDia ==  9 && bst == 0) //febrero (29) bisiesto
						||((unidadesMes == 3 || unidadesMes == 5 || unidadesMes == 8 || (decenasMes == 1 && unidadesMes == 1)) && decenasDia == 3 && unidadesDia == 0) //30 dias (29)
						||(((decenasMes == 0 && unidadesMes == 0) ||(decenasMes == 0 && unidadesMes == 2) || unidadesMes == 4 || unidadesMes == 6 || unidadesMes == 7 || unidadesMes == 9 || (decenasMes == 1 && unidadesMes == 0))&&(decenasDia == 3 && unidadesDia == 1)) //31 dias (30)
								)
								&&(decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1))
				begin
					unidadesMes <= unidadesMes + 1;
				end
			
			
		end
		


endmodule
