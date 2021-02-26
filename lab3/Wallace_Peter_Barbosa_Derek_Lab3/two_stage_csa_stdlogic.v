
module car_sel_std (cout, sum, a, b);

output cout;
output [63:0]sum;
input [63:0]a;
input [63:0]b;

wire cout_low;
wire cout_0;
wire cout_1;
wire [31:0]out_0;
wire [31:0]out_1;

thirtytwobit_std loweradd (cout_low, sum[31:0], a[31:0], b[31:0], 0);
thirtytwobit_std upper_0 (cout_0, out_0, a[63:32], b[63:32], 0);
thirtytwobit_std upper_1 (cout_1, out_1, a[63:32], b[63:32], 1);
Four_bit_mux mux1 (sum[63:32], cout, cout_low, out_1, out_0, cout_1, cout_0);

endmodule