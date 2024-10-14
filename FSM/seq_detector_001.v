//Moore machine
module seq_detector_001 (det, inp, clk, rst);

input inp, clk, rst;
output det;

reg [1:0]pr_s, nxt_s;

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 =2'b11;

always @(posedge clk) begin //present state sequential logic
    if(rst)
            pr_s <= S0;
    else
            pr_s <= nxt_s;
end

always @(inp, pr_s) begin //next state combinational logic
    case (pr_s)
        S0 : if(inp)
                nxt_s = S0;
             else
                nxt_s = S1;
        S1 : if(inp)
                nxt_s = S0;
             else
                nxt_s = S2;
        S2 : if(inp)
                nxt_s = S3;
             else
                nxt_s = S2;
        S3 : if(inp)
                nxt_s = S0;
             else
                nxt_s = S1;
        default : nxt_s = S0;
    endcase
end

always @(pr_s) begin //output combinational logic
    case (pr_s)
        S0 : det = 1'b0;
        S1 : det = 1'b0;
        S2 : det = 1'b0;
        S3 : det = 1'b1;
        default : det = 1'b0;
    endcase
end

endmodule