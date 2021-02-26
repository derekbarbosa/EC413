`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 06:43:01 PM
// Design Name: 
// Module Name: pipe
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

module big_throbbing_pipes(ALUOut, reset, clk, InstIn);


//parameterization because why not
parameter data_width = 32;
parameter select_width = 5;

//inputs to the pipeline
//input writeEnable;
input reset;
input clk;
input [31:0] InstIn;

//output of pipeline => ALUout according to diagram
output [31:0] ALUOut;


//stage 1 -> stage 2 wires

wire [15:0] s1_s2_imm;
wire s1_s2_datasrc;
wire [2:0] s1_s2_ALUop;
wire s1_s2_writeenable;
wire [4:0] s1_s2_writeselect;

//stage 1 -> reg file wires

wire [4:0] s1_reg_readselect1;
wire [4:0] s1_reg_readselect2;

//reg file -> stage 2

wire [31:0] reg_s2_readdata1;
wire [31:0] reg_s2_readdata2;

//stage 2 -> stage 3 wires

wire [4:0] s2_s3_writeselect;
wire s2_s3_writeenable;

//stage 2 -> MUX/ALU

wire [15:0] s2_mux_imm;
wire s2_mux_datasrc;
wire [31:0] s2_mux_readdata2;

wire [31:0] s2_ALU_readdata1;
wire [2:0] s2_ALU_ALUop;
wire [31:0] mux_ALU_muxout;


//stage 3 -> global output

wire [31:0] s3_global_ALUout;

// ALU -> stage 3 
wire [31:0] alu_s3_ALUout;

//stage 3 -> reg file

wire [4:0] s3_reg_writeselect;
wire s3_reg_writeenable;
wire [31:0] s3_reg_ALUout;


//initalize stage 1 with proper pipes (see diagram), inputs are InstIn

S1_pipe stage1(
																.read_select_1(s1_reg_readselect1),
                                                                .read_select_2(s1_reg_readselect2),
                                                                .immediate(s1_s2_imm),
                                                                .data_source(s1_s2_datasrc),
                                                                .alu_operation(s1_s2_ALUop),
                                                                .write_select(s1_s2_writeselect),
                                                                .write_enable(s1_s2_writeenable),
                                                                .InstIn(InstIn),
                                                                .clk(clk),
                                                                .reset(reset)
                                                                );


//initalzie register file, outputs are read_data1/2
nbit_register_file reg_file (
																		.WriteData(s3_reg_ALUout),
																     	.ReadData1(reg_s2_readdata1),
                                                                        .ReadData2(reg_s2_readdata2),
                                                                        .ReadSelect1(s1_reg_readselect1),
                                                                        .ReadSelect2(s1_reg_readselect2),
                                                                        .WriteSelect(s3_reg_writeselect),
                                                                        .WriteEnable(s3_reg_writeenable),  
                                                                        .Reset(reset),
                                                                        .Clk(clk)                                                              
                                                                         );
                                                                      
                                                                                                                 
//initalize stage 2, inputs are read_data_1, read_data_2, immediate, data_source, alu_operation, write_select, write_enable
S2_pipe stage2(
																	   .data_1(s2_ALU_readdata1),
																	   .data_2(s2_mux_readdata2), 
                                                                       .immediate_s2(s2_mux_imm),
                                                                       .data_source_s2(s2_mux_datasrc), 
                                                                       .alu_operation_s2(s2_ALU_ALUop), 
                                                                       .write_select_s2(s2_s3_writeselect), 
                                                                       .write_enable_s2(s2_s3_writeenable),
																	   .read_data_1(reg_s2_readdata1), 
                                                                       .read_data_2(reg_s2_readdata2), 
                                                                       .immediate(s1_s2_imm), 
                                                                       .data_source(s1_s2_datasrc), 
                                                                       .alu_operation(s1_s2_ALUop), 
                                                                       .write_select(s1_s2_writeselect), 
                                                                       .write_enable(s1_s2_writeenable),
                                                                       .clk(clk),
                                                                       .reset(reset)
                                                                       );


//initalize the 2-1 mux that takes RD2 and IMM and outputs to R3
two_one_mux mux(
																	    .out(mux_ALU_muxout),
                                                                        .data_2(s2_mux_readdata2),
                                                                        .immediate(s2_mux_imm),
                                                                        .data_source(s2_mux_datasrc)
                                                                        );

//initalize the ALU that takes R2, R3, and OP as inputs, with R1 as output
Ideal_ALU ALU(
										.R1(alu_s3_ALUout),
										.R2(s2_ALU_readdata1),
                                        .R3(mux_ALU_muxout),
                                        .ALUOp(s2_ALU_ALUop)
                                        );

//initalize stage 3, inputs are ALU_out_s3, write_select_s2, write_enable_s2
S3_pipe stage3(
																	   .ALU_out_s3(s3_reg_ALUout), 
																	   .write_select_s2(s2_s3_writeselect), 
                                                                       .write_enable_s2(s2_s3_writeenable), 
                                                                       .write_select_s3(s3_reg_writeselect), 
                                                                       .write_enable_s3(s3_reg_writeenable), 
                                                                       .ALU_out(alu_s3_ALUout),
                                                                       .clk(clk),
                                                                       .reset(reset)
                                                                       );
                                                                       
assign ALUOut = s3_reg_ALUout;
                                                                
                                                                
endmodule
