`timescale 1ns / 1ps

module Seven_Seg(
    input clk,
    input [31:0] data,
    output [6:0] cathode,
    output [7:0] anode
);

	wire seg_clk;
	wire [2:0] seg_count;
	wire [3:0] seg_data;
	
	Freq_Div FDIV (clk, seg_clk);
	
	Seg_Count SCOUNT (seg_clk, seg_count);

	Seg_Mux SMUX (data, seg_count, seg_data);

	Seg_Anode SANOD (seg_count, anode);

	Seg_Cathode SCATH (seg_data, cathode);
	   
endmodule
