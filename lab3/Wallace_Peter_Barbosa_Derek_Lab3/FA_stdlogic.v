
module FA_stdlog (cout, sum, a, b, cin);

output cout;
output sum;
input a;
input b;
input cin;

wire xout1;
wire aout1;
wire aout2;

// compute the sum
xor xor1 (xout1, a, b);
xor xor2 (sum, xout1, cin);

// compute the cout
and and1 (aout1, xout1, cin);
and and2 (aout2, a, b);
or or1 (cout, aout1, aout2);

endmodule