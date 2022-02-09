/*
You are provided with a BCD one-digit adder named bcd_fadd that adds two BCD digits and carry-in, and produces a sum and carry-out.

module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
Instantiate 100 copies of bcd_fadd to create a 100-digit BCD ripple-carry adder. Your adder should add two 100-digit BCD numbers (packed into 400-bit vectors) and a carry-in to produce a 100-digit sum and carry out.

*/

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] tmp;
    bcd_fadd bcd_1(a[3:0],b[3:0],cin,tmp[0],sum[3:0]);
    assign cout=tmp[99];
    
    generate
        genvar i;
        for(i=4;i<=399;i=i+4)
            begin:bcdadder
                bcd_fadd bcd_2(a[i+3:i],b[i+3:i],tmp[(i-4)/4],tmp[i/4],sum[i+3:i]);
            end
    endgenerate

endmodule
