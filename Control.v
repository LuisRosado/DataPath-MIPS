module UnidadControl(
input [5:0]op,
output reg MemToReg,
output reg MemToWrite,
output reg [2:0]ALUOP,
output reg regwrite,
output reg MemToRead,
output reg Branch,
output reg ALUSrt,
output reg RegDst

);


always@*
begin
case(op)
	0:begin
	MemToReg <= 1;
	MemToWrite <= 0;
	ALUOP <= 1;
	regwrite <= 1;
	MemToRead <= 0;
	Branch <= 0;
	ALUSrt <= 0;
	RegDst <= 1;
	end
	43: ALUOP <= 2;
	35: ALUOP <= 2;
	4: ALUOP <= 3;
endcase
end


endmodule

