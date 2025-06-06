module top_module (input x, input y, output z);
    wire a,b,c,p,q,r;
    A IA1(x,y,a);
    B IB1(x,y,b);
    A IA2(x,y,c);
    B IB2(x,y,p);
    assign q=a||b;
    assign r=c&&p;
    assign z=q^r;
endmodule
        module B(input x, input y, output z);
        assign z=~(x^y);
        endmodule
module A(input x, input y, output z);
        assign z=(x^y) & x;
      endmodule
