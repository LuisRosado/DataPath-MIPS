module MUX2(

input MemReg,
input [4:0]Din,
input [4:0]z,
output reg [4:0]Dout
);

always @*
begin
 
 if (MemReg == 1)
   Dout = z;

 else
    Dout = Din;

end
endmodule

