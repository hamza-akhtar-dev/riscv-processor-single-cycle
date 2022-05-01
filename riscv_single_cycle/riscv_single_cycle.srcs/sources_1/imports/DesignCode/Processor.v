//---------------------------------------------------------------------
//               A Single-Cycle Implementation of the
//               Datapath and Controller for a Reduced
//                    RISC-V Instruction Set
//---------------------------------------------------------------------

module Processor(
	input clk, rst,
	output wire [31:0] tag
);

wire sel_A, sel_B, rf_wr, mem_rd, mem_wr;
wire [1:0] wb_sel, mem_mode;
wire [2:0] br_type, funct3, funct;
wire [3:0] alu_op;
wire [6:0] funct7;

DataPath DP (clk, rst, sel_A, sel_B, rf_wr, mem_rd, mem_wr, wb_sel, mem_mode, br_type, alu_op, funct3, funct, funct7, tag);

Controller CTRL (funct3, funct, funct7, sel_A, sel_B, rf_wr, mem_rd, mem_wr, wb_sel, mem_mode, br_type, alu_op);

endmodule