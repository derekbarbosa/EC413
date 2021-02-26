`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 09:44:26 PM
// Design Name: 
// Module Name: sixtyfour_ripple
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


module sixtyfour_ripple (c_out, sum, a, b, c_in);
output c_out;
output [63:0]sum;
input [63:0]a;
input [63:0]b;
input c_in;

wire [14:0]temp_c;

fourbit_ripple adder1 (temp_c[0], sum[3:0], a[3:0], b[3:0], c_in);
fourbit_ripple adder2 (temp_c[1], sum[7:4], a[7:4], b[7:4], temp_c[0]);
fourbit_ripple adder3 (temp_c[2], sum[11:8], a[11:8], b[11:8], temp_c[1]);
fourbit_ripple adder4 (temp_c[3], sum[15:12], a[15:12], b[15:12], temp_c[2]);
fourbit_ripple adder5 (temp_c[4], sum[19:16], a[19:16], b[19:16], temp_c[3]);
fourbit_ripple adder6 (temp_c[5], sum[23:20], a[23:20], b[23:20], temp_c[4]);
fourbit_ripple adder7 (temp_c[6], sum[27:24], a[27:24], b[27:24], temp_c[5]);
fourbit_ripple adder8 (temp_c[7], sum[31:28], a[31:28], b[31:28], temp_c[6]);
fourbit_ripple adder9 (temp_c[8], sum[35:32], a[35:32], b[35:32], temp_c[7]);
fourbit_ripple adder10 (temp_c[9], sum[39:36], a[39:36], b[39:36], temp_c[8]);
fourbit_ripple adder11 (temp_c[10], sum[43:40], a[43:40], b[43:40], temp_c[9]);
fourbit_ripple adder12 (temp_c[11], sum[47:44], a[47:44], b[47:44], temp_c[10]);
fourbit_ripple adder13 (temp_c[12], sum[51:48], a[51:48], b[51:48], temp_c[11]);
fourbit_ripple adder14 (temp_c[13], sum[55:52], a[55:52], b[55:52], temp_c[12]);
fourbit_ripple adder15 (temp_c[14], sum[59:56], a[59:56], b[59:56], temp_c[13]);
fourbit_ripple adder16 (c_out, sum[63:60], a[63:60], b[63:60], temp_c[14]);

endmodule
