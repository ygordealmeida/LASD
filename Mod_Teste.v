`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);
//---------- modifique a partir daqui --------

//mux_2x1 #(.N(8)) Inst1 (.it0(SW[7:0]), .it1(SW[15:8]), .sel(SW[17]), .out(LEDR[7:0]) );

//wire clock;
//wire [4:0] valor;


//QUESTAO 3:

//frequency_divider divisor (.clock_50Mhz(CLOCK_50), .clock_1hz(clock) );

//counter_0x9 contador ( .clk(clock), .rst(KEY[1]), .value(valor) );

//decoder_7segments  decodificador (.hex_input(valor), .segment_out(HEX4[0:6]));  


// QUESTAO 1:
//decoder_7segments testdecodificador (.hex_input(SW[11:8]), .segment_out(HEX3[0:6]));

// QUESTAO 2:
//frequency_divider divisor (.clock_50Mhz(CLOCK_50), .clock_1hz(LEDG[0]) );  ,

//DESAFIO:

//counter_rot contador ( .clk(clock), .rst(KEY[1]), .value(valor) );
//decoder_rot  decodificador (.hex_input(valor), .segment_out0(HEX3[0:6]), .segment_out1(HEX2[0:6]), .segment_out2(HEX1[0:6]) , .segment_out3(HEX0[0:6]) );
//frequency_rot divisor (.clock_50Mhz(CLOCK_50), .clock_1hz(clock) );

// --------SPRINT 3 ---------
/*
registrars_bank registradores(.wd3(SW[7:0]), .wa3(SW[16:14]), .we3(SW[17]), .clk(KEY[1]), .ra1(SW[13:11]), .ra2(SW[10:8]),
.rst(KEY[2]),
.rd1(w_d0x0), .rd2(w_d0x1) ) ;
assign LEDG[8] = ~KEY[1];
decoder_7segments primeiro (.hex_input(SW[3:0]), .segment_out(HEX0[0:6]));
decoder_7segments segundo (.hex_input(SW[7:4]), .segment_out(HEX1[0:6]));
assign LEDG[5] = ~KEY[2];
*/


// ---------SPRINT 4-ULA ----------
/*
wire [7:0] w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3;
registrars_bank registradores(.wd3(SW[7:0]), .wa3(SW[16:14]), .we3(1'b1), .clk(KEY[1]), .ra1(SW[13:11]), .ra2(3'b010),
.rst(KEY[2]),
.rd1(w_rd1SrcA), .rd2(w_rd2) ) ;

assign LEDG[5] = ~KEY[2];
assign LEDG[8] = ~KEY[1];

decoder_7segments primeiro (.hex_input(SW[3:0]), .segment_out(HEX0[0:6]));
decoder_7segments segundo (.hex_input(SW[7:4]), .segment_out(HEX1[0:6]));
mux_2x1 #(.N(8)) MuxULASrc (.it0(w_rd2), .it1(8'h07), .sel(SW[17]), .out(w_SrcB) );

ULA ulinha (.SrcA(w_rd1SrcA), .SrcB(w_SrcB),
.ULAControl(SW[10:8]),
.Z(LEDG[0]),
.ULAResult(w_ULAResultWd3));

assign w_rd1SrcA = w_d0x0;
assign w_rd2 = w_d1x0;
assign w_SrcB = w_d1x1;
assign w_ULAResultWd3 = w_d0x4; 
*/

//----------SPRINT 5-UNIDADE DE CONTROLE ---------
/*
wire w_ULASrc, w_RegWrite;
wire [2:0] w_ULAControl;
wire [7:0] w_PCp4, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResult;
wire [31:0] w_Inst;

registrars_bank registradores(.wd3(w_ULAResult), .wa3(w_Inst[11:7]), .we3(w_RegWrite), .clk(KEY[1]), .ra1(w_Inst[19:15]), .ra2(w_Inst[24:20]),
.rst(KEY[2]),
.rd1(w_rd1SrcA), .rd2(w_rd2), .saida_0(w_d0x0), .saida_1(w_d0x1), .saida_2(w_d0x2), .saida_3(w_d0x3), .saida_4(w_d1x0), .saida_5(w_d1x1), .saida_6(w_d1x2), .saida_7(w_d1x3)  ) ;

assign w_PCp4 = w_PC+4;
Program_Counter CONTADOR_PROGRAMA (.clk(KEY[1]), .rst(KEY[2]), .PCin(w_PCp4), .PC(w_PC) );

Instruction_Memory memoria_instrucao (.A(w_PC), .RD(w_Inst));


ControlUnit unidade_controle (.OP(w_Inst[6:0]), .Funct7(w_Inst[31:25]),
.Funct3(w_Inst[14:12]),
.ULAControl(w_ULAControl[2:0]),
.ULASrc(w_ULASrc), .RegWrite(w_RegWrite));


ULA ulinha (.SrcA(w_rd1SrcA), .SrcB(w_SrcB),
.ULAControl(w_ULAControl[2:0]),
.Z(LEDG[0]),
.ULAResult(w_ULAResult));

mux_2x1 #(.N(8)) Inst1 (.it0(w_rd2), .it1(w_Inst[31:20]), .sel(w_ULASrc), .out(w_SrcB) );


decoder_7segments setimo (.hex_input(w_Inst[31:28]), .segment_out(HEX7[0:6]));
decoder_7segments sexto (.hex_input(w_Inst[27:24]), .segment_out(HEX6[0:6]));
decoder_7segments quinto (.hex_input(w_Inst[23:20]), .segment_out(HEX5[0:6]));
decoder_7segments quarto (.hex_input(w_Inst[19:16]), .segment_out(HEX4[0:6]));
decoder_7segments terceiro (.hex_input(w_Inst[15:12]), .segment_out(HEX3[0:6]));
decoder_7segments segundo (.hex_input(w_Inst[11:8]), .segment_out(HEX2[0:6]));
decoder_7segments primeiro (.hex_input(w_Inst[7:4]), .segment_out(HEX1[0:6]));
decoder_7segments zero (.hex_input(w_Inst[3:0]), .segment_out(HEX0[0:6]));

assign LEDR[4:0] = {w_RegWrite,w_ULASrc,w_ULAControl[2:0]};
assign LEDG[3] = ~KEY[1];
assign LEDG[5] = ~KEY[2];

assign w_PC = w_d0x4;

*/
//----------SPRINT 6-DATA MEMORY ---------

wire w_ULASrc, w_RegWrite, w_ImmSrc, w_MemWrite, w_ResultSrc;
wire [2:0] w_ULAControl;
wire [7:0] w_PCp4, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResult, w_Wd3, w_Imm, w_RData;
wire [31:0] w_Inst;

registrars_bank registradores(.wd3(w_Wd3), .wa3(w_Inst[11:7]), .we3(w_RegWrite), .clk(KEY[1]), .ra1(w_Inst[19:15]), .ra2(w_Inst[24:20]),
.rst(KEY[2]),
.rd1(w_rd1SrcA), .rd2(w_rd2), .saida_0(w_d0x0), .saida_1(w_d0x1), .saida_2(w_d0x2), .saida_3(w_d0x3), .saida_4(w_d1x0), .saida_5(w_d1x1), .saida_6(w_d1x2), .saida_7(w_d1x3)  ) ;

assign w_PCp4 = w_PC+4;
Program_Counter CONTADOR_PROGRAMA (.clk(KEY[1]), .rst(KEY[2]), .PCin(w_PCp4), .PC(w_PC) );

Instruction_Memory memoria_instrucao (.A(w_PC), .RD(w_Inst));


ControlUnit unidade_controle (.OP(w_Inst[6:0]), .Funct7(w_Inst[31:25]),
.Funct3(w_Inst[14:12]),
.ULAControl(w_ULAControl[2:0]), .ImmSrc(w_ImmSrc),
.ULASrc(w_ULASrc), .RegWrite(w_RegWrite), .ResultSrc(w_ResultSrc), .MemWrite(w_MemWrite));

mux_2x1 #(.N(12)) Inst1 (.it0(w_Inst[31:20]), .it1({w_Inst[31:25],w_Inst[11:7]}), .sel(w_ImmSrc), .out(w_Imm) );



ULA ulinha (.SrcA(w_rd1SrcA), .SrcB(w_SrcB),
.ULAControl(w_ULAControl[2:0]),
.Z(LEDG[0]),
.ULAResult(w_ULAResult));

mux_2x1 #(.N(8)) Inst2 (.it0(w_rd2), .it1(w_Imm), .sel(w_ULASrc), .out(w_SrcB) );

Data_mem memoria_dados (.A(w_ULAResult), .WD(w_rd2), .rst(KEY[2]),.clk(KEY[1]),
.WE(w_MemWrite),.RD(w_RData));

mux_2x1 #(.N(8)) MuxResSrc (.it0(w_ULAResult), .it1(w_RData), .sel(w_ResultSrc), .out(w_Wd3));

decoder_7segments setimo (.hex_input(w_Inst[31:28]), .segment_out(HEX7[0:6]));
decoder_7segments sexto (.hex_input(w_Inst[27:24]), .segment_out(HEX6[0:6]));
decoder_7segments quinto (.hex_input(w_Inst[23:20]), .segment_out(HEX5[0:6]));
decoder_7segments quarto (.hex_input(w_Inst[19:16]), .segment_out(HEX4[0:6]));
decoder_7segments terceiro (.hex_input(w_Inst[15:12]), .segment_out(HEX3[0:6]));
decoder_7segments segundo (.hex_input(w_Inst[11:8]), .segment_out(HEX2[0:6]));
decoder_7segments primeiro (.hex_input(w_Inst[7:4]), .segment_out(HEX1[0:6]));
decoder_7segments zero (.hex_input(w_Inst[3:0]), .segment_out(HEX0[0:6]));

assign LEDR[7:0] = {w_RegWrite,w_ImmSrc,w_ULASrc,w_ULAControl[2:0],w_MemWrite,w_ResultSrc};
assign LEDG[3] = ~KEY[1];
assign LEDG[5] = ~KEY[2];

assign w_PC = w_d0x4;

endmodule
