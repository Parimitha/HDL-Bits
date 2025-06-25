module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter S0=2'b01,S1=2'b10;
    reg [1:0]s,ns;
    always@(*)
        begin
            case(s)
                S0: begin
                    if(x)
                        begin
                            ns=S1;
                            z=1;
                        end
                    else begin
                        ns=S0;
                        z=0;
                    end
                end
                S1: begin
                    ns=S1;
                    z=(x)?1'b0:1'b1;
                end
            endcase
        end
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                s<=S0;
            else
                s<=ns;
        end
endmodule
