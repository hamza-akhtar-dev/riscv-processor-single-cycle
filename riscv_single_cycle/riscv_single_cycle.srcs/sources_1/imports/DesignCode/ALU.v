module ArithmeticLogicUnit(
	input[2:0] ALUop,
	input[31:0] operand_1, operand_2,
	output reg[31:0] ALUresult,
	output reg zeroFlag
);

reg[31:0] temp;

always@(*)
begin
	case(ALUop)
	3'b000 : ALUresult = operand_1 + operand_2; //ADD
	3'b001 : ALUresult = operand_1 - operand_2; //SUBTRACT
	3'b010 : ALUresult = operand_1 | operand_2; //OR
	3'b011 : ALUresult = operand_1 & operand_2; //AND
	3'b100 : ALUresult = operand_1 ^ operand_2; //XOR
	3'b101 :begin
	            temp = operand_1 - operand_2;
				ALUresult = (temp[31]==1) ? 1 : 0; //SLT
			end
	3'b110 : ALUresult = (operand_1 < operand_2) ? 1 : 0; //SLTU
	endcase
	if(ALUresult == 0)
		zeroFlag = 1;
	else
		zeroFlag = 0;
end

endmodule
