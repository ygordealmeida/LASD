module decoder_rot
(input [3:0] hex_input,
output reg [0:6] segment_out0, segment_out1, segment_out2, segment_out3);

always @ (hex_input) begin
	case (hex_input)
		4'h0 : begin 
		segment_out0 =  7'b0111111; 
		segment_out1 =  7'b1111111;
		segment_out2 =  7'b1111111;
		segment_out3 =  7'b1111111;
		end
		4'h1 : begin 
		segment_out1 =  7'b0111111;
		segment_out0 =  7'b1111111;
		segment_out2 =  7'b1111111;
		segment_out3 =  7'b1111111;
		end
		4'h2 : begin
		segment_out2 =  7'b0111111;
		segment_out0 =  7'b1111111;
		segment_out1 =  7'b1111111;
		segment_out3 =  7'b1111111;
		end
		4'h3 : begin
		segment_out3 =  7'b0111111;
		segment_out0 =  7'b1111111;
		segment_out1 =  7'b1111111;
		segment_out2 =  7'b1111111;
		end
		4'h4 : begin
		segment_out3 =  7'b1011111;
		segment_out0 =  7'b1111111;
		segment_out2 =  7'b1111111;
		segment_out2 =  7'b1111111;
		end
		4'h5 : begin
		segment_out3 =  7'b1101111;
		segment_out0 =  7'b1111111;
		segment_out2 =  7'b1111111;
		segment_out2 =  7'b1111111;
		end
		4'h6 : begin
		segment_out3 =  7'b1110111;
		segment_out0 =  7'b1111111;
		segment_out2 =  7'b1111111;
		segment_out1 =  7'b1111111;
		end
		4'h7 : begin
		segment_out2 =  7'b1110111;
		segment_out0 =  7'b1111111;
		segment_out1 =  7'b1111111;
		segment_out3 =  7'b1111111;
		end
		4'h8 : begin
		segment_out1 =  7'b1110111;
		segment_out0 =  7'b1111111;
		segment_out2 =  7'b1111111;
		segment_out3 =  7'b1111111;
		end
		4'h9 :begin
		segment_out0 =  7'b1110111;
		segment_out1 =  7'b1111111;
		segment_out2 =  7'b1111111;
		segment_out3 =  7'b1111111;
		end
		4'hA :begin
		segment_out0 =  7'b1111011;
		segment_out1 =  7'b1111111;
		segment_out2 =  7'b1111111;
		segment_out3 =  7'b1111111;
		end
		4'hB :begin 
		segment_out0 =  7'b1111101;
		segment_out1 =  7'b1111111;
		segment_out2 =  7'b1111111;
		segment_out3 =  7'b1111111;
		end
		
	
	default : begin 
	segment_out0 = 7'b1111111;
	segment_out1 = 7'b1111111;
	segment_out2 = 7'b1111111;
	segment_out3 = 7'b1111111;
	end
	endcase
	end
	
endmodule