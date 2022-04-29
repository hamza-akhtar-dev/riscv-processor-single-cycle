`timescale 1ns / 10ps

module RegisterFile(
	input clk, rfwrite,
	input[4:0] raddr1, raddr2, waddr,
	input[31:0] wdata,
	output reg[31:0] rdata1, rdata2
);
reg [31:0] register_mem [31:0];
initial
begin
	//Initializing Register Memory
	$readmemh("RegisterMem.mem", register_mem); 
end
//Synchronous Write
always@(posedge clk)
begin
	if(rfwrite) 
		register_mem[waddr] <= wdata;
end  
//Asynchronuous Read
always@(*)
begin
	rdata1 <= register_mem[raddr1];
	rdata2 <= register_mem[raddr2];
end  
endmodule