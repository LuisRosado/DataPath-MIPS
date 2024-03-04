`timescale 1ns / 1ns

module PC(
input [31:0] PCNext,
input CLK,
output reg  [31:0]PCResult
);
initial begin
	
PCResult <= 0;

end

always @(posedge CLK)
begin

PCResult <= PCNext;
end

endmodule

