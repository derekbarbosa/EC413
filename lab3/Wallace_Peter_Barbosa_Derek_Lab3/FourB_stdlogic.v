module Fourbit_std (cout, sum, a, b, cin);

output cout;
output [3:0]sum;
input [3:0]a;
input[3:0]b;
input cin;

wire c1;
wire c2;
wire c3;

FA_stdlog adder1 (c1, sum[0], a[0], b[0], cin);
FA_stdlog adder2 (c2, sum[1], a[1], b[1], c1);
FA_stdlog adder3 (c3, sum[2], a[2], b[2], c2);
FA_stdlog adder4 (cout, sum[3], a[3], b[3], c3);

endmodule