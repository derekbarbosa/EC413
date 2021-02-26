module select_carry_std_tb;
`timescale 1ns / 1ns

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c_in;

	
	reg clk;

	// Outputs
	wire c_out;
	wire [63:0]sum;
	wire [63:0]sum_ver;


	// Instantiate the Unit Under Test (UUT)
	car_sel_std selectadder_std(.cout(c_out), .sum(sum), .a(a), .b(b));
	
	// Verification module
	verification_csa csa_ver (.sum(sum_ver), .a(a), .b(b));
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
  end
  
  
  
  always begin
      #5
      c_in = c_in + 1'b1;
  end
  
  
 endmodule