//traffic_emergency.v
module Timer_emergency(TS, TL, TS2, ST, Clk);
  output TS, TL, TS2;
  input  ST, Clk;
  integer value;

  assign TS  = (value >= 4); 
  assign TL  = (value >= 14);
  assign TS2 = (value >= 1);
  always @(posedge ST) value = 0;
  always @(posedge Clk) value = value + 1;
endmodule
 
module FSM_emergency(HR, HY, HG, FR, FY, FG, ST, TS, TL, TS2, C, Emergency, reset, Clk);
  output HR, HY, HG, FR, FY, FG;
  output reg ST;
  input  TS, TL, TS2, C, Emergency, reset, Clk;

  reg [5:0] state;

  parameter highwaygreen   = 6'b001100;
  parameter highwayyellow  = 6'b010100;
  parameter farmroadgreen  = 6'b100001;
  parameter farmroadyellow = 6'b100010;

  assign {HR, HY, HG, FR, FY, FG} = state;

  always @(posedge Clk) begin
    if (reset) begin
        state <= highwaygreen;
        ST <= 1;
    end else begin
      ST <= 0;
      case (state)
        highwaygreen:
          if ((TL & C) | Emergency) begin
            state <= highwayyellow;
            ST <= 1;
          end
        highwayyellow:
          if (Emergency ? TS2 : TS) begin
            state <= farmroadgreen;
            ST <= 1;
          end
        farmroadgreen:
          if (TL | !C) begin
            state <= farmroadyellow;
            ST <= 1;
          end
        farmroadyellow:
          if (TS) begin
            state <= highwaygreen;
            ST <= 1;
          end
      endcase
    end
  end
endmodule
 
module traffic_emergency(HR, HY, HG, FR, FY, FG, reset, C, Emergency, Clk);
  output HR, HY, HG, FR, FY, FG;
  input  reset, C, Emergency, Clk;
  wire TS, TL, TS2, ST;

  Timer_emergency part1(.TS(TS), .TL(TL), .TS2(TS2), .ST(ST), .Clk(Clk));
  FSM_emergency   part2(.HR(HR), .HY(HY), .HG(HG), .FR(FR), .FY(FY), .FG(FG),
                        .ST(ST), .TS(TS), .TL(TL), .TS2(TS2), .C(C),
                        .Emergency(Emergency), .reset(reset), .Clk(Clk));
endmodule
