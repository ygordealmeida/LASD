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

registrars_bank registradores(.wd3(SW[7:0]), .wa3(SW[16:14]), .we3(SW[17]), .clk(KEY[1]), .ra1(SW[13:11]), .ra2(SW[10:8]),
 .rst(KEY[2]),
.rd1(w_d0x0), .rd2(w_d0x1) ) ;
assign LEDG[8] = ~KEY[1];
decoder_7segments primeiro (.hex_input(SW[3:0]), .segment_out(HEX0[0:6]));
decoder_7segments segundo (.hex_input(SW[7:4]), .segment_out(HEX1[0:6]));



endmodule
