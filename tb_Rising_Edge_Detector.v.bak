
`timescale 1ns / 1ps

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
        forever #1 Clk = ~Clk;  // 2ns 주기 클럭
    end
    
    initial begin
        in = 0;
        reset = 1;
        #10;
        reset = 0;
        #10; in = 1;   // 0→1 (Rising edge 발생)
        #10; in = 1;   // 1→1 (유지, edge 없음)
        #10; in = 0;   // 1→0 (Falling edge, 출력 0)
        #10; in = 1;   // 0→1 (Rising edge 다시 발생)
        #10; in = 0;
        #20; $finish;
    end
endmodule