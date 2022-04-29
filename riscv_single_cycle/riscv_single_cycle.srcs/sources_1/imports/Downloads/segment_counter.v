`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2022 02:12:27
// Design Name: 
// Module Name: segment_counter
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


module segment_counter(seg_clk,count_seg);
    input seg_clk;
    output reg [2:0] count_seg;
    //seven segment decoder and selector 

    initial
    count_seg<=0;
        
	always @(posedge seg_clk)
	begin
            if (count_seg>=7)   
               count_seg <= 0;
            else
               count_seg <= count_seg+1; 
         end
endmodule
