module InstructionMemory(
	input [31:0] insAddr,
	output [31:0] instruction
);

reg [7:0] mem [1023:0]; //BYTE-ADDRESSABLE Memory

initial
begin
	//Initializing Memory 
	$readmemh("C:/Users/asus/Documents/Lab Assignments/Digital Systems Design Lab 3rd SEM/Project Part 2/PP2_2019-EE-12/DesignCode/InstructionMem.txt", mem); 
end
//Fetching Instruction
assign instruction = {mem[insAddr+3], mem[insAddr+2], mem[insAddr+1], mem[insAddr]};
endmodule