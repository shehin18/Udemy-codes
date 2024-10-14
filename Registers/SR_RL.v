module SR_RL (SO,SI,clk,rst); //5-Bit Right to Left Shift Register
input SI, clk, rst;
output SO;

reg [4:0]SR;

always @(posedge clk, negedge rst)
    if(!rst)
            SR <= 5'd0;
    else
            SR <= {SI,SR[4:1]};
            
assign SO = SR[0];
    
endmodule