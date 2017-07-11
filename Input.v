module Input(Switches, InRead, InputCtr, InputOut);
	input [14:0] Switches;
	input InputCtr, InRead;
	output reg [31:0] InputOut;

	always@(*) begin

		if (InputCtr == 1) begin
			if (InRead == 1) begin
				InputOut = {17'b0,Switches};
				if (Switches[14] == 1)
					InputOut = InputOut + 32'b11111111111111111000000000000000;
			end
		end
	end
endmodule