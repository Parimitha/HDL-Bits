module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire p,q;
    add16 a1(a[15:0],b[15:0],0,sum[15:0],p);
    add16 a2(a[31:16],b[31:16],p,sum[31:16],q);
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum=a ^ b ^ cin;
    assign cout=(a & b)|(b & cin)|(a & cin);
endmodule
