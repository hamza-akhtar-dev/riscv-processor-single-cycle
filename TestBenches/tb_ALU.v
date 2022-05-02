
`timescale 1ns / 10ps

module tb_ArithmeticLogicUnit();

reg[31:0] operand_1;
reg[31:0] operand_2;
reg[2:0] ALUop;
wire[31:0] result;

ArithmeticLogicUnit UUT (ALUop, operand_1, operand_2, result);

initial 
begin

#2
//Adding 5 and 6
operand_1 <= 5; operand_2 <= 6; ALUop <= 3'b000;
#2
//Subtracting 3 from 7
operand_1 <= 7; operand_2 <= 3; ALUop <= 3'b001;
#2
//ORing 3 and 1
operand_1 <= 3; operand_2 <= 1; ALUop <= 3'b010;
#2
//ANDing 3 and 5
operand_1 <= 3; operand_2 <= 5; ALUop <= 3'b011;
#2
//XORing 5 and 2
operand_1 <= 5; operand_2 <= 2; ALUop <= 3'b100;
#2
//SLT -6 and 4
operand_1 <= -6; operand_2 <= 4; ALUop <= 3'b101;
#2
//SLTU 5 and 6
operand_1 <= 5; operand_2 <= 6; ALUop <= 3'b110;
#2

$stop;

end
endmodule



