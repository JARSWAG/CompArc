module top_dmem (
	 input [12:0] mem_addr,
	 input clk,
	 input rw,
	 input reset,
	 input [31:0] data_in,
	 output reg [31:0]dmem             
	                                   
);

reg [7:0] e;
wire [31:0] out0;
wire [31:0] out1;
wire [31:0] out2;
wire [31:0] out3;
wire [31:0] out4;
wire [31:0] out5;
wire [31:0] out6;
wire [31:0] out7;
always @(posedge clk)
begin
    case(mem_addr[12:10])
        0: begin
		  e[0] = 1;
		  e[7:1] = 0;
		  end
        1: begin
		  e[1] = 1;
		  e[0] = 0;
		  e[7:2] = 0;
		  end
        2: begin
		  e[1:0] = 0;
		  e[2] = 1;
		  e[7:3] = 0;
		  end
        3:
		  begin
		  e[2:0] = 0;
		  e[3] = 1;
		  e[7:4] = 0;
		  end 
        4:
		  begin
		  e[3:0] = 0;
		  e[4] = 1;
		  e[7:5] = 0;
		  end
		  5:
		  begin
		  e[4:0] = 0;
		  e[5] = 1;
		  e[7:6] = 0;
		  end
		  6:
		  begin
		  e[5:0] = 0; 
		  e[6] = 1;
		  e[7] = 0;
		  end
		  7:
		 begin
		  e[6:0] = 0; 
		  e[7] = 1;
		  end
        default: e[7:0] = 0;      // Default operation
    endcase
end

always @(posedge clk)
begin
    case(mem_addr[12:10])
        0:dmem <= out0[31:0];
        1:dmem <= out1[31:0];
        2:dmem <= out2[31:0];
        3:dmem <= out3[31:0];
        4:dmem <= out4[31:0];
		  5:dmem <= out5[31:0];
		  6:dmem <= out6[31:0];
		  7:dmem <= out7[31:0];
        default: dmem <= 0;      
    endcase
end

   

 dmem M0(e[0], clk, mem_addr[9:0], data_in[31:0], rw, reset, out0);
 dmem M1(e[1], clk, mem_addr[9:0], data_in[31:0], rw, reset, out1);
 dmem M2(e[2], clk, mem_addr[9:0], data_in[31:0], rw, reset, out2);
 dmem M3(e[3], clk, mem_addr[9:0], data_in[31:0], rw, reset, out3);
 dmem M4(e[4], clk, mem_addr[9:0], data_in[31:0], rw, reset, out4);
 dmem M5(e[5], clk, mem_addr[9:0], data_in[31:0], rw, reset, out5);
 dmem M6(e[6], clk, mem_addr[9:0], data_in[31:0], rw, reset, out6);
 dmem M7(e[7], clk, mem_addr[9:0], data_in[31:0], rw, reset, out7);

endmodule