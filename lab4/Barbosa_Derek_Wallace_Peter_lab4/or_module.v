`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 07:23:15 PM
// Design Name: 
// Module Name: bw_or
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


module bw_or(out, in1, in2);

parameter N = 32;

output [N-1:0] out;
input [N-1:0] in1, in2;

genvar i;
generate
for (i = 0; i < N; i=i+1)begin
    or orgate (out[i], in1[i], in2[i]);
    end
endgenerate
endmodule
