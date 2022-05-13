`include "interface.sv"
`include "test"
module tbench_top;
  bit clk,reset;
  
  always #5 clk = !clk;
  intf i_intf(clk,reset);
  test t1(i_intf);
  full_adder f1(i_intf.a,i_intf.b,i_intf.clk,i_intf.reset,i_intf.sum);
    
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    reset = 1;
    #5;
    reset = 0;
  end
endmodule