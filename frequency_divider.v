module frequency_divider
(input clock_50Mhz,
output reg clock_1hz);

reg [25:0] counter ; //São necessários 26 bits para armazenar a contagem do clock_

always @ (posedge clock_50Mhz)
begin

	if (counter==25000000)
	begin
	clock_1hz = ~clock_1hz;
	counter =0;
	end
	
	else 
	counter = counter+1;

	end
endmodule	