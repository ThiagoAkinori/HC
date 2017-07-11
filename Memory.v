module Memory(Address, WriteData, WriteEnable,clock, ReadData);

	reg [31:0] DataMemory[20:0];
	input [31:0] WriteData, Address;
	input WriteEnable, clock;
	output [31:0] ReadData;
    

	always @(posedge clock) begin
    
		if (WriteEnable == 1) 
			DataMemory[Address] = WriteData;
				
	end
    
	assign ReadData = DataMemory[Address];
    
endmodule