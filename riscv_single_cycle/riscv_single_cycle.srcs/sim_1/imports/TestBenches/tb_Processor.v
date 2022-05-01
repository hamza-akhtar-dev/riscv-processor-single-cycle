`timescale 1ns / 10ps
module tb_CPU_FPGA();
//Clock Period = 10ns
parameter T = 10;

reg clk, rst;
wire [6:0] cathode;
wire [7:0] anode;

CPU_FPGA UUT(rst, clk, cathode, anode);
//----Clock Generator----//
initial	
	begin
		clk = 0;
		forever	#(T/2)	clk=~clk;
	end
//---Starting Processor--//
initial
	begin
		rst_dut;
	end
//----Reset Sequence----//
task rst_dut;
	begin
		rst <= 0;
		#(10*T); 
		rst <= 1;
	end
endtask
endmodule