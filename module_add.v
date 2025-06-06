module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire p,q;
    add16 add(a[15:0],b[15:0],0,sum[15:0],p);
    add16 add2(a[31:16],b[31:16],p,sum[31:16],q);

endmodule
