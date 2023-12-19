module branch_comparator (
    input [31:0] rs1,
    input [31:0] rs2,
    output reg BrLT,
    output reg BrEq
);

    always @* begin
        // Branch if rs1 is less than rs2
        BrLT = (rs1 < rs2);

        // Branch if rs1 is equal to rs2
        BrEq = (rs1 == rs2);
    end

endmodule
