module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100;
    reg [2:0]ns;
    always@(*)
        begin
            case(y)
                A: ns=(x)?B:A;
                B: ns=(x)?E:B;
                C: ns=(x)?B:C;
                D: ns=(x)?C:B;
                E: ns=(~x)?D:E;
                default: ns=3'b000;
            endcase
        end
    assign Y0=ns[0];
    assign z=(y==3'd3)||(y==3'd4);

endmodule
