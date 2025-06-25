module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter [2:0]IDLE=3'b000,S0=3'b001,S1=3'b010,S2=3'b011,END=3'b100;
    reg [2:0]s,ns;
    reg [3:0]i;
    always@(*)
        begin
            case(s)
                IDLE: ns=(in)?IDLE:S0;
                S0: ns=S1;
                S1: begin
                    if(i==8)
                        begin
                            if(in)
                                ns=END;
                            else
                                ns=S2;
                        end
                    else 
                        ns=S1;
                end
                S2: ns=(in)?IDLE:S2;
                END: ns=(in)?IDLE:S0;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                s<=IDLE;
            else
                s<=ns;
        end
    always@(posedge clk)
        begin
            if(reset)
                begin
                    done<=0;
                    i<=0;
                end
            else begin
                case(ns)
                    S1: begin
                        done<=0;
                        i=i+1;
                    end
                    END: begin
                        done<=1;
                        i<=0;
                    end
                    default: begin
                        done<=0;
                        i<=0;
                    end
                endcase
            end
        end
endmodule
