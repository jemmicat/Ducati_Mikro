/**************************************************************************************************
* Project Name: API functions for nRF24L01+
* Company: (c) mikroElektronika, 2012
* Revision History:                
*     20120724 (DA):
*       - initial release;
* Description:
*     This project contains API functions for NORDIC nRF24L01+.
**************************************************************************************************/

#include "nRF24L01_defs.h"
#include "__Lib_nRF24L01.h"
#include <built_in.h>

/**************************************************************************************************
* nRF24L01+ connections
**************************************************************************************************/
extern sfr sbit nRF_CS;

extern sfr sbit nRF_CE;

extern sfr sbit nRF_IRQ; // ubaceno

/**************************************************************************************************
* VARIABLES AND CONSTANTS
**************************************************************************************************/
// Predefine a static pipe address
unsigned char ADDRESS_P0[nRF_ADR_LENGTH] = {0x34,0x43,0x10,0x10,0x01};
unsigned char ADDRESS_P1[nRF_ADR_LENGTH] = {0xB3,0xB4,0xB5,0xB6,0x02};
unsigned char ADDRESS_P2[nRF_ADR_LENGTH] = {0xB3,0xB4,0xB5,0xB6,0x03};
unsigned char ADDRESS_P3[nRF_ADR_LENGTH] = {0xB3,0xB4,0xB5,0xB6,0x04};
unsigned char ADDRESS_P4[nRF_ADR_LENGTH] = {0xB3,0xB4,0xB5,0xB6,0x05};
unsigned char ADDRESS_P5[nRF_ADR_LENGTH] = {0xB3,0xB4,0xB5,0xB6,0x06};

// Predefine TX payload packet..
//char TX_PAYLOAD[nRF_TX_PLOAD_WIDTH] = "Text message";                               //unsigned

unsigned char TX_pload[nRF_TX_PLOAD_MAX_WIDTH] = "Text message";                              // TX payload buffer
unsigned char RX_pload[nRF_RX_PLOAD_MAX_WIDTH];                              // RX payload buffer

//status bytes
unsigned char ucCom_Mode = nRF_IDLE_MODE;                                    // Communication mode on/off

unsigned char ucLinkStat, ucLastStat;

unsigned int uiRX_info;                                                  // store RX_FIFO pipe number and pload width
unsigned int ucRX_info;

unsigned char ucTry_Ctr;                                                 // Try Counter variable

// Variable that indicates nRF24L01 interrupt source
unsigned char ucIRQ_Source;

/**************************************************************************************************
*  Function: nRF_SPI_RW
*
*  Description:
*  Writes one byte to nRF24L01, and return the byte read
*  from nRF24L01 during write, according to SPI protocol
*
*  In/Out parameters:
*  In: 'byte', current byte to be written
*  Out: 'SPI'
**************************************************************************************************/
unsigned char nRF_SPI_RW(unsigned char byte)
{
  return(SPI_Read(byte));                        // Perform HW SPI operation
}

/**************************************************************************************************
//  Function: nRF_SPI_Read
//
//  Description:
//  Read one byte from nRF24L01 register, 'reg'
//
//  In/Out parameters:
//  In: reg, register to read
//  Out: return reg_val, register value.
**************************************************************************************************/
unsigned char nRF_SPI_Read(unsigned char reg)
{
  unsigned char reg_val;

  nRF_CS = 0;                                     // CSN low, initialize SPI communication...
  nRF_SPI_RW(reg);                                // Select register to read from..
  reg_val = nRF_SPI_RW(0);                        // ..then read registervalue
  nRF_CS = 1;                                     // CSN high, terminate SPI communication

  return(reg_val);                                // return register value
}

/**************************************************************************************************
//  Function: nRF_SPI_RW_Reg
//
//  Description:
//  Writes value 'value' to register 'reg'
//
//  In/Out parameters:
//  In: 'reg' register to write value 'value' to.
//  Return status byte.
**************************************************************************************************/
unsigned char nRF_SPI_RW_Reg(unsigned char reg, unsigned char value)
{
  unsigned char status;

  nRF_CS = 0;                                     // CSN low, init SPI transaction
  status = nRF_SPI_RW(reg);                       // select register
  nRF_SPI_RW(value);                              // ..and write value to it..
  nRF_CS = 1;                                     // CSN high again

  return(status);                                 // return nRF24L01 status byte
}

