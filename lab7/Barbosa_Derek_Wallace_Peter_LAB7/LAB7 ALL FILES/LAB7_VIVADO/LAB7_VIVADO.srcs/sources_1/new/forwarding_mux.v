module mux_forwarding (out, in1, in2, in3, select);

output reg [31:0] out;
input [31:0] in1, in2, in3;
input [1:0] select;

always @ (in1 or in2 or in3 or select) //ID_EX, EX_MEM, MEM_WB, or SELECT
begin
// one ahead case
if (select == 2'b10)
    out = in2;
// two ahead case
else if (select == 2'b01)
    out = in3;
else if (select == 2'b00)
    out = in1;
else 
    out = in1;
end

endmodule