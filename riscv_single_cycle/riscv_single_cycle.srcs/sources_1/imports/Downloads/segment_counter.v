`timescale 1ns / 1ps

module Seg_Count(
    input seg_clk,
    output reg [2:0] count_seg
);
    initial
    begin
        count_seg<=0;
    end
        
	always @(posedge seg_clk)
	begin
        if (count_seg >= 7)   
           count_seg <= 0;
        else
           count_seg <= count_seg+1; 
    end
    
endmodule
