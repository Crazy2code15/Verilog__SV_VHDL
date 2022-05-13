class packet;
  rand bit [3:0] addr;
  
  constraint addr_range{ addr >5 ;}
endclass

module constr_blocks;
  initial begin
    packet packt;
    packt=new();
    repeat(10) begin
      packt.randomize();
      $display("\t The address values =%0d", packt.addr);
    end
  end 
endmodule