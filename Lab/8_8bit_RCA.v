// full adder
module FA(
  input a,
  input b,
  input cin, 
  output sum,
  output cout);
  assign sum = a ^ b ^ cin;
  assign cout = ((a && b) || (a && cin) || (b && cin));
endmodule 

// 8 bit RCA using Full Adder
module RCA(
  input [7:0]a,
  input [7:0]b, 
  input cin,
  output [7:0]sum,
  output carry);
  wire [6:0] co;
  FA ff1(a[0], b[0], cin, sum[0], co[0]);
  FA ff2(a[1], b[1], co[0], sum[1], co[1]);
  FA ff3(a[2], b[2], co[1], sum[2], co[2]);
  FA ff4(a[3], b[3], co[2], sum[3], co[3]);
  FA ff5(a[4], b[4], co[3], sum[4], co[4]);
  FA ff6(a[5], b[5], co[4], sum[5], co[5]);
  FA ff7(a[6], b[6], co[5], sum[6], co[6]);
  FA ff8(a[7], b[7], co[6], sum[7], carry);
endmodule
 
// Testbench
  module tb;
	reg [7:0] a, b;
	reg cin;
	wire carry;
  wire [7:0] sum;
	integer i;
	integer x;
    RCA dut (a,b,cin,carry,sum);
    initial begin
       repeat(10) begin
         x =0;
         a = $random;
         b = $random;
         cin = $random;
         i = a+b+cin;
         #1;
         if ({carry,sum}!=i) x = x+1;
         else $display("input is %d,%d,%d , output is %d",a,b,cin,{carry,sum});
         #10;
       end
     end  
endmodule
