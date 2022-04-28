module Adder(
	input[31:0] operand_1, operand_2,
	output reg[31:0] result
);
always@(*)
begin
	result <= operand_1 + operand_2;
end
endmodule