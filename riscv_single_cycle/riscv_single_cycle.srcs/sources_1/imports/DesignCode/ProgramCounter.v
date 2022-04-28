module ProgramCounter(
	input rst, clk,
	input[31:0] PC_in,
	output reg[31:0] PC_out
);
always @(posedge clk or posedge rst)
begin
	if(rst)
		PC_out <= 0; // Reset to ZERO
	else
		PC_out <= PC_out + PC_in;
end
endmodule