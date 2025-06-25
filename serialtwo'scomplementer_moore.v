module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter S0=0, S1=1;
    reg s,ns;
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                s<=S0;
            else
                s<=ns;
        end
    always@(*)
        begin
            case(s)
                S0: ns=(x==1)?S1:S0;
                S1: ns=S1;
                default: ns=S0;
            endcase
        end
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                z<=1'b0;
            else
                begin
                    case(s)
                        S0: z<=x;
                        S1: z<=~x;
                    endcase
                end
        end
endmodule
