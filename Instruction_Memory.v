module Instruction_Memory (input [7:0] A,
output reg [31:0] RD);

always @(*)
begin

	case(A)
	8'h00 : RD = 32'h0ab00093;
	8'h04 : RD = 32'h00100523;
	8'h08 : RD = 32'h00a00103;
	8'h0c : RD = 32'h002005a3;
	8'h10 : RD = 32'h00b00183;
	8'h14 : RD = 32'h00300623;
	8'h18 : RD = 32'h00c00203;
	endcase

end



endmodule 