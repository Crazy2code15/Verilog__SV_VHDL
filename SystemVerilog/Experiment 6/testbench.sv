`include "interface.sv"
`include "test"
module tbench_top;
  intf i_intf();
  test t1(i_intf);
  full_adder f1(i_intf.a,i_intf.b,i_intf.cin,i_intf.s,i_intf.cy);
endmodule