`timescale 1ps/1ps

module rom_tb;

reg [31:0] address;
reg enable;
reg clock;
wire [31:0] out;

rom uut (
    .address(address),
    .enable(enable),
    .clock(clock),
    .out(out)
);

always begin
    #1 clock = ~clock;
end

initial begin
    $dumpfile("rom_tb.vcd");
    $dumpvars(0, rom_tb);

    address = 0;
    enable = 0;
    clock = 0;

    enable = 1;
    address = 0;
    #10;

    address = 4;
    #10;

    address = 8;
    #10;

    enable = 0;
    #10;

    enable = 1;
    address = 12;
    #10;

    $finish;
end

endmodule
