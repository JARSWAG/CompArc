`timescale 1ps/1ps

module dmem_tb;

reg clock, reset, enable, write_enable, read_enable;
reg [31:0] memory_address, data_in, data_out;

dmem uut (
    .clock(clock),
    .reset(reset),
    .enable(enable),
    .memory_address(memory_address),
    .data_in(data_in),
    .write_enable(write_enable),
    .read_enable(read_enable),
    .data_out(data_out)
);

always begin
    #5 clock = ~clock;
end

initial begin
    $dumpfile("dmem_tb.vcd");
    $dumpvars(0, dmem_tb);

    clock = 0;
    reset = 1;
    enable = 0;
    write_enable = 0;
    read_enable = 0;
    memory_address = 0;
    data_in = 0;

    // Reset the DMEM
    #10 reset = 0;
    #10 reset = 1;

    // Enable the DMEM and write data at address 0
    enable = 1;
    write_enable = 1;
    memory_address = 0;
    data_in = 32'h12345678;
    #10;

    // Read data at address 0
    write_enable = 0;
    read_enable = 1;
    #10;

    // Disable the DMEM
    enable = 0;
    #10;

    // Enable the DMEM again and write data at address 4
    enable = 1;
    write_enable = 1;
    memory_address = 4;
    data_in = 32'h98765432;
    #10;

    // Read data at address 4
    write_enable = 0;
    read_enable = 1;
    #10;

    $finish;
end


endmodule