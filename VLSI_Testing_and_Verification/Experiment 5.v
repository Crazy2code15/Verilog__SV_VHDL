//DUT

module fsm(input i,rst,clk, output y);
	parameter idle=3'b000, s1=3'b001, s10=3'b010, s100=3'b011, s1001=3'b100;
	reg [2:0] p_state,nxt_state; 
	
	always@(*)begin
		case(p_state)
			idle	: nxt_state <= i ? s1 	: idle;
			s1		: nxt_state <= i ? s1 	: s10;
			s10		: nxt_state <= i ? s1 	: s100;
			s100	: nxt_state <= i ? s1001: idle;
			s1001 : nxt_state <= i ? s1	: s10	;
		endcase
	end
	
	always@(posedge clk)begin
		if(rst) p_state <= idle;
		else p_state <= nxt_state;
	end
	
	assign y = (p_state == s1001) ? 1 : 0;
endmodule 

//TB

module tb;

	
	reg i=0,rst,clk=0;// Inputs
	wire y;// Output
	fsm uut (i,rst,clk,y);// Instantiate the Unit Under Test (UUT)
	reg [3:0]q=0	;
	integer err = 0;
	
	initial forever #5 clk = !clk;
	initial forever @(posedge clk) q <= {q[2:0],i};
	
	initial begin
		$monitor("%0d : input i = %b state is %d, output y = %b ",$time,i,uut.p_state,y);
		rst = 1'b1;
		#10;
		rst = 1'b0;
		@(negedge clk) i = 1;
		@(negedge clk) i = 0;
		@(negedge clk) i = 0;
		@(negedge clk) i = 1;
		@(negedge clk) i = 0;
		@(negedge clk) i = 0;
		@(negedge clk) i = 1;
		@(negedge clk) i = 0;
		@(negedge clk) i = 1;
		@(negedge clk) i = 0;
		@(negedge clk) i = 0;
		@(negedge clk) i = 0;
		@(negedge clk) i = 1;
		@(negedge clk) i = 0;
		@(negedge clk) i = 0;
		@(negedge clk) i = 1;
		#100;
		if(err) $display("error"); else $display("success");
		#20;
		$finish;
	end      
	
	always@(q)begin
		if(q == 4'b1001)begin
			@(negedge clk);
			if(!y) err = err+1;
		end
	end
	
endmodule  