module ram_singleport_1 (data, clk, cs, wr_en, o_en, rd_adrs, wr_adrs);

input clk, cs, wr_en, o_en;
inout [7:0] data;
input [5:0] rd_adrs, wr_adrs;

reg [7:0] temp_data;
reg [7:0] ram [0:63];

always @(posedge clk) begin
         if(cs && wr_en)
                ram[wr_adrs] <= data;
end

always @(posedge clk) begin
        if(cs && !wr_en)
                temp_data <= ram[rd_adrs];
end

assign data = (cs & o_en & !wr_en) ? temp_data : 'hz;

endmodule
 