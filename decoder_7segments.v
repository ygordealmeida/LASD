module decoder_7segments 
(input [3:0] hex_input,
output reg [6:0] segment_out);

always @ (hex_input) begin
	case (hex_input)
		4'h0 : segment_out =  0000001;
		4'h1 : segment_out =  1001111;
		4'h2 : segment_out =  0010010;
		4'h3 : segment_out =  0000110;
		4'h4 : segment_out =  1001100;
		4'h5 : segment_out =  0100100;
		4'h6 : segment_out =  0100000;
		4'h7 : segment_out =  0001111;
		4'h8 : segment_out =  0000000;
		4'h9 : segment_out =  0000100;
		4'hA : segment_out =  0001000;
		4'hB : segment_out =  1100000;
		4'hC : segment_out =  0110000;
		4'hD : segment_out =  1000010;
		4'hE : segment_out =  0110000;
		4'hF : segment_out =  0111000;
	
	default : segment_out = 1111111;
	
	endcase
	end
	
endmodule