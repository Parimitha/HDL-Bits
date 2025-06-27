module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
    parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101;
    reg [2:0]s,ns;
    always@(*)
        begin
            case(s)
                A: ns=(w)?B:A;
                B: ns=(w)?C:D;
                C: ns=(w)?E:D;
                D: ns=(w)?F:A;
                E: ns=(~w)?D:E;
                F: ns=(w)?C:D;
                default: ns=3'b000;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                s<=A;
            else
                s<=ns;
        end
    assign z=(s==E|s==F);
endmodule
