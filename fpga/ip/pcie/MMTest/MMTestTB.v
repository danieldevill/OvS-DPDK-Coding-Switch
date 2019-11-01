`timescale 1 ns / 1 ps

module MMTestTB;

reg clk, rst;

MMTest u0 (
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