// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
//`define ACCESS_ADDR 32'h900000

module source_component (
		output reg [15:0] aso_out0_data,  //  out0.data
		input  wire        aso_out0_ready, //      .ready
		output reg        aso_out0_valid, //      .valid
		input  wire        clk,            // clock.clk
		input  wire        reset           // reset.reset
		// read master port interface
		//output reg [31:0] avm_read_address,
		//output reg 				avm_read_read,
		//input  wire [31:0] avm_read_readdata,
		//input	 wire				avm_read_waitrequest
	);
	
reg 	[15:0]	DMA_Cont;

//reg	[5:0]	DMA_state;
//parameter	DMA_IDLE				=	0;
//parameter	READ					=	1;
//parameter	WAIT_READ				=	2;
//parameter	WRITE				=	3;
//parameter	WAIT_WRITE			=	4;
//parameter	CALC_NEXT				=	5;
//parameter	DMA_DONE				=	6;
reg [15:0] data;

always@(posedge clk or posedge reset)
begin
	if(reset) begin
		DMA_Cont 	<= 16'h0;
		data <= 16'h0;
		aso_out0_valid<=1'b0;
	end	else begin
		if(aso_out0_ready==1'b1) begin
			aso_out0_data<=data;
			if(DMA_Cont<16'd32)	begin
				DMA_Cont <= DMA_Cont + 1'b1;
				data <= data +1'b1;
				if(data>16'd16) aso_out0_valid<=0;
				else aso_out0_valid<=1;
			end else begin
				DMA_Cont <= 16'd0;
				data <= 16'h0;
				aso_out0_valid<=0;
			end
		end else begin
			DMA_Cont <= DMA_Cont;
			data <= data;
			aso_out0_valid <= aso_out0_valid;
		end
	end
end

endmodule
