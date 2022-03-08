// Tri-state Buffer Verilog Code

module tristate_buffer(a,c,f);
	input a,c;
	output f;
	assign f= c ? a : 1'bz;	
endmodule


// testbench Tri-State Buffer

include "tristate_buffer.v"
module tb();
  reg a,c;
  wire f;
  tristate_buffer dut(a,c,f);
  initial begin
	  $display ("RESULT\ta\tf");

	a = 0; c = 0; # 100; 
	  if ( f === 1'bz ) // Test for inversion
      		$display ("PASS\t%d\t%d",a,f);
	  else
      		$display ("FAIL\t%d\t%d",a,f);

	a = 0; c = 1; # 100; 
	  if ( f === 0 ) // Test for inversion
      		$display ("PASS\t%d\t%d",a,f);
	  else
      		$display ("FAIL\t%d\t%d",a,f);

	a = 1; c = 0; # 100; 
	  if ( f === 1'bz ) // Test for inversion
      		$display ("PASS\t%d\t%d",a,f);
	  else
      		$display ("FAIL\t%d\t%d",a,f);

	a = 1; c = 1; # 100; 
	  if ( f === 1 ) // Test for inversion
		  $display ("PASS\t%d\t%d",a,f);
	  else
		  $display ("FAIL\t%d\t%d",a,f);

	end
  
  initial begin
    //dump waveform
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
