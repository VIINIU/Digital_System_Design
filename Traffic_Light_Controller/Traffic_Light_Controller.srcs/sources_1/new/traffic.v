`timescale 1ns/1ps
module traffic(HR, HY, HG, FR, FY, FG, reset, C, Emergency, Clk);
    output HR, HY, HG, FR, FY, FG;
    input reset, C, Emergency, Clk;
    
    wire TS, TL, TS2, ST;

    // 하위 타이머 및 FSM 모듈 연결
    Timer part1 (
        .TS(TS), .TL(TL), .TS2(TS2), .ST(ST), .Clk(Clk)
    );
    
    FSM part2 (
        .HR(HR), .HY(HY), .HG(HG), .FR(FR), .FY(FY), .FG(FG), 
        .ST(ST), .TS(TS), .TL(TL), .TS2(TS2), .C(C), 
        .Emergency(Emergency), .reset(reset), .Clk(Clk)
    );
endmodule