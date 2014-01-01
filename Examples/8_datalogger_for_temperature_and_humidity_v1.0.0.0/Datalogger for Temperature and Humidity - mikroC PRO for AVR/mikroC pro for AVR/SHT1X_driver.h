// SHT11 connections
extern sfr sbit SDA_;             // Serial data pin
extern sfr sbit SCL_;             // Serial clock pin

extern sfr sbit SDA_Direction;    // Serial data direction pin
extern sfr sbit SCL_Direction;    // Serial clock direction pin
//

//
extern char Temperature[];        // Strings for storing measured data
extern char Humidity[];
//


void Read_SHT1X();