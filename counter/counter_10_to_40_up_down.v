module counter_10_to_40_up_down (count,data,u-d,load,clk,rst);

input u_d,load, clk, rst;
input [7:0] data;
output [7:0] count;

reg [7:0] count_temp;

always @(posedge clk)
    if(!rst | (count_temp < 8'd10) | (count_temp > 8'd40))
            count_temp <= 8'10;
    else if(load)
            count_temp <= data;
    else if(u_d)
            count_temp <= (count_temp > 8'd40) ? 8'd10 : (count_temp + 1);
    else
            count_temp <= (count_temp < 8'd10) ? 8'd40 : (count_temp - 1);

assign count = count_temp;

endmodule