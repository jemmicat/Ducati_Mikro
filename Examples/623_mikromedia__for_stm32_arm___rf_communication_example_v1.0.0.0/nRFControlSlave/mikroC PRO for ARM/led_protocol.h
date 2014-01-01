#ifndef LED_PROTOCOL_H
#define LED_PROTOCOL_H

/*******************************************************************************
Simple Led nRF Protocol

Command byte:

XXXX XXXX
7654 3210 - bit position

bits[7:4] - command bits
bits[3:0] - data bits
*******************************************************************************/
//command syntax :
#define LED_CMD_ALL_ON         0x10       // Turn on all Leds
#define LED_CMD_SINGLE_ON      0x20       // Turn on single Led
#define LED_CMD_ROW_ON         0x30       // Turn on Leds in a single row
#define LED_CMD_COLUMN_ON      0x40       // Turn on Leds in a single column
#define LED_CMD_ALL_OFF        0x50       // Turn off all Leds
#define LED_CMD_SINGLE_OFF     0x60       // Turn off single Leds
#define LED_CMD_ROW_OFF        0x70       // Turn off Leds in a single row
#define LED_CMD_COLUMN_OFF     0x80       // Turn off Leds in a single column

#define LED_ROW_01             0x00       // Leds in a first row
#define LED_ROW_02             0x01       // Leds in a second row
#define LED_ROW_03             0x02       // Leds in a third row
#define LED_ROW_04             0x03       // Leds in a fourth row

#define LED_CLN_01             0x00       // Leds in a first column
#define LED_CLN_02             0x01       // Leds in a second column

#define LED_QUERY_SINGLE       0x90       // Query single led
#define LED_QUERY_ROW          0xA0       // Query single row
#define LED_QUERY_COLUMN       0xB0       // Query single column

#define LED_OK                 0xFF       // Led status : OK
#define LED_ERROR              0x00       // Led status : Error

#define RF_SEND_CMD            0x00
#define RF_STOP                0x01

#define LED_OFF     0x00
#define LED_ON      0x01

//structure used to keep Led state (On/Off) and Led number.
typedef struct Led {
  unsigned char _state;
  unsigned char _no;
} TLed;

extern TLed leds[8];

#endif