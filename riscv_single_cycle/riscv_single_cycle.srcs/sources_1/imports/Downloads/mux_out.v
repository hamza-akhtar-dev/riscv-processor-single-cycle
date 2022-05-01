module Seg_Mux(
    input [31:0] data,
    input [2:0] select,
    output reg [3:0] m_out
);

	always @(*)
	begin
		case(select)
            0: m_out <= data[3:0];
            1: m_out <= data[7:4];
            2: m_out <= data[11:8];
            3: m_out <= data[15:12];
            4: m_out <= data[19:16];
            5: m_out <= data[23:20];
            6: m_out <= data[27:24];
            7: m_out <= data[31:28];
		endcase
	end
	
endmodule	