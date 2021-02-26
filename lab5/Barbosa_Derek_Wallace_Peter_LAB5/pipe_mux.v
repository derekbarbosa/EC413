`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 06:41:08 PM
// Design Name: 
// Module Name: mux
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


module two_one_mux (out, data_2, immediate, data_source);

//parameter data_width = 32;
//parameter select_width = 5;

input [31:0] data_2;
input [15:0] immediate;
input data_source;

output reg [31:0] out;

always @ (data_2 or immediate or data_source) begin
	if(data_source)
	begin
	out[31:16] <= 16'b0;
  	out[15:0] <= immediate;
  	end
  else
  	out <= data_2;
end
endmodule
