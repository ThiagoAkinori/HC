module BranchControl (BranchSelect, ULAout, LineSelection);
	input [31:0] ULAout;
	input [2:0] BranchSelect;
	output reg LineSelection;

	always @ (*) begin
		
		case(BranchSelect[2:0])
			3'b000: LineSelection = 1;//j e jr
			3'b001: 
				if (ULAout == 0) //beq
					LineSelection = 1;
				else
					LineSelection = 0;
			3'b010: 
				if (ULAout != 0) //bne
					LineSelection = 1;
				else
					LineSelection = 0;
			3'b011:
				if ($signed(ULAout) > 0) //bgt
					LineSelection = 1;
				else
					LineSelection = 0;
			3'b100:
				if ($signed(ULAout) < 0) //blt
					LineSelection = 1;
				else
					LineSelection = 0;
			3'b101: LineSelection = 0; //nada
			default: LineSelection = 0;
		endcase
		
	end
endmodule