/**************************************************************************************************
//  Function: nRF_SPI_RW_Reg_IRQ
//
//  Description:
//  Writes value 'value' to register 'reg'
//
//  In/Out parameters:
//  In: 'reg' register to write value 'value' to.
//  Return status byte.
**************************************************************************************************/
unsigned char nRF_SPI_RW_Reg_IRQ(unsigned char reg, unsigned char value)
{
  unsigned char status;

  nRF_CS = 0;                                     // CSN low, init SPI transaction

  status = SPI_Read(reg);
  reg = SPI_Read(value);

  nRF_CS = 1;                                     // CSN high again

  return(status);                                 // return nRF24L01 status byte
}

/**************************************************************************************************
//  Function: nRF_SPI_Write_Buf
//
//  Description:
//  Writes contents of buffer '*pBuf' to nRF24L01
//  Typically used to write TX payload, Rx/Tx address
//
//  In/Out parameters:
//  In: register 'reg' to write, buffer '*pBuf*' contains
//  data to be written and buffer size 'buf_size' is #of
//  bytes to be written
//  Out: return nRF24L01 status byte.
**************************************************************************************************/
unsigned char nRF_SPI_Write_Buf(unsigned char reg, unsigned char *pBuf, unsigned char bytes)
{
  unsigned char status, byte_ctr;

  nRF_CS = 0;                                     // Set CSN low, init SPI tranaction
  status = nRF_SPI_RW(reg);                       // Select register to write to and read status byte

  for(byte_ctr=0; byte_ctr<bytes; byte_ctr++)     // then write all byte in buffer(*pBuf)
  {
    nRF_SPI_RW(*pBuf++);
  }

  nRF_CS = 1;                                     // Set CSN high again

  return(status);                                 // return nRF24L01 status byte
}

/**************************************************************************************************
//  Function: nRF_SPI_Read_Buf
//
//  Description:
//  Reads 'bytes' #of bytes from register 'reg'
//  Typically used to read RX payload, Rx/Tx address
//
//  In/Out parameters:
//  In: 'reg', register to read from, '*pBuf' are buffer
//  the read bytes are stored to and 'bytes' are #of bytes
//  to read.
//  Out: return nRF24L01 status byte.
**************************************************************************************************/
unsigned char nRF_SPI_Read_Buf(unsigned char reg, unsigned char *pBuf, unsigned char bytes)
{
  unsigned char status, byte_ctr;

  nRF_CS = 0;                                     // Set CSN low, init SPI tranaction
  status = nRF_SPI_RW(reg);                       // Select register to write to and read status byte

  for(byte_ctr=0;byte_ctr<bytes;byte_ctr++)       // Perform SPI_RW to read byte from nRF24L01
  {
    pBuf[byte_ctr] = nRF_SPI_RW(0);
  }

  nRF_CS = 1;                                     // Set CSN high again

  return(status);                                 // return nRF24L01 status byte
}

/**************************************************************************************************
* Function: nRF_CE_Pin
*
* Description:
* Switch CE pin
* In/Out parameters:
* In: 'action' current state
* Out: none
**************************************************************************************************/
void nRF_CE_Pin(unsigned char action)    // CE pin high, low or pulse..
{
  switch(action)
  {
    case nRF_CE_LOW:                     // action == 0, CE low
      nRF_CE = 0;
    break;

    case nRF_CE_HIGH:                    // action == 1, CE high
      nRF_CE = 1;
    break;

    case nRF_CE_PULSE:                   // action == 2, CE pulse (10탎)
      nRF_CE = 1;                    // Set CE pin high
      TIM2_CR1.CEN = 1;             // Enable timer
    break;
  }
}

/**************************************************************************************************
* Interrupt from nRF24L01+
**************************************************************************************************/
void nRF24L01_IRQ(void)
{
  unsigned char temp;

  DisableInterrupts();
  temp = nRF_SPI_RW_Reg_IRQ(nRF_MASK_IRQ_FLAGS, nRF_WRITE_REG + nRF_STATUS);

  switch(temp & nRF_MASK_IRQ_FLAGS)
  {
    case nRF_MAX_RT:
      ucIRQ_Source = nRF_MAX_RT;              // Max Retries
    break;
    case nRF_TX_DS:                           // TX data sent
      ucIRQ_Source = nRF_TX_DS;
    break;
    case nRF_RX_DR:                           // RX data received
      ucIRQ_Source = nRF_RX_DR;
    break;
  }
  EnableInterrupts();
}

