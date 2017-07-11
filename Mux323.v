module Mux323 (In1, In2, In3, Select, Out);
	input[31:0] In1, In2, In3;
	input[1:0] Select;
	output reg[31:0] Out;
	
	always@(*) begin
	
		case(Select)
			2'b00: Out = In1;
			2'b01: Out = In2;
			2'b10: Out = In3;
			default: Out = 32'b0;
		endcase
	
	end
	
	
endmodule