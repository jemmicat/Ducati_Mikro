/*
 * Project name:
     GPS Click board example
 * Copyright:
     (c) mikroElektronika, 2012.
 * Revision History:
     20120523:
       - initial release (JK and DO);
 * Description:
     This example demonstrates the functionality of the GPS Click board.
     It displays a map of the world on the TFT and shows the location of the GPS module on it.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32
                      http://www.mikroe.com/eng/products/view/852/easymx-pro-v7-for-stm32/
     Oscillator:      HS-PLL 72.0000 MHz, internal 8.0000 MHz RC
     Ext. Modules:    GPS click - ac:GPS_click 
                      http://www.mikroe.com/eng/products/view/871/gps-click-l10/
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Place GPS Click board in the mikroBUS socket 1.
     - Turn on TFT backlight switch SW11.3
 */

#include "resources.h"

// Uncomment to select desired GPS module
#define QUECTEL
//#define UBLOX

// Variables used in the example
char txt[768];
char *string;
int i, latitude, longitude, oldlatitude, oldlongitude;
unsigned short ready;
char lat_str[8];
char long_str[9];

void interrupt() iv IVT_INT_USART3 ics ICS_AUTO {
  txt[i] = UART3_Read();
  i++;
  if (i == 768) {
    i = 0;
    ready = 1;
  }
}

void Display_Cursor(signed int lat, signed int lon, char *lt_Str, char *lng_Str, unsigned int color) {
  unsigned long latitude_y, longitude_x;

  // Latitude and Longitude scaling for 320x240 display:
  // Latitude: Input range is -90 to 90 degrees
  // Longitude: Input range is -180 to 180 degrees
  latitude_y = ((160*(90 - lat))/180) + 40;
  longitude_x = (320*(lon + 180));
  longitude_x = longitude_x/360 - 10;
  
  // Cursor drawing
  TFT_Set_Pen(CL_RED, 1);
  TFT_H_Line(longitude_x - 2, longitude_x + 2, latitude_y );
  TFT_V_Line( latitude_y - 2, latitude_y + 2, longitude_x );
  
  TFT_Set_Font(&TFT_defaultFont, color, FO_HORIZONTAL);
  TFT_Write_Text(lt_Str, 160, 200);
  TFT_Write_Text(lng_Str, 160, 215);
}


void main() {

  TFT_Init(320,240);
  Delay_ms(500);
  TFT_Fill_Screen(CL_WHITE);
  TFT_Image(0, 40, WorldImage_bmp, 1);

  TFT_Set_Font(&HandelGothic_BT21x22_Regular, CL_RED, FO_HORIZONTAL);
  TFT_Write_Text("GPS click Example", 75, 14);
  TFT_Set_Font(&TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
  TFT_Write_Text("Your latitude is:", 40, 200);
  TFT_Write_Text("Your longitude is:", 40, 215);
  
  ready = 0;
  i = 0;
    
  UART3_Init_Advanced(9600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
    
  // Enable Usart Receiver interrupt:
  USART3_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART3);  // enable interrupt vector
  Enableinterrupts();
    
  while(1) {
    if(ready == 1) { //if the data in txt array is ready do:
      ready = 0;
      string = strstr(txt,"$GPGLL");
      if(string != 0) {                      // If txt array contains "$GPGLL" string we proceed...
        if(string[7] != ',') {               // if "$GPGLL" NMEA message have ',' sign in the 8-th
                                             // position it means that tha GPS receiver does not have FIXed position!
          // If QUECTEL GPS receiver module is used :
          #ifdef QUECTEL
            latitude = (string[7]-48)*10 + (string[8]-48);
            longitude = (string[19]-48)*100 + (string[20]-48)*10 + (string[21]-48);
            if(string[17] == 'S') {            // if the latitude is in the South direction it has minus sign
              latitude = 0 - latitude;
            }
            if(string[30] == 'W') {            // if the longitude is in the West direction it has minus sign
              longitude = 0 - longitude;
            }
          
            if ((oldlongitude != longitude) | (oldlatitude != latitude)){
              Display_Cursor(latitude, longitude, &lat_str, &long_str, CL_WHITE);     // Display the cursor on the world map
            
              lat_str[0] = string[7];
              lat_str[1] = string[8];
              lat_str[2] = ',';
              lat_str[3] = string[9];
              lat_str[4] = string[10];
              lat_str[5] = ' ';
              lat_str[6] = string[17];
              lat_str[7] = 0;
          
              long_str[0] = string[19];
              long_str[1] = string[20];
              long_str[2] = string[21];
              long_str[3] = ',';
              long_str[4] = string[22];
              long_str[5] = string[23];
              long_str[6] = ' ';
              long_str[7] = string[30];
              long_str[8] = 0;
            #endif

          // If uBlox GPS receiver module is used :
          #ifdef UBLOX
            latitude = (string[7]-48)*10 + (string[8]-48);
            longitude = (string[20]-48)*100 + (string[21]-48)*10 + (string[22]-48);
            if(string[18] == 'S') {            // if the latitude is in the South direction it has minus sign
              latitude = 0 - latitude;
            }
            if(string[32] == 'W') {            // if the longitude is in the West direction it has minus sign
              longitude = 0 - longitude;
            }

            if ((oldlongitude != longitude) | (oldlatitude != latitude)){
              Display_Cursor(latitude, longitude, &lat_str, &long_str, CL_WHITE);     // Display the cursor on the world map

              lat_str[0] = string[7];
              lat_str[1] = string[8];
              lat_str[2] = ',';
              lat_str[3] = string[9];
              lat_str[4] = string[10];
              lat_str[5] = ' ';
              lat_str[6] = string[18];
              lat_str[7] = 0;

              long_str[0] = string[20];
              long_str[1] = string[21];
              long_str[2] = string[22];
              long_str[3] = ',';
              long_str[4] = string[23];
              long_str[5] = string[24];
              long_str[6] = ' ';
              long_str[7] = string[32];
              long_str[8] = 0;
            #endif

            Display_Cursor(latitude, longitude, &lat_str, &long_str, CL_RED);     // Display the cursor on the world map
          }
        }
      }
    }
  }
}