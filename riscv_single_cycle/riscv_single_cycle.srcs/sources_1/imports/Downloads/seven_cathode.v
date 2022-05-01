module Seg_Cathode(
    input [3:0] data,
    output reg [6:0] cathode
);
    
    initial
    begin
        cathode=0;
    end

    always @(*)
    begin
        case(data)
        4'b0000: cathode <= 7'b0000001; // "0"     
        4'b0001: cathode <= 7'b1001111; // "1" 
        4'b0010: cathode <= 7'b0010010; // "2" 
        4'b0011: cathode <= 7'b0000110; // "3" 
        4'b0100: cathode <= 7'b1001100; // "4" 
        4'b0101: cathode <= 7'b0100100; // "5" 
        4'b0110: cathode <= 7'b0100000; // "6" 
        4'b0111: cathode <= 7'b0001111; // "7" 
        4'b1000: cathode <= 7'b0000000; // "8"     
        4'b1001: cathode <= 7'b0000100; // "9"
		4'b1010: cathode <= 7'b0001000; // "A"     
        4'b1011: cathode <= 7'b1100000; // "b"     
        4'b1100: cathode <= 7'b0110001; // "C"     
        4'b1101: cathode <= 7'b1000010; // "d"     
        4'b1110: cathode <= 7'b0110000; // "E"     
        4'b1111: cathode <= 7'b0111000; // "F"     
        
        default: cathode = 7'b1111111; // "-"
        endcase
    end

endmodule