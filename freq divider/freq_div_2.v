module freq_div_2 (clk_out,clk,rst);

input clk, rst;
output reg clk_out;

always @(posedge clk)
    if(rst)
            clk_out <= 1'b0;
    else
            clk_out <= ~clk_out;

endmodule