/**************************************************************************************************
* TIMER 2 Interrupt handler
**************************************************************************************************/
void TIMER2_IRQ(void)
{
  TIM2_CR1.CEN = 0;       // Disable Timer2
  nRF_CE = 0;
}

/**************************************************************************************************
*  Function: nRF_Clear_IRQ
*
*  Description:
*  Clear nRF24L01 IRQ flag(s).
*
*  In/Out parameters:
*  In: IRQ Flag
*  Out: Reg state
**************************************************************************************************/
unsigned char nRF_Clear_IRQ(unsigned char irq_flag)
{
  return nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_STATUS, irq_flag);
}

/**************************************************************************************************
*  Function: nRF_Flush_TX
*
*  Description:
*  Flush TX FIFO
*
*  In/Out parameters:
*  In: none
*  Out: none
**************************************************************************************************/
void nRF_Flush_TX(void)
{
  nRF_SPI_RW_Reg(nRF_FLUSH_TX,0);
}

/**************************************************************************************************
*  Function: nRF_Flush_RX
*
*  Description:
*  Flush RX FIFO
*
*  In/Out parameters:
*  In: none
*  Out: none
**************************************************************************************************/
void nRF_Flush_RX(void)
{
  nRF_SPI_RW_Reg(nRF_FLUSH_RX,0);
}

/**************************************************************************************************
*  Function: nRF_RD_RX_PW_n
*
*  Description:
*  Get current RX payload width for pipe.n
*
*  In/Out parameters:
*  In: pipe.n
*  Out: RX payload
**************************************************************************************************/
unsigned char nRF_RD_RX_PW_n(unsigned char pipe)
{
  return nRF_SPI_Read(nRF_RX_PW_P0 + pipe);
}

/**************************************************************************************************
*  Function: nRF_Get_Status
*
*  Description:
*  Read status byte
*
*  In/Out parameters:
*  In: none
*  Out: Status result
**************************************************************************************************/
unsigned char nRF_Get_Status(void)
{
  return nRF_SPI_Read(nRF_STATUS);
}

/**************************************************************************************************
*  Function: nRF_Get_Current_Pipenum
*
*  Description:
*  Get current pipe.n
*
*  In/Out parameters:
*  In: none
*  Out: pipe.n
**************************************************************************************************/
unsigned char nRF_Get_Current_Pipenum(void)
{
  return ((nRF_Get_Status() & nRF_RX_P_NO) >> 1);
}

/**************************************************************************************************
*  Function: nRF_Get_FIFO
*
*  Description:
*  Read FIFO_STATUS register
*
*  In/Out parameters:
*  In: none
*  Out: Status of FIFO register
**************************************************************************************************/
unsigned char nRF_Get_FIFO(void)
{
  return nRF_SPI_Read(nRF_FIFO_STATUS);
}

/**************************************************************************************************
*  Function: nRF_Read_RX_Pload
*
*  Description:
*  Read current pipe#'s RX payload
*
*  In/Out parameters:
*  In: buffer for pipe's payload
*  Out: pipe# & pipe#.plWidth
**************************************************************************************************/
unsigned int nRF_Read_RX_Pload(unsigned char *pBuf)
{
  unsigned char plWidth, pipe;
  plWidth = nRF_RD_RX_PW_n(pipe = nRF_Get_Current_Pipenum());   // Read current pipe's payload width
  nRF_SPI_Read_Buf(nRF_RD_RX_PLOAD, pBuf, plWidth);             // Then get RX data

  return ((pipe << 8) + plWidth);                               // return pipe# & pipe#.plWidth
}

