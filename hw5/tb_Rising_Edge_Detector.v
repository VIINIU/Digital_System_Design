//tb_Rising_Edge_Detector.v

timescale 1ns / 1ps
 
module tb_Rising_Edge_Detector;
  reg in;
  reg Clk;
  reg reset;
  wire out;

  Rising_Edge_Detector testmodule (
    .out(out),
    .in(in),
    .reset(reset),
    .Clk(Clk)
  );

  initial begin
    Clk = 0;
    forever #1 Clk = ~Clk;
  end

  initial begin
    in = 0;
    reset = 1;
    #10;
    reset = 0;
    #10;
    in = 1;
    #10; 
    in = 1;
    #10; 
    in = 0;
    #10; 
    in = 1;
    #10; 
    in = 0;
    #20; 
    $finish;
  end
endmodule