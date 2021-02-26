`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 06:39:33 PM
// Design Name: 
// Module Name: S3_pipe
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


module S3_pipe(ALU_out_s3, write_select_s2, write_enable_s2, write_select_s3, write_enable_s3, ALU_out, clk, reset);

parameter data_width = 32;
parameter select_width = 5;

output reg [31:0] ALU_out_s3;
output reg write_enable_s3;
output reg [4:0] write_select_s3;

input [31:0] ALU_out;
input write_enable_s2;
input [4:0] write_select_s2;
input clk;
input reset;

always @ (posedge clk)
begin
    if (reset)
    begin
        write_select_s3 <= 5'b0;
        write_enable_s3 <= 5'b0;
        ALU_out_s3 <= 32'b0;
    end
    else
        write_select_s3 <= write_select_s2;
        write_enable_s3 <= write_enable_s2;
        ALU_out_s3 <= ALU_out;
end

endmodule
