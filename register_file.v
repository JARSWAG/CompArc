module register_file (
    input [31:0] Din,
    input [4:0] rd,
    input [4:0] rs1,
    input [4:0] rs2,
    input clock,
    input enable,
    input read_write,
    input reset,
    output reg [31:0] A,
    output reg [31:0] B
);

reg [31:0] reg_File [31:0];

always @(posedge clock or posedge reset) begin
    if (reset) begin
        // Clear all registers on reset
        for (i = 0; i < 32; i = i + 1) begin
            reg_File[i] <= 32'h0;
        end
    end else if (enable) begin
        if (read_write) begin
            // Write operation
            reg_File[rd] <= Din;
        end else begin
            // Read operation
            A <= reg_File[rs1];
            B <= reg_File[rs2];
        end
    end
end

endmodule
