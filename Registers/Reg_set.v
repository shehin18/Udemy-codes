module Reg_set (Q1,Q2,D1,D2,clk,rst); //8-Bit Twin Register set
input [7:0]D1, D2;
input clk, rst;
output reg [7:0]Q1, Q2;

always @(posedge clk)
    if(rst) begin
            Q1 <= 1'b0;
            Q2 <= 1'b0; end
    else    begin
            Q1 <= D1;
            Q2 <= D2; end

endmodule