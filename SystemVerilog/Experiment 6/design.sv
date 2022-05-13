module full_adder(input a,b,cin, output s,cy);
  assign {cy,s} = a+b+cin;
endmodule