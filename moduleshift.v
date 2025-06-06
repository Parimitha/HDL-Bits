module top_module ( input clk, input d, output q );
    wire a,b;
    my_dff inst1(.clk(clk),.d(d),.q(a));
    my_dff inst2(.clk(clk),.d(a),.q(b));
    my_dff inst3(.clk(clk),.d(b),.q(q));
    

endmodule
