// Code your design here
module arrays();
  integer array_1[], array_2[]; 
  int x,y;
  
  initial begin
    array_1 = new[10];
    array_1 = {2,4,6,8,10,12,14,16,18,20};
    array_2 = new[10];
	array_2 = {1,3,5,7,9,11,13,15,17,29};
    
    $display("array_1 is ",array_1);
    $display("array_1 is ",array_2);
  
    foreach(array_1[i]) x = x+array_1[i];
    $display("sum of elements in array_1 is %0d",x);
    foreach(array_2[i]) y = y+array_2[i];
    $display("sum of elements in array_2 is %0d",y);
  	
    array_2 = new[20]({array_2,array_1});
    array_1.delete();
  
    $display("array_1 is ",array_1);
    $display("array_2 is ",array_2);
  end
endmodule