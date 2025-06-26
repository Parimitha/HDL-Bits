module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A=1'b0,B=1'b1;
    reg state,ns;
    reg [1:0]cnt;
    reg [1:0]count;
    always@(*)
        begin
            case(state)
                A: ns=(s)?B:A;
                B: ns=B;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)
                begin
                    state<=A;
                    cnt=0;
                    count=0;
                end
            else begin
                state<=ns;
                if(state==B)
                    begin
                        if(count==3)
                            begin
                                cnt=0;
                                count=0;
                            end
                        if(w==1)
                                cnt=cnt+1'b1;
                                count=count+1'b1;
                    end
            end
        end
    assign z = ((cnt== 2) & (count == 3) );
                             
                              
endmodule
