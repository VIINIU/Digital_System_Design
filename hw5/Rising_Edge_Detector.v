// Rising_Edge_Detector.v
module Rising_Edge_Detector(out, in, reset, Clk);
  output out;
  input  in;
  input  reset;
  input  Clk;
  reg in_prev;
 
  always @(posedge Clk) begin
	  if (reset)
      in_prev <= 1'b0;
	  else
      in_prev <= in;
  end
  assign out = in & ~in_prev;
endmodule