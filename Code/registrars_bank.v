module registrars_bank 
(input [7:0] wd3,
input [2:0] wa3,
input we3, clk,
input [2:0]  ra1, ra2,
input rst,
output [7:0] rd1, rd2,
output [7:0] saida_0, saida_1, saida_2, saida_3, saida_4, saida_5, saida_6, saida_7);

reg [7:0] register [7:0];
integer i;
//assign register[0]=0;
//assign register[wa3] = (we3&(|wa3))?wd3:register[wa3]; //Se we3 for 1 e wa3 diferente de 0 recebe wd3 se nao continua o mesmo valor
//assign register[7:0] = (!rst)?0:register[7:0];

always @ (posedge clk or negedge rst)
begin
		if (!rst) // EM verilog nao podemos mudar todos os arrays de uma vez
		begin
			for(i=1;i<8;i=i+1)
			begin
			register[i]<=0;
			end

		end
		else if (we3==1 && wa3 != 0)
			register[wa3]<=wd3;
		else 
		register[0] <=0;
		

end


 assign rd1 = register[ra1];
 assign rd2 = register[ra2];
 assign saida_0 = register[0];
 assign saida_1 = register[1];
 assign saida_2= register[2];
 assign saida_3= register[3];
 assign saida_4 = register[4];
 assign saida_5 = register[5];
 assign saida_6 = register[6];
 assign saida_7 = register[7];

 endmodule

