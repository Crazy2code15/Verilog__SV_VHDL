class monitor;
  virtual intf vif;
  mailbox mon2scb;
  transaction trans;
  
  function new(virtual intf vif, mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    #3;
    trans = new();
    trans.a = vif.a;
    trans.b = vif.b;
    trans.cin = vif.cin;
    trans.s = vif.s;
    trans.cy = vif.cy;
    mon2scb.put(trans);
    trans.display("Monitor");
    
  endtask
  
endclass