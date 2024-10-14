module dff_Pe_ALr_AHs (Q,D,clk,rst,set);

input D, clk, rst, set;
output Q;

always @(posedge clk, negedge rst, posedge set)
    if(!rst)
            Q <= 1'b0;
    else if(set)
            Q <= 1'b1;
    else
            Q <= D;

endmodule