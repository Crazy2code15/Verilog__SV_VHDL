module love(
  input Care,
  input Undestanding,
  input feeling,
  output reg Love);

// Data modelling
always@(*) begin
Love <= Care && Understanding && feeling;
end
endmodule
