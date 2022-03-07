// Code your design here
module dff (
    input clk,
    input  d,
    output reg q
);
    always@(posedge clk)
        begin
            q<=d;
        end
endmodule


// Code your testbench here
// or browse Examples
module tb;
  bit d,clk,q;
  dff uut(clk,d,q);
  
  initial forever #5 clk=~clk;
  
  initial begin 
    repeat (10) begin
      @(negedge clk) d = $random;
      #5;
      $display(" %0d The input is d=%b and the output is q=%b ",$time,d,q);
    end
  end
endmodule
