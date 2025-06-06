module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [2:0]p;
    bcd_fadd b_add1(a[3:0],b[3:0],cin,p[0],sum[3:0]);
    bcd_fadd b_add2(a[7:4],b[7:4],p[0],p[1],sum[7:4]);
    bcd_fadd b_add3(a[11:8],b[11:8],p[1],p[2],sum[11:8]);
    bcd_fadd b_add4(a[15:12],b[15:12],p[2],cout,sum[15:12]);
endmodule
