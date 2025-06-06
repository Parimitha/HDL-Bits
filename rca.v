module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [3:0]cout;
    fulladder fa1(x[0],y[0],0,sum[0],cout[0]);
    fulladder fa2(x[1],y[1],cout[0],sum[1],cout[1]);
    fulladder fa3(x[2],y[2],cout[1],sum[2],cout[2]);
    fulladder fa4(x[3],y[3],cout[2],sum[3],sum[4]);
endmodule
module fulladder(a,b,cin,sum,cout);
    input a,b,cin;
    output sum,cout;
    assign sum=a ^ b ^ cin;
    assign cout=(a & b)|(b & cin)|(a & cin);
endmodule
