module sixteen_bit_std (cout, sum, a, b, cin);

output cout;
output [15:0]sum;
input [15:0]a;
input [15:0]b;
input cin;

wire c1;
wire c2;
wire c3;
// instantiate 4 4-bit ripple carry adders

Fourbit_std adder1 (c1, sum[3:0], a[3:0], b[3:0], cin);
Fourbit_std adder2 (c2, sum[7:4], a[7:4], b[7:4], c1);
Fourbit_std adder3 (c3, sum[11:8], a[11:8], b[11:8], c2);
Fourbit_std adder4 (cout, sum[15:12], a[15:12], b[15:12], c3);

endmodule