module Output (SignOut, dis0, dis1, dis2, dis3, dis4, dis5, dis6, dis7);
	input[31:0] SignOut;
	wire [3:0] D0, D1, D2, D3, D4, D5, D6;
	wire [31:0] twotobin;
	wire sign;
	output [6:0] dis0, dis1, dis2, dis3, dis4, dis5, dis6;
	output reg[6:0] dis7;
	
	twotobin_conv conv(.twocomplement(SignOut), .sign(sign), .binary(twotobin));
	
	BCD convert(.binario(twotobin), .d0(D0), .d1(D1), 
		.d2(D2), .d3(D3), .d4(D4), .d5(D5), .d6(D6));
	
	Display d0(.In(D0), .Out(dis0));
	
	Display d1(.In(D1), .Out(dis1));
	
	Display d2(.In(D2), .Out(dis2));
	
	Display d3(.In(D3), .Out(dis3));
	
	Display d4(.In(D4), .Out(dis4));
	
	Display d5(.In(D5), .Out(dis5));
	
	Display d6(.In(D6), .Out(dis6));
	
	always@(*)begin
		
		dis7 = 7'b1111111;
		if (sign == 1)
			dis7 = 7'b0111111;
		
	end
	
	
endmodule