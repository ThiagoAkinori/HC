module Extensor21(in, out);
    input [20:0] in;
    output reg [31:0] out;
    
    always @(in or out) begin
        
		out = in;
		if (in[20]==1)
			out = out + 32'b11111111111000000000000000000000;
        
    end
endmodule