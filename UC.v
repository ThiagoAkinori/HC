module UC(opcode, outend, aluctr, branchselect, halt, inputctr, 
	jumpsl, memwrite, shift, inread, regread, regwrite, selreg, 
	write, writeenable, writesel, outctr, regbranch);	
	
	input[5:0] opcode;
	input inread, outend;
	output reg [3:0] aluctr;
	output reg [2:0] branchselect;
	output reg halt, inputctr, memwrite, shift, regwrite,
		jumpsl, regread, writeenable, outctr, regbranch;
	output reg [1:0] selreg, write, writesel;
	
	always@(*)begin 
		
		case(opcode)
			6'b000000: begin //nop
				aluctr=4'b0000;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 0;
				regwrite = 0;
				selreg = 2'b00;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b00;
				outctr = 0;
				regbranch = 0;
			end
			6'b000001: begin //add
				aluctr=4'b0001;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 1;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b10;
				outctr = 0;
				regbranch = 0;
			end
			6'b000010: begin //sub
				aluctr=4'b0010;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 1;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b10;
				outctr = 0;
				regbranch = 0;
			end
			6'b000011: begin //lw
				aluctr=4'b0000;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 1;
				selreg = 2'b01;
				write = 2'b01;
				writeenable = 0;
				writesel = 2'b10;
				outctr = 0;
				regbranch = 0;
			end
			6'b000100: begin //mov
				aluctr=4'b0000;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 1;
				selreg = 2'b01;
				write = 2'b10;
				writeenable = 0;
				writesel = 2'b10;
				outctr = 0;
				regbranch = 0;
			end
			6'b000101: begin //sw
				aluctr=4'b0000;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 0;
				selreg = 2'b00;
				write = 2'b00;
				writeenable = 1;
				writesel = 2'b00;
				outctr = 0;
				regbranch = 0;
			end
			6'b000110: begin //li
				aluctr=4'b0000;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 0;
				regwrite = 1;
				selreg = 2'b00;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b00;
				outctr = 0;
				regbranch = 0;
			end
			6'b000111: begin //and
				aluctr=4'b0100;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 1;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b10;
				outctr = 0;
				regbranch = 0;
			end
			6'b001000: begin //or
				aluctr=4'b0100;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 1;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b10;
				outctr = 0;
				regbranch = 0;
			end
			6'b001001: begin //not
				aluctr=4'b0101;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 1;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b10;
				outctr = 0;
				regbranch = 0;
			end
			6'b001010: begin //xor
				aluctr=4'b0110;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 1;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b10;
				outctr = 0;
				regbranch = 0;
			end
			6'b001011: begin //sll
				aluctr=4'b0111;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 1;
				regread = 1;
				regwrite = 1;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b10;
				outctr = 0;
				regbranch = 0;
			end
			6'b001100: begin //srl
				aluctr=4'b1000;
				branchselect = 3'b101;
				halt = 0;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 1;
				regread = 1;
				regwrite = 1;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b10;
				outctr = 0;
				regbranch = 0;
			end
			6'b001101: begin //beq
				aluctr=4'b0010;
				branchselect = 3'b001;
				halt = 0;
				inputctr = 0;
				jumpsl = 1;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 0;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b00;
				outctr = 0;
				regbranch = 1;
			end
			6'b001110: begin //bne
				aluctr=4'b0010;
				branchselect = 3'b010;
				halt = 0;
				inputctr = 0;
				jumpsl = 1;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 0;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b00;
				outctr = 0;
				regbranch = 1;
			end
			6'b001111: begin //bgt
				aluctr=4'b0010;
				branchselect = 3'b011;
				halt = 0;
				inputctr = 0;
				jumpsl = 1;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 0;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b00;
				outctr = 0;
				regbranch = 1;
			end
			6'b010000: begin //blt
				aluctr=4'b0010;
				branchselect = 3'b100;
				halt = 0;
				inputctr = 0;
				jumpsl = 1;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 0;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b00;
				outctr = 0;
				regbranch = 1;
			end
			6'b010001: begin //j
				aluctr=4'b0000;
				branchselect = 3'b000;
				halt = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 0;
				regwrite = 0;
				selreg = 2'b00;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b00;
				outctr = 0;
				regbranch = 0;
			end
			6'b010010: begin //jr
				aluctr=4'b0000;
				branchselect = 3'b000;
				halt = 0;
				inputctr = 0;
				jumpsl = 1;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 0;
				selreg = 2'b10;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b00;
				outctr = 0;
				regbranch = 0;
			end
			6'b010011: begin //in
				aluctr=4'b0000;
				branchselect = 3'b101;
				halt = 1;
				inputctr = 1;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 0;
				regwrite = 1;
				selreg = 2'b00;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b01;
				outctr = 0;
				regbranch = 0;
				if (inread== 1)
					halt = 0;
				else
					halt = 1;
			end
			6'b010100: begin //out
				aluctr=4'b0000;
				branchselect = 3'b101;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 1;
				regwrite = 0;
				selreg = 2'b00;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b00;
				outctr = 1;
				regbranch = 0;
				if (outend == 1)
					halt = 0;
				else
					halt = 1;
			end
			6'b111111: begin //hlt
				aluctr=4'b0000;
				branchselect = 3'b101;
				halt = 1;
				inputctr = 0;
				jumpsl = 0;
				memwrite = 0;
				shift = 0;
				regread = 0;
				regwrite = 0;
				selreg = 2'b00;
				write = 2'b00;
				writeenable = 0;
				writesel = 2'b00;
				outctr = 0;
				regbranch = 0;
			end
		endcase
		
	end
endmodule 