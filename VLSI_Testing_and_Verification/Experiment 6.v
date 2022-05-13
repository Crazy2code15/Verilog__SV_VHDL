// DUT

module lfsr_4bit(
    input clk,
    input reset,
    output reg [3:0] q
); 
    wire x;
	 assign x = q[3]^q[2];
    always@(posedge clk) begin
        if(reset)
            q <= 4'h1;
    	else  begin
            q[3] <= q[2];
            q[2] <= q[1];
            q[1] <= q[0];
            q[0] <= x;
        end 
		  end
endmodule


//Testbench

`timescale 1ns / 1ps
module tb;
	reg clk=0;
	reg reset;
	reg [3:0]x,q;
	lfsr_4bit uut (clk, reset, q);
	initial forever #10 clk=~clk;
	initial begin
		reset=1;
		#30 reset=0;
		#40;
		repeat(10) begin
			@(negedge clk)
			x=uut.q;
			x={x[2:0],x[3]^x[2]};
		end
		end
endmodule