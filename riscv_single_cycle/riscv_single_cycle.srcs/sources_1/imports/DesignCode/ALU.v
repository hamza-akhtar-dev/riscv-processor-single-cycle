module ArithmeticLogicUnit(
	input[3:0] ALUop,
	input[31:0] operand_1, operand_2,
	output reg[31:0] ALUresult,
	output reg zeroFlag
);

reg[31:0] temp;

always@(*)
begin

	case(ALUop)
        4'b0000 : ALUresult = operand_1 + operand_2; //ADD
        4'b0001 : ALUresult = operand_1 - operand_2; //SUBTRACT
        4'b0010 : ALUresult = operand_1 | operand_2; //OR
        4'b0011 : ALUresult = operand_1 & operand_2; //AND
        4'b0100 : ALUresult = operand_1 ^ operand_2; //XOR
        4'b0101 : ALUresult = operand_1 << operand_2; //SLL
        4'b0110 : ALUresult = operand_1 >> operand_2; //SRL
        4'b0111 : ALUresult = operand_1 >>> operand_2; //SRA
        4'b1000 : ALUresult = ($signed(operand_1) < $signed(operand_2)) ? 1 : 0; //SLT
        4'b1001 : ALUresult = (operand_1 < operand_2) ? 1 : 0; //SLTU
	endcase
	
	if(ALUresult == 0)
		zeroFlag = 1;
	else
		zeroFlag = 0;
		
end

endmodule
