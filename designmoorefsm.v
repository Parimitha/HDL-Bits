module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter A=0,B=1,C=2,D=3,E=4,F=5;
    reg [2:0]state,ns;
    always@(posedge clk)
        begin
            if(reset)
                state<=A;
            else
                state<=ns;
        end
    always@(*)
        begin
            case(state)
                A: ns=s[1]?B:A;
                B: ns=s[2]?D: (s[1]?B:A);
                C: ns=s[2]?D: (s[1]?C:A);
                D: ns=s[3]?F: (s[2]?D:C);
                E: ns=s[3]?F: (s[2]?E:C);
                F: ns=s[3]?F:E;
                default: ns=3'b000;
            endcase
        end
    always@(*)
        begin
            case(state)
                A: {fr3,fr2,fr1,dfr}=4'b1111;
                B: {fr3,fr2,fr1,dfr}=4'b0110;
                C: {fr3,fr2,fr1,dfr}=4'b0111;
                D: {fr3,fr2,fr1,dfr}=4'b0010;
                E: {fr3,fr2,fr1,dfr}=4'b0011;
                F: {fr3,fr2,fr1,dfr}=4'b0000;
                default: {fr3,fr2,fr1,dfr}=4'b0000;
            endcase
        end
endmodule
