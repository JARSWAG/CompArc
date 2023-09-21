module Reg_32bit (
    input wire clk,      // Clock input
    input wire rst,      // Reset input
    input wire enable,   // Enable input
    input wire [31:0] data_in,  // Data input
    output wire [31:0] data_out // Data output
);

  reg [31:0] reg_data; // 32-bit register

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      reg_data <= 32'h0; // Reset the register to 0
    end else if (enable) begin
      reg_data <= data_in; // Load data into the register when enabled
    end
  end

  assign data_out = reg_data; // Output data is the content of the register

endmodule
