class packet;
  rand bit [3:0] addr;
  rand bit [3:0] start_addr;
  rand bit [3:0] end_addr;
  
  constraint addr1_range { !(addr inside{[start_addr:end_addr]});}
endclass


module constr_inside;
  initial begin
    packet packt;
    packt=new();
    $display("-------------------------------------");
    repeat(3) begin
      packt.randomize();
      $display("\t the start addres=%0d, end address= %0d", packt.start_addr, packt.end_addr);
      $display("\t the address= %0d", packt.addr);
      $display("-------------------------------------");
    end
  end 
endmodule