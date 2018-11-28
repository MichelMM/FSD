`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:55 11/23/2018 
// Design Name: 
// Module Name:    Condiciones 
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

	module Condiciones(
		input clk,
		input reset,
		input stay,
		input [1:0]add,
		input [2:0]sw,
		output [7:0]  decimales,	// bus de 8 bits 	(max 99 decimas y centesimas) 0000 0000 
		output [6:0]  segundos, 	// bus de 7 bits 	(max 60 segundos) 				000  0000
		output [6:0]  minutos,		// bus de 7 bits 	(max 60 minutos) 					000  0000
		output [5:0]  horas,
		output [5:0]  dias,			// bus de 6 bits 	(max 31 dias) 						00   0000
		output [4:0]  meses,			// bus de 5 bits 	(max 12 meses) 					0    0000
		output [15:0] years,			// bus de 16 bits (max 9999 years)					0000 0000 0000 0000
		output [3:0] Trans,
		output [6:0]seg,
		output dp,
		output [1:0]bst
    );
	
	wire clkredu;
	wire [3:0]Res;
	wire [1:0]sel;
//	clksin thSegClock(.clk(clk),.reset(reset),.clkredu(clkredu));
	reg p = 1,Clk;
	 always @ (posedge stay)
		begin 
			p = ~p;
		end
	
	Centesimas 			cente (.reset(reset),.clk(clk),.p(p),.Q(decimales[3:0]),.clkSlow(clkredu));
	
	always @ (posedge clk)
		begin
			Clk <= clkredu;
		end
	
	Decimas	  			deci	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.rst(reset),.stay(p));
	UnidadesSegundo	segu	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.rst(reset),.stay(p));
	DecenasSegundo		segd	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]),.rst(reset),.stay(p));
	
	UnidadesMinuto		minu	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]) ,.rst(reset),.stay(p));
	DecenasMinuto		mind	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .rst(reset),.stay(p));
	UnidadesHora		horu	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .unidadesHora(horas[3:0]), .decenasHora(horas[5:4]), .rst(reset), .stay(p));
	DecenasHora			hord	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .unidadesHora(horas[3:0]), .decenasHora(horas[5:4]), .rst(reset), .stay(p));
	
	UnidadesDia			uniu	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .unidadesHora(horas[3:0]), .decenasHora(horas[5:4]), .unidadesDia(dias[3:0]), .decenasDia(dias[5:4]), .unidadesMes(meses[3:0]), .decenasMes(meses[4]), .rst(reset), .stay(p), .bst(bst));
	DecenasDia			decd	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .unidadesHora(horas[3:0]), .decenasHora(horas[5:4]), .unidadesDia(dias[3:0]), .decenasDia(dias[5:4]), .unidadesMes(meses[3:0]), .decenasMes(meses[4]), .rst(reset), .stay(p), .bst(bst));
	UnidadesMes			mesu	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .unidadesHora(horas[3:0]), .decenasHora(horas[5:4]), .unidadesDia(dias[3:0]), .decenasDia(dias[5:4]), .unidadesMes(meses[3:0]), .decenasMes(meses[4]), .rst(reset), .stay(p), .bst(bst));
	DecenasMes			mesd	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .unidadesHora(horas[3:0]), .decenasHora(horas[5:4]), .unidadesDia(dias[3:0]), .decenasDia(dias[5:4]), .unidadesMes(meses[3:0]), .decenasMes(meses[4]), .rst(reset), .stay(p));

	UnidadesYear		yru	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .unidadesHora(horas[3:0]), .decenasHora(horas[5:4]), .unidadesDia(dias[3:0]), .decenasDia(dias[5:4]), .unidadesMes(meses[3:0]), .decenasMes(meses[4]), .unidadesYear(years[3:0]), .rst(reset), .stay(p));
	DecenasYear		  	yrd	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .unidadesHora(horas[3:0]), .decenasHora(horas[5:4]), .unidadesDia(dias[3:0]), .decenasDia(dias[5:4]), .unidadesMes(meses[3:0]), .decenasMes(meses[4]), .unidadesYear(years[3:0]), .decenasYear(years[7:4]), .rst(reset), .stay(p));
	CentenasYear	  	yrc	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .unidadesHora(horas[3:0]), .decenasHora(horas[5:4]), .unidadesDia(dias[3:0]), .decenasDia(dias[5:4]), .unidadesMes(meses[3:0]), .decenasMes(meses[4]), .unidadesYear(years[3:0]), .decenasYear(years[7:4]), .centenasYear(years[11:8]), .rst(reset), .stay(p));
	MilesimasYear	  	yrm	(.clk(clk),.centesimas(decimales[3:0]),.decimas(decimales[7:4]),.unidadesSegundo(segundos[3:0]),.decenasSegundo(segundos[6:4]), .unidadesMinuto(minutos[3:0]), .decenasMinuto(minutos[6:4]), .unidadesHora(horas[3:0]), .decenasHora(horas[5:4]), .unidadesDia(dias[3:0]), .decenasDia(dias[5:4]), .unidadesMes(meses[3:0]), .decenasMes(meses[4]), .unidadesYear(years[3:0]), .decenasYear(years[7:4]), .centesimasYear(years[11:8]), .milesimasYear(years[15:12]), .rst(reset), .stay(p));
	
	Bisiesto 			bis 	(.clk(clk), .year(years), .bst(bst));

	MultipleXOR  PMult	(.reset(reset),.clk(clk),.Q(sel));
	
	assign Trans = (sel == 0)?4'b1110:
						(sel == 1)?4'b1101:
						(sel == 2)?4'b1011:
						(sel == 3)?4'b0111:
									         0;

	//Segundos-Decimas
//	assign Res = 	(Trans[3]==0)? {segundos[6:4]}:
//						(Trans[2]==0)? {segundos[3:0]}:
//						(Trans[1]==0)? {decimales[7:4]}:
//						(Trans[0]==0)? {decimales[3:0]}:
//						0;
	
	//Horas-Minutos
//	assign Res = 	(Trans[3]==0)? {horas[5:4]}:
//						(Trans[2]==0)? {horas[3:0]}:
//						(Trans[1]==0)? {minutos[6:4]}:
//						(Trans[0]==0)? {minutos[3:0]}:
//						0;
	
	//Mes-Dias
	/*assign Res = 	(Trans[3]==0)? {meses[4]}:
						(Trans[2]==0)? {meses[3:0]}:
						(Trans[1]==0)? {dias[5:4]}:
						(Trans[0]==0)? {dias[3:0]}:
						0;*/
						
	//Todo
	assign Res = 	(Trans[3]==0)? (sw == 0)?{ segundos[6:4]}:(sw == 1)?{  horas[5:4]}:(sw == 2)?{meses[4  ]}:{years[15:12]}:
						(Trans[2]==0)? (sw == 0)?{ segundos[3:0]}:(sw == 1)?{  horas[3:0]}:(sw == 2)?(meses[4] == 1)?{meses[3:0]}: {meses[3:0]+1}:{years[11: 8]}:
						(Trans[1]==0)? (sw == 0)?{decimales[7:4]}:(sw == 1)?{minutos[6:4]}:(sw == 2)?{ dias[5:4]}:{years[ 7: 4]}:
						(Trans[0]==0)? (sw == 0)?{decimales[3:0]}:(sw == 1)?{minutos[3:0]}:(sw == 2)?{ dias[5:4]!=0} ?{ dias[3:0]}:{ dias[3:0]+1}:{years[ 3: 0]}:
						0;
						
	assign dp = 1'b1;
	
	Decoder DEC (.A(Res),.Seg(seg));

	
endmodule
