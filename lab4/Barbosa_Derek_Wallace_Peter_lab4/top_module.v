`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 07:42:23 PM
// Design Name: 
// Module Name: top_module
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


module top_module (c_outa, c_outs, r0, r2, r3, ALUop, clk);

parameter N = 32;

output c_outa, c_outs;
output signed [N-1:0] r0;
input signed [N-1:0] r2,r3;
input [2:0] ALUop;
input clk;

wire [N-1:0] r1;

alu #(.N(N)) alu_inst (.r1(r1), .c_outa(c_outa), .c_outs(c_outs), .r2(r2), .r3(r3), .opcode(ALUop));
dff_param #(.N(N)) register (.q(r0), .d(r1), .clk(clk));

endmodule
