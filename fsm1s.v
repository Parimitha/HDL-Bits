module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;
    
    parameter A=0,B=1;

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) 
            present_state<=B;
        else
            present_state<=next_state;
    end
    always@(*)
        begin
            case(present_state)
                A: next_state<=(in==1)?A:B;
                B: next_state<=(in==1)?B:A;
            endcase
        end
    assign out=(present_state==B);
                    
endmodule
