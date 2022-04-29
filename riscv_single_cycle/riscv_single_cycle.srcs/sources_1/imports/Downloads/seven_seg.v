`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2022 12:42:36
// Design Name: 
// Module Name: lab7
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seven_seg(cathode,anode,data,clk,reset);
    output [6:0] cathode;
    output [7:0] anode;
    input [31:0] data;
    input clk;
    input reset;
    wire [3:0] m_out;
	wire seg_clk;
	wire [2:0] count_seg;
	
	//dividing input clock to display collectively on seven segments
	freq_div fq(clk,seg_clk);
	//segment counter based on segment clock
	segment_counter scount(seg_clk,count_seg);
	//8*1 mux will decide which data will go to seven segment for showing
	mux_out mo8(data,count_seg,m_out);
	// Anode selector for 7 segment display
	seven_seg_anode(count_seg,anode);
	// Cathode patterns of the 7-segment 1 LED display 
	seven_cathode sc(m_out,cathode);
	   
endmodule
