module DataMemory(
	input clk, memWrite,
	input[31:0] addr,
	input[31:0] wdata,
	output reg[31:0] rdata
);

reg [31:0] data_mem [127:0];

initial
begin
	//Initializing Data Memory
	$readmemh("C:/Users/asus/Documents/Lab Assignments/Digital Systems Design Lab 3rd SEM/Project Part 2/PP2_2019-EE-12/DesignCode/DataMem.txt", data_mem); 
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
	rdata <= data_mem[addr];
end  
endmodule