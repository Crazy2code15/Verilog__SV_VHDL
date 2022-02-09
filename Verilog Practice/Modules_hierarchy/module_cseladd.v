module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1,cout2,cout3;
    reg [15:0] tmp1, tmp2;
    add16 ins1(a[15:0],b[15:0],0,sum[15:0],cout1);
    add16 ins2(a[31:16],b[31:16],0,tmp1,cout2);
    add16 ins3(a[31:16],b[31:16],1,tmp2,cout3);
    assign sum[31:16]=cout1?tmp2:tmp1;
   /* always@(cout1 or sum)
        begin
            case(cout1)
                0:tmp3=tmp1;
                1:tmp3=tmp2;
                default:tmp3=0;
            endcase
        end
    assign sum[31:16]=tmp3;
    */
endmodule
