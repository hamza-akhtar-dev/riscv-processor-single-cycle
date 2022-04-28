
`timescale 1 ns / 10 ps

module tb_InstructionMemory();

reg[31:0] insAddr;
wire[31:0] instruction;

InstructionMemory UUT (insAddr, instruction);

initial 
begin

insAddr = 32'h00000000;

#5

insAddr = 32'h00000001;

end

endmodule
