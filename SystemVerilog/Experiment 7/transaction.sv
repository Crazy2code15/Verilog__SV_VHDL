class transaction;
  rand bit [3:0] a;
  rand bit [3:0] b;
  
  bit [3:0] s;
  bit cy;
  
  function void display(string name);
    $display("%s",name);
    $display("a=%0d, b=%0d",a,b);
    $display("sum=%0d, carry=%0d", s, cy);
  endfunction
endclass