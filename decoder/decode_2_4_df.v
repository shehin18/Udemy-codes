module decode_2_4_df(Y,I,EN);
input [1:0]I;
input EN;
output [3:0]Y;

assign Y = {EN & I[1] & I[0],
            EN & I[1] & ~I[0],
            EN & ~I[1] & I[0],
            EN & ~I[1] & ~I[0]};

endmodule