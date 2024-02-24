module counter_rot
(input clk, rst, 
output reg [3:0] value);

  always @ (posedge clk,negedge  rst) begin
	if (rst==0) 
		value = 0;
		
    else if (value >=11)
		value =0;
	else
		value = value +1;
	end
	
endmodule
