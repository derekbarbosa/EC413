`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 06:39:20 PM
// Design Name: 
// Module Name: S2_pipe
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

module S2_pipe(data_1, data_2, immediate_s2, data_source_s2, alu_operation_s2, write_select_s2, write_enable_s2,
								read_data_1, read_data_2, immediate, data_source, alu_operation, write_select, write_enable, clk, reset);
//parameter data_width = 32;
//parameter select_width = 5;
              
output reg [31:0] data_1, data_2;
output reg [15:0] immediate_s2;
output reg data_source_s2;
output reg  write_enable_s2;
output reg [2:0] alu_operation_s2;
output reg [4:0] write_select_s2;

input [31:0] read_data_1, read_data_2;
input [15:0] immediate;
input data_source, write_enable;
input [2:0] alu_operation;
input [4:0] write_select;
input clk;
input reset;

always @ (posedge clk)
begin
    if (reset)
    begin
        data_1 <= 32'b0;
        data_2 <= 32'b0;
        immediate_s2 <= 16'b0;
        data_source_s2 <= 1'b0;
        write_enable_s2 <= 1'b0;
        alu_operation_s2 <= 3'b0;
        write_select_s2 <= 5'b0;
    end
    else
        data_1 <= read_data_1;
        data_2 <= read_data_2;
        immediate_s2 <= immediate;
        data_source_s2 <= data_source;
        write_enable_s2 <= write_enable;
        alu_operation_s2 <= alu_operation;
        write_select_s2 <= write_select;
    end

endmodule