`timescale 1ps/1ps

module rom_tb;

reg [12:0] address;
reg read_write;
reg reset;
reg clock;
reg dataOut;

DMEM_TopLevel uut (
	 .data_in(data_in)
    .address(address),
    .clock(clock),
    .read_write(read_write),
	 .reset(reset),
	 .dataOut(dataOut),
);

always begin
    #1 clock = ~clock;
end

initial begin
    $dumpfile("dmem_tb.vcd");
    $dumpvars(0, dmem_tb);

    data_in = 0;
    read_write = 1;
	 reset = 1;
    address = 0;
	 
    #10 reset = 0;
	 
	 address[12:10] = 0;
	 address[9:0] = ;
    #10;

    address[12:10] = 1;
    #10;

    address[12:10] = 2;
    #10;

    address[12:10] = 3;
    #10;

    address[12:10] = 4;
    #10;
	 
	 address[12:10] = 5;
    #10;
	 
	 address[12:10] = 6;
    #10;
	 
	 address[12:10] = 7;
    #10;

    $finish;
end

endmodule 