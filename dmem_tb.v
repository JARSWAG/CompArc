`timescale 1ps/1ps

module dmem_tb;

    reg [31:0] data_in;
    reg [31:0] address;
    reg clk, read_write, reset, enable;
    wire [31:0] dataOut;

    dmem uut (
        .data_in(data_in),
        .address(address),
        .clk(clk),
        .read_write(read_write),
        .reset(reset),
        .enable(enable),
        .dataOut(dataOut)
    );

    always begin
        #1 clk = ~clk;
    end

    initial begin
        $dumpfile("dmem_tb.vcd");
        $dumpvars(0, dmem_tb);

        // Initialize signals
        data_in = 32'h0;
        address = 0;
        clk = 0;
        read_write = 0;
        reset = 0;
        enable = 1;

        // Reset the DMEM
        #10 reset = 1;
        #10 reset = 0;

        // Write data at address 0
        read_write = 1;
        address = 0;
        data_in = 32'hA5A5A5A5;
        #10;

        // Read data at address 0
        read_write = 0;
        #10;

        // Write data at address 4
        read_write = 1;
        address = 4;
        data_in = 32'h12345678;
        #10;

        // Read data at address 4
        read_write = 0;
        #10;

        $finish;
    end

endmodule
