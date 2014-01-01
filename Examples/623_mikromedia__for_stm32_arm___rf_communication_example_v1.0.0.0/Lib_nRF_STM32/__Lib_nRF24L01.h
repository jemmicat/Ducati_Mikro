#ifndef __LIB_NRF24L01_H
#define __LIB_NRF24L01_H

typedef struct {
  unsigned char _status;
  unsigned int _pipe;
  unsigned char _plos_cnt;
  unsigned char _arc_cnt;
  unsigned char *_pBuff;
} TnRF_Status;

typedef struct RF_Config {
  unsigned char autoTransmitDelay;
  unsigned char autoTransmitCount;
  unsigned char channel;
  unsigned char outputPower;
  unsigned char dataRate;
} TRF_Config;

extern unsigned char TX_pload[];
extern unsigned char RX_pload[];

unsigned char nRF_SPI_RW(unsigned char byte);
unsigned char nRF_SPI_Read(unsigned char reg);
unsigned char nRF_SPI_RW_Reg(unsigned char reg, unsigned char value);
unsigned char nRF_SPI_RW_Reg_IRQ(unsigned char reg, unsigned char value);
unsigned char nRF_SPI_Write_Buf(unsigned char reg, unsigned char *pBuf, unsigned char bytes);
unsigned char nRF_SPI_Read_Buf(unsigned char reg, unsigned char *pBuf, unsigned char bytes);
void nRF_CE_Pin(unsigned char action) ;
void nRF24L01_IRQ(void);
void TIMER2_IRQ(void);
unsigned char nRF_Clear_IRQ(unsigned char irq_flag);
void nRF_Flush_TX(void);
void nRF_Flush_RX(void);
unsigned char nRF_RD_RX_PW_n(unsigned char pipe);
unsigned char nRF_Get_Status(void);
unsigned char nRF_Get_Current_Pipenum(void);
unsigned char nRF_Get_FIFO(void);
unsigned int nRF_Read_RX_Pload(unsigned char *pBuf);
void nRF_Init();
void nRF_TX_Mode_Init_Advanced(unsigned char dataRate, unsigned char autoRetransmitDelay, unsigned char autoRetransmitCount,
                      unsigned char outputPower, unsigned char channel);
void nRF_TX_Mode_Init(unsigned char channel);
void nRF_RX_Mode_Init_Advanced(unsigned char dataRate, unsigned char outputPower, unsigned char channel);
void nRF_RX_Mode_Init(unsigned char channel);
void nRF_Process(TnRF_Status *nRFstatus);
void nRF_Write_TX_Pload(unsigned char *pBuf, unsigned char plWidth);
unsigned char nRF_Send_Packet();
unsigned char nRF_Receive_Packet();

//example specific
int GetOutputPower(unsigned char op);

#endif