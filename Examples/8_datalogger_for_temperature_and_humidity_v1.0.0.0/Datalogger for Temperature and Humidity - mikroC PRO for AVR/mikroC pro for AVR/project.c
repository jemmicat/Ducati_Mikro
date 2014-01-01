/*
 * Project name
     SHT data logger
 * Copyright
     (c) mikroElektronika, 2011.
 * Revision History
     201100713 (JK):
       - initial release
 * Description
       This example demonstrates how to measure temperature and humidity with the SHT1X sensor. It uses Real Time Clock module driven by external 32768 Hz oscilator,
       in the way that each second it takes a new sample of temperature and humidity. The data is stored in microSD card by creating new file for each day,
       named in the format "YYYYMMDD.txt" . Every txt file is in CSV (comma-separated values) format and populated with the information:
           time (YYYY-MM-DD HH:MM:SS), Temperature, Humidity (two decimal places).
       Display shows current date and time, temperature and humidity and a graph of previously measured values.
  * Test configuration:
     MCU:             ATXMEGA 128A1
                        http://www.atmel.com/dyn/resources/prod_documents/doc8067.pdf
     Dev.Board:       mikroMedia for XMEGA
                        http://www.mikroe.com/eng/products/view/688/mikromedia-for-xmega/
                        ac:mikroMMB_for_xmega
     Oscillator:      32.000 MHz
     Ext. Modules:    SHT senzor
                        http://www.mikroe.com/eng/products/view/368/sht1x-proto-board/
                        ac:sht_sensor
                      Battery Boost Shield
                        http://www.mikroe.com/eng/products/view/681/battery-boost-shield/
                        ac:battery_boost
                      microSD card
                        http://www.mikroe.com/eng/products/view/670/microsd-card-1gb-with-adapters/
                        ac:mikroSD
     SW:              mikroC PRO for AVR
                        http://www.mikroe.com/eng/products/view/228/mikroc-pro-for-avr/
 * NOTES:
     - SHT sensor must be connected to MMB Xmega board.
     - Pay attention on sensor connection to the board, see image below
     - mikroSD card must be formated as FAT16
 * OPERATION:
     - Data logger measure Temperature an Humidity every second then logs the data on a graph and into a CSV file on MMC card.
     - The name of the file is in format YYYYMMDD.txt
     - Fields in CSV file are separated with the comma symbol, for example:
       2011-06-25 14:38:11, 23.45C, 67.67%
*/


const char _RTC_INTERNAL_CLOCK = 0;
const char _RTC_EXTERNAL_CLOCK = 1;

void Set_First_Screen();
void Read_SHT1X();
void RTC16_Start();
void RTC16_Init(unsigned int period, char IntExt, int UseInterupt);
void Set_My_Screen();
void Date_Time();
void Set_Initial_Date();
void Refresh_Screen();
void New_Day();
void New_measurement(long int temp, long int humi);

// SHT11 connections
sbit SDA_Out_ at PORTD_OUT.B0;                                              // Serial data pin
sbit SCL_     at PORTD_OUT.B1;                                              // Serial clock pin
sbit SDA_In_  at PORTD_IN.B0;

sbit SDA_Direction at PORTD_DIR.b0;                                         // Serial data direction pin
sbit SCL_Direction at PORTD_DIR.b1;                                         // Serial clock direction pin
// End SHT11 connections

// TFT module connections
char TFT_DataPort at PORTK_OUT;
char TFT_DataPort_Direction at PORTK_DIR;
sbit TFT_RST at PORTJ_OUT.B1;
sbit TFT_BLED at PORTJ_OUT.B0;
sbit TFT_RS at PORTJ_OUT.B4;
sbit TFT_CS at PORTJ_OUT.B5;
sbit TFT_RD at PORTJ_OUT.B2;
sbit TFT_WR at PORTJ_OUT.B3;
sbit TFT_RST_Direction at PORTJ_DIR.B1;
sbit TFT_BLED_Direction at PORTJ_DIR.B0;
sbit TFT_RS_Direction at PORTJ_DIR.B4;
sbit TFT_CS_Direction at PORTJ_DIR.B5;
sbit TFT_RD_Direction at PORTJ_DIR.B2;
sbit TFT_WR_Direction at PORTJ_DIR.B3;
// End TFT module connections

