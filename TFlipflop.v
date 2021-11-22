// T Flipflop Verilog Code

module tflipflop(q,qbar,clk,rst,t);
	output reg q;
	output qbar;
	input clk, rst;
	input t;

	assign qbar = ~q;

	always @(posedge clk)
	begin
		if (rst)
			q <= 0;
		else
			case(t)
				1'b0: q <= q;
				1'b1: q <= ~q;
			endcase
	end
endmodule


// TestBench T flipflop
