module ControlUnit (input [6:0] OP, Funct7,
input [2:0] Funct3,
output reg [2:0] ULAControl,
output reg ULASrc, RegWrite, ImmSrc, MemWrite, ResultSrc);

always @(*) begin

casex({OP,Funct3,Funct7})
17'b0110011_000_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc} = 8'b1x000000;
17'b0110011_000_0100000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc} = 8'b1x000100;
17'b0110011_111_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc} = 8'b1x001000;
17'b0110011_110_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc} = 8'b1x001100;
17'b0110011_100_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc} = 8'b1x010000;
17'b0110011_010_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc} = 8'b1x010100;
17'b0010011_000_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc} = 8'b10100000;
17'b0000011_000_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc} = 8'b10100001;
17'b0100011_000_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc} = 8'b0110001x;


default : {RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc} = 8'b0000_0000;
endcase


end

endmodule