#include <stdio.h>
#include <stdlib.h>
#include "sys/alt_dma.h"
#include "system.h"
#include "alt_types.h"

#define CHAR_LENGTH    1024

static volatile int tx_done = 0;
volatile static alt_u8 chr[CHAR_LENGTH];



//�ص�����
static void done (void* handle)
{
    tx_done++;
}

int main()
{
    //�������Ŀ���ַ�ռ������
    int i;
    for(i = 0; i < CHAR_LENGTH; i++)
    {
       *(chr + i) = i;
    }

    //����DMA�����ŵ�
    alt_dma_txchan txchan;
    //Դ��ַ
    void* source_buff_ptr = (void*) ONCHIP_RAM_BASE;
    //Ŀ���ַUART_BASE+2����ΪUART��txdata�Ĵ�����rxdata֮��ƫ����Ϊһ��rxdata�ĳ��ȣ�16λ��2���ֽڣ�
    void* destination_buff_ptr = (void*)(UART2_BASE + 2);

    //-----------------------------------------------------------
    /* �򿪷���ͨ�� */
    if ((txchan = alt_dma_txchan_open(DMA_0_NAME)) == NULL)
    {
        printf ("Failed to open transmit channel %s\n",DMA_0_NAME);
        exit (1);
    }
    else
        printf("�򿪷���ͨ��.\n");

    //-----------------------------------------------------------
    //����ÿ�η���һ���ֽڣ���8λ����ΪUARTÿ��ֻ����8λ
    if(alt_dma_txchan_ioctl(    txchan,
                                ALT_DMA_SET_MODE_8 ,
                                NULL) <0 )
    {
        printf("Failed to set mode 8\n");
        exit(1);
    }
    else
        printf("����8�ֽڷ���ģʽ.\n");

    //-----------------------------------------------------------
    /* ����Ŀ���ַ�̶� */
    if (alt_dma_txchan_ioctl(    txchan,
                                ALT_DMA_TX_ONLY_ON,
                                destination_buff_ptr) < 0)
    {
        printf ("Failed to set ioctl.\n");
        exit (1);
    }
    else
        printf("����Ŀ���ַ�̶�.\n");

    //-----------------------------------------------------------
    /* ��ʼ���� */
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
        printf("��ʼ����.\n");

    //-----------------------------------------------------------
    /* �ȴ����ͽ��� */
    while (!tx_done);
    printf ("Transfer successful!\n");

    //-----------------------------------------------------------
    //�ر�DMA�����ŵ�
    alt_dma_txchan_close(txchan);


    return 0;
}
