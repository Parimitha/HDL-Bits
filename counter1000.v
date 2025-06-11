module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] a, b, c;
    assign OneHertz = {a == 4'd9 & b == 4'd9 & c == 4'd9};
    assign c_enable = {b == 4'd9 & a == 4'd9, a == 4'd9, 1'b1};
    
    bcdcount counter0 (clk, reset, c_enable[0], a);
    bcdcount counter1 (clk, reset, c_enable[1], b);
    bcdcount counter2 (clk, reset, c_enable[2], c);
endmodule
