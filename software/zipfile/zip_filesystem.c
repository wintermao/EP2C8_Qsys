/**************************************************************************
 * Copyright (c) 2004 Altera Corporation, San Jose, California, USA.      *
 * All rights reserved. All use of this software and documentation is     *
 * subject to the License Agreement located at the end of this file below.*
 *************************************************************************/
/**************************************************************************
 *
 *
 * Description
 ***************
 * A simple example that demonstrates the use of the read-only Zip file
 * system.
 *
 *
 * Requirements
 ****************
 * This is a "Hosted" application. According to the ANSI C standard, hosted
 * applications can rely on numerous system-services (including properly-
 * initialized device drivers and, in this case, STDOUT).
 *
 * When this program is compiled, code is added before main(), so that all
 * devices are properly-initialized and all system-services (e.g. the <stdio>
 * library) are ready-to-use. In this hosted environment, all standard C
 * programs will run.
 *
 * A hosted application (like this example) does not need to concern itself
 * with initializing devices. As long as it only calls C Standard Library
 * functions, a hosted application can run "as if on a workstation."
 *
 * An application runs in a hosted environment if it declares the function
 * main(), which this application does.
 *
 * This software example requires a STDOUT component such as a UART or
 * JTAG UART, and a CFI flash component.  Therefore it can run on the following
 * hardware examples:
 *
 * Nios Development Board, Stratix II Edition:
 * -  Standard
 * -  Full Featured
 *
 * DSP Development Board, Stratix II Edition:
 * -  Standard
 * -  Full Featured
 *
 * Nios Development Board, Stratix Edition:
 * -  Standard
 * -  Full Featured
 * 
 * Nios Development Board, Stratix Professional Edition:
 * -  Standard
 * -  Full Featured
 * 
 * Nios Development Board, Cyclone Edition:
 * -  Standard
 * -  Full Featured
 *
 * Peripherals Exercised by SW
 *******************************
 * The example's purpose is to demonstrate the use of the Read Only Zip File
 * System . To build & run the application, perform  the following steps:
 *
 *
 * === I.  BUILD PROJECT ===
 * 1. After creating a new "Zip File System" software example project
 *    targeting a Nios II "standard" or "full_featured" hardware example
 *    design, you may build it by choosing "Build All" from the Nios II IDE
 *    "Project" menu.
 *
 * 2. Wait for the build process to complete. During the software build, the
 *    files necessary to run this example are generated.
 *
 * === II. PROGRAM FLASH ===
 * 1. Select the zip file system application project (the default project name
 *    is "zip_filesystem_0" unless specified otherwise during project creation).
 *
 * 2. From the "Tools" menu, select "Flash Programmer".
 *
 * 2. Select "Flash Programmer" under the list of "Configurations:".
 *
 * 3. Press New.
 *
 * 4. Press Program Flash.
 *
 *    Flash on your development board will now be programmed with the
 *    zip file system demo-application, read-only zip file system contents,
 *    and a boot-copier program. When your board is programmed with the standard
 *    or full_featured .sof file, the application will boot and print the
 *    contents of the files in the read-only zip file system.
 *
 * === III. RUN PROGRAM === *
 * 1. Right-click the software project and select "Run As -> Nios II Hardware"
 *
 * 
 * Software Files
 ******************
 * zip_filesystem.c - Main C file that contains all code in this example.
 *
 **************************************************************************/

#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#define	BUF_SIZE (50)

void print_file_contents(FILE* fp);

/******************************************************************
*  Function: main
*
*  Purpose: Opens the files file1.txt and file2.txt, then calls
*           print_file_contents to print them to stdout.
*
******************************************************************/
int	main(void)
{
	FILE*	fp =  NULL;

  /*
   * Open and print contents of ZipFS file 1.
   */
  printf("Reading file 'file1.txt' from ZipFS...\n");
	
  fp	=	fopen	("/mnt/rozipfs/file1.txt", "r");
	if (fp ==	NULL)
	{
		printf ("Cannot	open file.\n");
		exit (1);
	}

  print_file_contents(fp);

	fclose (fp);


  /*
   * Open and print contents of ZipFS file 2.
   */
  printf("Reading file 'file2.txt' from ZipFS...\n");
  
  fp  = fopen ("/mnt/rozipfs/file2.txt", "r");

  if (fp == NULL)
  {
    printf ("Cannot open file.\n");
    exit (1);
  }

  print_file_contents(fp);

  fclose (fp);
  
  printf("\nAll files successfully read.\n");
  printf("\nExiting....\n");

	return 0;
}

/******************************************************************
*  Function: print_file_contents
*
*  Purpose: Prints the contents of the specified file to stdout
*
******************************************************************/
void print_file_contents(FILE* fp)
{
  char buffer[BUF_SIZE];
  int read_size;
  int i;

  read_size = fread (buffer, 1, BUF_SIZE, fp);
  for(i=0; i<BUF_SIZE-1; i++)
  {
    if (buffer[i] == 0xa)
    {
      buffer[i+1] = 0x0;
      break;
    }
  }

  printf("%s\n", buffer);
}

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2004 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/