/**************************************************************************************************
*  Function: nRF_Init
*
*  Description:
*  Set I/O pins
*
*  In/Out parameters:
*  In: none
*  Out: none
**************************************************************************************************/
void nRF_Init()
{
  asm {
        MOVW  R0, #lo_addr(nRF_CS)
        MOVT  R0, #hi_addr(nRF_CS)
        MOV   R1, #1
        LSL   R1, R1, #bitPos(nRF_CS)
  }
  GPIO_Digital_Output(R0, R1);
  
  asm {
        MOVW R0, #lo_addr(nRF_CE)
        MOVT R0, #hi_addr(nRF_CE)
        MOV  R1, #1
        LSL  R1, R1, #bitPos(nRF_CE)
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


/**************************************************************************************************
*  Function: nRF_TX_Mode_Init_Advanced
*
*  Description:
*  This function initializes one nRF24L01 device to TX mode, set TX address,
*  set RX address for auto.ack, fill TX payload, select RF channel, datarate & TX pwr.
*  PWR_UP is set, CRC(2 bytes) is enabled, & PRIM:TX.
*
*  ToDo: One high pulse(>10탎) on CE will now send this
*  packet and expext an acknowledgment from the RX device.
*
*  In/Out parameters:
*  In: 'dataRate' value dor data rate, 'autoRetransmitDelay' how much time to wait to resend package,
*      'autoRetransmitCount' how many times to retransmit the package after failure, 'outputPower'
*  Out: none
**************************************************************************************************/
void nRF_TX_Mode_Init_Advanced(unsigned char dataRate, unsigned char autoRetransmitDelay, unsigned char autoRetransmitCount,
                      unsigned char outputPower, unsigned char channel)
{
  unsigned char setupRetr, rfSetup;

  //nRF_Init();

  setupRetr = autoRetransmitDelay + autoRetransmitCount;
  rfSetup   = dataRate + outputPower + 1;// + 0x20;
  ucCom_Mode = nRF_TX_MODE;
  
  DisableInterrupts();

  nRF_CE_Pin(nRF_CE_LOW);
  
  nRF_Flush_TX();
  nRF_Flush_RX();
  
  nRF_Clear_IRQ(nRF_MASK_IRQ_FLAGS);                           // Clear interrupts
  ucIRQ_Source = nRF_IDLE;
  ucLastStat = ucLinkStat = nRF_LINK_ESTABLISH;
  
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_EN_AA, 0x3F);             // Enable Auto.Ack:Pipes 0-5
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_EN_RXADDR, 0x3F);         // Enable Pipes 0-5
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_SETUP_RETR, setupRetr);   // Set auto retransmit delay and count
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RF_CH, channel);          // select RF channel
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RF_SETUP, rfSetup);
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_CONFIG, 0x0E);
  
  nRF_SPI_Write_Buf(nRF_WRITE_REG + nRF_TX_ADDR, &ADDRESS_P0, sizeof(ADDRESS_P0));    // Writes TX_Address to nRF24L01
  nRF_SPI_Write_Buf(nRF_WRITE_REG + nRF_RX_ADDR_P0, &ADDRESS_P0, sizeof(ADDRESS_P0)); // RX_Addr0 same as TX_Adr for Auto.Ack

  Delay_ms(10);

  EnableInterrupts();
}

/**************************************************************************************************
*  Function: nRF_TX_Mode_Init
*
*  Description:
*  This function initializes one nRF24L01 device to TX mode, set TX address,
*  set RX address for auto.ack, fill TX payload, select RF channel, datarate & TX pwr.
*  PWR_UP is set, CRC(2 bytes) is enabled, & PRIM:TX.
*
*  ToDo: One high pulse(>10탎) on CE will now send this
*  packet and expext an acknowledgment from the RX device.
*
*  In/Out parameters:
*  In: number of channel. The channel occupies a bandwidth of 1MHz at 1Mbps and 2MHz at 2Mbps.
*  nRF24L01 can operate on frequencies from 2.400GHz to 2.525GHz.
*  Out: none
**************************************************************************************************/
void nRF_TX_Mode_Init(unsigned char channel)
{
  nRF_TX_Mode_Init_Advanced(nRF_DATA_RATE_1Mbps, nRF_AUTO_RETRANSMIT_DELAY_4000us, nRF_AUTO_RETRANSMIT_COUNT_05, nRF_OUTPUT_POWER_0dBm, channel);
}

