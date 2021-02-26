`timescale 1ns / 1ns
module Four_bit_mux (sout, cout, select, sum_one, sum_zero, c1_in, c0_in);

output reg cout;
output reg [31:0] sout;
input select;
input [63:32]sum_one;
input [63:32]sum_zero;
input c1_in;
input c0_in;


always @ (select or sum_one or sum_zero)
begin

    if(select) begin
        sout = sum_one;
        cout = c1_in;
    end
    else begin
        sout = sum_zero;
        cout = c0_in;
    end
  
end

endmodule