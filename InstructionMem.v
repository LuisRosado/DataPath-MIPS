module INSTRUCTION_MEM(

input [7:0]RA,
output  [31:0]DR
);

reg [7:0]Breg[511:0];
wire [31:0]Dir;

initial
	begin

		$readmemb("/home/ise/Desktop/Proyecto/TestF1_MemInst.mem",Breg);
	end

assign Dir = {RA,RA + 8'd1 , RA + 8'd2 , RA + 8'd3};
assign DR = Breg[Dir];


endmodule