/**************************************************************************************************
*  Function: nRF_RX_Mode_Init_Advanced
*
*  Description:
*  This function initializes one nRF24L01 device to RX Mode, set RX address,
*  writes RX payload width, select RF channel, datarate & LNA HCURR.
*  After init, CE is toggled high, which means that this device is now
*  ready to receive a datapacket.
*
*  In/Out parameters:
*  In: 'dataRate' | 'outputPower' | 'channel'
*  Out: none
**************************************************************************************************/
void nRF_RX_Mode_Init_Advanced(unsigned char dataRate, unsigned char outputPower, unsigned char channel)
{
  unsigned char rfSetup;

  //nRF_Init();

  rfSetup   = dataRate + outputPower + 1;// + 0x20;
  
  DisableInterrupts();

  ucCom_Mode = nRF_RX_MODE;
  nRF_CE_Pin(nRF_CE_LOW);
  
  nRF_Flush_TX();
  nRF_Flush_RX();
  
  nRF_Clear_IRQ(nRF_MASK_IRQ_FLAGS);
  ucIRQ_Source = nRF_IDLE;
  
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_EN_AA, 0x3F);             // Enable Auto.Ack:Pipes 0-5
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_EN_RXADDR, 0x3F);         // Enable Pipes 0-5
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RF_CH, channel);          // select RF channel
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RF_SETUP, rfSetup);
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_CONFIG, 0x0F);
  
  nRF_SPI_Write_Buf(nRF_WRITE_REG + nRF_RX_ADDR_P0, &ADDRESS_P0, sizeof(ADDRESS_P0)); // Use the same address on the RX device as the TX device
  nRF_SPI_Write_Buf(nRF_WRITE_REG + nRF_RX_ADDR_P1, &ADDRESS_P1, sizeof(ADDRESS_P1));

  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_ADDR_P2, 0x03);
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_ADDR_P3, 0x04);
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_ADDR_P4, 0x05);
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_ADDR_P5, 0x06);

  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P0, nRF_RX_PLOAD_WIDTH); // Select same RX payload width as TX Payload width
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P1, nRF_RX_PLOAD_WIDTH);
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P2, nRF_RX_PLOAD_WIDTH);
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P3, nRF_RX_PLOAD_WIDTH);
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P4, nRF_RX_PLOAD_WIDTH);
  nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P5, nRF_RX_PLOAD_WIDTH);

  Delay_ms(200);

  TIM2_SR.UIF = 0;
  TIM2_CR1.CEN = 0;

  EnableInterrupts();

  nRF_CE_Pin(nRF_CE_HIGH);                                      // Set CE pin high to enable RX device
}

/**************************************************************************************************
*  Function: nRF_RX_Mode_Init
*
*  Description:
*  Default initialisation of nRF chip
*
*  In/Out parameters:
*  In: number of channel. The channel occupies a bandwidth of 1MHz at 1Mbps and 2MHz at 2Mbps. 
*  nRF24L01 can operate on frequencies from 2.400GHz to 2.525GHz.
*  Out: none
**************************************************************************************************/
void nRF_RX_Mode_Init(unsigned char channel)
{
  nRF_RX_Mode_Init_Advanced(nRF_DATA_RATE_1Mbps, nRF_OUTPUT_POWER_0dBm, channel);
}

