`timescale 1ps/1ps

module control_unit_tb;

  reg [31:0] Instruction;
  reg BrEq, BrLT;
  reg clock;

  wire [3:0] ALUop;
  wire wEn, ImmSel, BSel, BrUn, ASel, PCSel, WBSel, MemRW, BEQ, BNE, BLT, BGE;

  control_unit uut (
    .Instruction(Instruction),
    .BrEq(BrEq),
    .BrLT(BrLT),
    .ALUop(ALUop),
    .wEn(wEn),
    .ImmSel(ImmSel),
    .BSel(BSel),
    .BrUn(BrUn),
    .ASel(ASel),
    .PCSel(PCSel),
    .WBSel(WBSel),
    .MemRW(MemRW),
	 .clock(clock),
    .BEQ(BEQ),
    .BNE(BNE),
    .BLT(BLT),
    .BGE(BGE)
  );
  
always begin
    #1 clock = ~clock;
end

  initial begin
    $dumpfile("control_unit_tb.vcd");
    $dumpvars(0, control_unit_tb);
	
	 clock = 0;

    // Test case 1: R-type instruction (ADD)
    Instruction = 32'b0000000_00000_00000_000_00000_0110011;
    BrEq = 0;
    BrLT = 0;
    #10;

    // Test case 2: I-type instruction (ADDI)
    Instruction = 32'b0000000_00000_00000_000_00000_0010011;
    BrEq = 0;
    BrLT = 0;
    #10;

    // Test case 3: B-type instruction (BEQ)
    Instruction = 32'b0000000_00000_00000_000_00000_1100011;
    BrEq = 1;
    BrLT = 0;
    #10;

    $finish;
  end

endmodule
