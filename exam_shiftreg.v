module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF m0(SW[3], KEY[0], KEY[1], KEY[2], KEY[3], LEDR[3]);
    MUXDFF m1(SW[2], KEY[0], KEY[1], KEY[2], LEDR[3], LEDR[2]);
    MUXDFF m2(SW[1], KEY[0], KEY[1], KEY[2], LEDR[2], LEDR[1]);
    MUXDFF m3(SW[0], KEY[0], KEY[1], KEY[2], LEDR[1], LEDR[0]);

endmodule

module MUXDFF (R,clk,E,L,w,out);
    input R,clk,E,L,w;
    output reg out;
    wire [1:0]t;
    assign t[0] = E ? w : out;
    assign t[1] = L ? R : t[0];
    
    always @(posedge clk) begin
        out <= t[1];
    end
endmodule
