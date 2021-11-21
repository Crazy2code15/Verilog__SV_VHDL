// OR Gate Verilog Code

// Data Flow Modelling

module or_gate(input a,b, output y);
  assign y = a || b;
endmodule


// Gate level Modelling

module or_gate(input a,b, output y);
  or(y,a,b);
endmodule

// Behavioural Modelling

module or_gate (input a, b, output reg y);
  always @ (a or b) begin
    if (a == 1'b0 & b == 1'b0) begin
        y = 1'b0;
    end
    else 
        y = 1'b1; 
end
endmodule

//Testbench or_gate

include "or_gate.v"
module tb();
  reg ta,tb;
  wire ty;
  
  or_gate dut(ta,tb,ty);
  initial begin
    ta = 0; tb = 0;
 #5 ta = 0; tb = 1;
 #5 ta = 1; tb = 0;
 #5 ta = 1; tb = 1;   
end
  
  initial begin
    $monitor("the input is %b %b",ta,tb, "output is ",ty);
  end
endmodule
