module top_module(
    input a,
    input b,
    input c,
    output out ); 
    assign out=c|(~c)&(a|b);

endmodule
