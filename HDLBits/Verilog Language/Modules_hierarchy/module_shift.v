/*module my_dff (input clk, d, output reg q); //None Blocking style
  always @(posedge clk) begin
    q <= d;
  end
endmodule*/
module top_module ( input clk, input d, output reg q );
    wire x1, x2;
    my_dff dff1( .clk(clk), .d(d),.q(x1));
    my_dff dff2( .clk(clk),.d(x1),.q(x2));
    my_dff dff3( .clk(clk),.d(x2),.q(q));
    
  //  dff inst_1 (.d(data), .q(net_1), .clk(clock));
  //dff inst_2 (.clk(clock), .d(net_1), .q(q_out));
endmodule

