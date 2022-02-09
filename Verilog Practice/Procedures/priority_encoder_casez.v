//Build a 4-bit priority encoder. For this problem, if none of the input bits are high (i.e., input is zero), output zero. Note that a 4-bit number has 16 possible combinations.

// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
       always@(*) begin 
           casez(in)
               4'bzzz1:begin pos=2'd0; end
               4'bzz10:begin pos=2'd1; end
               4'bz100:begin pos=2'd2; end
               4'b1000:begin pos=2'd3; end
               default: begin pos=2'd0; end
           endcase 
    end

endmodule
