class scoreboard;

  mailbox mon2scb;
  transaction trans;
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    mon2scb.get(trans);
   
    if({trans.cy,trans.s} == trans.a+trans.b)
      $display("Success");
    else 
      $error("Wrong Result");
<<<<<<< HEAD
    trans.display("**************Scoreboard**************");
=======
    trans.display("Scoreboard");
>>>>>>> 6a47234895e395691d0502c6371e9aa387a2cde3
  endtask
  
endclass