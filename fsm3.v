module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    parameter [1:0] A=2'b00,B=2'b01,C=2'b10,D=2'b11;
    reg [2:0]state,ns;
    always@(*)
        begin
            case(state)
                A: ns<=(in==0)?A:B;
                B: ns<=(in==0)?C:B;
                C: ns<=(in==1)?D:A;
                D: ns<=(in==1)?B:C;
            endcase
        end
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                state<=A;
            else
                state<=ns;
        end
    assign out=(state==D);
endmodule
