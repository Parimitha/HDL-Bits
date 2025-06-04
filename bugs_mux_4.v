module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0]mux_4_0, mux_4_1;
    mux2 mux_f_0 ( sel[0],    a,    b, mux_4_0 );
    mux2 mux_f_1 ( sel[0],    c,    d, mux_4_1 );
    mux2 mux_f_2 ( sel[1], mux_4_0, mux_4_1,  out );

endmodule
