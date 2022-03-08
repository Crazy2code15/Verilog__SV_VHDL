// Build a circuit that sign-extends an 8-bit number to 32 bits. This requires a concatenation of 24 copies of the sign bit (i.e., replicate bit[7] 24 times) followed by the 8-bit number itself.


module top_module (
	input [7:0] in,
	output [31:0] out
);

	// Concatenate two things together:
	// 1: {in[7]} repeated 24 times (24 bits)
	// 2: in[7:0] (8 bits)
	assign out = { {24{in[7]}}, in };
	
endmodule
