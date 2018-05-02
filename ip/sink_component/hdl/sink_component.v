// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
`define ACCESS_ADDR 32'h1001000

module sink_component (
		input  wire [31:0] asi_in0_data,  //   in0.data
		output reg        asi_in0_ready, //      .ready
		input  wire        asi_in0_valid, //      .valid
		input  wire        clk,           // clock.clk
		input  wire        reset,          // reset.reset
		
	// write master port interface
		output	reg	[31:0]	avm_write_address,
		output	reg	avm_write_write,
		output	reg	[31:0]	avm_write_writedata,
		input	 wire avm_write_waitrequest
	);

reg 	[31:0]	DMA_Cont;

reg	[5:0]	DMA_state;
parameter	DMA_IDLE				=	0;
parameter	READ					=	1;
parameter	WAIT_READ				=	2;
parameter	WRITE				=	3;
parameter	WAIT_WRITE			=	4;
parameter	CALC_NEXT				=	5;
parameter	DMA_DONE				=	6;

always@(posedge clk or posedge reset)
begin
	if(reset) begin
		DMA_Cont 	<= 32'h0;
		avm_write_address <= `ACCESS_ADDR;
		DMA_state <= WRITE;
	end	else begin
		case(DMA_state)
			WRITE: begin
				avm_write_address <= `ACCESS_ADDR + DMA_Cont;
				if(asi_in0_valid==1'b1) begin
					avm_write_write <= 1'b1;
					avm_write_writedata <= asi_in0_data;
					DMA_state <= WAIT_WRITE;
				end else begin
					avm_write_write <= avm_write_write;
					DMA_state <= DMA_state;
				end
			end
			WAIT_WRITE: begin
				if(avm_write_waitrequest == 1'b0 ) begin
					avm_write_write <= 1'b0;
					if(DMA_Cont<32'd64)	DMA_Cont <= DMA_Cont + 32'h4;
					else DMA_Cont <= 32'd0;
					DMA_state <= WRITE;
					asi_in0_ready <= 1'b1;
				end	else asi_in0_ready <= 1'b0;
			end
		endcase
	end
end
	// TODO: Auto-generated HDL template

endmodule
