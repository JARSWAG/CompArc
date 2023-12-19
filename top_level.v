module top_level (
    input clk,
    input reset,
    output reg [31:0] pc,
    output reg Data_out,
    output reg ALUA_In,
    output reg ALUB_In,
    output reg [3:0] rs1_In,
    output reg [3:0] rs2_In,
    output reg ALU_out,
    output reg RegA_out,
    output reg RegB_out
);

wire Wen,ImmSel, Bsel, BrUn, Asel, PcSel,result,WbSel, MemRW;
reg [31:0] ImmEx, WbEx;
reg BselG, AselG, Breq, BrLT;
wire [31:0] data_rs1,data_rs2;
wire [31:0]op;
wire [31:0]Out;
wire [3:0] ALUop;
reg [4:0] rs1,rs2,rd;
//ROM Il (clk,Address,Read_enable,Out);
rom test4 (pc,Read_enable, clk, Out);
always@(*) begin
rs1 <= Out[19:15];
rs2 <= Out[24:20];
rd <= Out[11:7];
ALUA_In <= AselG;
ALUB_In <= BselG;
rs1_In <= rs1;
rs2_In <= rs2;
ALU_out <= result;
RegA_out <= data_rs1;
RegB_out <= data_rs2;

end
//Control_Unit ba (opcode, clk, Breq, BrLT, Wen, ImmSel, Bsel, BrUn, Asel, PcSel);
control_unit test1 (Out, Breq, BrLT, clk, ALUop, Wen, ImmSel, Bsel, BrUn, Asel, PcSel, WbSel, MemRW);

always@(*) begin
if (PcSel)begin
pc <=result;
end
else begin
pc <= pc+4;
end

if (ImmSel == 1) begin
	if (Out[31] == 1) begin
	// Negative number, pad with 1s
   ImmEx = { {20{1'b1}}, ImmSel };
   end else begin
   // Positive number, pad with 0s
   ImmEx = { {20{1'b0}}, ImmSel };
	end
end

if (Bsel) begin
BselG <= ImmEx;
end
else if (Bsel==0)begin
BselG <= data_rs2;
end

if (Asel) begin
AselG <= pc;
end
else if (Asel==0)begin
AselG <= data_rs1;
end
end

//reg_32bit(clk,reset,rd,rs1,rs2,Data_IN,Write_enable,data_rs1,data_rs2);
register_file test2(result,rd,rs1,rs2,clk,Wen,reset,data_rs1,data_rs2);

//ALU test(clk,opa,opb,funct3,result);
alu test3(AselG,BselG,funct3,clk,result);

//Branch compar
always@(*) begin
if (rs1==rs2)begin
Breq=1;
end 
else if (rs1!=rs2)begin
Breq=0;
end 
end
always@(*) begin
if (rs1<rs2)begin
BrLT=1;
end 
else begin
BrLT=0;
end 
end
//Top_level_Dmem o(mem_addr,clk,rw,reset,data_in,dmem);
top_dmem test5(mem_addr,clk,rw,reset,result,dmem);
endmodule 