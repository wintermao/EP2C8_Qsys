// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
//`define ACCESS_ADDR 32'h1001000

module sink_component (
		input  wire [15:0] asi_in0_data,  //   in0.data
		output reg        asi_in0_ready, //      .ready
		input  wire        asi_in0_valid, //      .valid
		input  wire        clk,           // clock.clk
		input  wire        reset,          // reset.reset
		output reg [15:0] data
	// write master port interface
//		output	reg	[31:0]	avm_write_address,
//		output	reg	avm_write_write,
//		output	reg	[31:0]	avm_write_writedata,
//		input	 wire avm_write_waitrequest
	);

reg 	[31:0]	DMA_Cont;

//reg	[5:0]	DMA_state;
//parameter	DMA_IDLE				=	0;
//parameter	READ					=	1;
//parameter	WAIT_READ				=	2;
//parameter	WRITE				=	3;
//parameter	WAIT_WRITE			=	4;
//parameter	CALC_NEXT				=	5;
//parameter	DMA_DONE				=	6;

always@(posedge clk or posedge reset)
begin
	if(reset) begin
		DMA_Cont 	<= 16'h0;
		data <= 16'h0;
		asi_in0_ready<=1'b1;
	end	else begin
		if(DMA_Cont<16'd40) DMA_Cont <= DMA_Cont + 1'b1;
		else DMA_Cont<=0;
		if(DMA_Cont>16'd10 && DMA_Cont<16'd15) begin
			asi_in0_ready<=1'b0;
		end else begin 
			asi_in0_ready<=1'b1;
		end
		if(asi_in0_valid==1'b1 && asi_in0_ready==1'b1 ) begin
			data <= asi_in0_data;
		end else begin
			data <= data;
		end
	end
end
	// TODO: Auto-generated HDL template

endmodule
