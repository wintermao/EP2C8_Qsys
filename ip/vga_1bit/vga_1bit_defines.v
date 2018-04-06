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