`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2020 02:45:37 PM
// Design Name: 
// Module Name: Verification
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


module verification_csa(sum, a, b);
output [63:0]sum;
input [63:0]a;
input [63:0]b;

assign{sum} = a + b;
    

endmodule
