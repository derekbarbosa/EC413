`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 07:36:31 PM
// Design Name: 
// Module Name: alumux
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


module alu_mux (out, mov_in, not_in, add_in, sub_in, or_in, and_in, opcode);

parameter N = 32;

output reg [N-1:0] out;
input [N-1:0] mov_in, not_in, add_in, sub_in, or_in, and_in;
input [2:0] opcode;

always @ (opcode or mov_in or not_in or add_in or sub_in or or_in or and_in)
begin
case (opcode)
		3'b000 : out = mov_in;
        3'b001 : out = not_in;
        3'b010 : out = add_in;
        3'b011 : out = sub_in;
        3'b100 : out = or_in;
        3'b101 : out = and_in;
endcase
end
endmodule