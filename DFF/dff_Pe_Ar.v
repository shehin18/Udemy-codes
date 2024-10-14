module dff_Pe_Ar (Q,D,rst,clk);

input D, rst, clk;
output reg Q;

always @(posedge clk or posedge rst)
    if(rst)
            Q <= 1'b0;
    else
            Q <= D;

endmodule