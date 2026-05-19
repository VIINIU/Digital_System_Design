`timescale 1ns/1ps
module FSM(HR, HY, HG, FR, FY, FG, ST, TS, TL, TS2, C, Emergency, reset, Clk);
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
                    if ((Emergency & TS2) | TS) begin
                        state <= farmroadgreen;
                        ST <= 1;
                    end
                farmroadgreen:
                    if ((!Emergency & C & TL) | (!(C | Emergency) & TS)) begin
                        state <= farmroadyellow;
                        ST <= 1;
                    end
                farmroadyellow:
                    if (Emergency & TS2) begin
                        state <= farmroadgreen;
                        ST <= 1;
                    end
                    else if (TS) begin
                        state <= highwaygreen;
                        ST <= 1;
                    end
            endcase
        end
    end
endmodule