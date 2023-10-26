module alu(
input [31:0] operand1,
input [31:0] operand2,
input [3:0] opcode,
output reg [32:0] result
);

always @ (opcode or operand1 or operand2) begin

	case(opcode)

		4'b0001: 
		begin
			result <= operand1 + operand2; //add
		end
		4'b0010:
		begin
			result <= operand1 - operand2; //sub
		end
		4'b0011:
		begin
			result <= operand1 & operand2; //and
		end
		4'b0100:
		begin
			result <= operand1 | operand2; //or
		end
		4'b0101:
		begin
			result <= operand1 ^ operand2; //xor
		end
		4'b0110:
		begin
			result <= operand1 << operand2; //shift left
		end
      4'b0111:
		begin
			result <= operand1 >> operand2; //shift right
		end
	endcase
end
endmodule 