module alu (
    input wire [31:0] operand1,
    input wire [31:0] operand2,
    input wire [3:0] opcode,
    input wire clock,            
    output reg [32:0] result
);

always @(posedge clock) begin 
    case (opcode)
        4'b0000: // ADD
            result <= operand1 + operand2;
        4'b1000: // SUB
            result <= operand1 - operand2;
        4'b0111: // AND
            result <= operand1 & operand2;
        4'b0110: // OR
            result <= operand1 | operand2;
        4'b0100: // XOR
            result <= operand1 ^ operand2;
        4'b0001: // Logical left shift
            result <= operand1 << operand2;
        4'b0101: // Logical right shift
            result <= operand1 >> operand2;
        default:
            result <= 33'b0;
    endcase
end

endmodule
