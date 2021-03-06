/*******************************************************************************
 * Project name:
     Omnibus example for mikromedia + for STM32
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20130411:
       - initial release (JK);
 * Description:
     This project allow user to test various on board features of the
     mikromedia + for STM board.
     
 * Test configuration:
     MCU:             STM32F407ZG
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf
     Dev.Board:       mikromedia + for STM : ac:mikromedia_plus_for_STM
                      http://www.mikroe.com/mikromedia/plus/stm32/
     Oscillator:      HS-PLL 150.0000 MHz, 25.0000 MHz Crystal
     Ext. Modules:    mikromedia + for STm Shield : ac:mikromedia_plus_STM_shield
                      http://www.mikroe.com/mikromedia/plus/shields/stm32/
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
                      VisualTFT
                      http://www.mikroe.com/visualtft/
                      
 * NOTES:
     - VisualTFT uses following font for example
       Open sans which can be downloaded from here:
       http://www.fontsquirrel.com/fonts/open-sans
 
     - Accel example reads accel values of all three axes and displays them as
       sliding graph on TFT.
       
     - Paint example is great way to test touch panel and touch panel controller
       on the board. Simple draw lines and shapes over TFT. Board had STMPE610
       touch panel controller connected to I2C lines on microcontroller.
     
     - Tic Tac Toe game demonstration. Play simple game with your friend. User
       choose whether the game will be played on one board on two over RF
       communication. For this nRF24L01 is used
     
     - MP3 player example demonstrates usage of mp3 codec chip and SD card. Program
       uses FAT32 file system and appropriate library can be downloaded from libstock:
       http://www.libstock.com/projects/view/108/fat32-library
       User can navigate through folders and find desired mp3 or wav file and play it.
       
       IMPORTANT: FAT32 library supports only 8.3 file name format. So all folders and
         audio files have to be in short file name format.
         
     - Sensors example reads light sensor and if the light intensity is low it dims 
       background light. Also temperature Sensors displays measured temperature
       
     - RTC example is used to set Real Time Clock and Calendar. Board has back up
       battery and it will keep time when power is down. Also user can ajust time
       by setting simple roller wheel, or synhronize with GMT time by pressing sync
       Button. For this purpose mikromedia + for STM Shield is used and our
       Net Ethernet library which is available on libstock:
       http://www.libstock.com/projects/view/107/network-ethernet-library
       
     - Slide Show example demonstrates Image scrolling. Images are soterd on SD card
       as resource file generated by VisualTFT. scrolling is done by swiping over 
       the images or by pressing up or down arrow.

     - RGB Light example demonstrates usage of RGB LED diode. It displays color
       palete on TFT and where ever user touch the Screen it converts it to RGB (5-6-5)
       and sets RGB diode in the same color.
       
*******************************************************************************/

#include "mikromedia_STM32plus_objects.h"
#include "__Lib_nRF24L01.h"

// external declarations
void Run_Example();
void RTC_Init();
void Init_SDIO();
char Init_FAT();
void Init_GPIO();
void doTicTacToeISR();
void Timer4_SoftPWM_ISR();

char TTT_flag = 0;
extern unsigned int TicTacToe_seconds_cnt;

//******************************************************************************
// ISR
//******************************************************************************

//******************************************************************************
// Timer interrupt - Timer4 (62.5us)
// Used to drive soft PWM on RGB diode
//******************************************************************************
void Timer4_interrupt() iv IVT_INT_TIM4{
  TIM4_SR.UIF = 0;
  //Enter your code here
  Timer4_SoftPWM_ISR();
}

//******************************************************************************
// Timer interrupt - Timer5 (16us)
// Used for nRF
//******************************************************************************
void Timer2_interrupt() iv IVT_INT_TIM2 ics ICS_AUTO
{
  TIM2_SR.UIF = 0;
  //Enter your code here
  TIM2_CR1.CEN = 0;
  TIMER2_IRQ();
  TIM2_CR1.CEN = 0;
}

//******************************************************************************
// External interrupt - EXTI10 (PG10)
// Used for nRF
//******************************************************************************
void ExtInt() iv IVT_INT_EXTI15_10 ics ICS_AUTO
{
  EXTI_PR.B10 = 1;                      // clear flag
  nRF24L01_IRQ();
}

//******************************************************************************
// Timer interrupt - Timer5 (1s)
// Used for TicTacToe
//******************************************************************************
extern sfr sbit LED_B;
void Timer5_interrupt() iv IVT_INT_TIM5 {
  TIM5_SR.UIF = 0;
  //Enter your code here
  TicTacToe_seconds_cnt ++;
  TTT_flag = 1;
  //Net_Ethernet_Intern_UserTimerSec++ ;
}

//******************************************************************************
// Main function
//******************************************************************************
void main() {
  Start_TP();

  Init_GPIO();
  Init_SDIO();
  Init_FAT();
  RTC_Init();

  while (1) {
    DisableInterrupts();
    Check_TP();
    EnableInterrupts();
    Run_Example();
  }
}
