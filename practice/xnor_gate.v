// exnor_gate Verilog code

//Data flow modelling

module xnor_gate(input a,b, output y);
  assign y = ! ( a ^ b );
endmodule

//Gate Level Modelling

module xnor_gate(input a,b, output y);
  xnor(y,a,b);
endmodule

//Behavioural Modelling

module xnor_gate(input a,b, output reg y);
  always @ (a or b) begin
    if (a == 1'b0 & b == 1'b0) begin
        y = 1'b1;
     end
    if (a == 1'b1 & b == 1'b1) begin
         y = 1'b1;
     end   
     else 
        y = 1'b0;
  end
 endmodule

//testbench xnor_gate

include "xnor_gate.v"
module tb();
  reg ta,tb;
  wire ty;
  xnor_gate dut(ta,tb,y);
  initial begin
       ta = 0; tb = 0;
    #5 ta = 1; tb = 0;
    #5 ta = 0; tb = 1;
    #5 ta = 1; tb = 1;
  end
  
  initial begin 
    $monitor("input is %b %b",ta,tb, "output is ",y);
  end
endmodule
