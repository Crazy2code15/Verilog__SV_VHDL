module cf(
  input I0, I1, I2, I3, I4, I5, I6, I7, I8,
  output reg Y);
  
  reg y9, y10, y11, y12, y13, y14, y15, y16, y17;
  
  always@(I1 or I8) begin
    if(I1>I8)
      y9=I1;
    else
      y9=I8;
  end
  
  always@(I4 or I6) begin
    if(I4<I6)
      y10=I4;
    else
      y10=I6;
  end
  
  always@(I6 or y9) begin
    if(I6>y9)
      y12=I6;
    else
      y12=y9;
  end
  
  always@(y12 or y13) begin
    if(y12<y13)
      y15=y12;
    else
      y15=y13;
  end
  
  always@(y13 or y14) begin
    if(y13<y14)
      y16=y13;
    else
      y16=y14;
  end
  
  always@(I8 or y11) begin
    if(I8<y11)
      y14=I8;
    else
      y14=y11;
  end
  
  always@(I3 or y14) begin
    if(I3<y14)
      y17=I3;
    else
      y17=y14;
  end
  
  always@(I2 or I6) begin
    if(1)
      y11=I2;
    else
      y11=I6;
  end
  
  always@(y10 or y11) begin
    if(1)
      y13=y10;
    else
      y13=y11;
  end
  
  always@(*) begin
    Y<=y15;
  end
endmodule


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
