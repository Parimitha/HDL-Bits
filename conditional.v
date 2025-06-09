module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    wire [7:0]p,q;
    
    assign p=(a<b)?a:b;
    assign q=(p<c)?p:c;
    assign min=(q<d)?q:d;

endmodule
