module RegisterBank(RegA, RegB, RegC, WriteData, RegWrite, RegRead, clock, OutA, OutB, OutC);

	input [4:0] RegA, RegB, RegC;
	input [31:0] WriteData;
	input RegWrite, clock, RegRead;
	output reg [31:0] OutA, OutB, OutC;
	reg [31:0] Register[31:0];

	
	always @(posedge clock) begin
		
		if (RegWrite == 1)
			Register[RegC] = WriteData;

	end
	
	always @(*) begin
		
		if (RegRead == 1) begin
	        OutA = Register[RegA];
	        OutB = Register[RegB];
	        OutC = Register[RegC];
      end
		else begin
			OutA = 0;
			OutB = 0;
			OutC = 0;
		end

	end
	
endmodule