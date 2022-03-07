// Code your testbench here
// or browse Examples
module arrays();
  bit [7:0] array1[10], array2[10]; 
  int x;
  
  initial begin
    array1 = '{2,4,6,8,10,12,14,16,18,20};
	array2 = '{1,3,5,7,9,11,13,15,17,29};
    
    $display("array1 is ",array1);
    $display("array2 is ",array2);
  
  	array2 = array1;
  	foreach(array1[i]) if(array1[i] != array2[i]) x = x+1;
  
    if(x) $display("not match");
  	else $display(" match");
  end
endmodule