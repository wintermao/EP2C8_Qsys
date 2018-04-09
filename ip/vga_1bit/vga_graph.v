`include "vga_1bit_defines.v"

module vga_graph
(
vga_clk,reset,
fifo_read_read,fifo_read_data,
Hs,Vs,R,G,B
);
	input vga_clk;				//vga clock		
	input reset;				// reset,high level active
	output fifo_read_read;			//fifo read request
	input [15:0] fifo_read_data;	//fifo read data
	//vga interface
	output Hs,Vs;
	output [1:0] R,G,B;
	
	wire DE;
	reg Hs_reg,Vs_reg;
	reg [1:0] R_reg,G_reg,B_reg;
	reg [15:0] count_h,count_v;
	reg Blank_H,Blank_V;

	reg [4:0] pixel_counter=0;
	reg read_request;
	reg [15:0] pixel_word,fifo_q;
	
//pixel counter
always @(posedge vga_clk or posedge reset)					
begin
	if(reset) begin
		pixel_counter<=0;
	end
	else begin
		if(pixel_counter<15)	pixel_counter<=pixel_counter+1'h1;
		else pixel_counter<=0;
	end
end

//read word signal
always @(posedge vga_clk or posedge reset)					
begin
	if(reset) begin
		read_request<=0;
		fifo_q<=0;
	end
	else begin
		if(pixel_counter==15) 	
			read_request<=1;
		else if(pixel_counter==0) begin
			read_request<=1;
			fifo_q<=fifo_read_data;
		end else
			read_request<=0;
	end
end

assign fifo_read_read = DE? read_request : 1'h0;

//fifo read
always @(posedge vga_clk or posedge reset)					
begin
	if(reset) begin
		pixel_word<=0;
		R_reg<=0;
		G_reg<=0;
		B_reg<=0;
	end
	else if(DE==1) begin
		if(pixel_counter==0) begin
			pixel_word<=fifo_q;
			R_reg<={1'h0,fifo_q[0]};
			G_reg<={1'h0,fifo_q[0]};
			B_reg<={1'h0,fifo_q[0]};
		end	else begin
			R_reg<={1'h0,pixel_word[0]};
			G_reg<={1'h0,pixel_word[0]};
			B_reg<={1'h0,pixel_word[0]};
		end
		pixel_word<=pixel_word>>1;
	end else begin
		pixel_word<=pixel_word;
		R_reg<=R_reg;
		G_reg<=G_reg;
		B_reg<=B_reg;
	end
end

//hsyc generate
always @(posedge vga_clk or posedge reset)					
begin
	if(reset) begin
		count_h<=0;
		Hs_reg<=0;
		Blank_H<=0;
	end
	else begin
		if(count_h>=`HTotal-1) count_h<=0;
		else count_h<=count_h+1'h1;				//horizontal counter
		if(count_h==`HDisplay-1) 			//horizontal blank start
		begin
			Blank_H<=1;
		end
		else if(count_h==(`HDisplay+`HSYNC_BACK)-1) 				//horizontal sync start
		begin
			Hs_reg<=1;
		end
		else if(count_h==(`HDisplay+`HSYNC_BACK+`HSYNC_WITH)-1)			//horizontal sync end
		begin
			Hs_reg<=0;
		end
		else if(count_h>=`HTotal-1)			//horizontal blank end
		begin
			Blank_H<=0;
		end
	end
end

//vsyc generate	
always @(posedge Hs_reg or posedge reset)					
begin
	if(reset) begin
		count_v<=0;
		Vs_reg<=0;
		Blank_V<=0;
	end
	else begin
		if(count_v>=`VTotal-1) count_v<=0;
		else count_v<=count_v+1'h1;			//vertical counter
		if(count_v==`VDisplay-1)				//vertical blank start
		begin
			Blank_V<=1;
		end
		if(count_v==(`VDisplay+`VSYNC_BACK)-1)				//vertical sync start
		begin
			Vs_reg<=1;
		end
		else if(count_v==(`VDisplay+`VSYNC_BACK+`VSYNC_WITH)-1)				//vertical sync end
		begin
			Vs_reg<=0;
		end
		else if(count_v>=`VTotal-1)				//vertical blank end
		begin
			count_v<=0;
			Blank_V<=0;
		end
	end
end

assign Hs=~Hs_reg;						//hsync out
assign Vs=~Vs_reg;						//vsync out
assign DE=~(Blank_H | Blank_V);		//DE out
assign R=DE?R_reg:2'h0;					//r out
assign G=DE?G_reg:2'h0;					//g out
assign B=DE?B_reg:2'h0;					//b out
endmodule

