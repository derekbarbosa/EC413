module sixtyfourbit_std (cout, sum, a, b, cin);

output cout;
output [63:0]sum;
input [63:0]a;
input [63:0]b;
input cin;

wire c1;

thirtytwobit_std adder1 (c1, sum[31:0], a[31:0], b[31:0], cin);
thirtytwobit_std adder2 (cout, sum[63:32], a[63:32], b[63:32], c1);

endmodule