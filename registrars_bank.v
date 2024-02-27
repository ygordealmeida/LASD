module registrars_bank 
(input [7:0] wd3,
input [2:0] wa3,
input we3, clk,
input [2:0] ra1, ra2,
input rst,
output [7:0] rd1, rd2);

reg [7:0] register [7:0];
//assign register[0]=0;
//assign register[wa3] = (we3&(|wa3))?wd3:register[wa3]; //Se we3 for 1 e wa3 diferente de 0 recebe wd3 se nao continua o mesmo valor
//assign register[7:0] = (!rst)?0:register[7:0];

always @ (posedge clk)
begin
		register[0]<=0;
		if (we3==1 & wa3 != 0)
			register[wa3]=wd3;
		if (rst==0) // EM verilog nao podemos mudar todos os arrays de uma vez
		
		begin
				repeat(7)
				begin 
					reg[3:0] i=1;
					register[i]<=0;
					i = i+1;
				end
		end

end

assign rd1 = register[ra1];
assign rd2 = register[ra2];


endmodule