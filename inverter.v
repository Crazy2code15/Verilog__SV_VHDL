// not_gate Verilog code
//Data Flow Modelling

module inverter(input a, output y);
  assign y = ~ a;
endmodule

//Gate Level Modelling

module inverter(input a, output y);
  not(y,a);
endmodule

//Behavioural Modelling

module inverter(input a, output reg y);
  always @(a) begin
    if (a == 1'b1)begin
      y = 1'b0;
    end
    else
      y = 1'b1;
  end
endmodule

//testbench inverter

include "inverter.v"
module tb();
  reg ta;
  wire ty;
  inverter dut(ta,y);
  initial begin
       ta = 0;
    #5 ta = 1;
  end
  
  initial begin 
    $monitor("input is %b ",ta, "output is ",y);
  end
endmodule
