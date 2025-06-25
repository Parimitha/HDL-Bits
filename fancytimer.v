module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    parameter [3:0] S=0,S1=1,S11=2,S110=3,B0=4,B1=5,B2=6,B3=7,COUNT=8,WAIT=9;
    reg [3:0]state,ns;
    reg [9:0]c;
    always@(*)
        begin
            case(state)
                S: ns=(data)?S1:S;
                S1: ns=(data)?S11:S;
                S11: ns=(data)?S11:S110;
                S110: ns=(data)?B0:S;
                B0: ns=B1;
                B1:ns=B2;
                B2: ns=B3;
                B3: ns=COUNT;
                COUNT:ns=(count==0 & c==999)?WAIT:COUNT;
                WAIT: ns=(ack)?S:WAIT;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                state<=S;
            else
                state<=ns;
        end
    always@(posedge clk)
        begin
            case(state)
                B0: count[3]<=data;
                B1: count[2]<=data;
                B2: count[1]<=data;
                B3: count[0]<=data;
                COUNT: begin
                    if(count>=0)
                        begin
                            if(c<999)
                                c<=c+1'b1;
                            else begin
                                count<=count-1'b1;
                                c<=0;
                            end
                        end
                end
                default: c<=0;
            endcase
        end
    assign counting=(state==COUNT);
    assign done=(state==WAIT);
    
endmodule
