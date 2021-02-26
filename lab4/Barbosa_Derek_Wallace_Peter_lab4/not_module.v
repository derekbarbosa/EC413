`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 03:44:54 PM
// Design Name: 
// Module Name: bw_not
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


module bw_not(out, in);

parameter WIDTH = 32;

output [WIDTH-1:0] out;
input [WIDTH-1:0] in;

genvar i;
generate
for (i = 0; i < WIDTH; i=i+1)begin
    not ins (out[i], in[i]);
end
endgenerate
endmodule
