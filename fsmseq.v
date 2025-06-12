module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    parameter [2:0]  IDLE = 0,
					 S0 = 1,
					 S1 = 2,
					 S2 = 3,
					 S3 = 4;

	reg [2:0] state, n;

	always @(*) begin
		case (state)
            IDLE : n = (data) ? S0  : IDLE;
            S0 : n = (data) ? S1 : IDLE;
            S1 : n = (data) ? S1  : S2;
            S2 : n = (data) ? S3: IDLE;
			S3 : n = S3;
		endcase
	end

	always @(posedge clk) begin
		if (reset) begin
			state <= IDLE;
		end
		else state <= n;
	end

    assign start_shifting = (state == S3);

endmodule
