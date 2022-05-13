class generator;
  transaction trans;
  mailbox gen2driv;
  int count;
  event drv_done;
  
  function new(mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
    trans = new(); 
    repeat(count)begin
    	trans.randomize();
    	trans.display("Generator");
    	gen2driv.put(trans);
      @(drv_done);
    end
  endtask
  
endclass