module mux_lui (input [31:0] in_1, input [31:0] in_2, input sel, output reg [31:0] out); // goes between mux at the right of diagram and write data in reg file

always @ (in_1 or in_2 or sel)
if (sel == 1'b0) begin
out = in_1;
end else if (sel == 1'b1) begin
out = in_2;
end
endmodule 