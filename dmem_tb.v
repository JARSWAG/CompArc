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
	 address[9:0] = 0;
	 Din = 32'hA5A5A5A5;
	 read_write = 1;
    #10;
	 
	 address[12:10] = 0;
	 address[9:0] = 0;
	 Din = 32'hA5A5A5A5;
	 read_write = 0;
    #10;

    address[12:10] = 1;
	 address[9:0] = 4;
	 Din = 32'h12345678;
	 read_write = 1;
    #10;
	 
	 address[12:10] = 1;
	 address[9:0] = 4;
	 Din = 32'h12345678;
	 read_write = 0;
    #10;

    address[12:10] = 2;
	 address[9:0] = 8;
	 Din = 32'h15328054;
	 read_write = 1;
    #10;
	 
	 address[12:10] = 2;
	 address[9:0] = 8;
	 Din = 32'h15328054;
	 read_write = 0;
    #10;

    address[12:10] = 3;
	 address[9:0] = 12;
	 Din = 32'h00100234;
	 read_write = 1;
    #10;
	 
	 address[12:10] = 3;
	 address[9:0] = 12;
	 Din = 32'h00100234;
	 read_write = 0;
    #10;

    address[12:10] = 4;
	 address[9:0] = 0;
	 Din = 32'h53601518;
	 read_write = 1;
    #10;
	 
	 address[12:10] = 4;
	 address[9:0] = 0;
	 Din = 32'h53601518;
	 read_write = 0;
    #10;
	 
	 address[12:10] = 5;
	 address[9:0] = 4;
	 Din = 32'h69420632;
	 read_write = 1;
    #10;
	 
	 address[12:10] = 5;
	 address[9:0] = 4;
	 Din = 32'h69420632;
	 read_write = 0;
    #10;
	 
	 address[12:10] = 6;
	 address[9:0] = 8;
	 Din = 32'h1839uaHF;
	 read_write = 1;
    #10;
	 
	 address[12:10] = 6;
	 address[9:0] = 8;
	 Din = 32'h1839uaHF;
	 read_write = 0;
    #10;
	 
	 address[12:10] = 7;
	 address[9:0] = 12;
	 Din = 32'h97319711;
	 read_write = 1;
	 #10;
	 
	 address[12:10] = 7;
	 address[9:0] = 12;
	 Din = 32'h97319711;
	 read_write = 0;
    #10;

    $finish;
end

endmodule 
