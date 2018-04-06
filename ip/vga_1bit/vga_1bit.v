`include "sdram_master_defines.v"
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
	avm_read_waitrequest
	);	
	
input	clk;
input 	reset;
input 	avs_s1_chipselect;
input 	[2:0] 	avs_s1_address;
input 	avs_s1_read;
output 	reg [31:0] 	avs_s1_readdata;
input 	avs_s1_write;
input 	[31:0] 	avs_s1_writedata;
input 	[3:0] 	avs_s1_byteenable;
output	avs_s1_waitrequest;
output	reg avs_s1_irq;

	// read master port interface
output	reg	[31:0]	avm_read_address;
output	reg	avm_read_read;
input	[15:0]	avm_read_readdata;
input	avm_read_waitrequest;
	
	// write fifo interface
reg	fifo_write_write;
reg	[15:0]	fifo_write_writedata;
wire	fifo_write_waitrequest;
wire [11:0] fifo_wruserdw;

reg	[15:0]	S_addr;//source address
reg	[15:0]	Longth;

reg [7:0]	Control;
reg	[7:0]	Status;

reg 	[15:0] 	DMA_DATA;

reg 	[15:0]	DMA_Cont;

reg	avs_s1_read_last;
always@(posedge clk)
begin
	avs_s1_read_last <= avs_s1_read;
end

wire	avs_s1_waitrequest;

//read and write regs
always@(posedge clk or posedge reset)
begin
		if(reset) begin
			S_addr 		<= 32'h0;	
			Longth 		<= 16'h0;
			Control		<= 8'h0;
		end
		else 	begin
			if((avs_s1_chipselect==1'b1) && (avs_s1_write==1'b1)) begin
				case(avs_s1_address)
					`S_ADDR:			S_addr 		<= avs_s1_writedata;
					`LONGTH:			Longth 		<= avs_s1_writedata[15:0];
					`CONTROL:			Control		<= avs_s1_writedata[7:0];
				endcase
			end
			else	begin
				if((avs_s1_chipselect==1'b1) && (avs_s1_read==1'b1)) begin
					case(avs_s1_address)
						`S_ADDR:			avs_s1_readdata <= S_addr;
						`LONGTH:			avs_s1_readdata <= {16'h0,Longth};
						`CONTROL:			avs_s1_readdata <= {24'h0,Control};
						`STATUS_ADDR:	avs_s1_readdata <= {24'h0,Status};
						`WRUSEDW_ADDR:avs_s1_readdata <= {20'h0,fifo_wruserdw};
						default: 			avs_s1_readdata <= 32'h0;
					endcase
				end
			end
		end
end


//start signal
reg	start;
always@(posedge clk or posedge reset)
begin
	if(reset)
		start 		<= 1'b0;
	else 	if((avs_s1_chipselect==1'b1) & (avs_s1_write==1'b1) & (avs_s1_address == `START_ADDR))	
				start 	<= 1'b1;
			else start 	<= 1'b0;
end

//status signal
reg	done;
reg done_last;
always@(posedge clk)
begin
	if(reset) 	done_last 		<= 1'b0;
	else 		done_last 		<= done;
end


always@(posedge clk)
begin
	if(reset)
	begin
		Status[0] <= 1'b0;
	end
	else 	if((avs_s1_chipselect==1'b1) &  (avs_s1_write==1'b1)  & (avs_s1_address == `START_ADDR) )	
			begin
				Status[0] <= 1'b0;
			end
			else 	if( (done_last == 1'b0 )&( done == 1'b1) )
					begin
						Status[0] <= 1'b1;
					end
end

//FSM

reg	[5:0]	DMA_state;

always@(posedge clk)
begin
	if(reset) begin
		DMA_state <= DMA_IDLE;
		DMA_Cont 	<= 16'h0;
	end
	else begin
		case(DMA_state)
			DMA_IDLE: begin
				DMA_Cont <= 16'h0;
				done 				<= 1'b0;
				if(start) 
					DMA_state 		<= READ;
			end
			READ: begin
				if(Control[0]==0)	avm_read_address <= S_addr + DMA_Cont;
				else avm_read_address <= S_addr;
				avm_read_read <= 1'b1;
				DMA_state	<= WAIT_READ;
			end
			WAIT_READ: begin
				if(avm_read_waitrequest == 1'b0 )
				begin
					avm_read_read <= 1'b0;
					DMA_DATA <= avm_read_readdata;
					DMA_state <= WRITE;
				end
			end
			WRITE: begin
				fifo_write_write <= 1'b1;
				fifo_write_writedata <= DMA_DATA;
				DMA_state <= WAIT_WRITE;
			end
			WAIT_WRITE: begin
				if(fifo_write_waitrequest == 1'b0 )
					begin
						DMA_Cont <= DMA_Cont + 32'h2;
						fifo_write_write <= 1'b0;
						if(DMA_Cont < Longth)
							DMA_state <= READ;
						else
							DMA_state <= DMA_DONE;
					end
			end
			DMA_DONE: begin
				done <= 1'b1;
				DMA_state <= DMA_IDLE;
			end
			default: begin
				DMA_state <= DMA_IDLE;
			end			
		endcase
	end
end

//generate irq signal
always@(posedge clk)
begin
	if(reset)
	begin
		avs_s1_irq <= 1'b0;
	end
	else 	if((avs_s1_chipselect==1'b1) &  (avs_s1_write==1'b1)  & (avs_s1_address == `STATUS_ADDR) )	
			begin
				avs_s1_irq <= 1'b0;
			end
			else 	if( (done_last == 1'b0 )&( done == 1'b1) )
					begin
						avs_s1_irq <= 1'b1;
					end
end

//initial dcfifo parameter
	dcfifo	dcfifo_component (
				.wrclk (clk),
				.rdreq (),
				.aclr (reset),
				.rdclk (),
				.wrreq (fifo_write_write),
				.data (fifo_write_writedata),
				.rdempty (),
				.wrusedw (fifo_wruserdw),
				.wrfull (fifo_write_waitrequest),
				.q ()
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
		
endmodule
