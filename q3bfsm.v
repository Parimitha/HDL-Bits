module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100;
    reg [2:0]s,ns;
    always@(*)
        begin
            case(s)
                A: ns=(x)?B:A;
                B: ns=(~x)?B:E;
                C: ns=(x)?B:C;
                D: ns=(x)?C:B;
                E: ns=(x)?E:D;
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
    assign z=(s==D | s==E);

endmodule
