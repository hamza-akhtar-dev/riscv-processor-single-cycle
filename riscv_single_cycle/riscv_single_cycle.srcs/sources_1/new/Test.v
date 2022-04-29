`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2022 08:42:20 AM
// Design Name: 
// Module Name: Test
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


module Test(
    input rst, 
    input clk,
    output wire [6:0] cathode,
    output wire [7:0] anode
    
);
    
    Processor CPU (clk, rst, pin);
    seven_seg SVG (cathode, anode, pin, clk, rst);
    
endmodule
