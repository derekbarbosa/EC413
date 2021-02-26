`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 06:39:06 PM
// Design Name: 
// Module Name: S1_pipe
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

module S1_pipe(read_select_1, read_select_2, immediate, data_source, alu_operation, write_select, write_enable, InstIn, clk, reset);

//parameter data_width = 32;
//parameter select_width = 5;

output reg [4: 0] read_select_1, read_select_2, write_select;
output reg data_source;
output reg write_enable;
output reg [2:0] alu_operation;
output reg [15:0] immediate;

input [31:0] InstIn;
input clk;
input reset;

always @ (posedge clk)
begin
    if (reset)
    begin
        write_enable <= 1'b0;
        data_source <= 1'b0;
        alu_operation <= 3'b0;
        write_select <= 5'b0;
        read_select_1 <= 5'b0;
        read_select_2 <= 5'b0;
        immediate <= 16'b0;
    end
    else
        write_enable <= InstIn[30];
        data_source <= InstIn[29];
        alu_operation <= InstIn[28:26];
        write_select <= InstIn[25:21];
        read_select_1 <= InstIn[20:16];
        read_select_2 <= InstIn[15:11];
        immediate <= InstIn[15:0];
end

endmodule

