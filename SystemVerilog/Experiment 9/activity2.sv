class packet;
  rand bit [3:0] addr;
  
  constraint addr_range;
endclass

constraint packet :: addr_range {addr >5;}

module extern_constr;
  initial begin
    packet packt;
    packt=new();
    
    repeat(10) begin
      packt.randomize();
      $display("\t the address values=%0d", packt.addr);
    end
  end 
endmodule