/**************************************************************************************************
*  Function: nRF_Process
*
*  Description:
*  Handle RF communication and set the status
*
*  In/Out parameters:
*  In: none
*  Out: none
**************************************************************************************************/
void nRF_Process(TnRF_Status *nRFstatus)
{
  nRFstatus->_status = nRF_IDLE;
  nRFstatus->_pipe   = 0;
  nRFstatus->_plos_cnt = 0;
  nRFstatus->_arc_cnt  = 0;
  nRFstatus->_pBuff    = 0;
  //if IDLE state return
  if(ucIRQ_Source == nRF_IDLE)
    return;

  DisableInterrupts();
  
  switch(ucIRQ_Source)
  {
    case nRF_RX_DR:
    {
      do
      {
        uiRX_info = nRF_Read_RX_Pload(RX_pload);
        
      }while(!(nRF_Get_FIFO() & nRF_RX_EMPTY));
      
      ucLinkStat = nRF_LINK_ESTABLISH;                                  // stavi da je uspostavljen link
      nRF_Clear_IRQ(nRF_MASK_RX_DR_FLAG);                               // resetuj interrupt flag kada se primi paket
    
      nRFstatus->_status = ucIRQ_Source;
      nRFstatus->_pipe   = uiRX_info;
      nRFstatus->_pBuff  = &RX_pload;
    
    
      break;
    }
    case nRF_TX_DS:
    {
      //link uspostavljen.
      ucLinkStat = nRF_LINK_ESTABLISH;
      nRF_Clear_IRQ(nRF_MASK_TX_DS_FLAG);       // Interrupt ako je paket poslat
      nRF_Clear_IRQ(nRF_MASK_MAX_RT_FLAG);      // Interrupt broj retransmisija paketa
      
      //procitaj status TX-a
      ucRX_info = nRF_SPI_RW(nRF_READ_REG + nRF_OBSERVE_TX);
      
      nRFstatus->_status = nRF_TX_DS;
      nRFstatus->_arc_cnt = (ucRX_info & 0x0F);
      nRFstatus->_plos_cnt = (ucRX_info & 0xF0) >> 4;

      break;
    }
    case nRF_MAX_RT:
    {
      if(ucTry_Ctr++ == 3)
        ucLinkStat = nRF_STOP;

      ucRX_info = nRF_SPI_Read(nRF_READ_REG + nRF_OBSERVE_TX);
      
      nRFstatus->_status = nRF_MAX_RT;
      nRFstatus->_arc_cnt = (ucRX_info & 0x0F);
      nRFstatus->_plos_cnt = (ucRX_info & 0xF0)>>4;
    
      switch(ucLinkStat)
      {
        case nRF_LINK_ESTABLISH:                         // max retransmitt, but had comm on last channel
        nRF_Clear_IRQ(nRF_MASK_MAX_RT_FLAG);             // clear MAX_RT flag (nRF24L01)
        ucLinkStat = nRF_LINK_LOSS;                      // change LinkStat state to LINK_LOSS, wait for new timeout
        break;

        case nRF_LINK_LOSS:                              // still not connected, run channel scan..
        nRF_Clear_IRQ(nRF_MASK_MAX_RT_FLAG);             // clear MAX_RT flag (nRF24L01)
        nRF_CE_Pin(nRF_CE_PULSE);                            // retransmitt packet
        ucLinkStat = nRF_LINK_RELOST;                    // change LinkStat state to LINK_RELOST
        break;

        case nRF_LINK_RELOST:
        nRF_Clear_IRQ(nRF_MASK_MAX_RT_FLAG);             // clear MAX_RT flag (nRF24L01)
        nRF_CE_Pin(nRF_CE_PULSE);                            // retransmitt packet
        ucLinkStat = nRF_LINK_RELOST;
        break;

        case nRF_STOP:
          nRF_Clear_IRQ(nRF_MASK_MAX_RT_FLAG);           // clear MAX_RT flag
          ucLinkStat = nRF_LINK_ESTABLISH;               // stop retransmission
        break;
      }
      
      break;
    }
    default:
    {
      nRF_Clear_IRQ(nRF_MASK_IRQ_FLAGS);

      break;
    }
  }
  ucIRQ_Source = nRF_IDLE;
  EnableInterrupts();                            // Enable global interrupt
}

/**************************************************************************************************
*  Function: nRF_Write_TX_Pload
*
*  Description:
*  Write TX payload.
*
*  In/Out parameters:
*  In: payload in *pBuf & #of bytes = plWidth
*  Out: none
**************************************************************************************************/
void nRF_Write_TX_Pload(unsigned char *pBuf, unsigned char plWidth)
{
  nRF_SPI_Write_Buf(nRF_WR_TX_PLOAD, pBuf, plWidth);
}

/**************************************************************************************************
* Function: nRF_Send_Packet
*
* Description: Prepare and send data into TX buffer and set value for CE pin. Note: check nRF_Process
*              to see if the packet is sent (wait for response from receiver).
*
* In/Out parameters:
* In: none
* Out: '0' - incorrect mode or state is not IDLE
*      '1' - data sent to TX buffer
**************************************************************************************************/
unsigned char nRF_Send_Packet()                          // Send one data packet
{
  if ((ucCom_Mode == nRF_RX_MODE) || (ucIRQ_Source != nRF_IDLE)) //ubacen IDLE
    return 0;

  nRF_Write_TX_Pload(&TX_pload, nRF_TX_PLOAD_WIDTH);     // Write new TX payload
  nRF_CE_Pin(nRF_CE_PULSE);                                  // Enable CE pulse, 12탎
  ucTry_Ctr = 0;                                     // Reset Try_Ctr before nex transmitt..

  return 1;
}

/**************************************************************************************************
* Receive message
**************************************************************************************************/
unsigned char nRF_Receive_Packet()
{
  if((ucCom_Mode == nRF_TX_MODE) || (ucIRQ_Source == nRF_IDLE))
    return 0;
    
  return 1;
}

/**************************************************************************************************
* End of File
**************************************************************************************************/