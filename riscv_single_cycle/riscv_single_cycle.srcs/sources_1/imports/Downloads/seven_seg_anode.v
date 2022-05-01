`timescale 1ns / 1ps

module Seg_Anode(
    input [2:0] select,
    output reg [7:0] anode
);
 
	always @(*)
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
