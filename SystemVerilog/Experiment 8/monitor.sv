class monitor;
  virtual intf vif;
  mailbox mon2scb;
  transaction trans;
    event drv_done;
  
  function new(virtual intf vif, mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    forever begin
    trans = new();
    @(posedge vif.clk);
    #1;
    trans.a = vif.a;
    trans.b = vif.b;
    
    trans.sum = vif.sum;
    mon2scb.put(trans);
    trans.display("Monitor");
    ->drv_done;
    end
  endtask
  
endclass