`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 07:44:18 PM
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_tb;

parameter N = 32;

//inputs
reg signed [N-1:0] r2,r3;
reg [2:0] operation;
reg clk;

//outputs
wire signed [N-1:0] r0;
wire [N-1:0] mov_v, not_v, add_v, sub_v, and_v, or_v;
wire c_outa, c_outs, c_outav, c_outsv;

//instantiate UUT

top_module #(.N(N)) uut (.c_outa(c_outa), .c_outs(c_outs), .r0(r0), .r2(r2), .r3(r3), .ALUop(operation), .clk(clk));

//verification
MOV_verification #(.N(N)) mov_ver (.b(mov_v), .a(r2));
add_verification #(.N(N)) add_ver (.c_out(c_outav), .sum(add_v), .a(r2), .b(r3), .c_in(0));
NOT_verification #(.N(N)) not_ver (.out(not_v), .a(r2));
sub_verification #(.N(N)) sub_ver (.c_out(c_outsv), .diff(sub_v), .a(r2), .b(r3), .c_in(1));
AND_verification #(.N(N)) and_ver (.out(and_v), .a(r2), .b(r3));
OR_verification #(.N(N)) or_ver (.out(or_v), .a(r2), .b(r3));



//initialize clk
initial begin 
    clk = 0;
end

always 
#5 clk = ~clk;

// test cases

initial begin
    r2 = 32'b0;
    r3 = 32'b0;
    operation = 3'b000;
    #5
/// mov ////
    r2 = 32'b11010000101000010000101011101010; //27345429
    operation = 3'b000;
//check waveform if mov_v takes value of r2

//adding some delay 
    #10


//// or ///

operation = 3'b100;
r2 = 32'b01010000101011111000011010011100; // 1353680540
r3 = 32'b00100001111110000000010101101001; // 569902441

//check waveform if or_v takes on the value 0111 0001 1111 1111 1000 0111 1111 1101

//adding some delay 
    #10

/// and ///

operation = 3'b101;
r2 = 32'b01010010000011111001011010100101; 
r3 = 32'b01010000101011111000011010011100;

//check waveform if and_v takes on value  0101 0000 0000 1111 1000 0110 1000 0100

//adding some delay 
    #10

/// not ////

operation = 3'b001;
r2 = 32'b11111111111111111111111111111111;

//check waveform if not_v takes on value 0000 0000 0000 0000 0000 0000 0000 0000

//adding some delay 
    #10

///// add /////
    operation = 3'b010;
//add two big numbers with and without overflow --> 2,147,483,647 is the top cap


    ////without overflow

      r2 = 32'b00111011100110101100101000000000; // 1,000,000,000
      r3 = 32'b00111011100110101100101000000000; // 1,000,000,000

    //add hw_add1(add_v, r2, r3); //result should be 2 billion = 0111 0111 0011 0101 1001 0100 0000 0000

    //add some delay
    #30

    //with overflow add 1,073,741,824 and 1,073,741,824 to get overflow since  2,147,483,647 is the top cap
        r2 = 32'b01000000000000000000000000000000; //1,073,741,824
        r3 = 32'b01000000000000000000000000000000; //1,073,741,824

        //result should be 1000 0000 0000 0000 0000 0000 0000 0000 0000 -> -2,147,483,648

    //add some delay
    #30


//add two small numbers

    r2 = 32'b00000000000000000000000000001101; // 13
    r3 = 32'b00000000000000000000000000001111; // 15

    //result should be 0000 0000 0000 0000 0000 0000 0001 1100 or 28

//adding some delay 
    #30

//add a negative and a positive number 

    r2 = 32'b11111111111111111111111110100000; //-96
    r3 = 32'b00000000000000000000000000011100; //28

    //result should be -68 or 1111 1111 1111 1111 1111 1111 1011 1100

//adding some delay 
    #10


//// sub ////
    operation = 3'b011;
//sub same values

    r2 = 32'b01101010111101100000100101011111; //1,794,509,151
    r3 = 32'b01101010111101100000100101011111; //1,794,509,151

    //result should be zero

//adding some delay 
    #30

// diff is negative

    r2 = 32'b01101010111101100000100101011111; // 1,794,509,151
    r3 = 32'b01110001010010100110001010001100; // -1,900,700,300
    
   //result should be zero -106,191,149

//adding some delay 
    #30

// diff is positive

    r2 = 32'b01101010111101100000100101011111; //1,794,509,151
    r3 = 32'b01011111011010100001001001100000; //1,600,787,040

    // 00001011100010111111011011111111 or 193,722,111

    

//adding some delay 
    #30

// subtract 0
    r2 = 32'b00000000000010101111011010101111;
    r3 = 32'b00000000000000000000000000000000;

    // diff should equal 0000 0000 0000 1010 1111 0110 1010 1111
end
endmodule
