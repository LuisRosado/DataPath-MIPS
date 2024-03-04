`timescale 1ns / 1ns

module IF_ID(
	input	[31:0]PCResult,
	input [31:0]Mem_I,
	input clk,
	output reg [31:0]PCResult1,
	output reg [31:0]Mem_I1
    );

always @(posedge clk)
begin
PCResult1 = PCResult;
Mem_I1 = Mem_I;

end
endmodule

