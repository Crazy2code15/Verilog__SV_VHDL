class driver;
  virtual intf vif;
  mailbox gen2driv;
  transaction trans;
  
  function new(virtual intf vif, mailbox gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
    gen2driv.get(trans);
    
    vif.a <= trans.a;
    vif.b <= trans.b;
    vif.cin <= trans.cin;
    trans.s = vif.s;
    trans.cy = vif.cy;
<<<<<<< HEAD
    trans.display("****************Driver****************");
=======
    trans.display("Driver");
>>>>>>> 6a47234895e395691d0502c6371e9aa387a2cde3
  endtask
  
endclass