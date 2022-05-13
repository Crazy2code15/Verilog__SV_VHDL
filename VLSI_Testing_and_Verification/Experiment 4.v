//dut
module carrylookahead(input [3:0]a, b, input cin, output [3:0]sum, output cout);
	wire [3:0]g,p;
	wire [4:1]x;
	
	assign g = a&b;
	assign p = a^b;
	
	assign sum = p^{x[3:1],cin};
	assign x[4:1] = g | (p & {x[3:1],cin});
	assign cout = x[4];
endmodule  


//tb
module tb;

	reg [3:0] a,b;
	reg cin;
	reg clk = 0;
	wire [3:0] sum;
	wire cout;
	integer x = 0, y = 0;
	
	carrylookahead uut (a,b,cin,sum,cout);

	initial forever #5 clk = !clk;
 
	always@(posedge clk) begin
		a = y;
		b = y^1;
		cin = $random;
		y = y+1;
		#1;
		if((a+b+cin) != {cout,sum}) x = x+1;
	end
	
	initial begin
		#100;
		if(!x) $display("success");
		else $display("%d number of errors",x);
		$finish;
	end
      
endmodule 