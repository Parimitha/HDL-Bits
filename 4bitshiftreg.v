module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    reg [3:0] shift_temp;
    always@(posedge clk)
        begin
            if(shift_ena)
                    shift_temp<={shift_temp[2:0],data};
            else if(count_ena==1)
                shift_temp<=shift_temp-1;
        end
    assign q=shift_temp;
endmodule
