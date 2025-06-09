module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [98:0] p;
    genvar i;
    bcd_fadd s1(a[3:0],b[3:0],cin,p[0],sum[3:0]);
    generate
        for(i=1;i<99;i=i+1)
            begin: block
                bcd_fadd bcd(a[(4*(i)+3):(4*i)],b[(4*(i)+3):(4*i)],p[i-1],p[i],sum[(4*(i)+3):(4*i)]);
        end
    endgenerate
    bcd_fadd s2(a[399:396],b[399:396],p[98],cout,sum[399:396]);
endmodule
