// SR_flipflop Verilog Code

module srflipflop(q,qbar,clk,rst,sr);
	output reg q;
	output qbar;
	input clk, rst;
	input [1:0] sr;

	assign qbar = ~q;

	always @(posedge clk)
	begin
		if (rst)
			q <= 0;
		else
			case(sr)
				2'b00: q <= q;
				2'b01: q <= 0;
				2'b10: q <= 1;
				2'b11: q <= 1'bx;
			endcase
	end
endmodule


// TestBench SR flipflop

include "srflipflop.v"
module tb();
  wire q, qbar;
  reg clk, rst;
  reg [1:0] sr;
  
  srflipflop dut(q,qbar,clk,rst,sr);
  always #5 clk = !clk;
  
  initial begin
    clk = 1'b0;
    rst = 1; #5; rst = 0; #5;
    
    $display("")
