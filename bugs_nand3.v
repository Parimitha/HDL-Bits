module top_module (input a, input b, input c, output out);//
    wire p;
    andgate inst1 ( p, a, b, c,1,1 );
    assign out=~p;

endmodule
