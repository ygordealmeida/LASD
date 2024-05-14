module ControlUnit (input [6:0] OP, Funct7,
input [2:0] Funct3,
output reg [2:0] ULAControl,
output reg ULASrc, RegWrite, MemWrite,Branch, Jump, Jr,
output reg [1:0] ImmSrc, ResultSrc);

always @(*) begin

casex({OP,Funct3,Funct7})
17'b0110011_000_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1xx0000000000;
17'b0110011_000_0100000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1xx0001000000;
17'b0110011_111_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1xx0010000000;
17'b0110011_110_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1xx0011000000;
17'b0110011_100_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1xx0100000000;
17'b0110011_010_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1xx0101000000;
17'b0010011_000_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1001000000000;
17'b0000011_000_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1001000001000;
17'b0100011_000_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b00110001xx000;
17'b1100011_000_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b01000010xx100;
17'b1101111_xxx_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b111xxxx010010; //JAL
17'b0010011_110_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1001011000000; // ORI
17'b0010011_111_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1001010000000;// ANDI
17'b0110011_101_0000000 :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b1xx0110000000;//SRL
17'b1100111_000_xxxxxxx :{RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump, Jr} = 13'b000xxxx0xx011; //JALR
default : {RegWrite,ImmSrc,ULASrc,ULAControl,MemWrite,ResultSrc,Branch,Jump} = 13'b0000_0000_0000_0;
endcase


end

endmodule