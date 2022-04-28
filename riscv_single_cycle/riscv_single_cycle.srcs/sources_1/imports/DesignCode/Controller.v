module Controller(
	input zeroFlag,
	input [2:0] funct3,
	input [6:0] opcode, funct7,
	output reg isImm, memWrite, rfWrite, waddrSel, 
	output reg [1:0] pcSel, immSel, wbackSel, 
	output reg [2:0] ALUop
);

//----Opcodes----//  


parameter ALU    = 7'b0110011; //R-Type
parameter ALUi   = 7'b0010011; //I-Type
parameter SW     = 7'b0100011; //S-Type
parameter LW     = 7'b0000011; //I-Type Variation
parameter Branch = 7'b1100011; //B-Type
parameter JAL    = 7'b1101111; //J-Type

//----Funct3s----//
parameter ADD  = 3'b000;
parameter SUB  = 3'b001;
parameter OR   = 3'b010;
parameter AND  = 3'b011;
parameter XOR  = 3'b100;
parameter SLT  = 3'b101;
parameter SLTU = 3'b110;
parameter BEQ  = 3'b000;
parameter BNE  = 3'b001;

reg[1:0] ALUctrl;

//--Controller's Combinational Logic--//
always @(*)
begin
	case(opcode)
		ALU: 
		begin 
			isImm    = 1'd0; 
			memWrite = 1'd0;
			rfWrite  = 1'd1;
			waddrSel = 1'd0;
			wbackSel = 2'd0;
			pcSel    = 2'd0;
			ALUctrl  = 2'd0;
		end
		
		ALUi: 
		begin 
			isImm    = 1'd1;
			memWrite = 1'd0;
			rfWrite  = 1'd1;
			waddrSel = 1'd0;
			wbackSel = 2'd0;
			pcSel    = 2'd0;
			ALUctrl  = 2'd0;
			immSel   = 2'd0;
		end
		
		SW: 
		begin 
			isImm    = 1'd1;
			memWrite = 1'd1;
			rfWrite  = 1'd0;
			pcSel    = 2'd0;
			ALUctrl  = 2'd1;
			immSel   = 2'd1;
		end
		
		LW: 
		begin 
			isImm    = 1'd1;
			memWrite = 1'd0;
			rfWrite  = 1'd1;
			waddrSel = 1'd0;
			wbackSel = 2'd1;
			pcSel    = 2'd0;
			ALUctrl  = 2'd1;
			immSel   = 2'd0;
		end
		
		Branch: 
		begin 
			isImm    = 1'd0;
			memWrite = 1'd0;
			rfWrite  = 1'd0;
			ALUctrl  = 2'd2;
			immSel   = 2'd2;
			if(((funct3==BEQ) && zeroFlag) || ((funct3==BNE) && !zeroFlag))
				pcSel <= 2'd1;  //Jump to Branch Address
			else
				pcSel <= 2'd0;  //PC = PC + 4
		end
		
		JAL: 
		begin 
			isImm    = 1'd1;
			memWrite = 1'd0;
			rfWrite  = 1'd1;
			waddrSel = 1'd1;
			wbackSel = 2'd2;
			pcSel    = 2'd1;
			immSel   = 2'd3;
		end
	endcase 
end

//----ALU Controller----//
always @(*) 
begin
	case(ALUctrl)
		2'd0 : 
		begin
		case(funct3)
			3'b000: 
			begin
			 if((funct7 == 7'b0100000) && (opcode == ALU))
				ALUop = SUB;
			 else 
				ALUop = ADD;
			end
			3'b111: ALUop = AND;
			3'b110: ALUop = OR;
			3'b100: ALUop = XOR;
			3'b010: ALUop = SLT;
			3'b011: ALUop = SLTU;
		endcase
		end
		2'd1 : ALUop = ADD;
		2'd2 : ALUop = SUB;
	endcase
end
endmodule



