module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire tmp;
    add16 add1(.a(a[15:0]), .b(b[15:0]),.cin(1'b0), .sum(sum[15:0]), .cout(tmp));
    add16 add2(.a(a[31:16]), .b(b[31:16]),.cin(tmp), .sum(sum[31:16]));
    
endmodule
