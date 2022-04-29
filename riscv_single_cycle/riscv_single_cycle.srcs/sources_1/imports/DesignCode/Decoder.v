`timescale 1ns / 10ps

module Decoder(
	input [31:0] instruction, 
	output reg [2:0] funct3, type,
	output reg [4:0] rs1, rs2, rd,
	output reg [6:0] funct7,
	output reg [31:0] imm
);

parameter R_type = 3'b000; //R_Type
parameter I_type = 3'b001; //I-Type
parameter L_type = 3'b010; //L-Type
parameter S_type= 3'b011;  //S-Type
parameter B_type= 3'b100;  //B-Type
parameter U_type= 3'b101;  //U-Type
parameter J_type= 3'b110;  //J-Type

reg[6:0] opcode;

always@(*)
begin
  opcode = instruction[6:0];
end

always@(*)
begin
    case(opcode)
        7'b0110011: type = R_type;
        7'b0010011: type = I_type;
        7'b0000011: type = L_type;
        7'b0100011: type = S_type;
        7'b1100011: type = B_type;
        7'b0110111: type = U_type;
        7'b1100111: type = J_type;
   endcase
end

always @(*)
begin
	case(type)
		R_type: 
		begin 
		    funct3 = instruction[14:12];
		    funct7 = instruction[31:25];
		    rs1 = instruction[19:15];
		    rs2 = instruction[24:20];
		    rd = instruction[11:7];
		end
		
		I_type: 
		begin 
			funct3 = instruction[14:12];
            rs1 = instruction[19:15];
            rd = instruction[11:7];
            imm = $signed(instruction[31:20]);
		end
		
		L_type: 
        begin 
            funct3 = instruction[14:12];
            rs1 = instruction[19:15];
            rd = instruction[11:7];
            imm = $signed(instruction[31:20]);
        end
		
		S_type: 
		begin 
			funct3 = instruction[14:12];
            rs1 = instruction[19:15];
            rs2 = instruction[24:20];
            imm = $signed({instruction[31:25], instruction[11:7]});
		end
		
		B_type: 
		begin 
			funct3 = instruction[14:12];
            rs1 = instruction[19:15];
            rs2 = instruction[24:20];
            imm = $signed({instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0});
		end
		
		U_type: 
		begin 
			rd = instruction[11:7];
			imm = {instruction[31:12], 12'b0};
		end
		
		J_type: 
		begin 
			rd = instruction[11:7];
            imm = $signed({instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0});
		end
	endcase 
end

endmodule

