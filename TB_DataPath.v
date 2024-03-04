`timescale 1ns / 1ns

module TB_DataPath;
 
	reg clk = 0;

	DataPath uut (
		.clk(clk)
	);
	
always #50 clk = !clk;

initial
begin
  #1000;
  $finish;
end


endmodule


