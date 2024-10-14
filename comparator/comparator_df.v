module comparator_df(Eq,Gt,Sm,A,B);
input [3:0]A, B;
output Eq, Gt, Sm;

//df_1
assign Eq = &(A ~^ B);
assign Gt = (A[3] & ~B[3]) |
            ((A[3] ~^ B[3]) & (A[2] & ~ B[2])) |
            ((A[3] ~^ B[3]) & (A[2] ~^ B[2]) & (A[1] & ~B[1])) |
            ((A[3] ~^ B[3]) & (A[2] ~^ B[2]) & (A[1] ~^ B[1]) & (A[0] & ~B[0]));
assign Sm = ~(Eq | Gt);

//df_2
assign Eq = (A==B);
assign Gt = (A>B);
assign Sm = (A<B);

endmodule