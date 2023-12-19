module dmem (
    input e,               // Enable signal
    input clk,             // Clock
    input [9:0] addr,
    input [31:0] data_in,
     input rw,
     input reset,                      // Address input
    output reg [31:0] out  // Data output

);

 integer i;
 
    reg [7:0] storage [1023:0]; 

    always @(posedge clk) begin
        if (rw && e && !reset) begin
            storage[addr] <= data_in [7:0];
                storage[addr + 1] <= data_in [15:8];
                storage[addr + 2] <= data_in [23:16];
                storage[addr + 3] <= data_in [31:24];
                end
            else if (reset) begin
             for (i = 0; i < 1024; i = i + 1) begin
                storage[i] = 0;
            end
                end
            else if (!rw && e && !reset) begin
          out = {storage[addr + 3], storage[addr + 2], storage[addr + 1], storage[addr]};
             end
        end

endmodule