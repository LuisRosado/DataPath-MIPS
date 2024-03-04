module Mux2a1(
input MemReg,
input [31:0]Din,
input [31:0]z,
output reg [31:0]Dout
);

always @*
begin

 if (MemReg == 1)
   Dout <= z;

 else
    Dout <= Din;

end
endmodule

