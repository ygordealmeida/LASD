module mux_2x1 #(parameter N=8) 
(input [N-1:0] it0,it1, 
input sel, 
output[N-1:0] out);

	assign out = (sel==1'b1)?it1:it0; //Se Sel for 1 atribui a out o valor de i1

endmodule
