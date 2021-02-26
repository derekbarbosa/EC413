module jump_PC (input [3:0] new_PC, input [27:0] shifted_imm, output [31:0] prog_address);

assign prog_address[31:28] = new_PC;
assign prog_address[27:0] = shifted_imm;

endmodule