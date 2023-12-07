module control_unit (
    input [31:0] Instruction,
    input BrEq,
    input BrLT,
	 input wire clock,
    output reg [3:0] ALUop,
    output reg wEn,
    output reg ImmSel,
    output reg BSel,
    output reg BrUn,
    output reg ASel,
    output reg PCSel,
	 output reg WBSel,
	 output reg MemRW,
	 output reg BEQ,
	 output reg BNE,
	 output reg BLT,
	 output reg BGE
);

reg [2:0] func3;
reg [6:0] func7;

always @* begin   
	case (Instruction[6:0]) // Checking opcode
		7'b0110011: begin // R-type
			func3 = Instruction[14:12];
			func7 = Instruction[31:25];
			wEn <= 0;
			ImmSel <= 0;
			BSel <= 0;
			BrUn <= 0;
			ASel <= 0;
			PCSel <= 0;
			WBSel <= 0;
			MemRW <= 0;
			if (func3 == 3'b000 && func7 == 7'b0000000) begin
				ALUop <= 4'b0000; //ADD
			end
			else if (func3 == 3'b000 && func7 == 7'b0100000) begin
				ALUop <= 4'b0010; //SUB
			end
			else if (func3 == 3'b001) begin
				ALUop <= 4'b0001; //SLL
			end
			else if (func3 == 3'b101) begin
				ALUop <= 4'b0101; //SRL
			end
			else if (func3 == 3'b110) begin
				ALUop <= 4'b0110; //OR
			end
			else if (func3 == 3'b100) begin
				ALUop <= 4'b0100; //XOR
			end
			else if (func3 == 3'b111) begin
				ALUop <= 4'b0111; //AND
			end
		end
		7'b0010011: begin //I-type
			func3 = Instruction[14:12];
			wEn <= 0;
			ImmSel <= 1;
			BSel <= 1;
			BrUn <= 0;
			ASel <= 0;
			PCSel <= 0;
			WBSel <= 0;
			MemRW <= 0;
			if (func3 == 3'b000) begin
				ALUop <= 4'b0000; //ADDI
			end
			else if (func3 == 3'b110) begin
				ALUop <= 4'b0110; //ORI
			end
			else if (func3 == 3'b100) begin
				ALUop <= 4'b0100; //XORI
			end
			else if (func3 == 3'b111) begin
				ALUop <= 4'b0111; //ANDI
			end
		end
		7'b1100011: begin //B-type
			func3 = Instruction[14:12];
			wEn <= 0;
			ImmSel <= 0;
			BSel <= 0;
			BrUn <= 0;
			ASel <= 1;
			PCSel <= 1;
			WBSel <= 0;
			MemRW <= 0;
			if (func3 == 3'b000) begin
				BEQ <= 1'b1; //BEQ
			end
			else if (func3 == 3'b001) begin
				BNE <= 1'b1; //BNE
			end
			else if (func3 == 3'b100) begin
				BLT <= 1'b1; //BLT
			end
			else if (func3 == 3'b101) begin
				BGE <= 1'b1; //BGE
			end	
	  end
	endcase
end
endmodule
