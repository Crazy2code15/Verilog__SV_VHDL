module bcd_to_binary(input [7:0]in, output [7:0]out);
    assign out = in[7:4]*10 + in[3:0]; 
endmodule 


module tb();
    reg [7:0]in;
    wire [7:0] out;
    integer x=0;
	 reg [3:0] y;
    bcd_to_binary dut(in,out);

    initial begin
        repeat(10)begin
				y = $random; //generating random input
				if (y > 9) y = y+6; //restricting it between 0 and 9
				in[3:0] = y; //assigning it to the lower bit
            
				y = $random; //generating random input
				if (y > 9) y = y+6; //restricting it between 0 and 9
				in[7:4] = y; //assigning it to the upper bit
            
				#1;
            if(out != in[7:4]*10 + in[3:0]) x = x+1; // self check if it is same
        end
        if(!x) $display("Success"); //print success when no loop raises error
		else $display("Failure"); // else print failure
    end
endmodule 




//4 digit

module bcd_to_bin(input [15:0]in, output [15:0]out);
    assign  out = in[15:12]*1000 + in[11:8]*100 + in[7:4]*10 + in[3:0];
endmodule

module tb();
    reg [15:0]in;
    wire [15:0] out;
    integer x=0;
	 reg [3:0] y;
    bcd_to_bin dut(in,out);

    initial begin
        repeat(10)begin
				y = $random;
				if (y > 9) y = y+6; //effective of rand(0,9)
				in[3:0] = y;
            
				y = $random;
				if (y > 9) y = y+6; //effective of rand(0,9)
				in[7:4] = y;
				
				y = $random;
				if (y > 9) y = y+6; //effective of rand(0,9)
				in[11:8] = y;
				
				y = $random;
				if (y > 9) y = y+6; //effective of rand(0,9)
				in[15:12] = y;
            
				#1;
            if(out != in[15:12]*1000 + in[11:8]*100 + in[7:4]*10 + in[3:0]) x = x+1;
        end
        if(!x) $display("Success"); //print success when no loop raises error
		else $display("Failure"); // else print failure
    end
endmodule 