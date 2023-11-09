`timescale 1ps/1ps

module alu_tb;

reg [31:0] operand1, operand2;
reg [3:0] opcode;
reg clock;
wire [31:0] result;

alu uut (
    .operand1(operand1),
    .operand2(operand2),
    .opcode(opcode),
    .clock(clock),
    .result(result)
);

always begin
    #1 clock = ~clock;
end

initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, alu_tb);

    operand1 = 50;
    operand2 = 10;
    opcode = 4'b0000; // Apply ADD operation
    clock = 0;

    #10;
    
    // Apply SUB operation
    opcode = 4'b1000;
    #10;

    // Apply AND operation
    opcode = 4'b0111;
    #10;

    // Apply OR operation
    opcode = 4'b0110;
    #10;

    // Apply XOR operation
    opcode = 4'b0100;
    #10;

    // Apply Logical Left Shift operation
    opcode = 4'b0001;
    #10;

    // Apply Logical Right Shift operation
    opcode = 4'b0101;
    #10;

    $finish;
end

endmodule
