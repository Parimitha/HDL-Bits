module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        case(state)
            ON: next_state<=(k==1)?OFF:ON;
            OFF: next_state<=(j==1)?ON:OFF;
        endcase
    end

    always @(posedge clk) begin
        if(reset)
            state<=OFF;
        else
            state<=next_state;
    end

    assign out = (state == ON);

endmodule
