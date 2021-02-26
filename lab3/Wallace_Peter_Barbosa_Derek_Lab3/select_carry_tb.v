module select_carry_64b_tb;
`timescale 1ns / 1ns

	// Inputs
	reg [0:63] a;
	reg [0:63] b;
	reg c_in;

	
	reg clk;

	// Outputs
	wire c_out;
	wire [0:63] sum;
	wire c_out_verify;
	wire [63:0]sum_verify;
	wire error_flag;


	// Instantiate the Unit Under Test (UUT)
	select_carry_adder selectadder(.cout(c_out), .sum(sum), .a(a), .b(b),.cin(c_in));
	
	// Verification module
	Verification_64bit_select verification(.sumv(sum_verify), .a(a), .b(b), .c_in(c_in));
		
	// Derfine clk signal for Verfication purpose
	initial begin
	   a <= 64'b0;
	   b <= 64'b0;
	   c_in <= 1'b0;
	   clk = 0;
	end   
  
  always begin
      #5
      clk = ~clk;
  end
  
  always begin
      #5
      a = a +1'b1;
  end
  
  
  always begin
      #5
      b = b + 1'b1;
  end
  
  
  always begin
      #5
      c_in = c_in + 1'b1;
  end
  
  
 endmodule