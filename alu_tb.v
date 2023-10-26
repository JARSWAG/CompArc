`timescale 1ps/1ps

module alu_tb;

reg [31:0] operand1, operand2;
reg [3:0] opcode;
wire [31:0] result;

alu uut (
    .operand1(operand1),
    .operand2(operand2),
    .opcode(opcode),
    .result(result)
);


initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, alu_tb);

    operand1 = 50;
    operand2 = 10;
	 #10

    opcode = 4'b0001; //add
    #10;

    opcode = 4'b0010; //sub
    #10;

    opcode = 4'b0011; //and
    #10;

    opcode = 4'b0100; //or
    #10;
	 
	 opcode = 4'b0101; //xor
	 #10;
	 
	 opcode = 4'b0110; //sll
	 #10;
	 
	 opcode = 4'b0111; //srl
	 #10;

	 
    $finish;
end


endmodule
