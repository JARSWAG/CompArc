module register_file_tb;

reg [31:0] Din;
reg [4:0] rd;
reg [4:0] rs1;
reg [4:0] rs2;
reg clock;
reg enable;
reg read_write;
reg reset;
wire [31:0] A;
wire [31:0] B;

register_file uut (
    .Din(Din),
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2),
    .clock(clock),
    .enable(enable),
    .read_write(read_write),
    .reset(reset),
    .A(A),
    .B(B)
);

always begin
    clock = #5 ~clock;
end

initial begin
    $dumpfile("register_file_tb.vcd");
    $dumpvars(0, register_file_tb);

    reset = 1;
    enable = 1;
    read_write = 1;
    rd = 0;
    rs1 = 1;
    rs2 = 2;
    Din = 32'hA5A5A5A5;

    #10 reset = 0;

	 // first test
	 
    #10 Din = 32'h12345678;
    rd = 3;
    read_write = 1;

    #10 rs1 = 3;
    rs2 = 4;
    read_write = 0;
	 
	 // second test
	 
	 #30 Din = 32'h15328054;
	 rd = 10;
	 read_write = 1;
	 
	 #30 rs1 = 10;
	 rs2 = 11;
	 read_write = 0;
	 
	 // third test
	 
	 #50 Din = 32'h00100234;
	 rd = 17;
	 read_write = 1;
	 
	 #50 rs1 = 17;
	 rs2 = 18;
	 read_write = 0;

	 // fourth test
	 
	 #70 Din = 32'h53601518;
	 rd = 24;
	 read_write = 1;
	 
	 #70 rs1 = 24;
	 rs2 = 25;
	 read_write = 0;
	 
	 // fifth test
	 
	 #90 Din = 32'h69420632;
	 rd = 30;
	 read_write = 1;
	 
	 #90 rs1 = 30;
	 rs2 = 31;
	 read_write = 0;

    #100 $finish;
end


endmodule 