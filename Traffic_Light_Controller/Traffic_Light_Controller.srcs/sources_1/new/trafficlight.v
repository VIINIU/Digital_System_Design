`timescale 1ns/1ps
module trafficlight(FARMTR, HIGHWAYTR, Emergency, C, HR, HY, HG, FR, FY, FG, AMB_IN, FARMCAR, Clk, RS);
    input Clk;
    input HR, HY, HG, FR, FY, FG;
    input RS;
    input FARMCAR;
    input AMB_IN;
    output reg [2:0] FARMTR;
    output reg [2:0] HIGHWAYTR;
    output reg Emergency;
    output reg C;

    parameter red    = 3'b100;
    parameter green  = 3'b010;
    parameter yellow = 3'b110;

    always @(posedge Clk) begin
        if (RS) begin
            FARMTR <= red;
            HIGHWAYTR <= green;
            Emergency <= 0;
            C <= 0;
        end
        else begin
            if (AMB_IN) Emergency <= 1;
            else if (FARMCAR) C <= 1;

            if (HY) begin
                FARMTR <= red;
                HIGHWAYTR <= yellow;
            end
            else if (HG) begin
                FARMTR <= red;
                HIGHWAYTR <= green;
            end
            else if (FY) begin
                FARMTR <= yellow;
                HIGHWAYTR <= red;
            end
            else if (FG) begin
                FARMTR <= green;
                HIGHWAYTR <= red;
                if (!AMB_IN) Emergency <= 0;
                if (!FARMCAR) C <= 0;
            end
        end
    end
endmodule