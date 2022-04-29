`timescale 1ns / 10ps

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

	