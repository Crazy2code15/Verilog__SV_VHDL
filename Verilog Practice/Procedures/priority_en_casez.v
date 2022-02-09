// Build a priority encoder for 8-bit inputs. Given an 8-bit vector, the output should report the first bit in the vector that is 1. Report zero if the input vector has no bits that are high. For example, the input 8'b10010000 should output 3'd4, because bit[4] is first bit that is high.

// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );
    
    always@(*) begin
        casez(in)
            8'bzzzzzzz1:begin pos=3'd0;end
            8'bzzzzzz10:begin pos=3'd1;end
            8'bzzzzz100:begin pos=3'd2;end
            8'bzzzz1000:begin pos=3'd3;end
            8'bzzz10000:begin pos=3'd4;end
            8'bzz100000:begin pos=3'd5;end
            8'bz1000000:begin pos=3'd6;end
            8'b10000000:begin pos=3'd7;end
            default:begin pos=3'd0; end
        endcase   
    end
endmodule
