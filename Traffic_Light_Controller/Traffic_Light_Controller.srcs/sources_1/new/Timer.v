`timescale 1ns/1ps
module Timer(TS, TL, TS2, ST, Clk);
    output TS, TL, TS2;
    input  ST, Clk;
    integer value;

    assign TS  = (value >= 4 * 6000000); 
    assign TL  = (value >= 14 * 6000000);
    assign TS2 = (value >= 1 * 6000000);

    always @(posedge Clk or posedge ST) begin
        if (ST)
            value <= 0;
        else if (TL)
            value <= value;
        else
            value <= value + 1;
    end
endmodule