module RegFile (
    input wire clk,                 // Clock input
    input wire rst,                 // Reset input
    input wire write_enable,        // Write enable input
    input wire [31:0] data_in,      // Data input
    input wire [5:0] rs1,           // Register select input 1 (6-bit, for 64 registers)
    input wire [5:0] rs2,           // Register select input 2 (6-bit, for 64 registers)
    input wire [5:0] rd,            // Register select for data output (6-bit, for 64 registers)

    output reg [31:0] data_rs1,     // Data output for rs1
    output reg [31:0] data_rs2      // Data output for rs2
);

    reg [31:0] reg_array [63:0];    // Array of 64 32-bit registers

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all registers to zero individually
            for (integer i = 0; i < 64; i = i + 1) begin
                reg_array[i] <= 32'h0;
            end
        end else if (write_enable) begin
            // Load data into the selected register
            reg_array[rd] <= data_in;
        end else begin
            // Assign data to data_rs1 and data_rs2
            data_rs1 = (rs1 == 0) ? 32'h0 : reg_array[rs1];
            data_rs2 = (rs2 == 0) ? 32'h0 : reg_array[rs2];
        end
    end

endmodule
