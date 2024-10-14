module encode_4_2_df(Y,V,I);
input [3:0]I;
output V ;
output [1:0]Y;

assign Y = {I[1] | I[0], I[3] | I[2]};
assign V = |I;

endmodule