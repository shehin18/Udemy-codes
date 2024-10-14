module dff_SLr (Q,D,clk,rst); //Synchronous D-Flip Flop with Active Low Reset
input D, clk, rst;
output reg Q;

always @(posedge clk)
    if(!rst)
            Q <= 1'b0;
    else
            Q <= D;
    
endmodule