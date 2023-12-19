`timescale 1ps/1ps

module top_level_tb;

  reg clk;
  reg reset;
  reg [31:0] desired_pc; // Register to hold desired initial PC value
  reg [31:0] pc; // Module input reg (not wire anymore!)
  wire Data_out;
  wire ALUA_In;
  wire ALUB_In;
  wire [3:0] rs1_In;
  wire [3:0] rs2_In;
  wire ALU_out;
  wire RegA_out;
  wire RegB_out;

  Top_Level_PC uut (
    .clk(clk),
    .reset(reset),
    .pc(pc),
    .Data_out(Data_out),
    .ALUA_In(ALUA_In),
    .ALUB_In(ALUB_In),
    .rs1_In(rs1_In),
    .rs2_In(rs2_In),
    .ALU_out(ALU_out),
    .RegA_out(RegA_out),
    .RegB_out(RegB_out)
  );

  always begin
    #5 clk = ~clk;
  end

  // Initial values
  initial begin
    reset = 1;
    #10 reset = 0;

    // Set desired initial PC value
    desired_pc = 32'h00400000;

    // Drive pc reg with desired_pc on next clock edge
    @(posedge clk);
    pc = desired_pc;

    #20;

    // Additional test cases can be implemented here by changing desired_pc

    #10 $finish;
  end

endmodule
