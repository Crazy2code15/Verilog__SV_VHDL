`include "transaction.sv" 
`include "generator.sv" 
`include "driver.sv" 
`include "monitor.sv" 
`include "scoreboard.sv" 

class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  mailbox m1,m2;
  event dr;
  
  virtual intf vif;
  function new(virtual intf vif);
    this.vif = vif;
    m1 = new();
    m2 = new();
    gen = new(m1);
    drv = new(vif,m1);
    mon = new(vif,m2);
    scb = new(m2);
  endfunction
  
  task test();
    fork
      gen.main();
      mon.main();
      drv.main();
      scb.main();
    join_any
  endtask
  
  task run;
    gen.count = 6;
    gen.drv_done = dr;
    mon.drv_done = dr;
    test();
    wait(gen.count == scb.no_trans);
    $display("%0d ON %0d TRANSACTIONS SUCCESSFULL",scb.x,scb.no_trans);
     $finish;
  endtask
endclass