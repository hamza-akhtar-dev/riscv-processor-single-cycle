`timescale 1ns / 10ps

module DataMemory(
	input clk, memRead, memWrite, 
	input[31:0] addr,
	input[31:0] wdata,
	output reg[31:0] rdata,
	output wire [31:0] pin
	
);

reg [31:0] data_mem [15:0];

//assign pin = data_mem[2][31:0];

initial
begin
	//Initializing Data Memory
	$readmemh("DataMem.mem", data_mem); 
end
//Synchronous Write
always@(posedge clk)
begin
	if(memWrite) 
		data_mem[addr] <= wdata;
end

//Asynchronuous Read
always@(*)
begin
    if(memRead)
	   rdata <= data_mem[addr];
end  

endmodule