`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 07:38:51 PM
// Design Name: 
// Module Name: total_alu
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


module alu (r1, c_outa, c_outs, r2, r3, opcode);

parameter N = 32;

output signed [N-1:0] r1;
output c_outa, c_outs;
input signed [N-1:0] r2,r3;
input [3:0] opcode;

wire [N-1:0] mov_out, not_out, add_out, sub_out, or_out, and_out;

mov #(.N(N)) mov_inst (.out(mov_out), .in(r2));
bw_not #(.N(N)) not_inst (.out(not_out), .in(r2));
FA_param #(.N(N)) add_inst (.c_out(c_outa), .sum(add_out), .a(r2), .b(r3), .c_in(1'b0));
SUB_param #(.N(N)) sub_inst (.c_out(c_outs), .diff(sub_out), .a(r2), .b(r3));
bw_or #(.N(N)) or_inst (.out(or_out), .in1(r2), .in2(r3));
logic_and #(.N(N)) and_inst (.out(and_out), .in1(r2), .in2(r3));

alu_mux #(.N(N)) mux (.out(r1), .mov_in(mov_out), .not_in(not_out), .add_in(add_out), .sub_in(sub_out), .or_in(or_out), .and_in(and_out), .opcode(opcode));

endmodule
