module dff_Ne_Ar (Q,D,rst,clk);

input D, clk, rst;
output reg Q;

always @(negedge clk or posedge rst)
    if(rst)
            Q <= 1'b0;
    else
            Q <= D;

endmodule