`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:33:48 11/23/2018 
// Design Name: 
// Module Name:    DecenasSegundo 
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
module DecenasSegundo(
	input clk,
	input stay,
	input add,
	input rst,
	input [3:0] decimas,
	input [3:0] centesimas,
	input [3:0] unidadesSegundo,
	output reg[2:0] decenasSegundo
    );
	 		
		always @ (posedge clk)
		begin
			if (rst == 1 || decenasSegundo == 5 && unidadesSegundo == 9 && decimas == 9 && centesimas == 9)
				begin 
					decenasSegundo <=0;
				end
			else if (unidadesSegundo == 9 && decimas == 9 && centesimas == 9 && stay == 1)
				begin
					decenasSegundo <= decenasSegundo + 1;
				end
		end
		
		


endmodule
