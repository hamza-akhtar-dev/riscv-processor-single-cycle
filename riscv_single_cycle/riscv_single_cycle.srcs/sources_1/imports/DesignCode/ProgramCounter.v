`timescale 1ns / 10ps

module ProgramCounter(
	input rst, clk,
	input[31:0] pc_in,
	output reg[31:0] pc_out
);
always @(posedge clk or posedge rst)
begin
	if(rst)
		pc_out <= 0; // Reset to ZERO
	else
		pc_out <= pc_out + pc_in;
end
endmodule