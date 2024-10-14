module dff_Pe_ALr (Q,D,rst,clk);

input D, clk, rst;
output reg Q;

always @(posedge clk, negedge rst)
    if(!rst)
            Q <= 1'b0;
    else
            Q <= D;

endmodule