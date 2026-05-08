module Rising_Edge_Detector(out, in, reset, Clk);
    output out;
    input in;
    input reset;
    input Clk;
    
    reg in_prev;  // 한 클럭 이전 입력값 저장
    
    always @(posedge Clk) begin
        if (reset)
            in_prev <= 1'b0;
        else
            in_prev <= in;
    end
    
    // 조합 논리: 현재 1이고 이전 0이면 rising edge
    assign out = in & ~in_prev;
    
endmodule
