module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    parameter [3:0]NONE=0,ONE=1,TWO=2,THREE=3,FOUR=4,FIVE=5,SIX=6,DISC=7,FLAG=8,ERROR=9;
    reg [3:0]state,ns;
    always@(*)
        begin
            case(state)
                NONE: ns=(in)?ONE:NONE;
                ONE: ns=(in)?TWO:NONE;
                TWO: ns=(in)?THREE:NONE;
                THREE: ns=(in)?FOUR:NONE;
                FOUR: ns=(in)?FIVE:NONE;
                FIVE: ns=(in)?SIX:DISC;
                SIX: ns=(in)?ERROR:FLAG;
                DISC: ns=(in)?ONE:NONE;
                FLAG: ns=(in)?ONE:NONE;
                ERROR: ns=(in)?ERROR:NONE;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                state<=NONE;
            else
                state<=ns;
        end
    assign disc=(state==DISC);
    assign flag=(state==FLAG);
    assign err=(state==ERROR);
endmodule
