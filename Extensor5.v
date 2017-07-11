module Extensor5 (in, out);
	input[4:0] in;
	output reg [31:0] out;

	always @(in or out) begin
	
        out = in;    

	end

endmodule