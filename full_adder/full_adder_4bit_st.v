module full_adder_4bit_st(s,c,a,b,cin);
input [3:0]a, b;
input cin;
output [3:0]s;
output c;
wire n1, n2, n3;

full_adder_st fa_0(.a(a[0]),.b(b[0]),.cin(cin),.s(s[0]),.c(c[0]));
full_adder_st fa_1(.a(a[1]),.b(b[1]),.cin(n1),.s(s[1]),.c(c[1]));
full_adder_st fa_2(.a(a[2]),.b(b[2]),.cin(n2),.s(s[2]),.c(c[2]));
full_adder_st fa_3(.a(a[3]),.b(b[3]),.cin(n3),.s(s[3]),.c(c[3]));

endmodule