/*
 * timestamp.c
 *
 *  Created on: 2018-2-4
 *      Author: mmh
 */

#include "system.h"
//#include "sys/alt_timestamp.h"          // Interval Timer核的驱动头文件
#include "alt_types.h"
#include <stdio.h>
#include <unistd.h>

int main()
{
  //alt_u32 t0,t1,dt;
//
  alt_u32 *ddr_dword1,*ddr_dword2;
  alt_u32 i,step;
  alt_u32 offset_source,offset_dest,base_source,base_dest,size;

  //ddr test bank
  base_source=SDRAM_BASE;
  base_dest=ONCHIP_RAM_BASE;//SDRAM_BASE;
  offset_source=0x100000;
  offset_dest=0x0;//0x200000;
  size=16;


  ddr_dword1=base_source+offset_source;
  ddr_dword2=base_dest+offset_dest;
  step=0;
  while(1)
  {
	  printf("s: ");
	  for(i=0;i<size;i++)		//generate data,size is 1M byte
	  {
		  *(ddr_dword1+i)=i+step;
		  printf("0x%04x ", *(ddr_dword1+i));
	  }
	  printf("\n");
	  printf("d: ");
	  for(i=0;i<size;i++)		//generate data,size is 1M byte
	  {
		  printf("0x%04x ", *(ddr_dword2+i));
	  }
	  printf("\n");
	  usleep(50000);
	  step++;
  }
  return 0;
}
