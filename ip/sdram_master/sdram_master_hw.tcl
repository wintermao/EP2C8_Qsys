# TCL File Generated by Component Editor 13.0
# Thu Apr 05 06:32:14 CST 2018
# DO NOT MODIFY


# 
# sdram_master "sdram_master" v1.0
#  2018.04.05.06:32:14
# 
# 

# 
# request TCL package from ACDS 13.0
# 
package require -exact qsys 13.0


# 
# module sdram_master
# 
set_module_property DESCRIPTION ""
set_module_property NAME sdram_master
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP user_logic
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME sdram_master
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL sdram_master
set_fileset_property quartus_synth ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file sdram_master.v VERILOG PATH sdram_master.v TOP_LEVEL_FILE
add_fileset_file sdram_master_defines.v VERILOG_INCLUDE PATH sdram_master_defines.v

add_fileset sim_verilog SIM_VERILOG "" "Verilog Simulation"
set_fileset_property sim_verilog TOP_LEVEL sdram_master
set_fileset_property sim_verilog ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file sdram_master.v VERILOG PATH sdram_master.v
add_fileset_file sdram_master_defines.v VERILOG_INCLUDE PATH sdram_master_defines.v


# 
# parameters
# 
add_parameter DMA_IDLE INTEGER 0
set_parameter_property DMA_IDLE DEFAULT_VALUE 0
set_parameter_property DMA_IDLE DISPLAY_NAME DMA_IDLE
set_parameter_property DMA_IDLE TYPE INTEGER
set_parameter_property DMA_IDLE UNITS None
set_parameter_property DMA_IDLE ALLOWED_RANGES -2147483648:2147483647
set_parameter_property DMA_IDLE HDL_PARAMETER true
add_parameter READ INTEGER 1
set_parameter_property READ DEFAULT_VALUE 1
set_parameter_property READ DISPLAY_NAME READ
set_parameter_property READ TYPE INTEGER
set_parameter_property READ UNITS None
set_parameter_property READ ALLOWED_RANGES -2147483648:2147483647
set_parameter_property READ HDL_PARAMETER true
add_parameter WAIT_READ INTEGER 2
set_parameter_property WAIT_READ DEFAULT_VALUE 2
set_parameter_property WAIT_READ DISPLAY_NAME WAIT_READ
set_parameter_property WAIT_READ TYPE INTEGER
set_parameter_property WAIT_READ UNITS None
set_parameter_property WAIT_READ ALLOWED_RANGES -2147483648:2147483647
set_parameter_property WAIT_READ HDL_PARAMETER true
add_parameter WRITE INTEGER 3
set_parameter_property WRITE DEFAULT_VALUE 3
set_parameter_property WRITE DISPLAY_NAME WRITE
set_parameter_property WRITE TYPE INTEGER
set_parameter_property WRITE UNITS None
set_parameter_property WRITE ALLOWED_RANGES -2147483648:2147483647
set_parameter_property WRITE HDL_PARAMETER true
add_parameter WAIT_WRITE INTEGER 4
set_parameter_property WAIT_WRITE DEFAULT_VALUE 4
set_parameter_property WAIT_WRITE DISPLAY_NAME WAIT_WRITE
set_parameter_property WAIT_WRITE TYPE INTEGER
set_parameter_property WAIT_WRITE UNITS None
set_parameter_property WAIT_WRITE ALLOWED_RANGES -2147483648:2147483647
set_parameter_property WAIT_WRITE HDL_PARAMETER true
add_parameter CALC_NEXT INTEGER 5
set_parameter_property CALC_NEXT DEFAULT_VALUE 5
set_parameter_property CALC_NEXT DISPLAY_NAME CALC_NEXT
set_parameter_property CALC_NEXT TYPE INTEGER
set_parameter_property CALC_NEXT UNITS None
set_parameter_property CALC_NEXT ALLOWED_RANGES -2147483648:2147483647
set_parameter_property CALC_NEXT HDL_PARAMETER true
add_parameter DMA_DONE INTEGER 6
set_parameter_property DMA_DONE DEFAULT_VALUE 6
set_parameter_property DMA_DONE DISPLAY_NAME DMA_DONE
set_parameter_property DMA_DONE TYPE INTEGER
set_parameter_property DMA_DONE UNITS None
set_parameter_property DMA_DONE ALLOWED_RANGES -2147483648:2147483647
set_parameter_property DMA_DONE HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock_reset
# 
add_interface clock_reset clock end
set_interface_property clock_reset clockRate 0
set_interface_property clock_reset ENABLED true
set_interface_property clock_reset EXPORT_OF ""
set_interface_property clock_reset PORT_NAME_MAP ""
set_interface_property clock_reset SVD_ADDRESS_GROUP ""

add_interface_port clock_reset clk clk Input 1


