module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter S0=4'd0,S1=4'd1,S2=4'd2,S3=4'd3,S4=4'd4,S5=4'd5,S6=4'd6,S7=4'd7,S8=4'd8;
    reg [3:0]state,ns;
    always@(posedge clk)
        begin
            if(~resetn)
                state<=S0;
            else
                state<=ns;
        end
    always@(*)
        begin
            f=0; g=0;
            case(state)
                S1: f=1;
                S5,S6,S7: g=1;
                default: g=0;
            endcase
        end
    always@(*)
        begin
            case(state)
                S0: ns<=S1;
                S1: ns<=S2;
                S2: ns<=(x)?S3:S2;
                S3: ns<=(x)?S3:S4;
                S4: ns<=(x)?S5:S2;
                S5: ns<=(~y)?S6:S7;
                S6: ns<=(y)?S7:S8;
                S7: ns<=S7;
                S8: ns<=S8;
                default: ns<=S0;
            endcase
        end
endmodule
