module load_upper_i (input [15:0] immediate, output [31:0] out);



assign out = {immediate, 16'b0};

endmodule