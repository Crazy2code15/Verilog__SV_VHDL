// Transmission Gate Verilog Code

module transmission_gate(output out,input A,in);
	
	wire Abar;
	assign Abar = ~A;
	
  nmos n1(out,in,A);
  pmos p1(out,in,Abar);
  
  //cmos c1(out,in,A,Abar);
	
endmodule

// Testbench Transmission_Gate

include "transmission_gate.v"
module tb();
  wire out;
  reg in, A;
  transmission_gate dut(out,A,in);
  initial begin
       in = 1'b0; A = 1'b0;
   #5  in = 1'b0; A = 1'b1;
   #5  in = 1'b1; A = 1'b0;
   #5  in = 1'b1; A = 1'b1;
  end
  
  initial begin 
    $monitor("the input is %b %b ",in,A, "output is ",out);
  end
endmodule
