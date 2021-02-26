module RCA_32b_str(cout,sum,a,b,cin);

output cout;
output [31:0] sum;
input [31:0] a;
input [31:0] b;
input cin;

wire c1;

FA_16b FA16_1(c1, sum[15:0], a[15:0], b[15:0],cin);

FA_16b FA16_2(cout, sum[31:16], a[31:16], b[31:16],c1);

endmodule