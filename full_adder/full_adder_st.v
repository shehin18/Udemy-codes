module full_adder_st(s,c,a,b,cin);
input a, b, cin;
output s, c;
wire n1, n2, n3;

half_adder HA_1(.a(a),.b(b),.s(n1),.c(n2));
half_adder HA_2(.a(n1),.b(cin),.s(s),.c(n3));
or or_1(c,n2,n3);

endmodule