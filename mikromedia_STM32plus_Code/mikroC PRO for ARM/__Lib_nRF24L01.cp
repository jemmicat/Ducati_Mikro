#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/nrf24l01_defs.h"
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__lib_nrf24l01.h"



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


int GetOutputPower(unsigned char op);
#line 1 "c:/users/jemmi/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 18 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
extern sfr sbit nRF_CS;

extern sfr sbit nRF_CE;

extern sfr sbit nRF_IRQ;
#line 28 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char ADDRESS_P0[ 5 ] = {0x34,0x43,0x10,0x10,0x01};
unsigned char ADDRESS_P1[ 5 ] = {0xB3,0xB4,0xB5,0xB6,0x02};
unsigned char ADDRESS_P2[ 5 ] = {0xB3,0xB4,0xB5,0xB6,0x03};
unsigned char ADDRESS_P3[ 5 ] = {0xB3,0xB4,0xB5,0xB6,0x04};
unsigned char ADDRESS_P4[ 5 ] = {0xB3,0xB4,0xB5,0xB6,0x05};
unsigned char ADDRESS_P5[ 5 ] = {0xB3,0xB4,0xB5,0xB6,0x06};




unsigned char TX_pload[ 0x20 ] = "Text message";
unsigned char RX_pload[ 0x20 ];


unsigned char ucCom_Mode =  0x02 ;

unsigned char ucLinkStat, ucLastStat;

unsigned int uiRX_info;
unsigned int ucRX_info;

unsigned char ucTry_Ctr;


