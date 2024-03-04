module ALU_CONTROL(
input [2:0]ALUOp,
input [5:0]FunCode,
output reg [2:0]ALUCt
);


always @*
begin
case(ALUOp)
	1:	begin
			case(FunCode)
				36: ALUCt <= 0; //and
				37: ALUCt <= 1; //or
				32: ALUCt <= 2; //suma
				34: ALUCt <= 3; //resta
				42: ALUCt <= 4; //slt
				default: ALUCt<=0;
			endcase
		end
	2: ALUCt <= 0;
	3: ALUCt <= 0;
endcase
end
endmodule

