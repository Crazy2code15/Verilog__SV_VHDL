//Design
module fa(input a,b,c, output s,cy);
	assign s = a^b^c; 
	assign cy = a&b | b&c | a&c; 
endmodule

//TB
module tb();
	reg a,b,c; //inputs
	wire s,cy; //outputs
    integer x=0; //error counter
	fa dut(a,b,c,s,cy); // instantiation
	
	initial begin
		repeat(100) begin //100 tests
			{a,b,c} = $random; //random input stimuli
			#1; //delay to see dut output 
			if ({cy,s} != a+b+c) x = x+1; // check if the output is as expected
		end
        if(!x) $display("SUCCESS"); //print success if correct
	    else $display("FAILURE"); //print failure is not
	end
endmodule 