unsigned char ucIRQ_Source;
#line 65 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_SPI_RW(unsigned char byte)
{
 return(SPI_Read(byte));
}
#line 80 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_SPI_Read(unsigned char reg)
{
 unsigned char reg_val;

 nRF_CS = 0;
 nRF_SPI_RW(reg);
 reg_val = nRF_SPI_RW(0);
 nRF_CS = 1;

 return(reg_val);
}
#line 102 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_SPI_RW_Reg(unsigned char reg, unsigned char value)
{
 unsigned char status;

 nRF_CS = 0;
 status = nRF_SPI_RW(reg);
 nRF_SPI_RW(value);
 nRF_CS = 1;

 return(status);
}
#line 124 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_SPI_RW_Reg_IRQ(unsigned char reg, unsigned char value)
{
 unsigned char status;

 nRF_CS = 0;

 status = SPI_Read(reg);
 reg = SPI_Read(value);

 nRF_CS = 1;

 return(status);
}
#line 151 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_SPI_Write_Buf(unsigned char reg, unsigned char *pBuf, unsigned char bytes)
{
 unsigned char status, byte_ctr;

 nRF_CS = 0;
 status = nRF_SPI_RW(reg);

 for(byte_ctr=0; byte_ctr<bytes; byte_ctr++)
 {
 nRF_SPI_RW(*pBuf++);
 }

 nRF_CS = 1;

 return(status);
}
#line 181 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_SPI_Read_Buf(unsigned char reg, unsigned char *pBuf, unsigned char bytes)
{
 unsigned char status, byte_ctr;

 nRF_CS = 0;
 status = nRF_SPI_RW(reg);

 for(byte_ctr=0;byte_ctr<bytes;byte_ctr++)
 {
 pBuf[byte_ctr] = nRF_SPI_RW(0);
 }

 nRF_CS = 1;

 return(status);
}
#line 207 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF_CE_Pin(unsigned char action)
{
 switch(action)
 {
 case  0x00 :
 nRF_CE = 0;
 break;

 case  0x01 :
 nRF_CE = 1;
 break;

 case  0x02 :
 nRF_CE = 1;
 TIM2_CR1.CEN = 1;
 break;
 }
}
#line 229 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF24L01_IRQ(void)
{
 unsigned char temp;

 DisableInterrupts();
 temp = nRF_SPI_RW_Reg_IRQ( 0x70 ,  0x20  +  0x07 );

 switch(temp &  0x70 )
 {
 case  0x10 :
 ucIRQ_Source =  0x10 ;
 break;
 case  0x20 :
 ucIRQ_Source =  0x20 ;
 break;
 case  0x40 :
 ucIRQ_Source =  0x40 ;
 break;
 }
 EnableInterrupts();
}
#line 254 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void TIMER2_IRQ(void)
{
 TIM2_CR1.CEN = 0;
 nRF_CE = 0;
}
#line 270 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_Clear_IRQ(unsigned char irq_flag)
{
 return nRF_SPI_RW_Reg( 0x20  +  0x07 , irq_flag);
}
#line 285 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF_Flush_TX(void)
{
 nRF_SPI_RW_Reg( 0xE1 ,0);
}
#line 300 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF_Flush_RX(void)
{
 nRF_SPI_RW_Reg( 0xE2 ,0);
}
#line 315 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_RD_RX_PW_n(unsigned char pipe)
{
 return nRF_SPI_Read( 0x11  + pipe);
}
#line 330 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_Get_Status(void)
{
 return nRF_SPI_Read( 0x07 );
}
#line 345 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_Get_Current_Pipenum(void)
{
 return ((nRF_Get_Status() &  0x0e ) >> 1);
}
#line 360 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_Get_FIFO(void)
{
 return nRF_SPI_Read( 0x17 );
}
#line 375 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned int nRF_Read_RX_Pload(unsigned char *pBuf)
{
 unsigned char plWidth, pipe;
 plWidth = nRF_RD_RX_PW_n(pipe = nRF_Get_Current_Pipenum());
 nRF_SPI_Read_Buf( 0x61 , pBuf, plWidth);

 return ((pipe << 8) + plWidth);
}
#line 394 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF_Init()
{
 asm {
 MOVW R0, #lo_addr(nRF_CS)
 MOVT R0, #hi_addr(nRF_CS)
 MOV R1, #1
 LSL R1, R1, #bitPos(nRF_CS)
 }
 GPIO_Digital_Output(R0, R1);

 asm {
 MOVW R0, #lo_addr(nRF_CE)
 MOVT R0, #hi_addr(nRF_CE)
 MOV R1, #1
 LSL R1, R1, #bitPos(nRF_CE)
 }
 GPIO_Digital_Output(R0, R1);

 asm {
 MOVW R0, #lo_addr(nRF_IRQ)
 MOVT R0, #hi_addr(nRF_IRQ)
 MOV R1, #1
 LSL R1, R1, #bitPos(nRF_IRQ)
 }
 GPIO_Digital_Input(R0, R1);
}
#line 438 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF_TX_Mode_Init_Advanced(unsigned char dataRate, unsigned char autoRetransmitDelay, unsigned char autoRetransmitCount,
 unsigned char outputPower, unsigned char channel)
{
 unsigned char setupRetr, rfSetup;



 setupRetr = autoRetransmitDelay + autoRetransmitCount;
 rfSetup = dataRate + outputPower + 1;
 ucCom_Mode =  0x00 ;

 DisableInterrupts();

 nRF_CE_Pin( 0x00 );

 nRF_Flush_TX();
 nRF_Flush_RX();

 nRF_Clear_IRQ( 0x70 );
 ucIRQ_Source =  0x00 ;
 ucLastStat = ucLinkStat =  0x02 ;

 nRF_SPI_RW_Reg( 0x20  +  0x01 , 0x3F);
 nRF_SPI_RW_Reg( 0x20  +  0x02 , 0x3F);
 nRF_SPI_RW_Reg( 0x20  +  0x04 , setupRetr);
 nRF_SPI_RW_Reg( 0x20  +  0x05 , channel);
 nRF_SPI_RW_Reg( 0x20  +  0x06 , rfSetup);
 nRF_SPI_RW_Reg( 0x20  +  0x00 , 0x0E);

 nRF_SPI_Write_Buf( 0x20  +  0x10 , &ADDRESS_P0, sizeof(ADDRESS_P0));
 nRF_SPI_Write_Buf( 0x20  +  0x0A , &ADDRESS_P0, sizeof(ADDRESS_P0));

 Delay_ms(10);

 EnableInterrupts();
}
#line 491 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF_TX_Mode_Init(unsigned char channel)
{
 nRF_TX_Mode_Init_Advanced( 0x00 ,  0xF0 ,  0x05 ,  0x06 , channel);
}
#line 509 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF_RX_Mode_Init_Advanced(unsigned char dataRate, unsigned char outputPower, unsigned char channel)
{
 unsigned char rfSetup;



 rfSetup = dataRate + outputPower + 1;

 DisableInterrupts();

 ucCom_Mode =  0x01 ;
 nRF_CE_Pin( 0x00 );

 nRF_Flush_TX();
 nRF_Flush_RX();

 nRF_Clear_IRQ( 0x70 );
 ucIRQ_Source =  0x00 ;

 nRF_SPI_RW_Reg( 0x20  +  0x01 , 0x3F);
 nRF_SPI_RW_Reg( 0x20  +  0x02 , 0x3F);
 nRF_SPI_RW_Reg( 0x20  +  0x05 , channel);
 nRF_SPI_RW_Reg( 0x20  +  0x06 , rfSetup);
 nRF_SPI_RW_Reg( 0x20  +  0x00 , 0x0F);

 nRF_SPI_Write_Buf( 0x20  +  0x0A , &ADDRESS_P0, sizeof(ADDRESS_P0));
 nRF_SPI_Write_Buf( 0x20  +  0x0B , &ADDRESS_P1, sizeof(ADDRESS_P1));

 nRF_SPI_RW_Reg( 0x20  +  0x0C , 0x03);
 nRF_SPI_RW_Reg( 0x20  +  0x0D , 0x04);
 nRF_SPI_RW_Reg( 0x20  +  0x0E , 0x05);
 nRF_SPI_RW_Reg( 0x20  +  0x0F , 0x06);

 nRF_SPI_RW_Reg( 0x20  +  0x11 ,  32 );
 nRF_SPI_RW_Reg( 0x20  +  0x12 ,  32 );
 nRF_SPI_RW_Reg( 0x20  +  0x13 ,  32 );
 nRF_SPI_RW_Reg( 0x20  +  0x14 ,  32 );
 nRF_SPI_RW_Reg( 0x20  +  0x15 ,  32 );
 nRF_SPI_RW_Reg( 0x20  +  0x16 ,  32 );

 Delay_ms(200);

 TIM2_SR.UIF = 0;
 TIM2_CR1.CEN = 0;

 EnableInterrupts();

 nRF_CE_Pin( 0x01 );
}
#line 570 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF_RX_Mode_Init(unsigned char channel)
{
 nRF_RX_Mode_Init_Advanced( 0x00 ,  0x06 , channel);
}
#line 585 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF_Process(TnRF_Status *nRFstatus)
{
 nRFstatus->_status =  0x00 ;
 nRFstatus->_pipe = 0;
 nRFstatus->_plos_cnt = 0;
 nRFstatus->_arc_cnt = 0;
 nRFstatus->_pBuff = 0;

 if(ucIRQ_Source ==  0x00 )
 return;

 DisableInterrupts();

 switch(ucIRQ_Source)
 {
 case  0x40 :
 {
 do
 {
 uiRX_info = nRF_Read_RX_Pload(RX_pload);

 }while(!(nRF_Get_FIFO() &  0x01 ));

 ucLinkStat =  0x02 ;
 nRF_Clear_IRQ( 0x40 );

 nRFstatus->_status = ucIRQ_Source;
 nRFstatus->_pipe = uiRX_info;
 nRFstatus->_pBuff = &RX_pload;


 break;
 }
 case  0x20 :
 {

 ucLinkStat =  0x02 ;
 nRF_Clear_IRQ( 0x20 );
 nRF_Clear_IRQ( 0x10 );


 ucRX_info = nRF_SPI_RW( 0x00  +  0x08 );

 nRFstatus->_status =  0x20 ;
 nRFstatus->_arc_cnt = (ucRX_info & 0x0F);
 nRFstatus->_plos_cnt = (ucRX_info & 0xF0) >> 4;

 break;
 }
 case  0x10 :
 {
 if(ucTry_Ctr++ == 3)
 ucLinkStat =  0x04 ;

 ucRX_info = nRF_SPI_Read( 0x00  +  0x08 );

 nRFstatus->_status =  0x10 ;
 nRFstatus->_arc_cnt = (ucRX_info & 0x0F);
 nRFstatus->_plos_cnt = (ucRX_info & 0xF0)>>4;

 switch(ucLinkStat)
 {
 case  0x02 :
 nRF_Clear_IRQ( 0x10 );
 ucLinkStat =  0x01 ;
 break;

 case  0x01 :
 nRF_Clear_IRQ( 0x10 );
 nRF_CE_Pin( 0x02 );
 ucLinkStat =  0x03 ;
 break;

 case  0x03 :
 nRF_Clear_IRQ( 0x10 );
 nRF_CE_Pin( 0x02 );
 ucLinkStat =  0x03 ;
 break;

 case  0x04 :
 nRF_Clear_IRQ( 0x10 );
 ucLinkStat =  0x02 ;
 break;
 }

 break;
 }
 default:
 {
 nRF_Clear_IRQ( 0x70 );

 break;
 }
 }
 ucIRQ_Source =  0x00 ;
 EnableInterrupts();
}
#line 693 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
void nRF_Write_TX_Pload(unsigned char *pBuf, unsigned char plWidth)
{
 nRF_SPI_Write_Buf( 0xA0 , pBuf, plWidth);
}
#line 709 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_Send_Packet()
{
 if ((ucCom_Mode ==  0x01 ) || (ucIRQ_Source !=  0x00 ))
 return 0;

 nRF_Write_TX_Pload(&TX_pload,  32 );
 nRF_CE_Pin( 0x02 );
 ucTry_Ctr = 0;

 return 1;
}
#line 724 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/__Lib_nRF24L01.c"
unsigned char nRF_Receive_Packet()
{
 if((ucCom_Mode ==  0x00 ) || (ucIRQ_Source ==  0x00 ))
 return 0;

 return 1;
}
