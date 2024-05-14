module parallel_out
(input [7:0] RegData,
input [7:0] Address,
input EN, clk,
input rst,
output reg [7:0] Data_Out);
wire enable;
always @ (posedge clk or negedge rst)
begin
	if(!rst)
		Data_Out <= 0;
	else if(EN == 1 && Address == 8'hFF)
		Data_Out <= RegData;
end	
		
		
endmodule	
	