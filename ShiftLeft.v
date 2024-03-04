module SHIFT_LEFT2(
	input [31:0]Din,
	output [31:0]Dout
    );
	 
assign Dout = Din << 2;

endmodule

