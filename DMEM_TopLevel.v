module topLevelDMEM(
	input reg [31:0] data_in, input [12:0] address,
	input clk, input reg read_write, input reset,
	output [7:0] dataOut;
);

wire [7:0] enable;

always @(posedge clk) begin
	enable[address[12:10]] <= 1;
	if reset begin
		enable <= 8'b11111111;
	end
end

DMEM Chip0(data_in, address[9:0], clk, read_write, reset, enable[0],dataOut);
DMEM Chip1(data_in, address[9:0], clk, read_write, reset, enable[1],dataOut);
DMEM Chip2(data_in, address[9:0], clk, read_write, reset, enable[2],dataOut);
DMEM Chip3(data_in, address[9:0], clk, read_write, reset, enable[3],dataOut);
DMEM Chip4(data_in, address[9:0], clk, read_write, reset, enable[4],dataOut);
DMEM Chip5(data_in, address[9:0], clk, read_write, reset, enable[5],dataOut);
DMEM Chip6(data_in, address[9:0], clk, read_write, reset, enable[6],dataOut);
DMEM Chip7(data_in, address[9:0], clk, read_write, reset, enable[7],dataOut);

endmodule 