class generator;
  transaction trans;
  mailbox gen2driv;
  
  function new(mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
    trans = new();
    trans.randomize();
<<<<<<< HEAD
    trans.display("*************Generator****************");
=======
    trans.display("Generator");
>>>>>>> 6a47234895e395691d0502c6371e9aa387a2cde3
    gen2driv.put(trans);
  endtask
  
endclass