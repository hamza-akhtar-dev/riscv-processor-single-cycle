`timescale 1ns / 10ps

module Decoder(
	input [31:0] instruction, 
	output reg [2:0] funct3, funct,
	output reg [4:0] rs1, rs2, rd,
	output reg[6:0] funct7,
	output reg [31:0] imm
);

parameter R_Type = 3'b000; //R-Type
parameter I_Type = 3'b001; //I-Type
parameter L_Type = 3'b010; //L-Type
parameter S_Type= 3'b011;  //S-Type
parameter B_Type= 3'b100;  //B-Type
parameter U_Type= 3'b101;  //U-Type
parameter J_Type= 3'b110;  //J-Type

parameter R_Type_Comp = 3'b000;
parameter I_Type_Comp = 3'b001;
parameter I_Type_Mem = 3'b010;
parameter I_Type_Jump = 3'b011;
parameter S_Type_Mem = 3'b100;
parameter B_Type_Jump = 3'b101;
parameter U_Type_Const = 3'b110;
parameter J_Type_Jump = 3'b111;

reg[6:0] opcode;
reg[2:0] type;

always@(*)
begin
  opcode = instruction[6:0];
end

always@(*)
begin
    case(opcode)
        7'b0110011: type = R_Type;
        7'b0010011: type = I_Type;
        7'b0000011: type = I_Type;
        7'b1100111: type = I_Type;
        7'b0100011: type = S_Type;
        7'b1100011: type = B_Type;
        7'b0110111: type = U_Type;
        7'b1101111: type = J_Type;
   endcase
end

always @(*)
begin
	case(type)
		R_Type: 
		begin 
		    funct3 = instruction[14:12];
		    funct7 = instruction[31:25];
		    rs1 = instruction[19:15];
		    rs2 = instruction[24:20];
		    rd = instruction[11:7];
		    funct = R_Type_Comp;
		end
		
		I_Type: 
		begin 
			funct3 = instruction[14:12];
            rs1 = instruction[19:15];
            rd = instruction[11:7];
            imm = $signed(instruction[31:20]);
            case(opcode)
                7'b0010011: funct = I_Type_Comp;
                7'b0000011: funct = I_Type_Mem;
                7'b1100111: funct = I_Type_Jump;
            endcase
		end
		
		S_Type: 
		begin 
			funct3 = instruction[14:12];
            rs1 = instruction[19:15];
            rs2 = instruction[24:20];
            imm = $signed({instruction[31:25], instruction[11:7]});
            funct = S_Type_Mem;
		end
		
		B_Type: 
		begin 
			funct3 = instruction[14:12];
            rs1 = instruction[19:15];
            rs2 = instruction[24:20];
            imm = $signed({instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0});
            funct = B_Type_Jump;
     
		end
		
		U_Type: 
		begin 
			rd = instruction[11:7];
			imm = {instruction[31:12], 12'b0};
            funct = U_Type_Const;
		end
		
		J_Type: 
		begin 
			rd = instruction[11:7];
            imm = $signed({instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0});
            funct = J_Type_Jump;
		end
		
		default:
		begin
		      funct3 = 3'd0;
		      funct7 = 7'd0;
		      rs1 = 5'd0;
		      rs2 = 5'd0;
		      rd = 5'd0;
		      imm = 32'd0;
		      funct = 3'd0;
		end
	endcase 
end

endmodule

