module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [7:0]out;
    always@(posedge clk)
        begin
            if(enable)
                out<={out[6:0],S};
            else
                out<=out;
        end
    always@(*)
        begin
            case({A,B,C})
                3'b000: Z=out[0];
                3'b001: Z=out[1];
                3'b010: Z=out[2];
                3'b011: Z=out[3];
                3'b100: Z=out[4];
                3'b101: Z=out[5];
                3'b110: Z=out[6];
                3'b111: Z=out[7];
            endcase
        end

endmodule
