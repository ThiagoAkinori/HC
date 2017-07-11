module Display(Out, In);
	input[3:0] In;
	output reg[6:0] Out;
	
	
	always@(*)
		begin
			case(In)
				0: Out = 7'b1000000;
				1: Out = 7'b1111001;
				2: Out = 7'b0100100;
				3: Out = 7'b0110000;
				4: Out = 7'b0011001;
				5: Out = 7'b0010010;
				6: Out = 7'b0000010;
				7: Out = 7'b1111000;
            8: Out = 7'b0000000;
            9: Out = 7'b0010000;
				default: Out = 7'b1111111;	
			endcase
		end
endmodule
