module thirtytwobit_std (cout, sum, a, b, cin);

output cout;
output [31:0]sum;
input [31:0]a;
input [31:0]b;
input cin;

wire c1;

sixteen_bit_std sixteenbit1 (c1, sum[15:0], a[15:0], b[15:0], cin);
sixteen_bit_std sixteenbit2 (cout, sum[31:16], a[31:16], b[31:16], c1);


endmodule
