module HardCore (switches, autoclk, reset, inread, outend,
	display0, display1, display2, display3, display4, display5, 
	display6, display7, clk, pc);
	
	
	input[14:0] switches;
	input autoclk, clk;
	input reset; 
	input inread, outend;
	
	output [31:0] pc;
	
	output [6:0] display0, display1, display2, display3, display4, 
		display5, display6, display7;
	
	wire [4:0] writereg;
	wire [31:0] ext1out, readdatamem, in, regdata, aluin2, shamt, 
		memreaddata, salto, desvio, regbdata, regcdata,  regwritedata, 
		outin, instruction, jump, memdata, aluout, regadata, pc;
	wire branchctr, overflow, inputctr, regwrite, regread, shift, 
		memwrite, writeenable, regbranch, jumpsl,	halt, outctr, sysstop;
	wire[1:0] selreg, writesel, write;
	wire [2:0] branchselect;
	wire [3:0] aluctr;
	wire clock;
	
	//DeBounce db(.clk(autoclk), .n_reset(1), .button_in(~clk), .DB_out(clock));
	
	assign clock = clk;
	
	InstructionMemory instmem(.PC(pc), .InstructOut(instruction));
	
	UC uc(.opcode(instruction[31:26]), .outend(outend), .aluctr(aluctr), 
		.branchselect(branchselect), .halt(halt), .inputctr(inputctr), 
		.jumpsl(jumpsl), .memwrite(memwrite), .shift(shift), .inread(inread), 
		.regread(regread), .regwrite(regwrite), .selreg(selreg), .write(write), 
		.writeenable(writeenable), .writesel(writesel), .outctr(outctr), 
		.regbranch(regbranch));
	
	
	Input inp(.Switches(switches), 
		.InRead(inread), 
		.InputCtr(inputctr), 
		.InputOut(in));
	
	Mux35 mux1(.Reg1(instruction[25:21]), 
		.Reg2(instruction[20:16]), 
		.Reg3(instruction[15:11]), 
		.RegCtr(selreg), 
		.RegOut(writereg));
	
	Extensor21 ext1(.in(instruction[20:0]), .out(ext1out));
	
	Mux323 mux2 (.In1(ext1out), 
		.In2(in), 
		.In3(regwritedata), 
		.Select(writesel), 
		.Out(regdata));
	
	RegisterBank rgbank(.RegA(instruction[25:21]), 
		.RegB(instruction[20:16]), 
		.RegC(writereg), 
		.WriteData(regdata), 
		.RegWrite(regwrite), 
		.RegRead(regread), 
		.clock(clock), 
		.OutA(regadata), 
		.OutB(regbdata), 
		.OutC(regcdata));
	
	Extensor5 ext2(.in(instruction[10:6]), .out(shamt));
	
	Mux32 mux3 (.In1(regbdata), .In2(shamt), .Ctr(shift), .Out(aluin2));
	
	ULA ula(.overflow(overflow), 
		.DataIn1(regadata), 
		.DataIn2(aluin2), 
		.DataOut(aluout), 
		.ULASelect(aluctr));
	
	Mux32 mux4 (.In1(32'b0), .In2(regadata), .Ctr(outctr), .Out(outin));
	
	Output out (.SignOut(outin), 
		.dis0(display0), 
		.dis1(display1), 
		.dis2(display2), 
		.dis3(display3), 
		.dis4(display4), 
		.dis5(display5), 
		.dis6(display6), 
		.dis7(display7));
	
	Mux32 mux5 (.In1(regbdata), .In2(ext1out), .Ctr(memwrite), .Out(memdata));
	
	Memory mem (.Address(regadata), 
		.WriteData(memdata), 
		.WriteEnable(writeenable),
		.clock(clock), 
		.ReadData(memreaddata));
	
	Mux323 mux6 (.In1(aluout), .In2(memreaddata), .In3(regadata), .Select(write), 
		.Out(regwritedata));
	
	BranchControl brctr(.BranchSelect(branchselect), 
		.ULAout(aluout), 
		.LineSelection(branchctr));
	
	Extensor26 ext3 (.in(instruction[25:0]), .out(salto));
	
	Mux32 mux7(.In1(regadata), .In2(regcdata), .Ctr(regbranch), .Out(desvio));
	
	Mux32 mux8(.In1(salto), .In2(desvio), .Ctr(jumpsl), .Out(jump));
	
	assign sysstop = halt | overflow;
	
	PC programcounter(.PC(pc), 
		.NewPC(pc), 
		.halt(sysstop), 
		.BranchCtr(branchctr), 
		.Jump(jump), 
		.reset(reset), 
		.clock(clock));
		
endmodule
