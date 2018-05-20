#!/bin/sh
#
# This file was automatically generated.
#
# It can be overwritten by nios2-flash-programmer-generate or nios2-flash-programmer-gui.
#

#
# Converting SOF File: E:\altera\13.0\project\EP2C8_RX_Qsys\output_files\EP2C8_Qsys.sof to: "..\flash/EP2C8_Qsys_epcs_flash.flash"
#
sof2flash --input="E:/altera/13.0/project/EP2C8_RX_Qsys/output_files/EP2C8_Qsys.sof" --output="../flash/EP2C8_Qsys_epcs_flash.flash" --epcs 

#
# Programming File: "..\flash/EP2C8_Qsys_epcs_flash.flash" To Device: epcs_flash
#
nios2-flash-programmer "../flash/EP2C8_Qsys_epcs_flash.flash" --base=0x1003000 --epcs --sidp=0x1004128 --id=0x0 --accept-bad-sysid --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program 

#
# Converting ELF File: E:\altera\13.0\project\EP2C8_RX_Qsys\software\epcs_test\epcs_test.elf to: "..\flash/epcs_test_epcs_flash.flash"
#
elf2flash --input="E:/altera/13.0/project/EP2C8_RX_Qsys/software/epcs_test/epcs_test.elf" --output="../flash/epcs_test_epcs_flash.flash" --epcs --after="../flash/EP2C8_Qsys_epcs_flash.flash" 

#
# Programming File: "..\flash/epcs_test_epcs_flash.flash" To Device: epcs_flash
#
nios2-flash-programmer "../flash/epcs_test_epcs_flash.flash" --base=0x1003000 --epcs --sidp=0x1004128 --id=0x0 --accept-bad-sysid --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program 

