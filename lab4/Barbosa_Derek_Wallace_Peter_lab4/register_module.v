`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2020 08:29:52 PM
// Design Name: 
// Module Name: dff_param
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


module dff_param(q, d, clk);

parameter WIDTH = 32;
output signed [WIDTH-1:0] q;
input signed [WIDTH-1:0] d;
input clk;

genvar i;

generate
for (i = 0; i < WIDTH; i=i+1)begin
    dff bit(.q(q[i]), 
            .d(d[i]), 
            .clk(clk)
            );
     end
 endgenerate

endmodule
