`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 09:33:23 PM
// Design Name: 
// Module Name: 4bit_ripple
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


module fourbit_ripple(c_out, sum, a, b, c_in);

output c_out;
output [3:0]sum;
input [3:0]a;
input [3:0]b;
input c_in;

wire wire1;
wire wire2;
wire wire3;

FA_str adder1 (wire1, sum[0], a[0], b[0], c_in);
FA_str adder2 (wire2, sum[1], a[1], b[1], wire1);
FA_str adder3 (wire3, sum[2], a[2], b[2], wire2);
FA_str adder4 (c_out, sum[3], a[3], b[3], wire3);

endmodule
