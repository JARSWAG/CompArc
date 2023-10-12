module rom(
input [31:0] address,
input enable,
output reg[31:0] out
);

reg [7:0] storage [1023:0];

initial begin
{storage[3], storage[2], storage[1], storage[0]} = 32'b0;
{storage[7], storage[6], storage[5], storage[4]} = 32'h99127254;
{storage[11], storage[10], storage[9], storage[8]} = 32'h12345678;
{storage[15], storage[14], storage[13], storage[12]} = 32'h89117843;
{storage[19], storage[18], storage[17], storage[16]} = 32'h12418549;
end

always @(address or enable) begin
	if(enable) begin
out <= {storage[address + 3], storage[address + 2], storage[address + 1], storage[address]};
	end
end

endmodule 