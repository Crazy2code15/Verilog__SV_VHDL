module top_module();
    reg [2:0] s;
    reg clk,in;
    wire out;
    q7 ins(clk,in,s,out);
initial begin
    clk =0;
    s = 3'b010; in = 0;
    #10 s = 3'b110;
    #10 s = 3'b010; in = 1;
    #10 s = 3'b111; in = 0;
    #10 s = 3'b000; in = 1;
    #30 in = 0;
end
    always begin #5 clk = !clk; end  
    
endmodule
