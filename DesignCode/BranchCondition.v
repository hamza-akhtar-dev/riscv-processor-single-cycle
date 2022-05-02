`timescale 1ns / 10ps

module BranchCondition(
    input[2:0] br_type,
    input[31:0] operand_1, operand_2,
    output reg br_taken
);
 
parameter NB = 3'b000;   
parameter BEQ = 3'b001;
parameter BNE = 3'b010;
parameter BLT = 3'b011;
parameter UC = 3'b100;

always@(*)
begin
    if((br_type == BEQ) && ($signed(operand_1) == $signed(operand_2)))
        br_taken = 1'b1;
    else if((br_type == BNE) && ($signed(operand_1) != $signed(operand_2)))
        br_taken = 1'b1;
    else if((br_type == BLT) && ($signed(operand_1) < $signed(operand_2)))
        br_taken = 1'b1;
    else if (br_type == NB)
        br_taken = 1'b0;
    else
        br_taken = 1'b0;
        
    if(br_type == UC)
        br_taken = 1'b1; 
        
end

endmodule