# 
# connection point clock_reset_reset
# 
add_interface clock_reset_reset reset end
set_interface_property clock_reset_reset associatedClock clock_reset
set_interface_property clock_reset_reset synchronousEdges DEASSERT
set_interface_property clock_reset_reset ENABLED true
set_interface_property clock_reset_reset EXPORT_OF ""
set_interface_property clock_reset_reset PORT_NAME_MAP ""
set_interface_property clock_reset_reset SVD_ADDRESS_GROUP ""

add_interface_port clock_reset_reset reset reset Input 1


# 
# connection point s1
# 
add_interface s1 avalon end
set_interface_property s1 addressAlignment NATIVE
set_interface_property s1 addressUnits WORDS
set_interface_property s1 associatedClock clock_reset
set_interface_property s1 associatedReset clock_reset_reset
set_interface_property s1 bitsPerSymbol 8
set_interface_property s1 burstOnBurstBoundariesOnly false
set_interface_property s1 burstcountUnits WORDS
set_interface_property s1 explicitAddressSpan 0
set_interface_property s1 holdTime 0
set_interface_property s1 linewrapBursts false
set_interface_property s1 maximumPendingReadTransactions 0
set_interface_property s1 readLatency 0
set_interface_property s1 readWaitTime 1
set_interface_property s1 setupTime 0
set_interface_property s1 timingUnits Cycles
set_interface_property s1 writeWaitTime 0
set_interface_property s1 ENABLED true
set_interface_property s1 EXPORT_OF ""
set_interface_property s1 PORT_NAME_MAP ""
set_interface_property s1 SVD_ADDRESS_GROUP ""

add_interface_port s1 avs_s1_chipselect chipselect Input 1
add_interface_port s1 avs_s1_address address Input 3
add_interface_port s1 avs_s1_read read Input 1
add_interface_port s1 avs_s1_write write Input 1
add_interface_port s1 avs_s1_readdata readdata Output 32
add_interface_port s1 avs_s1_writedata writedata Input 32
add_interface_port s1 avs_s1_byteenable byteenable Input 4
add_interface_port s1 avs_s1_waitrequest waitrequest Output 1
set_interface_assignment s1 embeddedsw.configuration.isFlash 0
set_interface_assignment s1 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment s1 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment s1 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point read
# 
add_interface read avalon start
set_interface_property read addressUnits SYMBOLS
set_interface_property read associatedClock clock_reset
set_interface_property read associatedReset clock_reset_reset
set_interface_property read bitsPerSymbol 8
set_interface_property read burstOnBurstBoundariesOnly false
set_interface_property read burstcountUnits WORDS
set_interface_property read doStreamReads false
set_interface_property read doStreamWrites false
set_interface_property read holdTime 0
set_interface_property read linewrapBursts false
set_interface_property read maximumPendingReadTransactions 0
set_interface_property read readLatency 0
set_interface_property read readWaitTime 1
set_interface_property read setupTime 0
set_interface_property read timingUnits Cycles
set_interface_property read writeWaitTime 0
set_interface_property read ENABLED true
set_interface_property read EXPORT_OF ""
set_interface_property read PORT_NAME_MAP ""
set_interface_property read SVD_ADDRESS_GROUP ""

add_interface_port read avm_read_address address Output 32
add_interface_port read avm_read_read read Output 1
add_interface_port read avm_read_readdata readdata Input 16
add_interface_port read avm_read_waitrequest waitrequest Input 1


# 
# connection point write
# 
add_interface write avalon start
set_interface_property write addressUnits SYMBOLS
set_interface_property write associatedClock clock_reset
set_interface_property write associatedReset clock_reset_reset
set_interface_property write bitsPerSymbol 8
set_interface_property write burstOnBurstBoundariesOnly false
set_interface_property write burstcountUnits WORDS
set_interface_property write doStreamReads false
set_interface_property write doStreamWrites false
set_interface_property write holdTime 0
set_interface_property write linewrapBursts false
set_interface_property write maximumPendingReadTransactions 0
set_interface_property write readLatency 0
set_interface_property write readWaitTime 1
set_interface_property write setupTime 0
set_interface_property write timingUnits Cycles
set_interface_property write writeWaitTime 0
set_interface_property write ENABLED true
set_interface_property write EXPORT_OF ""
set_interface_property write PORT_NAME_MAP ""
set_interface_property write SVD_ADDRESS_GROUP ""

add_interface_port write avm_write_address address Output 32
add_interface_port write avm_write_write write Output 1
add_interface_port write avm_write_writedata writedata Output 16
add_interface_port write avm_write_waitrequest waitrequest Input 1


# 
# connection point irq_s1
# 
add_interface irq_s1 interrupt end
set_interface_property irq_s1 associatedAddressablePoint s1
set_interface_property irq_s1 associatedClock clock_reset
set_interface_property irq_s1 associatedReset clock_reset_reset
set_interface_property irq_s1 ENABLED true
set_interface_property irq_s1 EXPORT_OF ""
set_interface_property irq_s1 PORT_NAME_MAP ""
set_interface_property irq_s1 SVD_ADDRESS_GROUP ""

add_interface_port irq_s1 avs_s1_irq irq Output 1

