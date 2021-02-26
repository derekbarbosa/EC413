`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2020 11:48:28 AM
// Design Name: 
// Module Name: select_carry_adder
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


module select_carry_adder(cout,sum,a,b,cin);

input [63:0] a;
input [63:0] b;
input cin;

output cout;
output [63:0] sum;

wire c_out_lower;
wire c_out_upper_one;
wire c_out_upper_zero;

wire [63:32] sum_zero;
wire [63:32] sum_one;

//instantiate the lower 32bit adder
RCA_32b_str lower_32(c_out_lower, sum[31:0], a[31:0], b[31:0], 0);

//instantiantate the upper 32 bit adders
RCA_32b_str upper_32_zero(c_out_upper_zero, sum_zero, a[63:32], b[63:32],0);

RCA_32b_str upper_32_one(c_out_upper_one, sum_one, a[63:32], b[63:32], 1);

//mux the sum outputs, and the c_outs

Four_bit_mux mux(sum[63:32], cout, c_out_lower, sum_zero, sum_one,c_out_upper_one, c_out_upper_zero);

endmodule
