`timescale 1ns / 10ps

module ArithmeticLogicUnit(
	input[3:0] ALUop,
	input[31:0] operand_1, operand_2,
	output reg[31:0] ALUresult
);

parameter ADD  = 4'b0000;
parameter SUB  = 4'b0001;
parameter SLL   = 4'b0010;
parameter SLT  = 4'b0011;
parameter SLTU  = 4'b0100;
parameter XOR  = 4'b0101;
parameter SRL = 4'b0110;
parameter SRA  = 4'b0111;
parameter OR  = 4'b1000;
parameter AND  = 4'b1001;
parameter NULL  = 4'b1010;

initial
begin
    
end

always@(*)
begin
	case(ALUop)
        ADD : ALUresult = operand_1 + operand_2; //ADD
        SUB : ALUresult = operand_1 - operand_2; //SUBTRACT
        OR  : ALUresult = operand_1 | operand_2; //OR
        AND : ALUresult = operand_1 & operand_2; //AND
        XOR : ALUresult = operand_1 ^ operand_2; //XOR
        SLL : ALUresult = operand_1 << operand_2; //SLL
        SRL : ALUresult = operand_1 >> operand_2; //SRL
        SRA : ALUresult = operand_1 >>> operand_2; //SRA
        SLT : ALUresult = ($signed(operand_1) < $signed(operand_2)) ? 1 : 0; //SLT
        SLTU : ALUresult = (operand_1 < operand_2) ? 1 : 0; //SLTU
        NULL : ALUresult = operand_2;
	endcase
end

endmodule
