`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:42:39 01/24/2022 
// Design Name: 
// Module Name:    mux41 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux41(input a, b, c, d, s0, s1, output y);
assign y=((~(s0))&(~(s1))&a)||((~(s0))&s1&b)||(s0&(~(s1))&c)||(s0&s1&d);
endmodule
