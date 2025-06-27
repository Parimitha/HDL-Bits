module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101;
    reg [2:0]s,ns;
    always@(*)
        begin
            case(s)
                A: ns=(w)?A:B;
                B: ns=(w)?D:C;
                C: ns=(w)?D:E;
                D: ns=(w)?A:F;
                E: ns=(~w)?E:D;
                F: ns=(w)?D:C;
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
