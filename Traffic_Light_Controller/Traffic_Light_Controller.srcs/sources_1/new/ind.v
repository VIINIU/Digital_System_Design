`timescale 1ns/1ps
module ind(IND_FARMCAR, IND_AMB, Emergency, C, Clk, reset);
    input Emergency;
    input C;
    input Clk;
    input reset;
    output reg IND_FARMCAR;
    output reg IND_AMB;

    wire WH, RE;
    integer r = 0; // 초기값 할당으로 시뮬레이션 및 신세시스 안정화

    assign WH = (r >= 800000);
    assign RE = (r >= 1600000);

    always @(posedge Clk) begin
        if (reset) begin
            IND_FARMCAR <= 0;
            IND_AMB <= 0;
            r <= 0;
        end
        else begin
            if (Emergency & RE) begin
                IND_AMB <= 1;
                r <= 0;
            end
            else if (Emergency & WH) begin
                IND_AMB <= 0;
                r <= r + 1;
            end
            else if (Emergency) begin
                IND_AMB <= 1;
                r <= r + 1;
            end
            else begin
                IND_AMB <= 0;
                r <= 0;
            end

            if (C) IND_FARMCAR <= 1;
            else IND_FARMCAR <= 0;
        end
    end
endmodule