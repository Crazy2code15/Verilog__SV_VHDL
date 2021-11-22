// first module is a simple d-ff  

module msff(q,qbar,clk,rst,d);
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

module MasterSlaveff(q,qbar,clk,rst,d);
	output q;
	output qbar;
	input clk, rst;
	input d;

	wire iclk, q1, q1bar; // inverted clock and intermediate q output of Master

	assign iclk = ~clk;
	assign qbar = ~q;

	msff jmasterff01(q1,q1bar,clk,rst,d);
	msff jslaveff02(q,qbar,iclk,rst,q1);

endmodule
