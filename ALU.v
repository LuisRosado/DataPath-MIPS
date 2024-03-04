module ALU(
input [2:0] AluCT,
input [31:0] A,B,
output reg [31:0]z,
output reg zf
);

always @(AluCT,A,B) 
begin
case(AluCT)
	0:z <= A&B;
	1:z <= A|B;
	2:z <= A+B;
	3:z <= A-B;
	4:z <= A<B?1:0;
	default: z <= 0;
endcase
end
always @*
begin
 //escribir
 if (z == 0)
   zf = 1;

 //leer
 else
    zf = 0;

end
endmodule

