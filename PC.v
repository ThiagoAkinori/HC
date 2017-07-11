module PC(PC, NewPC, halt, BranchCtr, Jump, reset, clock);
	input [31:0] PC, Jump;
	input reset ,halt, BranchCtr, clock;
	output reg [31:0] NewPC;

	always @(posedge clock) begin
		if (halt == 1)
			NewPC = PC;
		else 
			if (BranchCtr == 1)
				NewPC = Jump;
			else
				NewPC = PC+1;
		if (reset == 1)
			NewPC = 0;
	end

endmodule

