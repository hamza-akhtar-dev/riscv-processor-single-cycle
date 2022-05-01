`timescale 1ns / 1ps

module CPU_FPGA(
    input rst, 
    input clk,
    output wire [6:0] cathode,
    output wire [7:0] anode
);
    
    wire [31:0] tag;
    
    Processor CPU (clk, ~rst, tag);
    
    Seven_Seg SVG (clk, tag, cathode, anode);
    
endmodule