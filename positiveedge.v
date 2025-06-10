module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0]p;
    always@(posedge clk)
        begin
            p<=in;
            pedge<=in & ~p;
        end
endmodule
