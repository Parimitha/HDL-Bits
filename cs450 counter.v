module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    parameter SNT=2'b00,WNT=2'b01,WT=2'b10,ST=2'b11;
    reg [1:0]ns;
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                state<=WNT;
            else
                state<=ns;
        end
    always@(*)
        begin
            if(train_valid)
                begin
                    case(state)
                        SNT: ns<=(train_taken)?WNT:SNT;
                        WNT: ns<=(train_taken)?WT:SNT;
                        WT: ns<=(~train_taken)?WNT:ST;
                        ST: ns<=(train_taken)?ST:WT;
                    endcase
                end
            else begin
                case(state)
                    SNT: ns<=SNT;
                    WNT: ns<=WNT;
                    WT: ns<=WT;
                    ST: ns<=ST;
                endcase
            end
        end
endmodule
