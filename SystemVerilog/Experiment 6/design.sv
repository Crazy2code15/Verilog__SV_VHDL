module full_adder(input a,b,cin, output s,cy);
<<<<<<< HEAD
  assign s= a^b^cin;
  assign cy= a&b || b&cin || cin&a;
=======
  assign {cy,s} = a+b+cin;
>>>>>>> 6a47234895e395691d0502c6371e9aa387a2cde3
endmodule