//---------------------------------------------------------------------
//               A Single-Cycle Implementation of the
//               Datapath and Controller for a Reduced
//                    RISC-V Instruction Set
//---------------------------------------------------------------------

module Processor(
	input clk, rst
);

wire isImm, memWrite, rfWrite, zeroFlag, waddrSel;
wire[1:0] pcSel, wbackSel, immSel;
wire[2:0] funct3, ALUop;
wire[6:0] opcode, funct7;

DataPath DP (clk, rst, isImm, memWrite, rfWrite, 
waddrSel, pcSel, immSel, wbackSel, ALUop, 
zeroFlag, funct3, opcode, funct7);

Controller CTRL (zeroFlag, funct3, opcode, funct7, 
isImm, memWrite, rfWrite, waddrSel, 
pcSel, immSel, wbackSel, ALUop);

endmodule