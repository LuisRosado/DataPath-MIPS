module ShiftLeft_2(
	input [25:0]Din,[3:0]PCadd,
	output [31:0]Dout
    );
	 
assign Dout = {Din << 2,PCadd};

endmodule


