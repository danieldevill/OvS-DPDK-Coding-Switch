`timescale 1 ns / 1 ps

module PCIe_FundamentalTB;

reg clk, rst;

PCIe_Fundamental u0 (
	.clk (clk),
	.rst (rst)
);

initial
begin
	clk = 0;
	rst = 0;
	#20
	rst = 1;
end

always 
	#10 clk = ~clk;
	
endmodule 