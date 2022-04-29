module mux_out(I,select,m_out);
    input [31:0] I;
    //input clk;
    input [2:0] select;
    output reg [3:0] m_out;

//8*1 mux will decide which data will go to seven segment for showing
	always @ (select or I)
	begin
		case(select)
		0: m_out <= I[3:0];
		1: m_out <= I[7:4];
		2: m_out <= I[11:8];
		3: m_out <= I[15:12];
		4: m_out <= I[19:16];
		5: m_out <= I[23:20];
		6: m_out <= I[27:24];
		7: m_out <= I[31:28];
		endcase
	end
endmodule	