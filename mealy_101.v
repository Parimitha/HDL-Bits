module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    parameter S0 = 2'b00,S1 = 2'b01,S2 = 2'b10;
    reg [1:0] state, ns;
    always @(*) begin
        ns = state;
        z = 0;
        case (state)
            S0: begin
                if (x)
                    ns = S1;
            end
            S1: begin
                if (!x)
                    ns = S2;
            end
            S2: begin
                if (x) begin
                    ns = S1;
                    z = 1;  
                end
                else begin
                    ns = S0;
                end
            end
        endcase
    end
    always @(posedge clk or negedge aresetn) begin
        if (!aresetn)
            state <= S0;
        else
            state <= ns;
    end

endmodule
