module ULA (input [7:0] SrcA, SrcB,
input [2:0] ULAControl,
output Z,
output reg [7:0] ULAResult);

always @(*) begin		
	case (ULAControl) // PERGUNTAR SOBRE O OPERADOR <= EM VISTA QUE A ULA É COMBINACIONAL, MAS PRECISA DE UM REG PRA MONTAR ELA
		3'b000 : ULAResult <= SrcA + SrcB; 
		3'b001 : ULAResult <= SrcA + (~SrcB) +1;
		3'b010 : ULAResult <= SrcA & SrcB;
		3'b100 : ULAResult <= ~(SrcA | SrcB);
		3'b101 : ULAResult <= (SrcA<SrcB)?1:0;
		default :	ULAResult <= 0;
	endcase
	
end

assign Z = (ULAResult==1'b0)?1:0;

endmodule
