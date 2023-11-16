module dmem(
    input clock,              
    input reset, 
	 input enable,
    input [31:0] memory_address,     
    input [31:0] data_in,     
    input write_enable,      
    input read_enable,       
    output reg [31:0] data_out  
);

reg [31:0] chip [1023:0];
integer i;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        for (i = 0; i < 1024; i = i + 1) begin
            chip[i] <= 32'h0;
        end
    end else begin
        if (write_enable) begin
            chip[memory_address] <= data_in[7:0];
				chip[memory_address + 1] <= data_in[15:8];
				chip[memory_address + 2] <= data_in[23:16];
				chip[memory_address + 3] <= data_in[31:24];
        end
    end
end

always @(posedge clock or posedge reset) begin
    if (reset) begin
        data_out <= 32'h0;
    end else begin
        if (read_enable) begin
            data_out <= {chip[memory_address + 3], chip[memory_address + 2],
				chip[memory_address + 1], chip[memory_address]}; 
        end
    end
end

endmodule
