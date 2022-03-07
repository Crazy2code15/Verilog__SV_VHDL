//design
module bitadder(input [3:0]a,b,
                 input cin, 
                 output [3:0]sum,
                 output cout);
  assign {cout,sum} = a+b+cin;
endmodule
  
//tb
module tb();
  reg [3:0] a,b;
  wire [3:0] sum;
  reg cin;
  wire cout;
  bitadder uut(a,b,cin,sum,cout);
  
  initial begin
    repeat(10) begin
      {a,b,cin}=$random;
      #5; 
      $display("The input is %d %d %d and The output is %d %d",a,b,cin,sum,cout);    
    end
  end
endmodule
  