#include <stdio.h>
#include <stdlib.h>
#include "sys/alt_dma.h"
#include "system.h"
#include "alt_types.h"

#define CHAR_LENGTH    1024

static volatile int tx_done = 0;
volatile static alt_u8 chr[CHAR_LENGTH];



//回调函数
static void done (void* handle)
{
    tx_done++;
}

int main()
{
    //串口输出目标地址空间的数据
    int i;
    for(i = 0; i < CHAR_LENGTH; i++)
    {
       *(chr + i) = i;
    }

    //创建DMA接收信道
    alt_dma_txchan txchan;
    //源地址
    void* source_buff_ptr = (void*) ONCHIP_RAM_BASE;
    //目标地址UART_BASE+2，因为UART的txdata寄存器在rxdata之后，偏移量为一个rxdata的长度（16位，2个字节）
    void* destination_buff_ptr = (void*)(UART2_BASE + 2);

    //-----------------------------------------------------------
    /* 打开发送通道 */
    if ((txchan = alt_dma_txchan_open(DMA_0_NAME)) == NULL)
    {
        printf ("Failed to open transmit channel %s\n",DMA_0_NAME);
        exit (1);
    }
    else
        printf("打开发送通道.\n");

    //-----------------------------------------------------------
    //设置每次发送一个字节，即8位，因为UART每次只发送8位
    if(alt_dma_txchan_ioctl(    txchan,
                                ALT_DMA_SET_MODE_8 ,
                                NULL) <0 )
    {
        printf("Failed to set mode 8\n");
        exit(1);
    }
    else
        printf("设置8字节发送模式.\n");

    //-----------------------------------------------------------
    /* 设置目标地址固定 */
    if (alt_dma_txchan_ioctl(    txchan,
                                ALT_DMA_TX_ONLY_ON,
                                destination_buff_ptr) < 0)
    {
        printf ("Failed to set ioctl.\n");
        exit (1);
    }
    else
        printf("设置目标地址固定.\n");

    //-----------------------------------------------------------
    /* 开始发送 */
    if (alt_dma_txchan_send(    txchan,
                                source_buff_ptr,
                                CHAR_LENGTH,
                                done,
                                NULL) < 0)
    {
        printf ("Failed to post transmit request.\n");
        exit (1);
    }
    else
        printf("开始发送.\n");

    //-----------------------------------------------------------
    /* 等待发送结束 */
    while (!tx_done);
    printf ("Transfer successful!\n");

    //-----------------------------------------------------------
    //关闭DMA接收信道
    alt_dma_txchan_close(txchan);


    return 0;
}
