/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2' in SOPC Builder design 'nios2'
 * SOPC Builder design path: D:/altera/project/EP2C8_Qsys/nios2.sopcinfo
 *
 * Generated: Thu Mar 08 15:14:51 CST 2018
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x1003820
#define ALT_CPU_CPU_FREQ 108000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x19
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x800020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 108000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x19
#define ALT_CPU_NAME "nios2"
#define ALT_CPU_RESET_ADDR 0x800000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x1003820
#define NIOS2_CPU_FREQ 108000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x19
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x800020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x19
#define NIOS2_RESET_ADDR 0x800000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_EPCS_FLASH_CONTROLLER
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_UART
#define __ALTERA_NIOS2_QSYS
#define __ALTPLL


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone II"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x10040e0
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x10040e0
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x10040e0
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios2"


/*
 * altpll configuration
 *
 */

#define ALTPLL_BASE 0x10040d0
#define ALTPLL_IRQ -1
#define ALTPLL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ALTPLL_NAME "/dev/altpll"
#define ALTPLL_SPAN 16
#define ALTPLL_TYPE "altpll"
#define ALT_MODULE_CLASS_altpll altpll


/*
 * epcs_flash configuration
 *
 */

#define ALT_MODULE_CLASS_epcs_flash altera_avalon_epcs_flash_controller
#define EPCS_FLASH_BASE 0x1003000
#define EPCS_FLASH_IRQ 1
#define EPCS_FLASH_IRQ_INTERRUPT_CONTROLLER_ID 0
#define EPCS_FLASH_NAME "/dev/epcs_flash"
#define EPCS_FLASH_REGISTER_OFFSET 512
#define EPCS_FLASH_SPAN 2048
#define EPCS_FLASH_TYPE "altera_avalon_epcs_flash_controller"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK SYSTIMER
#define ALT_TIMESTAMP_CLK TIMESTAMP


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x10040e0
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * onchip_ram configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_ram altera_avalon_onchip_memory2
#define ONCHIP_RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_RAM_BASE 0x1001000
#define ONCHIP_RAM_CONTENTS_INFO ""
#define ONCHIP_RAM_DUAL_PORT 0
#define ONCHIP_RAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_RAM_INIT_CONTENTS_FILE "nios2_onchip_ram"
#define ONCHIP_RAM_INIT_MEM_CONTENT 0
#define ONCHIP_RAM_INSTANCE_ID "NONE"
#define ONCHIP_RAM_IRQ -1
#define ONCHIP_RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_RAM_NAME "/dev/onchip_ram"
#define ONCHIP_RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_RAM_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_RAM_SINGLE_CLOCK_OP 0
#define ONCHIP_RAM_SIZE_MULTIPLE 1
#define ONCHIP_RAM_SIZE_VALUE 4096
#define ONCHIP_RAM_SPAN 4096
#define ONCHIP_RAM_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_RAM_WRITABLE 1


/*
 * pio_key configuration
 *
 */

#define ALT_MODULE_CLASS_pio_key altera_avalon_pio
#define PIO_KEY_BASE 0x10040c0
#define PIO_KEY_BIT_CLEARING_EDGE_REGISTER 1
#define PIO_KEY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_KEY_CAPTURE 1
#define PIO_KEY_DATA_WIDTH 3
#define PIO_KEY_DO_TEST_BENCH_WIRING 0
#define PIO_KEY_DRIVEN_SIM_VALUE 0
#define PIO_KEY_EDGE_TYPE "RISING"
#define PIO_KEY_FREQ 108000000
#define PIO_KEY_HAS_IN 1
#define PIO_KEY_HAS_OUT 0
#define PIO_KEY_HAS_TRI 0
#define PIO_KEY_IRQ 7
#define PIO_KEY_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PIO_KEY_IRQ_TYPE "EDGE"
#define PIO_KEY_NAME "/dev/pio_key"
#define PIO_KEY_RESET_VALUE 0
#define PIO_KEY_SPAN 16
#define PIO_KEY_TYPE "altera_avalon_pio"


/*
 * pio_led configuration
 *
 */

#define ALT_MODULE_CLASS_pio_led altera_avalon_pio
#define PIO_LED_BASE 0x1004000
#define PIO_LED_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_LED_BIT_MODIFYING_OUTPUT_REGISTER 1
#define PIO_LED_CAPTURE 0
#define PIO_LED_DATA_WIDTH 4
#define PIO_LED_DO_TEST_BENCH_WIRING 0
#define PIO_LED_DRIVEN_SIM_VALUE 0
#define PIO_LED_EDGE_TYPE "NONE"
#define PIO_LED_FREQ 108000000
#define PIO_LED_HAS_IN 0
#define PIO_LED_HAS_OUT 1
#define PIO_LED_HAS_TRI 0
#define PIO_LED_IRQ -1
#define PIO_LED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_LED_IRQ_TYPE "NONE"
#define PIO_LED_NAME "/dev/pio_led"
#define PIO_LED_RESET_VALUE 0
#define PIO_LED_SPAN 32
#define PIO_LED_TYPE "altera_avalon_pio"


/*
 * sdram configuration
 *
 */

