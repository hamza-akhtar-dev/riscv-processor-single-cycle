`timescale 1ns / 10ps

module InstructionMemory(
	input [31:0] insAddr,
	output [31:0] instruction
);

reg [7:0] mem [1023:0]; //BYTE-ADDRESSABLE Memory

initial
begin
	//Initializing Memory 
	$readmemh("InstructionMem.mem", mem); 
end
//Fetching Instruction
assign instruction = {mem[insAddr], mem[insAddr+1], mem[insAddr+2], mem[insAddr+3]};
endmodule