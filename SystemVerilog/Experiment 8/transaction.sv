class transaction;
  rand bit [3:0] a;
  rand bit [3:0] b;
  
  bit [6:0] sum;
  
  function void display(string name);
    $display("@ %s component: inputs are %0d,%0d, and outputs: sum=%0d",name,a,b,sum);
  endfunction
endclass