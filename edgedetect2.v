module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0]p;
    always@(posedge clk)
        begin
            p<=in;
            anyedge<=in ^ p;
        end
endmodule
