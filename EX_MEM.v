`timescale 1ns / 1ns

module EX_MEM(

	input clk,
	input	RegWrite_BF1,
	input	MemToReg_BF1,
	input	MemWrite_BF1,
	input	MemRead_BF1,
	input	Branch_BF1,
	input	[31:0]BranchResult,
	input	ZeroF,
	input	[31:0]ALURes,
	input	[31:0]Dato2_1,
	input	[4:0]WREG1,
	output reg	RegWrite_BF1_1,
	output reg	MemToReg_BF1_1,
	output reg	MemWrite_BF1_1,
	output reg	MemRead_BF1_1,
	output reg	Branch_BF1_1,
	output reg	[31:0]BranchResult_1,
	output reg	ZeroF_1,
	output reg	[31:0]ALURes_1,
	output reg	[31:0]Dato2_1_1,
	output reg	[4:0]WREG1_1
	
    );

always @(posedge clk)
begin

RegWrite_BF1_1 =	RegWrite_BF1;				
MemToReg_BF1_1 =	MemToReg_BF1;
MemWrite_BF1_1 =	MemWrite_BF1;
MemRead_BF1_1	=	MemRead_BF1;
Branch_BF1_1 =	Branch_BF1;
BranchResult_1 = BranchResult;
ZeroF_1 = ZeroF;
ALURes_1 = ALURes;
Dato2_1_1 =	Dato2_1;
WREG1_1 = WREG1;

end
endmodule

