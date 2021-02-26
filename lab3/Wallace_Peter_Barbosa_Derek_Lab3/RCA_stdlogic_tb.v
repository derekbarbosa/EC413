module RCA_stdlogic_tb;
`timescale 1ns / 1ns

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c_in;

	
	reg clk;

	// Outputs
	wire c_out;
	wire [63:0]sum;
	wire [63:0]sumv;


	// Instantiate the Unit Under Test (UUT)
	sixtyfourbit_std rcadder(.cout(c_out), .sum(sum), .a(a), .b(b),.cin(c_in));
	
	// Verification module
	Verification_64bit ver_ripple (.sumv(sum), .a(a), .b(b), .c_in(c_in));
	// Derfine clk signal for Verfication purpose
	initial begin
	   a <= 64'b0;
	   b <= 64'b0;
	   c_in <= 1'b0;
	end   
  
  always begin
      #5
      a = a +1'b1;
      b = b + 1'b1;
      c_in = c_in + 1'b1;
  end
  
  
 endmodule
