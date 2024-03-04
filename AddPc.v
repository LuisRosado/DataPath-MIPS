module AddPc(
input [31:0]Din,
output reg [31:0]Dout
);

always @(Din)
begin

assign Dout = Din+4;

end

endmodule
