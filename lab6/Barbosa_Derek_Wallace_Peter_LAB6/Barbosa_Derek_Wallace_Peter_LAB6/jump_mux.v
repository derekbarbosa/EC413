module jump_mux (input [31:0] in_1, input [31:0] in_2, input sel, output reg [31:0] out);

always @ (in_1 or in_2 or sel)
if (sel == 1'b0) begin
out = in_2;
end else if (sel == 1'b1) begin
out = in_1;
end
endmodule