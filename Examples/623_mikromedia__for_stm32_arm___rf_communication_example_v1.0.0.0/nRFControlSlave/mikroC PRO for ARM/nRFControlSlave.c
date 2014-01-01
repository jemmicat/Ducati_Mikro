#include "__Lib_nRF24L01.h"
#include "nRF24L01_defs.h"
#include "led_protocol.h"

/*
 * Project name:
     nRFControlSlave
 * Test configuration:
     MCU:             STM32F107VC
     Dev.Board:       EasyMX PRO v7 for STM32 ARM
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      72.0 MHz
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
                      
     Note: Turn off all leds except leds on port E/H.
 */


/*******************************************************************************
* nRF24L01+ connections
*******************************************************************************/
sbit nRF_CS at GPIOD_ODR.B13;
sbit nRF_CE at GPIOC_ODR.B2;
sbit nRF_IRQ at GPIOD_IDR.B10;

TnRF_Status nRFStatus;
TRF_Config rfConfig;

unsigned char rfState;

TLed leds[8];

//Initialization of Leds data
void InitLeds(void) {
  unsigned char i;
  
  for (i = 0; i < 8; i++)
  {
    leds[i]._state = 0;
    leds[i]._no    = i;
  }
}
//Initialization of Timer 2
void InitTimer2(){
  // Initialize TIMER2 module for CE pulse
  RCC_APB1ENR.TIM2EN = 1;       // Enable clock gating for timer module 2
  TIM2_CR1.CEN = 0;             // Disable timer
  TIM2_PSC = 0;                 // Set timer prescaler.
  TIM2_ARR = 1152;
  NVIC_IntEnable(IVT_INT_TIM2); // Enable timer interrupt
  TIM2_DIER.UIE = 1;            // Update interrupt enable

  TIM2_CR1.CEN = 1;             // Start timer 2
}
//Initialization of External Interrupt
void InitExt(){
  RCC_APB2ENR.AFIOEN = 1;              // Enable clock for alternate pin functions
  AFIO_EXTICR3 = 0x0300;               // PD10 as External interrupt
  EXTI_RTSR = 0x00000000;              // Set interrupt on Rising edge (none)
  EXTI_FTSR = 0x00000400;              // Set Interrupt on Falling edge (PD10)
  EXTI_IMR |= 0x00000400;              // Set mask

  NVIC_IntEnable(IVT_INT_EXTI15_10);   // Enable External interrupt
}
//Interrupt function for Timer 2
void Timer2_interrupt() iv IVT_INT_TIM2 ics ICS_AUTO {
  TIM2_SR.UIF = 0;
  TIM2_CR1.CEN = 0;
  TIMER2_IRQ();
  TIM2_CR1.CEN = 0;                    // stop timer 2
}
//Interrupt function for External interrupt
void GPIOInt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
  EXTI_PR.B10 = 1;                      // clear flag
  nRF24L01_IRQ();
}

void InitRF()
{
  nRF_CE = 0;
  nRF_CS = 1;

  //Initialize timer and external interrupt
  InitTimer2();
  InitExt();

  //Initialize SPI over C port
  SPI3_Init_Advanced(_SPI_FPCLK_DIV16, _SPI_MASTER  | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI3_PC10_11_12);
}

void SetVal(unsigned char off, unsigned char *val)
{
  if(off == LED_OFF)
  {
    *val = 0;
  }
  else
  {
    *val = 1;
  }
}
//Command used to control all leds on port (On/Off state)
void CmdAll(unsigned char off)
{
  unsigned char val, i;
  val = 0;
  SetVal(off, &val);
  
  for(i = 0; i < 8; i++)
  {
    leds[i]._state = val;
    
    if(val == LED_ON)
    {
      GPIOE_ODR |= (val << i) << 8;
    }
    else
    {
      GPIOE_ODR &= (val << i) << 8;
    }
  }
}
//Command used to control leds in a column.
void CmdColumn(unsigned char off)
{
  unsigned char val, i;
  val = 0;
  SetVal(off, &val);

  if((RX_pload[0] & 0x0F) == LED_CLN_01)
  {
    if(val == 1)
      GPIOE_ODR |= ((val << 4) | (val << 5) | (val << 6) | (val << 7)) << 8;
    else
      GPIOE_ODR &= 0x0F00;
      
    for(i = 4; i < 8; i++)
    {
      leds[i]._state = val;
    }
  }
  else
  {
    if(val == 1)
      GPIOE_ODR |= (val | (val << 1) | (val << 2) | (val << 3)) << 8;
    else
      GPIOE_ODR &= 0xF000;
      
    for(i = 0; i < 4; i++)
    {
      leds[i]._state = val;
    }
  }
}

