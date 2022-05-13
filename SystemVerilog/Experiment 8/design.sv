module bit4_adder(input [3:0]a,b, output [3:0]s, output cy);
  assign {cy,s}=a+b;
endmodule