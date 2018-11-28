`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:37 10/22/2018 
// Design Name: 
// Module Name:    MultipleXOR 
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
module MultipleXOR(
    input reset,
    input clk,
    output [2:0]Q,
	 output reg clkSlow
    );
	
	 wire [2:0]w;
	 
	 
	 ////////////////// RELOJ MULTIPLEXOR //////////////////
	 reg [14:0] contador = 0; 
	 
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
						if(contador == 25_000)
							begin
								clkSlow <= clkSlow +1;
								contador <=0; //reiniciamos elconteo de ciclos
							end
				end
		end
		
		//////////////////////////////////////////////////////
		
		
	   Combinacional4  combUni (.Q(Q), .Qnext(w));
		FlipFlopD 		 ffuni   (.clk(clkSlow), .reset(reset), .Q(Q), .D(w));	 
	 
endmodule
