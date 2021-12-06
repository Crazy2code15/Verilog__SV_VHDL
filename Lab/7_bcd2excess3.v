// Dataflow                        
module bcd_ex3(
    input a,
    input b,
    input c,
    input d,
    output w,
    output x,
    output y,
    output z
    );

assign w = (a | (b & c) | (b & d));
assign x = (((~b) & c) | ((~b) & d) | (b & (~c) & (~d)));
assign y = ((c & d) | ((~c) & (~d)));
assign z = ~d;
  
endmodule

//Testbench

module tb();
  reg a,b,c,d ;
  wire w,x,y,z;
  bcd_ex3 dut(a,b,c,d,w,x,y,z);
  initial begin
    $monitor("@time %3d : when input is %b %b %b %b output is %b %b %b %b",$time,a,b,c,d,w,x,y,z);
    a=0; b=0; c=0; d=0;
    #100;
    a=0; b=0; c=1; d=1;
    #100; 
    a=0; b=1; c=0; d=1;
  end
endmodule

// Behavioural 
module bcd_ex3(input [3:0]i, output [3:0]y);
  always@(i)begin
    y <= i+3;
  end
endmodule

// Testbench
module tb();
  reg [3:0]i;
  wire [3:0]y;
  integer x;
  bcd_ex3 dut(i,y);
  initial begin
    $monitor("@time %3d : when input is %b output is %b",$time,i,y);
    for (x=0; x <16; x=x+1) begin
      i=x;
      #5;
    end
    $finish;
  end
endmodule
