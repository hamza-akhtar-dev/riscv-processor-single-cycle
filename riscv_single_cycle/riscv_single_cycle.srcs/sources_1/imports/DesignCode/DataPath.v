
//Data Path for RISC-V

module DataPath(
	input clk, rst, isImm, memWrite, rfWrite, waddrSel, 
	input[1:0] pcSel, immSel, wbackSel,
	input[2:0] ALUop,
	output zeroFlag,
	output[2:0] funct3,
	output[6:0] opcode, funct7
);

wire[31:0] instruction, wdata, rdata1, rdata2, op2, ALUresult,Br, PC_in, PC_out, LWdata, imm;
wire[20:0] immJ;
wire[12:0] immB;
wire[11:0] immI, immS;
wire[4:0] src1, src2, dst;

reg[31:0] PC4 = 31'd4;
ProgramCounter PC (rst, clk, PC_in, PC_out);
Mux4x1 MX1 (pcSel, PC4, imm, ALUresult, 32'd0, PC_in);
Adder AD1(PC_out, imm, Br);
InstructionMemory IM (PC_out, instruction);
Decoder DC (instruction, opcode, funct7, funct3, src1, src2, dst, immI, immS, immB, immJ);
ImmSelector IS (immSel, immI, immS, immB, immJ, imm); 
Mux2x1 MX2 (isImm, rdata2, imm, op2);
RegisterFile RF (clk, rfWrite, src1, src2, dst, wdata, rdata1, rdata2);
DataMemory DM(clk, memWrite, ALUresult, rdata2, LWdata);
ArithmeticLogicUnit ALU (ALUop, rdata1, op2, ALUresult, zeroFlag);
Mux4x1 MX3 (wbackSel, ALUresult, LWdata, PC4, 32'd0, wdata);

endmodule