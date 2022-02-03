module test;
  bit [11:0] my_array[4];
  
  initial begin
    my_array='{12'h012, 12'h345, 12'h678, 12'h9AB};
    
    $display("\n Using For loop");
    for(int i=0; i<$size(my_array); i++) begin
      $displayh("my_array(%0d)=%b,%b",i,my_array[i], my_array[i][5:4]);
    end
    
    $display("\n Using Foreach loop");
    foreach(my_array[i]) begin
      $displayh("my_array(%0d)=%b,%b",i,my_array[i], my_array[i][5:4]);
    end
    
    $display("\n Adding 4 values");
    $display("\n Using For loop");
    for(int i=0; i<$size(my_array); i++) begin
      my_array[i] +=4;
      $displayh("my_array(%0d)=%b,%b",i,my_array[i]);
    end
    
    my_array='{12'h012, 12'h345, 12'h678, 12'h9AB};
    $display("\n Using Foreach");
    foreach(my_array[i]) begin
      my_array[i] +=4;
      $displayh("my_array(%0d)=%b,%b",i,my_array[i]);
    end

  end
endmodule
