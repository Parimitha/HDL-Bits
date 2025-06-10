module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]p;
    always@(posedge clk)
        begin
            p<=in;
            if(reset)
                out<=32'b0;
            else
                out<=out|(p & ~in);
        end
endmodule
