
//Data Path for RISC-V

module DataPath(
	input clk, rst, sel_A, sel_B, rf_wr, mem_rd, mem_wr,
	input[1:0] wb_sel, mem_mode,
	input[2:0] br_type,
	input[3:0] alu_op,
	output[2:0] funct3, funct,
	output[6:0] funct7,
	output wire[31:0] pin
);

wire br_taken;
wire[4:0]  rs1, rs2, rd;
wire[31:0] pc_in, pc_out, A, B, imm, instruction, wdata, rdata, rdata1, rdata2, alu_out;

reg[31:0] PC4 = 32'd4;

Mux2x1 MX1 (br_taken, pc_out + PC4, alu_out, pc_in);
ProgramCounter PC (rst, clk, pc_in, pc_out);
InstructionMemory IM (pc_out, instruction);
Decoder DC (instruction, funct3, funct, rs1, rs2, rd, funct7, imm);
Mux2x1 MX2 (sel_A, rdata1, pc_out, A);
Mux2x1 MX3 (sel_B, rdata2, imm, B);
BranchCondition BC (br_type, rdata1, rdata2, br_taken);
RegisterFile RF (clk, rf_wr, rs1, rs2, rd, wdata, rdata1, rdata2);
DataMemory DM (clk, mem_rd, mem_wr, mem_mode, alu_out, rdata2, rdata, pin);
Mux4x1 MX4 (wb_sel, alu_out, rdata, pc_out + PC4, 32'd0, wdata);
ArithmeticLogicUnit ALU (alu_op, A, B, alu_out);

endmodule