module love(
  input Care,
  input Undestanding,
  input feeling,
  input Respect,
  output reg Love);

// Dataflow modelling
always@(*) begin
Love <= Respect && Care && Understanding && feeling;
end
endmodule
