module ALU (x,y,a,b,opcode);
input [3:0]a, b, opcode;
output reg [3:0]x, y;

always @(a,b,opcode)
    case (opcode)
       4'd0  : x[0] = |a;
       4'd1  : x[0] = &a;
       4'd2  : x[0] = ^a;
       4'd3  : x = a | b;
       4'd4  : x = a & b;
       4'd5  : x = a ^ b;
       4'd6  : x[0] = a > b;
       4'd7  : x[0] = a < b;
       4'd8  : x[0] = !a;
       4'd9  : x[0] = (a == b);
       4'd10 : {y[0],x} = a + b;
       4'd11 : x = a - b;
       4'd12 : {y,x} = a * b;
       4'd13 : {y,x} = a >> b;
       4'd14 : {y,x} = a << b;
       4'd15 : x = ~a;
        default: $display("error");
    endcase

endmodule