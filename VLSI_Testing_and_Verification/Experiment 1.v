//Design
module mux(input [3:0]i, [1:0]s, output y);
	assign y = s[1]?(s[0]?i[3]:i[2]):(s[0]?i[1]:i[0]); 
endmodule 

//TB
module mux_tb;
	reg [3:0] i;// Input of mux
	reg [1:0] s; //select line of mux
	wire y; // output of mux
	integer x = 0; // integer to count error
	mux uut(i,s,y); //instantiation 

	initial begin
		repeat(10)begin //test 10 times
			i = $random; // random input (4 bits)
			s = $random; // random select input (2 bits)
			#20; //20 ns delay as mentioned in exp requirement
			if (y != i[s]) x = x + 1; //check if y is mapped to correct input 
		end
		if(!x) $display("Success"); //print success when no loop raises error
		else $display("Failure"); // else print failure
	end
endmodule 