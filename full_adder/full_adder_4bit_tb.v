`timescale 1ns/100ps

module full_adder_tb;
reg [3:0]a1, b1;
reg cin;
wire [3:0]s1;
wire c1;

full_adder_4bit_bh DUT(.s(s1),.c(c1),.a(a1),.b(b1),.cin(cin));

initial
$monitor("time = %d \t a = %b \t b = %b \t cin = %b \t s = %b \t c = %b", $time,a1,b1,cin,s1,c1);

initial begin
    a1 = 0;
    b1 = 0;
    cin = 0;
    repeat(16) begin
        #10 a = a + 1;
        repeat(16) begin
            #10 b = b + 1;
            repeat(2)
                #10 cin = ~cin;
        end
    end
end

endmodule