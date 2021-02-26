`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 07:06:18 PM
// Design Name: 
// Module Name: forwarding_unit
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


module forwarding_unit (ID_EX_Rs, ID_EX_Rt, EX_MEM_Rd, MEM_WB_Rd, EX_MEM_RegWrite, MEM_WB_RegWrite, ForwardA, ForwardB);

output reg [1:0] ForwardA, ForwardB;
input [4:0] ID_EX_Rs, ID_EX_Rt, EX_MEM_Rd, MEM_WB_Rd;
input EX_MEM_RegWrite;
input MEM_WB_RegWrite;

  

always @ (ID_EX_Rs or ID_EX_Rt or EX_MEM_Rd or MEM_WB_Rd or EX_MEM_RegWrite or MEM_WB_RegWrite)
begin

    ForwardA = 2'b00; // assign both forwarding codes = to 0 at the start (ask tony)
    ForwardB = 2'b00; 
    
// one ahead forwarding (should work for sure --> break condition: not wired right)
if (EX_MEM_Rd != 5'b0 && EX_MEM_RegWrite != 1'b0 && ID_EX_Rs == EX_MEM_Rd) // forwarding when Rs from reg file == to Rd in EX/MEM
    ForwardA = 2'b10;
if (EX_MEM_Rd != 5'b0 && EX_MEM_RegWrite != 1'b0 && ID_EX_Rt == EX_MEM_Rd) // forwarding when Rt from reg file == to Rd in EX/MEM
    ForwardB = 2'b10;

// two ahead forwarding (should work for sure --> break condition: not wired right)
if (MEM_WB_Rd != 5'b0 && MEM_WB_RegWrite != 1'b0 && ID_EX_Rs == MEM_WB_Rd && EX_MEM_Rd != ID_EX_Rs) // forwardA when Rs from reg file == to Rd in MEM/WB
    ForwardA = 2'b01;
if (MEM_WB_Rd != 5'b0 && MEM_WB_RegWrite != 1'b0 && ID_EX_Rt == MEM_WB_Rd && EX_MEM_Rd != ID_EX_Rt) // forwardB when Rt from reg file == to Rd in MEM/WB
    ForwardB = 2'b01;

// arbitration for one ahead vs. two ahead (without RegWrite and $0 logic)
// if (ID_EX_Rs == EX_MEM_Rd && ID_Ex_Rs == MEM_WB_Rd)
// ForwardA == 2'b10;
// if (ID_EX_Rt == EX_MEM_Rd && ID_EX_Rt == MEM_WB_Rd)
// ForwardB == 2'b10;

end

endmodule
