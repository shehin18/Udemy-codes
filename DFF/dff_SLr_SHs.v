module dff_SLr_SHs (Q,D,clk,rst,set); //Synchronous D-Flip Flop with Active Low Reset & Active High Set
input D, clk, rst, set;
output reg Q;

always @(posedge clk)
    if(!rst)
            Q <= 1'b0;
    else if(set)
            Q <= 1'b1;
    else
            Q <= D;
            

endmodule