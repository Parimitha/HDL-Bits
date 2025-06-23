module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    parameter [1:0] IDLE=2'b00,BYTE1=2'b01,BYTE2=2'b10,DONE=2'b11;
    reg [1:0]state,ns;
    always@(*)
        begin
            case(state)
                IDLE: ns=(in[3])?BYTE1:IDLE;
                BYTE1: ns=BYTE2;
                BYTE2: ns=DONE;
                DONE: ns=(in[3])?BYTE1:IDLE;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                state<=IDLE;
            else
                state<=ns;
        end
    assign done=(state==DONE);
endmodule
