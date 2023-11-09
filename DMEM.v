module DMEM(
	input [31:0] data_in, input [9:0] address,
	input clk, input read_write, input reset, input enable,
	output [7:0] dataOut
);

reg [7:0] storage [1023:0];

initial begin
	{storage[3], storage[2], storage[1], storage[0]} = 32'b0;
	{storage[7], storage[6], storage[5], storage[4]} = 32'h99127254;
	{storage[11], storage[10], storage[9], storage[8]} = 32'h12345678;
	{storage[15], storage[14], storage[13], storage[12]} = 32'h89117843;
	{storage[19], storage[18], storage[17], storage[16]} = 32'h12418549;
end

always @(posedge clk) begin
	if reset begin
		storage <= 1024'b0;
	end
	else begin
		if read_write begin
			storage[address] = data_in[7:0];
			storage[address+1] = data_in[15:8];
			storage[address+2] = data_in[23:16];
			storage[address+3] = data_in[31:24];
		end 
		else begin 
			dataOut <= {storage[address+3], storage[address+2], storage[address+1], storage[address]}
		end
	end
end
endmodule 