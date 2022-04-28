module Mux2x1(
	input sel,
	input[31:0] dataIn1, dataIn2,  
	output reg [31:0] dataOut
);
always @(*)
begin
	case(sel)
	1'd0: dataOut = dataIn1;
	1'd1: dataOut = dataIn2;
	endcase
end 
endmodule

module Mux4x1(
	input [1:0] sel,
	input[31:0] dataIn1, dataIn2, dataIn3, dataIn4,
	output reg [31:0] dataOut
);
always @(*)
begin
	case(sel)
	2'd0 : dataOut = dataIn1;
	2'd1 : dataOut = dataIn2;
	2'd2 : dataOut = dataIn3;
	2'd3 : dataOut = dataIn4;
	endcase
end 
endmodule

module ImmSelector(
    input[1:0] selImm,
	input[11:0] immI, immS,
	input[12:0] immB,
	input[20:0] immJ,
	output reg [31:0] imm
);
always@(*)
// Selecting and Sign-Extending Immidiate Values
begin
	case(selImm)
	2'd0 : imm[31:0] = {{20{immI[11]}}, immI[11:0]};
	2'd1 : imm[31:0] = {{20{immS[11]}}, immS[11:0]};
	2'd2 : imm[31:0] = {{19{immB[12]}}, immB[12:0]};
	2'd3 : imm[31:0] = {{11{immJ[20]}}, immJ[20:0]};
	endcase
end 
endmodule

	