`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Design Code
//////////////////////////////////////////////////////////////////////////////////

module fa(input a,b,c, output s,cy);
	assign s = a^b^c; //logic for sum
	assign cy = a&b | b&c | a&c; //logic for carry 
endmodule

// Testbench Code

module tb;

    // Inputs
    reg a; b; c; d; s0; s1;

    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux41 uut (.a(a), .b(b), .c(c), .d(d), .s0(s0), .s1(s1), .y(y));

    initial begin
        // Initialize Inputs
        a = 0; b = 0; c = 0; d = 1; s0 = 0; s1 = 0;
        #20;
        a = 0; b = 0; c = 0; d = 1; s0 = 0; s1 = 1;
        #20;
        a = 0; b = 0; c = 0; d = 1; s0 = 1; s1 = 0;
        #20;
        a = 0; b = 0; c = 0; d = 1; s0 = 1; s1 = 1;
        end
initial begin 
$monitor ($time , "a=%b, b=%b, c=%b, s0=%b, S1=%b", a,b,c,s0,s1);
End
endmodule
