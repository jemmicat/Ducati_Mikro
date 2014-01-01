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
#define LED_CMD_ALL_ON         0x10
#define LED_CMD_SINGLE_ON      0x20
#define LED_CMD_ROW_ON         0x30
#define LED_CMD_COLUMN_ON      0x40
#define LED_CMD_ALL_OFF        0x50
#define LED_CMD_SINGLE_OFF     0x60
#define LED_CMD_ROW_OFF        0x70
#define LED_CMD_COLUMN_OFF     0x80

#define LED_ROW_01             0x00
#define LED_ROW_02             0x01
#define LED_ROW_03             0x02
#define LED_ROW_04             0x03

#define LED_CLN_01             0x00
#define LED_CLN_02             0x01

#define LED_QUERY_SINGLE       0x90
#define LED_QUERY_ROW          0xA0
#define LED_QUERY_COLUMN       0xB0

#define LED_OK             0xFF
#define LED_ERROR          0x00

typedef struct Led {
  unsigned char _state;
  unsigned char _no;
} TLed;

extern TLed leds[8];

#define RF_SEND_CMD            0x00
#define RF_STOP                0x01

#define LED_OFF     0x00
#define LED_ON      0x01

#endif