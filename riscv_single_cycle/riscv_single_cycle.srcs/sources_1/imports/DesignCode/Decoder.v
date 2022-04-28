module Decoder(
	input[31:0] instruction, 
	output[6:0] opcode, funct7, 
	output[2:0] funct3, 
	output[4:0] src1, src2, dst, 
	output[11:0] immI, immS, 
	output[12:0] immB, 
	output[20:0] immJ
);

assign opcode = instruction[6:0];
assign destin = instruction[11:7];
assign funct3 = instruction[14:12];
assign src1 = instruction[19:15];
assign src2 = instruction[24:20];
assign funct7 = instruction[31:25];
assign dst = instruction[11:7];


assign immI = {funct7, src2};
assign immS = {funct7, dst};
assign immB = {instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
assign immJ = {instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};

endmodule

