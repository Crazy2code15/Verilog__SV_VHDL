`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design code 
//////////////////////////////////////////////////////////////////////////////////
module mux41(input a, b, c, d, s0, s1, output y);
assign y=((~(s0))&(~(s1))&a)||((~(s0))&s1&b)||(s0&(~(s1))&c)||(s0&s1&d);
endmodule

//Testbench Code
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