#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x800000
#define SDRAM_CAS_LATENCY 2
#define SDRAM_CONTENTS_INFO
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/sdram"
#define SDRAM_POWERUP_DELAY 100.0
#define SDRAM_REFRESH_PERIOD 15.625
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x16
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 8
#define SDRAM_SDRAM_DATA_WIDTH 16
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 12
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 0
#define SDRAM_SPAN 8388608
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 6.0
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 14.0


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x10040e8
#define SYSID_ID 0
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1520492466
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * systimer configuration
 *
 */

#define ALT_MODULE_CLASS_systimer altera_avalon_timer
#define SYSTIMER_ALWAYS_RUN 0
#define SYSTIMER_BASE 0x10040a0
#define SYSTIMER_COUNTER_SIZE 32
#define SYSTIMER_FIXED_PERIOD 0
#define SYSTIMER_FREQ 108000000
#define SYSTIMER_IRQ 2
#define SYSTIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SYSTIMER_LOAD_VALUE 107999
#define SYSTIMER_MULT 0.0010
#define SYSTIMER_NAME "/dev/systimer"
#define SYSTIMER_PERIOD 1
#define SYSTIMER_PERIOD_UNITS "ms"
#define SYSTIMER_RESET_OUTPUT 0
#define SYSTIMER_SNAPSHOT 1
#define SYSTIMER_SPAN 32
#define SYSTIMER_TICKS_PER_SEC 1000.0
#define SYSTIMER_TIMEOUT_PULSE_OUTPUT 0
#define SYSTIMER_TYPE "altera_avalon_timer"


/*
 * timestamp configuration
 *
 */

#define ALT_MODULE_CLASS_timestamp altera_avalon_timer
#define TIMESTAMP_ALWAYS_RUN 0
#define TIMESTAMP_BASE 0x1004080
#define TIMESTAMP_COUNTER_SIZE 32
#define TIMESTAMP_FIXED_PERIOD 0
#define TIMESTAMP_FREQ 108000000
#define TIMESTAMP_IRQ 3
#define TIMESTAMP_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMESTAMP_LOAD_VALUE 107
#define TIMESTAMP_MULT 1.0E-6
#define TIMESTAMP_NAME "/dev/timestamp"
#define TIMESTAMP_PERIOD 1
#define TIMESTAMP_PERIOD_UNITS "us"
#define TIMESTAMP_RESET_OUTPUT 0
#define TIMESTAMP_SNAPSHOT 1
#define TIMESTAMP_SPAN 32
#define TIMESTAMP_TICKS_PER_SEC 1000000.0
#define TIMESTAMP_TIMEOUT_PULSE_OUTPUT 0
#define TIMESTAMP_TYPE "altera_avalon_timer"


/*
 * uart1 configuration
 *
 */

#define ALT_MODULE_CLASS_uart1 altera_avalon_uart
#define UART1_BASE 0x1004060
#define UART1_BAUD 115200
#define UART1_DATA_BITS 8
#define UART1_FIXED_BAUD 1
#define UART1_FREQ 108000000
#define UART1_IRQ 4
#define UART1_IRQ_INTERRUPT_CONTROLLER_ID 0
#define UART1_NAME "/dev/uart1"
#define UART1_PARITY 'N'
#define UART1_SIM_CHAR_STREAM ""
#define UART1_SIM_TRUE_BAUD 0
#define UART1_SPAN 32
#define UART1_STOP_BITS 1
#define UART1_SYNC_REG_DEPTH 2
#define UART1_TYPE "altera_avalon_uart"
#define UART1_USE_CTS_RTS 0
#define UART1_USE_EOP_REGISTER 0


/*
 * uart2 configuration
 *
 */

#define ALT_MODULE_CLASS_uart2 altera_avalon_uart
#define UART2_BASE 0x1004040
#define UART2_BAUD 115200
#define UART2_DATA_BITS 8
#define UART2_FIXED_BAUD 1
#define UART2_FREQ 108000000
#define UART2_IRQ 5
#define UART2_IRQ_INTERRUPT_CONTROLLER_ID 0
#define UART2_NAME "/dev/uart2"
#define UART2_PARITY 'N'
#define UART2_SIM_CHAR_STREAM ""
#define UART2_SIM_TRUE_BAUD 0
#define UART2_SPAN 32
#define UART2_STOP_BITS 1
#define UART2_SYNC_REG_DEPTH 2
#define UART2_TYPE "altera_avalon_uart"
#define UART2_USE_CTS_RTS 0
#define UART2_USE_EOP_REGISTER 0


/*
 * uart3 configuration
 *
 */

#define ALT_MODULE_CLASS_uart3 altera_avalon_uart
#define UART3_BASE 0x1004020
#define UART3_BAUD 115200
#define UART3_DATA_BITS 8
#define UART3_FIXED_BAUD 1
#define UART3_FREQ 108000000
#define UART3_IRQ 6
#define UART3_IRQ_INTERRUPT_CONTROLLER_ID 0
#define UART3_NAME "/dev/uart3"
#define UART3_PARITY 'N'
#define UART3_SIM_CHAR_STREAM ""
#define UART3_SIM_TRUE_BAUD 0
#define UART3_SPAN 32
#define UART3_STOP_BITS 1
#define UART3_SYNC_REG_DEPTH 2
#define UART3_TYPE "altera_avalon_uart"
#define UART3_USE_CTS_RTS 0
#define UART3_USE_EOP_REGISTER 0

#endif /* __SYSTEM_H_ */
