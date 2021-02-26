`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2020 08:38:39 PM
// Design Name: 
// Module Name: FA_param
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FA_param (c_out, sum, a, b, c_in);

parameter N = 32;
output c_out;
output signed [N-1:0] sum;
input signed [N-1:0] a;
input signed [N-1:0] b;
input c_in;

wire [N-2:0] temp;

FA_str adder1 (
        .c_out(temp[0]),
        .sum(sum[0]),
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in)
        );
        
genvar i;
generate
for (i=1; i < (N-1); i=i+1)begin
        FA_str adder(
            .c_out(temp[i]),
            .sum(sum[i]),
            .a(a[i]),
            .b(b[i]),
            .c_in(temp[i-1])
            );
end
endgenerate

FA_str last_adder (
        .c_out(c_out),
        .sum(sum[N-1]),
        .a(a[N-1]),
        .b(b[N-1]),
        .c_in(temp[N-2])
        ); 
        
endmodule
