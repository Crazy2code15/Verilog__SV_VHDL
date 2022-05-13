class driver;
  virtual intf vif;
  mailbox gen2driv;
  transaction trans;
  
  function new(virtual intf vif, mailbox gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
    forever begin
    gen2driv.get(trans);
    
    vif.a <= trans.a;
    vif.b <= trans.b;
    trans.sum = vif.sum;
    trans.display("Driver");
    end
  endtask
  
endclass