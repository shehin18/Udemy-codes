module encode_4_2_bh(Y,V,I);
input [3:0]I;
output reg V;
output reg [1:0]Y;

always @(*) begin
    case (I)
        4'b0001 : {V,Y} = 3'b100;
        4'b0010 : {V,Y} = 3'b101;
        4'b0100 : {V,Y} = 3'b110;
        4'b1000 : {V,Y} = 3'b111;
        4'd0, 4'b3, 4'b5, 4'b6, 4'b7, 4'b9, 4'b10, 4'b11, 4'b12, 4'b13, 4'b14, 4'b15 : {V,Y} = 3'b000;
        default: $display("error");
    endcase
end
    
endmodule