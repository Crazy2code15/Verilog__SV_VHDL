class transaction;
  rand bit a;
  rand bit b;
  rand bit cin;
  
  bit s;
  bit cy;
  
  function void display(string name);
<<<<<<< HEAD
    $display("%s",name);
    $display("a=%0d, b=%0d, c=%0d",a,b, cin);
    $display("sum=%0d, carry=%0d", s, cy);
=======
    $display("@ %s component: inputs are %0d,%0d,%0d, and outputs: sum=%0d, cy=%0d",name,a,b,cin,s,cy);
>>>>>>> 6a47234895e395691d0502c6371e9aa387a2cde3
  endfunction
endclass