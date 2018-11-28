`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:52 10/22/2018 
// Design Name: 
// Module Name:    FlipFlopD 
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

module FlipFlopD(
    input [3:0] D,
    input clk,
    input reset,
    output reg [3:0] Q
    );

	always @(posedge clk, posedge reset)
		begin
			if(reset == 1)
				begin
					Q<=0;
				end
			else
				begin
					Q<=D;
				end
		end

endmodule