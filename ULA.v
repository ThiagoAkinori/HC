module ULA(overflow, DataIn1, DataIn2, DataOut, ULASelect);
	input[31:0] DataIn1, DataIn2;
	input[3:0] ULASelect;
	output reg[31:0] DataOut;
	output reg overflow;
	reg carry1, carry2;
	reg[30:0] PartialSum;
    
	always @(*) begin
		
		case(ULASelect[3:0])
			4'b0000: DataOut = 0;
			4'b0001: begin  //soma
				{carry1,PartialSum} = DataIn1[30:0] + DataIn2[30:0];
				{carry2,DataOut} = DataIn1 + DataIn2;
			end
			4'b0010: begin //subtração
				{carry1,PartialSum} = DataIn1[30:0] - DataIn2[30:0];
				{carry2,DataOut} = DataIn1 - DataIn2;
			end
			4'b0011: DataOut = DataIn1 & DataIn2;  //and
			4'b0100: DataOut = DataIn1 | DataIn2;  //or 
			4'b0101: DataOut = ~DataIn1;           //not
			4'b0110: DataOut = DataIn1 ^ DataIn2;  //xor
			4'b0111: DataOut = DataIn1 >> DataIn2; //shift left
			4'b1000: DataOut = DataIn1 << DataIn2; //shift right
			default: DataOut = 0;
		endcase
		
		if (ULASelect == 4'b0001||ULASelect == 4'b0010)
			overflow = carry1 ^ carry2;
		else
			overflow = 0;
	end

endmodule
