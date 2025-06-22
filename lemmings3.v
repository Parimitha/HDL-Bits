module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter LEFT=3'b000,RIGHT=3'b001,FALL_L=3'b010,FALL_R=3'b011,DIG_L=3'b100,DIG_R=3'b101;
    reg [2:0]state,ns;
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                state<=LEFT;
            else
                state<=ns;
        end
    always@(*)
        begin
            case(state)
                LEFT: begin
                    if(!ground)
                        ns=FALL_L;
                    else if(dig)
                        ns=DIG_L;
                    else if(bump_left)
                        ns=RIGHT;
                    else
                        ns=LEFT;
                end
                RIGHT: begin
                    if(!ground)
                        ns=FALL_R;
                    else if(dig)
                        ns=DIG_R;
                    else if(bump_right)
                        ns=LEFT;
                    else
                        ns=RIGHT;
                end
                FALL_L: begin
                    if(ground)
                        ns=LEFT;
                    else
                        ns=FALL_L;
                end
                FALL_R: begin
                    if(ground)
                        ns=RIGHT;
                    else 
                        ns=FALL_R;
                end
                DIG_L: begin
                    if(ground)
                        ns=DIG_L;
                    else
                        ns=FALL_L;
                end
                DIG_R: begin
                    if(!ground)
                        ns=FALL_R;
                    else
                        ns=DIG_R;
                end
                default: ns=LEFT;
            endcase
        end
    always@(*)
        begin
            walk_left=0;
            walk_right=0;
            aaah=0;
            digging=0;
            case(state)
                LEFT: walk_left=1;
                RIGHT: walk_right=1;
                FALL_L,FALL_R: aaah=1;
                DIG_L,DIG_R: digging=1;
            endcase
        end

endmodule
