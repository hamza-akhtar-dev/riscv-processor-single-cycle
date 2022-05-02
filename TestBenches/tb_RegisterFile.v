`timescale 1ns / 1ps

module tb_RegisterFile();

parameter T = 10;

reg clk, rfwrite;
reg[4:0] raddr1, raddr2, waddr; 
reg[31:0] wdata;

wire[31:0] rdata1, rdata2;

RegisterFile UUT (clk, rfwrite, raddr1, raddr2, waddr, wdata, rdata1, rdata2);

initial	
begin
	clk = 0;
	forever	#(T/2)	clk=~clk;
end

initial 
begin
//----------Test Case 1----------//

//Writing 8 to address 0 and 6 to address 1 Synchronously

rfwrite = 1;

waddr = 0;
wdata = 8;
#T

waddr = 1;
wdata = 6;
#T

//Reading from address 0 and 1 Asynchronously

rfwrite = 0;

raddr1 = 0;
raddr2 = 1;

#T

//----------Test Case 2----------//

//Writing 156 to address 30 and 674 to address 31 Synchronously

rfwrite = 1;

waddr = 30;
wdata = 156;
#T

waddr = 31;
wdata = 674;
#T

//Reading from address 30 and 31 Asynchronously

rfwrite = 0;

raddr1 = 30;
raddr2 = 31;

end
endmodule