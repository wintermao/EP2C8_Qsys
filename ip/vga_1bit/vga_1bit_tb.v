`timescale 1ns / 1ns
`include "vga_1bit_defines.v"


module vga_1bit_tb  ; 
parameter delay = 20 ;
  reg clk;
  reg reset;
	reg avs_s1_chipselect;
	reg avs_s1_address;
	reg avs_s1_read;
	reg avs_s1_write;
	wire avs_s1_readdata;
	reg avs_s1_writedata;
	reg avs_s1_byteenable;
	wire avs_s1_waitrequest;
	wire avs_s1_irq;
	reg avm_read_address;
	reg avm_read_read;
	wire avm_read_readdata;
	wire avm_read_waitrequest;
	reg fifo_write_write;
	reg fifo_write_writedata;
	wire fifo_write_waitrequest;
	wire fifo_wruserdw;
	reg vga_clk;
	wire Hs,Vs;
	wire [1:0] R,G,B;
  vga_1bit tb  ( 
  	// signals to connect to an Avalon clock source interface
	.clk(clk),
	.reset(reset),
	
	// signals to connect to an Avalon-MM slave interface
	.avs_s1_chipselect(avs_s1_chipselect),
	.avs_s1_address(avs_s1_address),
	.avs_s1_read(avs_s1_read),
	.avs_s1_write(avs_s1_write),
	.avs_s1_readdata(avs_s1_readdata),
	.avs_s1_writedata(avs_s1_writedata),
	.avs_s1_byteenable(avs_s1_byteenable),
	.avs_s1_waitrequest(avs_s1_waitrequest),
	.avs_s1_irq(avs_s1_irq),

	// read master port interface
	.avm_read_address(avm_read_address),
	.avm_read_read(avm_read_read),
	.avm_read_readdata(avm_read_readdata),
	.avm_read_waitrequest(avm_read_waitrequest),
	
	//VGA interface
	.vga_clk(vga_clk),.Hs(Hs),.Vs(Vs),.R(R),.G(G),.B(B)
	);

task  avalon_write;
  input [2:0] addr;
  input [31:0] data;
  begin
  #delay;
	avs_s1_address=addr;
	writedata=data;
	avs_s1_chipselect=1;
	avs_s1_write=1;
	#delay;
	avs_s1_chipselect=0;
	end
endtask
// Generates serial clock of time period 10	
initial                         
   begin
     clk = 0;
     forever #5 clk = !clk;
   end	
   
initial
  begin
	reset=1;
	#delay;
	reset=0;
	avalon_write(`S_ADDR,32'h900000); 
	avalon_write(`LONGTH,200);
	avalon_write(`CONTROL,0);
	avalon_write(`START_ADDR,1);
	end


endmodule

