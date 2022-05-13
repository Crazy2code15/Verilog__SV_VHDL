class transaction;
  rand bit a;
  rand bit b;
  rand bit cin;
  
  bit s;
  bit cy;
  
  function void display(string name);
    $display("@ %s component: inputs are %0d,%0d,%0d, and outputs: sum=%0d, cy=%0d",name,a,b,cin,s,cy);
  endfunction
endclass