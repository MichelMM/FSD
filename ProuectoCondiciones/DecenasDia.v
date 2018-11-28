`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:53:51 11/24/2018 
// Design Name: 
// Module Name:    DecenasDia 
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
module DecenasDia(
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
	input [3:0] unidadesMes,
	input decenasMes, 
	output reg[1:0] decenasDia
    );
	 
	  always @ (posedge clk)
		begin					////////////////////////MESES SON DE 0-11//////////////////////////////
								////////////////////////DIAS SON DE 0-30/29/27 //////////////////////////////
			if (rst == 1 || (decenasMes == 0 && unidadesMes == 1 && decenasDia == 2 && unidadesDia == 8 && bst > 0 &&//febrero (28) no bisiesto
															decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					decenasDia <=0;
				end
			
			else if (rst == 1 || (decenasMes == 0 && unidadesMes == 1 && decenasDia == 2 && unidadesDia == 9 && bst == 0  &&//febrero (29) bisiesto
															decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					decenasDia <=0;
				end
							
			else if (rst == 1 || (decenasDia == 3 && unidadesDia == 0 && //meses con 30 dias 
															(unidadesMes == 3 || unidadesMes == 5 || unidadesMes == 8 || (decenasMes == 1 && unidadesMes == 1)) &&
															decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					decenasDia <=0;
				end
				
			else if (rst == 1 || (decenasDia == 3 && unidadesDia == 1 &&//meses con 31 dias 
															(unidadesMes == 0 || unidadesMes == 2 || unidadesMes == 4 || unidadesMes == 6 || unidadesMes == 7 || unidadesMes == 9 || (decenasMes == 1 && unidadesMes ==0)|| (decenasMes == 1 && unidadesMes ==2)) &&
															decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9))
				begin 
					decenasDia <=0;
				end

			else if (decenasDia == 0 && unidadesDia == 8 && (decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1))
				begin
					decenasDia <= decenasDia + 1;
				end
			else if (decenasDia != 0 && unidadesDia == 9 && (decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1))
				begin
					decenasDia <= decenasDia + 1;
				end
			else if (decenasMes == 0 && unidadesMes == 1 && decenasDia == 2 && unidadesDia == 8 && bst != 0 &&(decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1))
				begin
					decenasDia <= decenasDia + 1;
				end
			else if (decenasMes == 0 && unidadesMes == 1 && decenasDia == 2 && unidadesDia == 9 && bst == 0 &&(decenasHora == 2 && unidadesHora == 3 && decenasMinuto == 5 && unidadesMinuto == 9 && decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1))
				begin
					decenasDia <= decenasDia + 1;
				end
		end
		
		


endmodule
