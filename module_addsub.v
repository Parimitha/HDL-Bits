module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire p,q;
    wire [31:0]xoor;
    assign xoor={32{sub}}^b;
    add16 add(a[15:0],xoor[15:0],sub,sum[15:0],p);
    add16 add2(a[31:16],xoor[31:16],p,sum[31:16],q);

endmodule
