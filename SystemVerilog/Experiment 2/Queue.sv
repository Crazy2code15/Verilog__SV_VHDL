// Code your testbench here
// or browse Examples
module arrays();
 int x;
  int queue_1[$],queue_2[$];
  initial begin
    int queue_1[$] = {3,4,5,6};
    int queue_2[$] = {10,11,12,13};
    
    $display("queue 1 is ",queue_1);
    $display("queue 2 is ",queue_2);
    
    queue_1.insert(1,10);
  	$display("queue 1 is ",queue_1);
    
    foreach(queue_2[i]) queue_1.insert(4+i,queue_2[i]);
    $display("queue 1 is ",queue_1);
    
    queue_1.delete(0);
    $display("queue 1 is ",queue_1);
    
    queue_1.push_front(20);
    $display("queue 1 is ",queue_1);
    
    x = queue_1.pop_back();
    $display("queue 1 is ",queue_1);
    
    queue_1.push_back(30);
    $display("queue 1 is ",queue_1);
    
    x = queue_1.pop_front();
    $display("queue 1 is ",queue_1);
  end
endmodule

