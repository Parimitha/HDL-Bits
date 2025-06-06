module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0]p,q;
    wire [15:0]r,s;
    add16 add(a[15:0],b[15:0],0,sum[15:0],p);
    add16 add_sel(a[31:16],b[31:16],0,r,q);
    add16 adder_sel(a[31:16],b[31:16],1,s,q);
    always@(*)
        begin
            case(p)
                1'b0: sum[31:16]=r;
                1'b1: sum[31:16]=s;
            endcase
        end
endmodule
