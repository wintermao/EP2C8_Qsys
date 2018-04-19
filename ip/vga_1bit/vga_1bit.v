`include "vga_1bit_defines.v"
/*
hl.ren.pub@gmail.com
*/


module vga_1bit(
	// signals to connect to an Avalon clock source interface
	clk,
	reset,
	
	// signals to connect to an Avalon-MM slave interface
	avs_s1_chipselect,
	avs_s1_address,
	avs_s1_read,
	avs_s1_write,
	avs_s1_readdata,
	avs_s1_writedata,
	avs_s1_byteenable,
	avs_s1_waitrequest,
	avs_s1_irq,

	// read master port interface
	avm_read_address,
	avm_read_read,
	avm_read_readdata,
	avm_read_waitrequest,
	
	//VGA interface
	vga_clk,Hs,Vs,R,G,B
	);	
	
input	clk;
input 	reset;
input 	avs_s1_chipselect;
input 	[2:0] 	avs_s1_address;
input 	avs_s1_read;
output 	[31:0] 	avs_s1_readdata;
input 	avs_s1_write;
input 	[31:0] 	avs_s1_writedata;
input 	[3:0] 	avs_s1_byteenable;
output	avs_s1_waitrequest;
output	avs_s1_irq;

	// read master port interface
output	[31:0]	avm_read_address;
output	avm_read_read;
input	[15:0]	avm_read_readdata;
input	avm_read_waitrequest;

input vga_clk;
output Hs,Vs;
output [1:0] R,G,B;
	
	// write fifo interface
wire	fifo_write_write1;
wire	[15:0]	fifo_write_writedata;
wire	fifo_write_waitrequest;
wire [11:0] fifo_wruserdw;

// read fifo interface
wire	fifo_read_read;
wire	[15:0]	fifo_read_data;

//initial vga_control
vga_control vga_control_component(
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
	
	// write fifo interface
	.fifo_write_write(fifo_write_write1),
	.fifo_write_writedata(fifo_write_writedata),
	.fifo_write_waitrequest(fifo_write_waitrequest),
	.fifo_wruserdw(fifo_wruserdw)
);


//initial dcfifo parameter
	dcfifo	dcfifo_component (
				.wrclk (clk),
				.rdreq (fifo_read_read),
				.aclr (reset),
				.rdclk (vga_clk),
				.wrreq (fifo_write_write1),
				.data (fifo_write_writedata),
				.rdempty (),
				.wrusedw (fifo_wruserdw),
				.wrfull (fifo_write_waitrequest),
				.q (fifo_read_data)
				// synopsys translate_off
				,
				.rdfull (),
				.rdusedw (),
				.wrempty ()
				// synopsys translate_on
				);
	defparam
		dcfifo_component.intended_device_family = "Cyclone II",
		dcfifo_component.lpm_numwords = 4096,
		dcfifo_component.lpm_showahead = "ON",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 16,
		dcfifo_component.lpm_widthu = 12,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 4,
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.wrsync_delaypipe = 4;

//init vga_graph
vga_graph		vga_graph_component(
	.vga_clk(vga_clk),
	.reset(reset),
	.fifo_read_read(fifo_read_read),
	.fifo_read_data(fifo_read_data),
	.Hs(Hs),
	.Vs(Vs),
	.R(R),
	.G(G),
	.B(B)
	);
endmodule
