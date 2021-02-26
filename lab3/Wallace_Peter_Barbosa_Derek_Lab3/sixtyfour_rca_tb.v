`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:29:28 09/25/2015
// Design Name:   FA_str_tb
// Module Name:   
// Project Name:  Pre_Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA_str
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module FA_str_tb;

	// Inputs
	reg [63:0]a;
	reg [63:0]b;
	reg c_in;
	
	reg clk;

	// Outputs
	wire c_out;
	wire [63:0]sum;
	wire [63:0]sumv;


	// Instantiate the Unit Under Test (UUT)
	sixtyfour_ripple rca (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Verification module
    Verification_64bit rca_ver (.sumv(sumv), .a(a), .b(b), .c_in(c_in));
	initial begin
		// Initialize Inputs
		clk = 0;
		
		a = 64'b0;
		b = 64'b0;
		c_in = 0;

	end
	
	always begin
	#5
	a = a + 1'b1;
	b = b + 1'b1;
	c_in = c_in + 1'b1;
	end

      
endmodule

