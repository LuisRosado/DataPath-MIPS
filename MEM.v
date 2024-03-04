module Mem(
input enWR,MemRead,
input [31:0]dataIn,
input [31:0]dir,
output reg [31:0]dataOut

);

reg [31:0]Breg[0:128];

always @*
begin
 //escribir
 if (enWR == 1)
   Breg[dir] <= dataIn;

 //leer
 if(MemRead == 1)
    dataOut <= Breg[dir];

end

endmodule

