module ADD(
input [31:0]Din,Din2,
output reg [31:0]Dout
);

always @*
begin

Dout = Din + Din2;

end

endmodule

