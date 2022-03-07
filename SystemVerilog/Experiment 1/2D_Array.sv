// Code your testbench here
// or browse Examples
module test2;
  int array_2d[4][3]='{'{0,1,2},'{3,4,5}, '{6,7,8}, '{19,20,21}};
  
  initial begin 
    // array_2d='{'{0,1,2},'{3,4,5}, '{6,7,8}, '{19,20,21}};
    
    foreach(array_2d[i,j])
      $display("array_2d[%0d][%0d]=%d",i,j,array_2d[i][j]);
    
  end
endmodule