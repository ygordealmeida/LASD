module Instruction_Memory (input [7:0] A,
output reg [31:0] RD);

always @(*)
begin

	case(A)
	8'h00 : RD <= 32'h00700293;
	8'h04 : RD <= 32'h00c000ef;
	8'h08 : RD <= 32'h0082e193;
	8'h0c : RD <= 32'h00c000ef;
	8'h10 : RD <= 32'h0012f113;
	8'h14 : RD <= 32'h00008067;
	8'h18 : RD <= 32'h0022d233;

	endcase

end



endmodule 


