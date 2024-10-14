module dlatch_df (Q,D,En);

input D, En;
output Q;

assign Q = En ? D : Q;

endmodule