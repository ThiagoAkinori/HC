module Extensor26 (in, out);
	input [25:0] in;
	output reg [31:0] out;

	always@(in or out) begin

		out = in;
		if(in[25] == 1)
			out = out + 32'b11111100000000000000000000000000;

	end
	
endmodule