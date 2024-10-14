module dff_bh (Q,D,clk);
input D, clk;
output reg Q;

always @(posedge clk )
    
    Q <= D; //Non-blocking assignment operator
    
endmodule