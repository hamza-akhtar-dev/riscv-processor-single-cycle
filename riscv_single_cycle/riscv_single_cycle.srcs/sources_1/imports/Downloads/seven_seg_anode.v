`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2022 02:16:55
// Design Name: 
// Module Name: seven_seg_anode
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


module seven_seg_anode(select,anode);
    input [2:0] select;
    output reg [7:0] anode;
    //seven segment decoder and selector
	always @(select)
	begin
		case(select)
        0: anode <= 8'b11111110;
        1: anode <= 8'b11111101;
        2: anode <= 8'b11111011;
        3: anode <= 8'b11110111; 
        4: anode <= 8'b11101111; 
        5: anode <= 8'b11011111; 
        6: anode <= 8'b10111111; 
        7: anode <= 8'b01111111; 
        endcase
    end
endmodule
