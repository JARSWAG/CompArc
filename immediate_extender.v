module immediate_extender (
    input [11:0] imm,
    output reg [31:0] extended_imm
);

    always @* begin
        // Sign extension logic
        if (imm[11] == 1) begin
			// Negative number, pad with 1s
			extended_imm = { {20{1'b1}}, imm };
			end else begin
			// Positive number, pad with 0s
			extended_imm = { {20{1'b0}}, imm };
		end
   end

endmodule


