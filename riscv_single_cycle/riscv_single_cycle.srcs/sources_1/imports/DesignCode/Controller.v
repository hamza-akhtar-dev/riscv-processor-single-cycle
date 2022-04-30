`timescale 1ns / 10ps

module Controller(
	input [2:0] funct3, funct,
	input [6:0] funct7,
	output reg sel_A, sel_B, rf_wr, mem_rd, mem_wr,
	output reg [1:0]  wb_sel, 
	output reg [2:0]  br_type,
	output reg [3:0] alu_op
);

parameter R_Type_Comp = 3'b000;
parameter I_Type_Comp = 3'b001;
parameter I_Type_Mem = 3'b010;
parameter I_Type_Jump = 3'b011;
parameter S_Type_Mem = 3'b100;
parameter B_Type_Jump = 3'b101;
parameter U_Type_Const = 3'b110;
parameter J_Type_Jump = 3'b111;

parameter ADD  = 4'b0000;
parameter SUB  = 4'b0001;
parameter SLL   = 4'b0010;
parameter SLT  = 4'b0011;
parameter SLTU  = 4'b0100;
parameter XOR  = 4'b0101;
parameter SRL = 4'b0110;
parameter SRA  = 4'b0111;
parameter OR  = 4'b1000;
parameter AND  = 4'b1001;
parameter NULL  = 4'b1010;

parameter NB = 3'b000;   
parameter BEQ = 3'b001;
parameter BNE = 3'b010;
parameter BLT = 3'b011;
parameter UC = 3'b100;

//--Controller's Combinational Logic--//
always @(*)
begin
	case(funct)
		R_Type_Comp: 
		begin  
		    sel_A   = 1'd0;
            sel_B   = 1'd0;
		    mem_rd = 1'd0;
			mem_wr = 1'd0;
			rf_wr  = 1'd1;
			wb_sel = 2'd0;
			br_type = NB;
		end
		
		I_Type_Comp: 
		begin 
		   sel_A   = 1'd0;
           sel_B   = 1'd1;
           mem_rd = 1'd0;
           mem_wr = 1'd0;
           rf_wr  = 1'd1;
           wb_sel = 2'd0;
           br_type = NB;
		end
		
		I_Type_Mem: 
        begin 
           sel_A  = 1'd0;
           sel_B  = 1'd1;
           mem_rd = 1'd1;
           mem_wr = 1'd0;
           rf_wr  = 1'd1;
           wb_sel = 2'd1;
           alu_op = ADD;
           br_type = NB;
        end
        
        I_Type_Jump: 
        begin 
           sel_A  = 1'd0;
           sel_B  = 1'd1;
           mem_rd = 1'd0;
           mem_wr = 1'd0;
           rf_wr  = 1'd1;
           wb_sel = 2'd2;
           alu_op = ADD;
           br_type = UC;
        end
		
		S_Type_Mem: 
		begin 
		   sel_A   = 1'd0;
           sel_B   = 1'd1;
           mem_rd = 1'd0;
           mem_wr = 1'd1;
           rf_wr  = 1'd0;
           wb_sel = 2'd0;
           alu_op = ADD;
           br_type = NB;
		end
		
		B_Type_Jump: 
		begin 
		   sel_A  = 1'd1;
           sel_B  = 1'd1;
           mem_rd = 1'd0;
           mem_wr = 1'd0;
           rf_wr  = 1'd0;
           wb_sel = 2'd0;
           alu_op = ADD;
           case(funct3)
                3'b000: br_type = BEQ;
                3'b001: br_type = BNE;
                3'b100: br_type = BLT;
           endcase
		end
		
		U_Type_Const: 
		begin 
		   sel_A  = 1'd0;
           sel_B  = 1'd1;
           mem_rd = 1'd0;
           mem_wr = 1'd0;
           rf_wr  = 1'd1;
           wb_sel = 2'd0;
           alu_op = NULL;
           br_type = NB;
		end
		
		J_Type_Jump: 
		begin 
		   sel_A  = 1'd1;
           sel_B  = 1'd1;
           mem_rd = 1'd0;
           mem_wr = 1'd0;
           rf_wr  = 1'd1;
           wb_sel = 2'd2;
           alu_op = ADD;
           br_type = UC;
		end
		
		default:
		begin
          sel_A  = 1'd0;
          sel_B  = 1'd0;
          mem_rd = 1'd0;
          mem_wr = 1'd0;
          rf_wr  = 1'd0;
          wb_sel = 2'd0;
          alu_op = NULL;
          br_type = NB;
		end
	endcase 
end

always @(*) 
begin
    if( funct == R_Type_Comp || funct == I_Type_Comp )
    begin 
        case(funct3)
            3'b000: 
            begin
                if( funct == R_Type_Comp )
                begin
                     case(funct7)
                         7'b0000000: alu_op = ADD;
                         7'b0100000: alu_op = SUB;
                     endcase
                end
                else
                begin
                    alu_op = ADD;
                end
            end
            3'b001: alu_op = SLL;
            3'b010: alu_op = SLT; 
            3'b011: alu_op = SLTU;
            3'b100: alu_op = XOR;
            3'b101: 
            begin
                if( funct == R_Type_Comp )
                begin
                     case(funct7)
                         7'b0000000: alu_op = SRL;
                         7'b0100000: alu_op = SRA;
                     endcase
                end
                else
                begin
                    alu_op = SRL;
                end
            end
            3'b110: alu_op = OR;
            3'b111: alu_op = AND;
        endcase
    end
end

endmodule



