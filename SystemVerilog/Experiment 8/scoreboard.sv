class scoreboard;

  mailbox mon2scb;
  transaction trans;
  int no_trans,x;
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    forever begin
    mon2scb.get(trans);
   	no_trans++;
    trans.display("Scoreboard");
    if(trans.sum == trans.a+trans.b)begin
      x++;
      $display("Success \n\n");
    end
    else 
      $error("Wrong Result");
    end
  endtask
  
endclass