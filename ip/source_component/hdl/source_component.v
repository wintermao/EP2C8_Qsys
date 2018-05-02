// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
`define ACCESS_ADDR 32'h900000

module source_component (
		output reg [31:0] aso_out0_data,  //  out0.data
		input  wire        aso_out0_ready, //      .ready
		output reg        aso_out0_valid, //      .valid
		input  wire        clk,            // clock.clk
		input  wire        reset,           // reset.reset
		// read master port interface
		output reg [31:0] avm_read_address,
		output reg 				avm_read_read,
		input  wire [31:0] avm_read_readdata,
		input	 wire				avm_read_waitrequest
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
		avm_read_address <= `ACCESS_ADDR;
		DMA_state <= READ;
	end	else begin
		case(DMA_state)
			READ: begin
				avm_read_address <= `ACCESS_ADDR + DMA_Cont;
				if(aso_out0_ready==1'b1) begin
					avm_read_read <= 1'b1;
					DMA_state	<= WAIT_READ;
				end else begin
					avm_read_read <= avm_read_read;
					DMA_state	<= DMA_state;
				end
			end
			WAIT_READ: begin
				if(avm_read_waitrequest == 1'b0 ) begin
					avm_read_read <= 1'b0;
					aso_out0_data <= avm_read_readdata;
					if(DMA_Cont<32'd64)	DMA_Cont <= DMA_Cont + 32'h4;
					else DMA_Cont <= 32'd0;
					DMA_state <= READ;
					aso_out0_valid <= 1'b1;
				end else aso_out0_valid <= 1'b0;
			end
		endcase
	end
end

endmodule
