`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 03:35:24 PM
// Design Name: 
// Module Name: mov_verification
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

module MOV_verification (b, a);

parameter N = 32;

input [N-1:0] a;
output [N-1:0] b;

assign b = a;

endmodule
