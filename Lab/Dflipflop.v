// D Flipflop Verilog Code

module dflipflop(q,qbar,clk,rst,d);
	output reg q;
	output qbar;
	input clk, rst;
	input d;

	assign qbar = ~q;

	always @(posedge clk)
	begin
		if (rst)
			q <= 0;
		else
			q <= d;
	end
endmodule

// TestBench D flipflop


