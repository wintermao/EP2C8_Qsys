#!/bin/sh
#

nios2-elf-objcopy -I srec -O ihex "E:/altera/13.0/project/EP2C8_RX_Qsys/flash/EP2C8_Qsys_epcs_flash.flash"  "E:/altera/13.0/project/EP2C8_RX_Qsys/flash/EP2C8_Qsys_epcs_flash.hex"
#
nios2-elf-objcopy -I srec -O ihex "E:/altera/13.0/project/EP2C8_RX_Qsys/flash/epcs_test_epcs_flash.flash"  "E:/altera/13.0/project/EP2C8_RX_Qsys/flash/epcs_test_epcs_flash.hex"
#
nios2-elf-objcopy -I srec -O ihex "E:/altera/13.0/project/EP2C8_RX_Qsys/flash/files_epcs_flash.flash"  "E:/altera/13.0/project/EP2C8_RX_Qsys/flash/files_epcs_flash.hex"
