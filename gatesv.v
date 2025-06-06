module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    function [2:0] compute_both;
        input [3:0] x;
        begin
            compute_both = x[2:0] & x[3:1];
        end
    endfunction

    function [3:1] compute_any;
        input [3:0] x;
        begin
            compute_any = x[3:1] | x[2:0];
        end
    endfunction

    function [3:0] compute_diff;
        input [3:0] x;
        begin
            compute_diff = x ^ {x[0], x[3:1]};
        end
    endfunction

    assign out_both = compute_both(in);
    assign out_any = compute_any(in);
    assign out_different = compute_diff(in);

endmodule
