module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    always@(posedge clk) if(a==b) state <= a;
    always@(*)begin
        if (state) q<= !(a^b);
        else q<= a^b;end

endmodule