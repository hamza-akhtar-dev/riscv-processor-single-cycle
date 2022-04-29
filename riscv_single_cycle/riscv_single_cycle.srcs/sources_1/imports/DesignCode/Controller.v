`timescale 1ns / 10ps

module Controller(
	input [2:0] funct3, type,
	input [6:0] funct7,
	output reg sel_A, sel_B, rf_wr, mem_rd, mem_wr,
	output reg [1:0]  wb_sel, 
	output reg [2:0]  br_type,
	output reg [3:0] alu_op
);

parameter R_type = 3'b000; //R_Type
parameter I_type = 3'b001; //I-Type
parameter L_type = 3'b010; //L-Type
parameter S_type= 3'b011;  //S-Type
parameter B_type= 3'b100;  //B-Type
parameter U_type= 3'b101;  //U-Type
parameter J_type= 3'b110;  //J-Type

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
	case(type)
		R_type: 
		begin  
		    sel_A   = 1'd0;
            sel_B   = 1'd0;
		    mem_rd = 1'd0;
			mem_wr = 1'd0;
			rf_wr  = 1'd1;
			wb_sel = 2'd0;
			br_type = NB;
		end
		
		I_type: 
		begin 
		   sel_A   = 1'd0;
           sel_B   = 1'd1;
           mem_rd = 1'd0;
           mem_wr = 1'd0;
           rf_wr  = 1'd1;
           wb_sel = 2'd0;
           br_type = NB;
		end
		
		L_type: 
        begin 
           sel_A  = 1'd0;
           sel_B  = 1'd1;
           mem_rd = 1'd1;
           mem_wr = 1'd0;
           rf_wr  = 1'd1;
           wb_sel = 2'd1;
           br_type = NB;
           alu_op = ADD;
        end
		
		S_type: 
		begin 
		   sel_A   = 1'd0;
           sel_B   = 1'd1;
           mem_rd = 1'd0;
           mem_wr = 1'd1;
           rf_wr  = 1'd0;
           wb_sel = 2'd0;
           br_type = NB;
           alu_op = ADD;
		end
		
		B_type: 
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
		
		U_type: 
		begin 
		   sel_A  = 1'd0;
           sel_B  = 1'd1;
           mem_rd = 1'd0;
           mem_wr = 1'd0;
           rf_wr  = 1'd1;
           wb_sel = 2'd0;
           br_type = NB;
           alu_op = ADD;
		end
		
		J_type: 
		begin 
		   sel_A  = 1'd1;
           sel_B  = 1'd1;
           mem_rd = 1'd0;
           mem_wr = 1'd0;
           rf_wr  = 1'd1;
           wb_sel = 2'd2;
           br_type = UC;
           alu_op = ADD;
		end
		
		default:
		begin
          sel_A  = 1'd0;
          sel_B  = 1'd0;
          mem_rd = 1'd0;
          mem_wr = 1'd0;
          rf_wr  = 1'd0;
          wb_sel = 2'd0;
          br_type = NB;
		end
	endcase 
end

always @(*) 
begin
    if( type == R_type || type == I_type )
    begin 
        case(funct3)
            3'b000: 
            begin
                 case(funct7)
                     7'b0000000: alu_op = ADD;
                     7'b0100000: alu_op = SUB;
                 endcase
            end
            3'b001: alu_op = SLL;
            3'b010: alu_op = SLT; 
            3'b011: alu_op = SLTU;
            3'b100: alu_op = XOR;
            3'b101: 
            begin
                 case(funct7)
                     7'b0000000: alu_op = SRL;
                     7'b0100000: alu_op = SRA;
                 endcase
            end
            3'b110: alu_op = OR;
            3'b111: alu_op = AND;
        endcase
    end
end

endmodule



