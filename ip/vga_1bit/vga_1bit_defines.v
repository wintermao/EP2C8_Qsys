//ADDR defines
`define S_ADDR													0
`define D_ADDR													1
`define LONGTH													2
`define CONTROL													3
`define STATUS_ADDR											4
`define START_ADDR											5
`define WRUSEDW_ADDR										6
//state machine
`define	DMA_IDLE				0
`define	READ						1
`define	WAIT_READ				2
`define	WRITE						3
`define	WAIT_WRITE			4
`define	CALC_NEXT				5
`define	DMA_DONE				6
//vga timing
//`define BRIGHTNESS 	3			// brightness level
//`define BLACK		0					//black level
//`define HDisplay	800			//horizontal active
//`define VDisplay	600			//vertical active
//`define HTotal		1056		//HTotal
//`define VTotal		628			//VTotal
//`define HSYNC_WITH	128		//hsync width
//`define HSYNC_FRONT	40		//hsync front porch
//`define HSYNC_BACK	88		//hsync back porch
//`define VSYNC_WITH	4			//vsync width
//`define VSYNC_FRONT	1			//vsync front porch
//`define VSYNC_BACK	23		//vsync back porch
`define BRIGHTNESS 	3			// brightness level
`define BLACK		0					//black level
`define HDisplay	80			//horizontal active
`define VDisplay	60			//vertical active
`define HTotal		104		//HTotal
`define VTotal		67			//VTotal
`define HSYNC_WITH	12		//hsync width
`define HSYNC_FRONT	4		//hsync front porch
`define HSYNC_BACK	8		//hsync back porch
`define VSYNC_WITH	4			//vsync width
`define VSYNC_FRONT	1			//vsync front porch
`define VSYNC_BACK	2		//vsync back porch