//Command used to control all leds in a row.
void CmdRow(unsigned char off)
{
  unsigned char val, l1, l2;
  unsigned int tmp;
  val = 0;
  
  SetVal(off, &val);
  
  l1 = 7 - (RX_pload[0] & 0x0F);
  l2 = 3 - (RX_pload[0] & 0x0F);
  
  leds[l1]._state = val;
  leds[l2]._state = val;
  
  tmp = ((1 << l1) | (1 << l2)) << 8;
  
  if(val == 1)
    GPIOE_ODR |= ((val << l1) | (val << l2)) << 8;
  else
    GPIOE_ODR &= ~tmp;
}

//Command used to control a single Led.
void CmdSingleLed(unsigned char off)
{
  unsigned char val;
  unsigned int tmp;
  
  val = 0;
  SetVal(off, &val);
  
  leds[((RX_pload[0] & 0x0F) - 1)]._state = val;
  
  tmp = (1 << (RX_pload[0] & 0x0F) - 1) << 8;
  
  if(val == 0)
    GPIOE_ODR &= ~tmp;
  else
    GPIOE_ODR |= tmp;
}

void ProcessCmd(unsigned char *cmd)
{
  //Get command bits from RX buffer.
  switch((RX_pload[0] & 0xF0))
  {
    case LED_CMD_ALL_ON :
    {
      CmdAll(LED_ON); break;
    }
    
    case LED_CMD_SINGLE_ON:
    {
      CmdSingleLed(LED_ON);
      break;
    }
    
    case LED_CMD_ROW_ON:
    {
      CmdRow(LED_ON);
      break;
    }
    
    case LED_CMD_COLUMN_ON:
    {
      CmdColumn(LED_ON);
      break;
    }
    
    case LED_CMD_ALL_OFF:
    {
      CmdAll(LED_OFF); break;
    }
    
    case LED_CMD_SINGLE_OFF:
    {
      CmdSingleLed(LED_OFF);
      break;
    }
    
    case LED_CMD_ROW_OFF:
    {
      CmdRow(LED_OFF);
      break;
    }
    
    case LED_CMD_COLUMN_OFF:
    {
      CmdColumn(LED_OFF);
      break;
    }
  }
}

void main() {
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH); // Set PORTE as digital output
  GPIOE_ODR = 0;
  
  InitLeds();

  //nRF Config Settings
  rfConfig.autoTransmitDelay = nRF_AUTO_RETRANSMIT_DELAY_4000us; //250 + 15 * 250 = 4000us
  rfConfig.autoTransmitCount = nRF_AUTO_RETRANSMIT_COUNT_05;
  rfConfig.channel           = 64;
  rfConfig.outputPower       = nRF_OUTPUT_POWER_0dBm;
  rfConfig.dataRate          = nRF_DATA_RATE_1Mbps;

  nRF_Init();
  InitRF();
  Delay_ms(100);

  rfState = RF_STOP;
  
  nRF_RX_Mode_Init_Advanced(rfConfig.dataRate, rfConfig.outputPower, rfConfig.channel);

  while (1) {
    if(nRF_Receive_Packet())
    {
      nRF_Process(&nRFStatus);
      if(nRFStatus._status == nRF_RX_DR)
      {
          ProcessCmd(RX_pload);
      }
    }
  }
}