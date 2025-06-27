module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter A=0,B=1,C=2,D=3;
    reg [1:0]s,ns;
    always@(*)
        begin
            case(s)
                A: ns<=r[1]?B:(~r[1]&r[2])?C:(~r[1]&~r[2]&r[3])?D:A;
                B: ns<=r[1]?B:A;
                C: ns<=~r[2]?A:C;
                D: ns<=~r[3]?A:D;
                default: ns<=A;
            endcase
        end
    always@(posedge clk)
        begin
            if(~resetn)
                s<=A;
            else
                s<=ns;
        end
    assign g={(s==D),(s==C),(s==B)};
endmodule
