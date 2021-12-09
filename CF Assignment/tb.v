//Testbench 

module tb();
  reg I0, I1, I2, I3, I4, I5, I6, I7, I8;
  wire Y;
  cf dut(I0, I1, I2, I3, I4, I5, I6, I7, I8,Y);
  initial begin
    $monitor("@time %3d : when input is %b %b %b %b %b %b %b %b %b output is %b",$time,I0,I1,I2,I3,I4,I5,I6,I7,I8,Y);
    #5 
    I0=0;
    I1=1;
    I2=0;
    I3=1;
    I4=0;
    I5=1;
    I6=0;
    I7=1;
    I8=1;
    
    #10
    I0=1;
    I1=1;
    I2=0;
    I3=1;
    I4=1;
    I5=1;
    I6=0;
    I7=0;
    I8=1;
    $finish;
  end
endmodule
