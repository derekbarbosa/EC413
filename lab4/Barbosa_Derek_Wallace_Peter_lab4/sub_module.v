`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 07:30:35 PM
// Design Name: 
// Module Name: Sub
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

module SUB_param (c_out, diff, a, b);

//assume a-b ==> a+b'+1

parameter N = 32;

//initalize output
output c_out;
output signed [N-1:0] diff;

//initialize inputs
input signed [N-1:0] a;
input signed [N-1:0] b;

wire [N-1:0] b_not;
wire [N-2:0] temp;

bw_not #(.N(N)) bnot (.out(b_not), .in(b));

FA_str adder1 (
        .c_out(temp[0]),
        .sum(diff[0]),
        .a(a[0]),
        .b(b_not[0]),
        .c_in(1'b1)
        );


genvar i;
generate
	for (i=1; i < (N-1); i = i+1) begin
		FA_str adder(
			.c_out(temp[i]),
			.sum(diff[i]),
			.a(a[i]),
			.b(b_not[i]),
			.c_in(temp[i-1])
			);
			end
endgenerate

FA_str last_adder (
        .c_out(c_out),
        .sum(diff[N-1]),
        .a(a[N-1]),
        .b(b_not[N-1]),
        .c_in(temp[N-2])
        ); 


endmodule
