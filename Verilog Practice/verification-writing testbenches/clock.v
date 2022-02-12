module top_module ( );
    reg clk;
    dut clock(.clk(clk));
    initial clk=0;
    always begin 
        #5 clk=~clk;
    end
    
        

endmodule