`timescale 1ns / 1ns

module MEM_WB(
	input RegWrite_BF2,
	input	MemToReg_BF2,
	input	[31:0]MemRes,
	input [31:0]ALURes_2,
	input [4:0]WREG2,
	input clk,
	output reg RegWrite_BF2_1,
	output reg	MemToReg_BF2_1,
	output reg	[31:0]MemRes_1,
	output reg [31:0]ALURes_2_1,
	output reg [4:0]WREG2_1
	
    );

always @(posedge clk)
begin

RegWrite_BF2_1 = RegWrite_BF2;
MemToReg_BF2_1 = MemToReg_BF2;
MemRes_1 = MemRes;
ALURes_2_1 = ALURes_2;
WREG2_1 = WREG2;

end
endmodule

