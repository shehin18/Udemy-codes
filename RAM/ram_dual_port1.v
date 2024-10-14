module ram_dual_port1 (q_a, q_b, d_a, d_b, adrs_a, adrs_b, clk, we_a, we_b);

input clk, we_a, we_b;
input [5:0] adrs_a, adrs_b;
inout [7:0] d_a, d_b;
output reg [7:0] q_a, q_b;

reg [7:0] ram [0:63];

always @(posedge clk)
    if(we_a) begin
        ram[adrs_a] <= d_a;
        q_a <= d_a; end
    else
        q_a <= ram[adrs_a];

always @(posedge clk)
    if(we_b) begin
        ram[adrs_b] <= d_b;
        q_b <= d_b; end
    else
        q_b <= ram[adrs_b];

endmodule