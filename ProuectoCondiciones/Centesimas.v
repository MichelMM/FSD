`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:19 10/22/2018 
// Design Name: 
// Module Name:    Centesimas 
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

module Centesimas(
    input reset,
    input clk,
    input p,
    output [3:0]Q,
	 output reg clkSlow
    );
	
	 wire [3:0]w;
	 
	 ////////////////// RELOJ CENTESIMAS //////////////////
	 reg [30:0] contador = 0; 
	 
	always @(posedge clk, posedge reset)
		begin
			if(reset)
				begin
					contador <=0;
					clkSlow  <=1;
				end
			
			else
				begin
					contador <= contador + 1; //incrementamos clk
						if(contador == 2)
							begin
								clkSlow <= clkSlow +1;
								contador <=0; //reiniciamos elconteo de ciclos
							end
				end
		end
		
		//////////////////////////////////////////////////////
		
		
	   Combinacional10 combCent (.Q(Q), .Qnext(w), .sw(p));
		FlipFlopD 		 ffCent   (.clk(clkSlow), .reset(reset), .Q(Q), .D(w));	 
	 
endmodule
