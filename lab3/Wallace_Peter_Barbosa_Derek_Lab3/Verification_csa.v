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


module Verification_64bit_select (sumv, a, b, c_in);

	input [63:0] a;
	input [63:0] b;
	input c_in;

	output [63:0]sumv; 

	assign {sumv} = a + b;

endmodule