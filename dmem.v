module dmem(
	input [31:0] data_in, 
	input [31:0] address,
	input clk, 
	input read_write, 
	input reset, 
	input enable,
	output reg [31:0] dataOut
);

reg [7:0] storage [1023:0];
integer i;

always @(posedge clk) begin
	if (reset) begin
       for (i = 0; i < 1024; i = i + 1) begin
            storage[i] <= 8'h0;
       end 
	end
	else begin
		if (read_write) begin
			storage[address] = data_in[7:0];
			storage[address+1] = data_in[15:8];
			storage[address+2] = data_in[23:16];
			storage[address+3] = data_in[31:24];
		end 
		else begin 
			dataOut <= {storage[address+3], storage[address+2], storage[address+1], storage[address]};
		end
	end
end

endmodule 
