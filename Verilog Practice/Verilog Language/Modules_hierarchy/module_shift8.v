module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] x1,x2,x3;
    my_dff8 dff1( .clk(clk), .d(d), .q(x1) );
    my_dff8 dff2( .clk(clk), .d(x1), .q(x2) );
    my_dff8 dff3( .clk(clk), .d(x2), .q(x3) );
    
    always@(*) begin
        case (sel)
            2'b00: q=d;
            2'b01: q=x1;
            2'b10: q=x2;
            default: q=x3;
         endcase
    end
endmodule
