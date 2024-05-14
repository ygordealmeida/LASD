module frequency_divider_2HZ
(input clock_50Mhz,
output reg clock_2hz);

reg [25:0] counter ; //São necessários 26 bits para armazenar a contagem do clock_

always @ (posedge clock_50Mhz)
begin

	if (counter==12500000)
	begin
	clock_2hz = ~clock_2hz;
	counter =0;
	end
	
	else 
	counter = counter+1;

	end
endmodule	