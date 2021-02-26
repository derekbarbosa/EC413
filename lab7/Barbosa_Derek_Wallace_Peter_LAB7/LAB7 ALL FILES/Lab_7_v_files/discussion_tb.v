`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:32 03/21/2017 
// Design Name: 
// Module Name:    discussion_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////
module discussion_tb;

   // Inputs
   reg clk;
   reg Reset;
   reg LoadInstructions;
   reg [31:0] Instruction;
   
   // Outputs
   wire [31:0] out;
   
   // Instantiate the Unit Under Test (UUT)
   CPU uut (
            .out(out), 
            .clk(clk), 
            .Reset(Reset), 
            .LoadInstructions(LoadInstructions), 
            .Instruction(Instruction)
            );
   
   initial begin
      // Initialize Inputs
      clk = 0;
      Reset = 1;
      LoadInstructions = 0;
      Instruction = 0;
      #10;
      
      Reset = 0;
      LoadInstructions = 1;
      #10;
       
//      Instruction = 32'b001000_00000_00001_0000000110100111; // addi $R1, $0, 423
//      #10; // 1                                              // -> 423
//      Instruction = 32'b001000_00000_00010_0000000001011100; // addi $R2, $0, 92
//      #10; // 2                                              // -> 92
//      Instruction = 32'b001000_00000_00011_0000000000001101; // addi $R3, $0, 13
//      #10; // 3                                              // -> 13
//      Instruction = 32'b001000_00000_00100_0000000010010010; // addi $R4, $0, 146
//      #10; // 4                                              // -> 146
//      Instruction = 32'b001000_00000_00101_0000000000000101; // addi $R5, $0, 5
//      #10; // 5                                              // -> 5
//      Instruction = 32'b000000_00001_00100_00101_00000_100000; // add $R5, $R1, $R4
//      #10; // 6                                             // -> 569 (423 if wrong)
//      Instruction = 32'b000000_00011_00101_00110_00000_101010; // slt $R6, $R3, $R5
//      #10; // 7                                                // -> 1 (0 if wrong)
//      Instruction = 32'b100011_00000_00100_0000000000000100;   // LW $R4, 4(R0)
//      #10; // 8                                                // -> 4
//      Instruction = 32'b000000_00100_00110_00111_00000_100010; // sub $R7, $R4, $R6
//      #10; // 9                                         // -> 3 (146 or 145 if wrong)
//      Instruction = 32'b101011_00000_00111_0000000000000000;   // SW $R7, 0(R0)
//      #10; // 10
//      Instruction = 32'b000000_00111_00010_01000_00000_100000; // add R8, R7, R2
//      #10; //

//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//      Instruction =32'b001000_00000_01100_0000000000000101; //addi R12 0 5
//      #10
      
//CASE 1: 1-AHEAD (not working)

      Instruction = 32'b000000_10100_10110_01100_00000_100000; // add $12, $20, $22
      #10; // 1                                              // $12 receives the value of 420
      Instruction = 32'b000000_00010_00011_00001_00000_100000; // add $1, $2, $3
      #10; // 2                                              // 1 recives value of 50
      Instruction = 32'b000000_00001_01000_00101_00000_100000; // add $5, $1, $8 NOT WORKING
      #10; // 3                                              //  5 should be 130 NOT 90

//CASE 2: 2-AHEAD WORKS

      Instruction = 32'b000000_01010_01011_01001_00000_100000; // add $9, $10, $11
      #10; // 4                                              // -> 9 should recieve 210
      Instruction = 32'b000000_01101_01110_01100_00000_100000; // add $12, $13, $14
      #10; // 5                                              // -> 12 CHANGES and  receives 270
      Instruction = 32'b000000_10000_01001_01111_00000_100000; // add $15, $16, $9
      #10; // 6                                             // -> 15 gets 160 + 210 = 370

//CASE 3: proving arbitration  (1-ahead not working)

      Instruction = 32'b000000_00010_00100_00001_00000_100000; // add $1, $2, $4
      #10; // 7                                                // -> 1 recieves 60
      Instruction = 32'b000000_00011_00010_00001_00000_100000; // add $1, $2, $3
      #10; // 8                                                // -> 1 recieves 50
      Instruction = 32'b000000_00111_00001_00110_00000_100000; // add $6, $7, $1
      #10; // 9                                               // 6 receives 70 + 50 = 120

//CASE 4: proving 0-write WORKS

      Instruction = 32'b000000_00001_00010_00000_00000_100000; // add $0, $1, $2
      #10; // 10                                               //NOTHING should happen. 0 SHOULD NOT change to 70
      Instruction = 32'b000000_11111_00000_11111_00000_100000; // add $31, $0, $31
      #10; // 11                                                 //register 31 should stay the same as 310+0 = 310

//CASE 5: no write WORKS
      Instruction = 32'b000100_00101_00111_0000_0000_0000_0111; // beq $5, $7, instruction number 7
      #10; // 12                                               //if 5 and 7 are equal, branch at instruction 7
      Instruction = 32'b000000_00101_00111_11010_00000_100000; // add $26, $5, $7
      #10; // 13                                               //if no branch then 50 + 70 = 120

//CASE 6: prove reg by-pass WORKS

      Instruction = 32'b000000_10000_10001_01111_00000_100000; // add $15, $16, $17
      #10; // 14                                               //15 CHANGES to store 330
      Instruction = 32'b000000_10011_10100_10010_00000_100000; // add $18, $19, $20
      #10; // 15                                               //18 recieves 390
      Instruction = 32'b000000_10110_10111_10101_00000_100000; // add $21, $22, $23
      #10; // 16                                               //21 recieves 450
      Instruction = 32'b000000_00001_01111_11001_00000_100000; // add $25, $1, $15
      #10; // 17                                               //25 should be 380
		
      LoadInstructions = 0;
      Reset = 1;
      #10;
		
      Reset = 0;
      #100;
      
   end
	
   always begin
      #5;
      clk = ~clk;
   end
   
endmodule
