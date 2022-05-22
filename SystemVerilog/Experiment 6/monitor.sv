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
<<<<<<< HEAD
    trans.display("***************Monitor****************");
=======
    trans.display("Monitor");
>>>>>>> 6a47234895e395691d0502c6371e9aa387a2cde3
    
  endtask
  
endclass