// Touch Panel module connections
sbit DriveX_Left at PORTA_OUT.B2;
sbit DriveX_Right at PORTQ_OUT.B2;
sbit DriveY_Up at PORTQ_OUT.B3;
sbit DriveY_Down at PORTA_OUT.B1;
sbit DriveX_Left_Direction at PORTA_DIR.B2;
sbit DriveX_Right_Direction at PORTQ_DIR.B2;
sbit DriveY_Up_Direction at PORTQ_DIR.B3;
sbit DriveY_Down_Direction at PORTA_DIR.B1;
// End Touch Panel module connections

// SHT11 Temperature & Humidity strings
char Temperature[] = "Ta = 000.00      ";
char Humidity[]    = "Rh = 000.00    ";

long int Ta_res,  Rh_res;
int  temp_ = 0;
int  humi_ = 0;
int  temp_1, humi_1;
int  i = 40;
unsigned int old_seconds = 0;
unsigned old_day=32 ;
unsigned int old_min=70;
 
struct RTC_time_t{                                                          // struct that defines time
        unsigned int  year;
        char          month;
        char          mday;
        char          hour;
        char          min;
        char          sec;
} ;

struct RTC_time_t t;

void Intr() org IVT_ADDR_RTC_OVF {                                          // Interupt routine on overflow
   Date_Time();
}

void SetInternalOsc(){
  OSC_CTRL = 0x02;                                                          // 32MHz internal RC oscillator

  while(RC32MRDY_bit == 0);

  CPU_CCP = 0xD8;
  CLK_CTRL = 1;
}

void main() {
  
  SetInternalOsc();                                                         // set system clock to 32MHz internal RC oscillator
  
  ADCA_Init_Advanced(_ADC_Signed | _ADC_12bit, _ADC_EXTERNAL_REF_A);        // Set ADC for touch panel
  ADCA_PRESCALER = 2;                                                       // system clock division factor div16

  TFT_Init(320,240);                                                        // Init TFT and Touch Pad
  TP_TFT_Init(320,240,1,2);
  TP_TFT_Set_ADC_Threshold(700);
  TP_TFT_Set_Calibration_Consts(186, 1872, 136, 1856);

  RTC16_Init(1000, _RTC_EXTERNAL_CLOCK, 1);                                 // Set Real Time Clock: 1000ms, external clk, use interrupt
  RTC16_Start();
  Delay_100ms();                                                            // Wait to stabilize RTC
  
  PMIC_CTRL = 2;                                                            // Medium Unterupt Level Enable
  CPU_SREG.B7 = 1;                                                          // Global Interupt Enable

  SPID_Init_Advanced(_SPI_MASTER, _SPI_FCY_DIV128, _SPI_CLK_LO_LEADING);    // SPI init for communication with SHT sensor

  Set_Initial_Date();                                                       // Set initial date and time

  Set_First_Screen();                                                       // Set first screen and wait for a press on the TP
  while (!TP_TFT_Press_Detect());
  
  Set_My_Screen();                                                          // User screen is set

  while (1) {
    if (i == 280 ) {                                                        // when graph exits drawing zone, start over again
      Refresh_Screen();
      i = 40;
    }

    if ( old_day != t.mday ) {                                              //  New day starts!
      New_Day();
      old_day = t.mday;
    }

    if (old_seconds != t.sec){                                              // Occurs every new second
      old_seconds = t.sec;

      Read_SHT1X();                                                         // Read values from SHT sensor
      temp_1 = temp_;                                                       // Save old Temperature value
      temp_ = 250-4 * (float) Ta_res / 100;                                 // Set coordinate for new Temperature value
      humi_1 = humi_;                                                       // Save old humidity value
      humi_=210-160 * (float) Rh_res / 10000;                               // Set coordinate for new humidity value
      if (i > 40){
        TFT_Set_Pen(CL_RED, 2);                                             // Use red pen for temperature
        TFT_Line(i-1, temp_1, i, temp_);                                    // Draw temperature
        TFT_Set_Pen(CL_BLUE, 2);                                            // Use blue pen for temperature
        TFT_Line(i-1, humi_1, i, humi_);                                    // Draw temperature
       }
      
      New_measurement(Ta_Res, RH_Res);                                      // Send measured values to SD card and write it on the display
      i++;                                                                  // increment horizontal position on screen
     }
  }
}