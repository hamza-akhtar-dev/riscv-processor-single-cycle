module freq_div(clk,div_clk_seg);
    input clk;
    output reg div_clk_seg;
    reg [17:0] counter=0;
    
    always @ (posedge clk)
    begin
        counter <= counter+1;
        div_clk_seg <= counter[17];
    end
endmodule