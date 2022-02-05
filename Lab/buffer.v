// Buffer Verilog code

// Data Flow Modelling

module buffer(input a, output y);
  assign y = a;
endmodule

// Behavioural Modelling

module buffer(input a, output reg y);
  always @(a) begin
    if (a == 1'b1)begin
      y = 1'b1;
    end
    else
      y = 1'b0;
  end
endmodule

// testbench buffer

include "buffer.v"
module tb();
  reg ta;
  wire ty;
  buffer dut(ta,y);
  initial begin
        ta = 0;
    #5  ta = 1;
  end
  
  initial begin
    $monitor("input is %b",ta,"output is",y);
  end
endmodule
