`timescale 1ns / 10ps
module tb_Processor();
//Clock Period = 10ns
parameter T = 10;

reg clk, rst;

Processor UUT(clk, rst);
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
		#180;
		$stop;
	end
//----Reset Sequence----//
task rst_dut;
	begin
		rst <= 1;
		#(3*T/4); 
		rst <= 0;
	end
endtask
endmodule