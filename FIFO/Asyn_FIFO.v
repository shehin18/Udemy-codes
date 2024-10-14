//FIFO - Dual Clock

module Asyn_FIFO (clk_wr, clk_rd, rst, wr_en, rd_en, buf_in, buf_out, fifo_counter, buf_empty, buf_full);

input  clk_wr, clk_rd, rst, wr_en, rd_en;
input  [7:0] buf_in;
output buf_empty, buf_full;
output [7:0] buf_out;
output [6:0] fifo_counter;

reg [7:0] buf_out;
reg       buf_empty, buf_full;
reg [6:0] fifo_counter;
reg [3:0] wr_ptr, rd_ptr;
reg [7:0] buf_mem [0:63];

always @(fifo_counter) begin
        buf_empty <= (fifo_counter == 7'd0);
        buf_full  <= (fifo_counter == 7'd64);    
end

always @(posedge clk_rd && posedge rst) begin
        if(rst)
                fifo_counter <= 7'd0;
        else if(!buf_empty && rd_en)
                fifo_counter <= fifo_counter - 1;
        else
                fifo_counter <= fifo_counter;
end

always @(posedge clk_wr or posedge rst) begin
        if(!buf_full && wr_en)
                fifo_counter <= fifo_counter + 1;
        else
                fifo_counter <= fifo_counter;
end

always @(posedge clk_rd or posedge rst) begin
        if(rst)
                buf_out <= 8'd0;
        else if(!buf_empty && rd_en)
                buf_out <= buf_mem[rd_ptr];
        else
                buf_out <= buf_out;
end

always @(posedge clk_wr or posedge rst) begin
        if(!buf_full && wr_en)
                buf_mem[wr_ptr] <= buf_in;
        else
                buf_mem[wr_ptr] <= buf_mem[wr_ptr];
end

always @(posedge clk_rd or posedge rst) begin
        if(rst)
                rd_ptr <= 4'd0;
        else if(!buf_empty && rd_en)
                rd_ptr <= rd_ptr + 1;
        else
                rd_ptr <= rd_ptr;
end

always @(posedge clk_wr && posedge rst) begin
        if(rst)
                wr_ptr <= 4'd0;
        else if(!buf_full && wr_en)
                wr_ptr <= wr_ptr + 1;
        else
                wr_ptr <= wr_ptr;
end

endmodule