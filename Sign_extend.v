`timescale 1ns / 1ns

module SIGN_EXTEND(
	input [15:0]Din,
	output reg [31:0]Dout
    );

	 always @*
begin
 //escribir en BR
 if (Din[15] == 1)
   Dout = {16'hFFFF,Din};
 else
	Dout = {16'h0000,Din};

end


endmodule

