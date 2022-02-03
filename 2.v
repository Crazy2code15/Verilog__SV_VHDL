module test;
  int array_2d[4][3]='{'{0,1,2},'{3,4,5}, '{6,7,8}, '{9,10,11}};
  
  initial begin 
    // array_2d='{'{0,1,2},'{3,4,5}, '{6,7,8}, '{9,10,11}};
    
    foreach(array_2d[i,j])
      $display("array_2d[%0d][%0d]=%d",i,j,array_2d[i][j]);
    
  end
endmodule
