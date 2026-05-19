`timescale 1ns/1ps
module top (FARMTR, HIGHWAYTR, IND_FARMCAR, IND_AMB, Clk, RS, FARMCAR, AMB_IN);
    input Clk;
    input RS;
    input FARMCAR;
    input AMB_IN;
    output [2:0] FARMTR;
    output [2:0] HIGHWAYTR;
    output IND_FARMCAR;
    output IND_AMB;

    wire Emergency, C;
    wire HR, HY, HG, FR, FY, FG;

    // 포트 커넥션 이름을 Emergency로 통일하여 매핑 수정
    traffic trafficlight_controller (
        .HR(HR), .HY(HY), .HG(HG), .FR(FR), .FY(FY), .FG(FG), 
        .reset(RS), .C(C), .Emergency(Emergency), .Clk(Clk)
    );
    
    ind indicator (
        .IND_FARMCAR(IND_FARMCAR), .IND_AMB(IND_AMB), 
        .Emergency(Emergency), .C(C), .Clk(Clk), .reset(RS)
    );
    
    trafficlight trafficlight_inst (
        .FARMTR(FARMTR), .HIGHWAYTR(HIGHWAYTR), .Emergency(Emergency), .C(C), 
        .HR(HR), .HY(HY), .HG(HG), .FR(FR), .FY(FY), .FG(FG), 
        .AMB_IN(AMB_IN), .FARMCAR(FARMCAR), .Clk(Clk), .RS(RS)
    );
endmodule