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
    reg a; b; c;

    // Outputs
    wire s; cy;

    // Instantiate the Unit Under Test (UUT)
    fa uut (.a(a), .b(b), .c(c), .s(s), .cy(cy));

    initial begin
        // Initialize Inputs
        a = 0; b = 0;c = 0;
        // Wait 100 ns for global reset to finish
        #20;
        a = 0; b = 0;c = 1;
        // Wait 100 ns for global reset to finish
        #20;
        a = 0; b = 1;c = 0;
        // Wait 100 ns for global reset to finish
        #20;
        a = 0; b = 1;c = 1;
        // Wait 100 ns for global reset to finish
        #20;
      a = 1; b = 0;c = 0;
        // Wait 100 ns for global reset to finish
        #20;
        a = 1; b = 0;c = 1;
        // Wait 100 ns for global reset to finish
        #20;
        a = 1; b = 1;c = 0;
        // Wait 100 ns for global reset to finish
        #20;
        a = 1; b = 1;c = 1;
        // Wait 100 ns for global reset to finish
        #20;
    end
    initial begin $monitor($time, "a=%b, b=%b, c=%b, s=%b, cy=%b", a,b,c,s,cy);end
endmodule

