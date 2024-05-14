module mux_4x1 #(parameter N=12) 
(input [N-1:0] it0,it1, it2, it3,
input [1:0] sel, 
output reg [N-1:0] out);


always @(*) begin

case(sel)
2'b00 : out = it0;
2'b01 : out = it1;
2'b10 : out = it2;
2'b11 : out = it3;
default : out = 0;
endcase

end

endmodule
