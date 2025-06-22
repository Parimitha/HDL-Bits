module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT=2'b00, RIGHT=2'b01, FALL_L=2'b10, FALL_R=2'b11;
    reg [1:0] state,ns;
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
                    else if(bump_left)
                        ns=RIGHT;
                    else
                        ns=LEFT;
                end
                RIGHT: begin
                    if(!ground)
                        ns=FALL_R;
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
                default: ns=LEFT;
            endcase
        end
        always@(*)
            begin
                walk_right=0;
                walk_left=0;
                aaah=0;
                case(state)
                    LEFT: walk_left=1;
                    RIGHT: walk_right=1;
                    FALL_L,FALL_R: aaah=1;
                endcase
            end
endmodule
