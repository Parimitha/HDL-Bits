module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire p,q;
    assign p=a & b;
    assign q=c & d;
    assign out=p | q;
    assign out_n=(~out);
endmodule
