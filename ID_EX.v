`timescale 1ns / 1ns

module ID_EX(
	input clk,
	input	Regwrite,
	input MemToReg,
	input MemWrite,
	input MemRead,
	input Branch,
	input [2:0]AluOP,
	input ALUSrt,
	input RegDst,
	input [31:0]PCResult_1,
	input [31:0]Dato1,
	input [31:0]Dato2,
	input [31:0]SignExtend,
	input [4:0]Rd,
	input [4:0]Shamt,
	output reg 	Regwrite_1,
	output reg  MemToReg_1,
	output reg  MemWrite_1,
	output reg  MemRead_1,
	output reg  Branch_1,
	output reg  [2:0]AluOP_1,
	output reg  ALUSrt_1,
	output reg  RegDst_1,
	output reg [31:0]PCResult_1_1,
	output reg [31:0]Dato1_1,
	output reg [31:0]Dato2_1,
	output reg [31:0]SignExtend_1,
	output reg [4:0]Rd_1,
	output reg [4:0]Shamt_1

    );

always @(posedge clk)
begin

Regwrite_1 = Regwrite;
MemToReg_1 = MemToReg;
MemWrite_1 = MemWrite;
MemRead_1 = MemRead;
Branch_1 = Branch;
AluOP_1 = AluOP;
ALUSrt_1 = ALUSrt;
RegDst_1 = RegDst;
PCResult_1_1 = PCResult_1;
Dato1_1 = Dato1;
Dato2_1 = Dato2;
SignExtend_1 = SignExtend;
Rd_1 = Rd;
Shamt_1 = Shamt;

end
endmodule

