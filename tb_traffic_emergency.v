`timescale 1ns / 1ps

module tb_traffic_emergency;
 reg C;
 reg Emergency;
 reg Clk;
 reg reset;
 
 wire HR, HY, HG, FR, FY, FG;
 
 traffic_emergency testmodule (
  .HR(HR),
  .HY(HY),
  .HG(HG),
  .FR(FR),
  .FY(FY),
  .FG(FG),
  .reset(reset),
  .C(C),
  .Emergency(Emergency),
  .Clk(Clk)
 );
 
 initial begin
  Clk = 0;
  forever #1 Clk = ~Clk;
 end
 
 iinitial begin
    C = 0;
    Emergency = 0;
    reset = 1;
    #10;        // t=10
    reset = 0;
    #20;        // t=30
    C = 1;
    #20;        // t=50
    C = 0;
    #30;        // t=80
    C = 1;
    #80;        // t=160
    C = 0;
    #40;        // t=200
    Emergency = 1;
    #30;        // t=230
    Emergency = 0;
    
    #100;       // t=330, 충분한 관찰 시간
    $finish;
 end
endmodule