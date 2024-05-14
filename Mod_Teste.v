`default_nettype none //Comando para desabilitar declaraÃƒÂ§ÃƒÂ£o automÃƒÂ¡tica de wires
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

//------------------SPRINT 8 --------------
/*
wire w_ULASrc, w_RegWrite, w_MemWrite, w_ResultSrc, w_Branch, w_PCSrc, w_Zero, clock;
wire [1:0] w_ImmSrc;
wire [2:0] w_ULAControl;
wire [7:0] w_PCp4, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResult, w_Wd3, w_Imm, w_RData, w_PCn, w_ImmPC;
wire [31:0] w_Inst;


assign clock = KEY[1];
//frequency_divider_2HZ divisor (.clock_50Mhz(CLOCK_50), .clock_2hz(clock) );

//Inalterado
registrars_bank registradores(.wd3(w_Wd3), .wa3(w_Inst[11:7]), .we3(w_RegWrite), .clk(clock), .ra1(w_Inst[19:15]), .ra2(w_Inst[24:20]),
.rst(KEY[2]),
.rd1(w_rd1SrcA), .rd2(w_rd2), .saida_0(w_d0x0), .saida_1(w_d0x1), .saida_2(w_d0x2), .saida_3(w_d0x3), .saida_4(w_d1x0), .saida_5(w_d1x1), .saida_6(w_d1x2), .saida_7(w_d1x3)  ) ;


assign w_PCp4 = w_PC+4; //Inalterado

//Inalterado
Program_Counter CONTADOR_PROGRAMA (.clk(clock), .rst(KEY[2]), .PCin(w_PCn), .PC(w_PC) );

//Inalterado
Instruction_Memory memoria_instrucao (.A(w_PC), .RD(w_Inst));

//Inalterado
ControlUnit unidade_controle (.OP(w_Inst[6:0]), .Funct7(w_Inst[31:25]),
.Funct3(w_Inst[14:12]),
.ULAControl(w_ULAControl[2:0]), .ImmSrc(w_ImmSrc),
.ULASrc(w_ULASrc), .RegWrite(w_RegWrite), .ResultSrc(w_ResultSrc), .MemWrite(w_MemWrite), .Branch(w_Branch));


//Inalterado
mux_4x1 #(.N(12)) MuxImmSrc (.it0(w_Inst[31:20]), .it1({w_Inst[31:25],w_Inst[11:7]}), .it2({w_Inst[7], w_Inst[30:25], w_Inst[11:8], 1'b0}), .it3(12'h000), .sel(w_ImmSrc), .out(w_Imm) );

//NOVO
assign w_ImmPC = w_Imm + w_PC;

//Alterado
ULA ulinha (.SrcA(w_rd1SrcA), .SrcB(w_SrcB),
.ULAControl(w_ULAControl[2:0]),
.Z(w_Zero),
.ULAResult(w_ULAResult));

assign LEDG[0] = w_Zero;

//Inalterado
mux_2x1 #(.N(8)) MuxULASrc (.it0(w_rd2), .it1(w_Imm), .sel(w_ULASrc), .out(w_SrcB) );

//Inalterado
Data_mem memoria_dados (.A(w_ULAResult), .WD(w_rd2), .rst(KEY[2]),.clk(clock),
.WE(w_MemWrite),.RD(w_RData));

//Alterado!!!
mux_2x1 #(.N(8)) MuxResSrc (.it0(w_ULAResult), .it1(w_RegData), .sel(w_ResultSrc), .out(w_Wd3));

assign w_PCSrc = w_Branch & w_Zero;

//NOVO
mux_2x1 #(.N(8)) MuxPCSrc (.it0(w_PCp4), .it1(w_ImmPC), .sel(w_PCSrc), .out(w_PCn) );


wire[7:0] w_DataOut, w_Data_in, w_RegData;
//Novo
parallel_out saida (.RegData(w_rd2), .Address(w_ULAResult), .EN(w_MemWrite), .clk(clock), .rst(KEY[2]),.Data_Out(w_DataOut));
parallel_in entrada (.Data_in(w_Data_in), .Address(w_ULAResult), .MemData(w_RData), .RegData(w_RegData));



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
assign w_Data_in =SW[7:0];
assign w_DataOut = w_d1x4;


endmodule
*/
//------------------PROJETO FINAL --------------

wire w_ULASrc, w_RegWrite, w_MemWrite, w_Branch, w_PCSrc, w_Zero, clock, w_Jump, w_JR;
wire [1:0] w_ImmSrc, w_ResultSrc;  //w_ResultSrc aumentou de tamanho
wire [2:0] w_ULAControl;
wire [7:0] w_PCp4, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResult, w_Wd3, w_Imm, w_RData, w_PCn, w_ImmPC, w_outJR;
wire [31:0] w_Inst;

mux_2x1 #(.N(8)) MuxJr (.it0(w_PC), .it1(w_rd1SrcA), .sel(w_JR), .out(w_outJR) );
assign w_ImmPC = w_Imm + w_outJR;


assign clock = KEY[1];
//frequency_divider_2HZ divisor (.clock_50Mhz(CLOCK_50), .clock_2hz(clock) );

registrars_bank registradores(.wd3(w_Wd3), .wa3(w_Inst[11:7]), .we3(w_RegWrite), .clk(clock), .ra1(w_Inst[19:15]), .ra2(w_Inst[24:20]),
.rst(KEY[2]),
.rd1(w_rd1SrcA), .rd2(w_rd2), .saida_0(w_d0x0), .saida_1(w_d0x1), .saida_2(w_d0x2), .saida_3(w_d0x3), .saida_4(w_d1x0), .saida_5(w_d1x1), .saida_6(w_d1x2), .saida_7(w_d1x3)  ) ;


assign w_PCp4 = w_PC+4; //Inalterado

Program_Counter CONTADOR_PROGRAMA (.clk(clock), .rst(KEY[2]), .PCin(w_PCn), .PC(w_PC) );

Instruction_Memory memoria_instrucao (.A(w_PC), .RD(w_Inst));

ControlUnit unidade_controle (.OP(w_Inst[6:0]), .Funct7(w_Inst[31:25]),
.Funct3(w_Inst[14:12]),
.ULAControl(w_ULAControl[2:0]), .ImmSrc(w_ImmSrc),
.ULASrc(w_ULASrc), .RegWrite(w_RegWrite), .ResultSrc(w_ResultSrc), .MemWrite(w_MemWrite), .Branch(w_Branch), .Jump(w_Jump), .Jr(w_JR));


//Adicionado imediato do tipo J 
mux_4x1 #(.N(12)) MuxImmSrc (.it0(w_Inst[31:20]), .it1({w_Inst[31:25],w_Inst[11:7]}), .it2({w_Inst[7], w_Inst[30:25], w_Inst[11:8], 1'b0}), .it3({w_Inst[19:12],w_Inst[20], w_Inst[30:21], 1'b0}), .sel(w_ImmSrc), .out(w_Imm) );


ULA ulinha (.SrcA(w_rd1SrcA), .SrcB(w_SrcB),
.ULAControl(w_ULAControl[2:0]),
.Z(w_Zero),
.ULAResult(w_ULAResult));

assign LEDG[0] = w_Zero;

mux_2x1 #(.N(8)) MuxULASrc (.it0(w_rd2), .it1(w_Imm), .sel(w_ULASrc), .out(w_SrcB) );


Data_mem memoria_dados (.A(w_ULAResult), .WD(w_rd2), .rst(KEY[2]),.clk(clock),
.WE(w_MemWrite),.RD(w_RData));

//MuxResSrc passou de 2x1 -> 4x1, assim podemos escolher PC+4;
//Isso tambem modifica o tamanho do sinal de controle ResultSrc
mux_4x1 #(.N(8)) MuxResSrc (.it0(w_ULAResult), .it1(w_RegData), .it2(w_PCp4), .it3(8'h00), .sel(w_ResultSrc), .out(w_Wd3));

assign w_PCSrc = (w_Branch & w_Zero) | w_Jump;

mux_2x1 #(.N(8)) MuxPCSrc (.it0(w_PCp4), .it1(w_ImmPC), .sel(w_PCSrc), .out(w_PCn) );


wire[7:0] w_DataOut, w_Data_in, w_RegData;

parallel_out saida (.RegData(w_rd2), .Address(w_ULAResult), .EN(w_MemWrite), .clk(clock), .rst(KEY[2]),.Data_Out(w_DataOut));
parallel_in entrada (.Data_in(w_Data_in), .Address(w_ULAResult), .MemData(w_RData), .RegData(w_RegData));



decoder_7segments setimo (.hex_input(w_Inst[31:28]), .segment_out(HEX7[0:6]));
decoder_7segments sexto (.hex_input(w_Inst[27:24]), .segment_out(HEX6[0:6]));
decoder_7segments quinto (.hex_input(w_Inst[23:20]), .segment_out(HEX5[0:6]));
decoder_7segments quarto (.hex_input(w_Inst[19:16]), .segment_out(HEX4[0:6]));
decoder_7segments terceiro (.hex_input(w_Inst[15:12]), .segment_out(HEX3[0:6]));
decoder_7segments segundo (.hex_input(w_Inst[11:8]), .segment_out(HEX2[0:6]));
decoder_7segments primeiro (.hex_input(w_Inst[7:4]), .segment_out(HEX1[0:6]));
decoder_7segments zero (.hex_input(w_Inst[3:0]), .segment_out(HEX0[0:6]));

assign LEDR[12:0] = {w_RegWrite,w_ImmSrc,w_ULASrc,w_ULAControl[2:0],w_MemWrite,w_ResultSrc[1:0], w_Branch, w_Jump, w_JR};
assign LEDG[3] = ~KEY[1];
assign LEDG[5] = ~KEY[2];

assign w_PC = w_d0x4;
assign w_Data_in =SW[7:0];
assign w_DataOut = w_d1x4;


endmodule



