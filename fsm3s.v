module top_module(
    input clk,
    input in,
    input reset,
    output out); 
    reg [2:0]state,ns;
    parameter [1:0]A=2'b00,B=2'b01,C=2'b10,D=2'b11;
    always@(*)
        begin
            case(state)
                A: ns<=(in==1)?B:A;
                B: ns<=(in==1)?B:C;
                C: ns<=(in==0)?A:D;
                D: ns<=(in==0)?C:B;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                state<=A;
            else
                state<=ns;
        end
    assign out=(state==D);
endmodule
