interface mem_int(
  input wire clk,rst,ce,we,
  input wire [7:0] data_in,addr_in,
  output logic [7:0] data_out);
endinterface

module ram(mem_int inf);
  logic [7:0] memory [256];
  
  always@(posedge inf.clk) begin
    if(inf.rst) inf.data_out <= 8'd0;
    else if (inf.ce) begin
      if(inf.we) memory[inf.addr_in] <= inf.data_in;
      else if(!inf.we) inf.data_out <= memory[inf.addr_in];
      else inf.data_out <= 8'd0;
    end
  end
endmodule 

module tb();
  logic clk=0,rst,ce,we;
  logic [7:0] data_in,addr_in;
  wire [7:0] data_out;
  
  mem_int int_tb(clk,rst,ce,we,data_in,addr_in,data_out);
  ram uut(int_tb);
  
  initial forever #5 clk = ~clk;
  
  task reset();
    begin
      rst <= 1'b1;
      ce <= 1'b0;
      repeat(2) @(posedge clk);
      rst <= 1'b0;
    end
  endtask
  
  task read(input [7:0] addr);
    logic [7:0] test;
    begin
      @(negedge clk);
      ce <= 1'b1;
      we <= 1'b0;
      addr_in <= addr;
      @(posedge clk) test <= uut.inf.data_out;
      @(negedge clk);
      ce <= 1'b0;
      $display("the data out is %d at %d",uut.inf.data_out,uut.inf.addr_in);
    end
  endtask
  
  task write(input [7:0] addr);
    begin
      @(negedge clk);
      ce <= 1'b1;
      we <= 1'b1;
      addr_in <= addr;
      data_in <= $random;
      @(negedge clk);
      ce <= 1'b0;
      $display("value written is %d at %d", uut.inf.data_in,uut.inf.addr_in);
    end
  endtask
    
    
  initial begin
    reset;
    for(int i=0; i<10; i++) write(i[7:0]);
    for(int i=0; i<10; i++) read(i[7:0]);
  end
endmodule