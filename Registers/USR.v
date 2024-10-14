module USR (PO,SO,PI,SI,clk,rst,sel); //Universal Shift Register
input clk, rst, SI;
input [1:0]sel;
input [4:0]PI;
output SO;
output reg [4:0]PO;

always @(posedge clk)
    if(rst)
            PO <= 5'd0;
    else begin
        case(sel)
            2'b00 : PO <= PO; //no change
            2'b01 : PO <= {PO[3:0],SI}; //shift left
            2'b10 : PO <= {SI,PO[4:1]}; //shift right
            2'b11 : PO <= PI; //parallel out
            default : PO <= 0;
        endcase
    end

assign SO = (sel == 2'b01) ? PO[4] : PO[0];

endmodule