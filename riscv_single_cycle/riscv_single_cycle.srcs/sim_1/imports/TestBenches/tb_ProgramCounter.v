`timescale 1ns / 1ps

module tb_ProgramCounter();

parameter T = 10;

reg clk, rst;
wire[31:0] PC;

ProgramCounter UUT (clk, rst, PC);

initial	
begin
	clk = 0;
	forever	#(T/2)	clk=~clk;
end

initial
begin
	rst_dut;
end

task rst_dut;
begin
	rst <= 1;
	#(3*T/4); 
	rst <= 0;
end
endtask

endmodule