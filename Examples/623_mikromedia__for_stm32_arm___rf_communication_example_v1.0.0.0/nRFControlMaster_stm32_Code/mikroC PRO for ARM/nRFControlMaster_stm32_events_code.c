#include "nRFControlMaster_stm32_objects.h"
#include "nRFControlMaster_stm32_resources.h"

//--------------------- User code ---------------------//
#include "__Lib_nRF24L01.h"
#include "nRF24L01_defs.h"
#include "led_protocol.h"

extern TLed leds[8];
extern unsigned char rfState;

extern TButton_Round *btns[8];

void SingleLedCmd(unsigned char *tx, unsigned char ledNo, unsigned char state)
{
  unsigned char tmpCmd;

  if(state == 1)
    tmpCmd = LED_CMD_SINGLE_ON | ledNo;
  else
    tmpCmd = LED_CMD_SINGLE_OFF | ledNo;

  tx[0] = tmpCmd;
}

//use it for all on, all off, cln and row commands
void LedCmd(unsigned char *tx, unsigned char cmd, unsigned char ledData)
{
   tx[0] = cmd | ledData;
}

void SetLedState(unsigned char ledNo)
{
  if(leds[ledNo]._state == 0)
  {
    leds[ledNo]._state = 1;
  }
  else
    leds[ledNo]._state = 0;
}

void SetButtonState(unsigned char ledNo)
{
  if(leds[ledNo]._state == 0)
  {
    btns[ledNo]->Gradient_Start_Color    = 0xC618;
    btns[ledNo]->Gradient_End_Color      = 0x8410;
  }
  else
  {
    btns[ledNo]->Gradient_Start_Color    = 0xF800;
    btns[ledNo]->Gradient_End_Color      = 0x5000;
  }

  DrawRoundButton(btns[ledNo]);
}

void SetLedRow(unsigned char l1, unsigned char l2, unsigned char row)
{
  if(leds[l1]._state == leds[l2]._state)
  {
    SetLedState(l1);
    SetLedState(l2);

    if(leds[l1]._state == 1)
      LedCmd(TX_pload, LED_CMD_ROW_ON, row);
    else
      LedCmd(TX_pload, LED_CMD_ROW_OFF, row);
  }
  else
  {
    LedCmd(TX_pload, LED_CMD_ROW_OFF, row);
    leds[l1]._state = 0;
    leds[l2]._state = 0;
  }

  SetButtonState(l1);
  SetButtonState(l2);
}

//----------------- End of User code ------------------//

// Event Handlers

void ButtonRound3OnClick() {
  SetLedState(5);
  SingleLedCmd(TX_pload, 6, leds[5]._state);
  rfState = RF_SEND_CMD;
  SetButtonState(5);
}

void ButtonRound4OnClick() {
  SetLedState(4);
  SingleLedCmd(TX_pload, 5, leds[4]._state);
  rfState = RF_SEND_CMD;
  SetButtonState(4);
}

void ButtonRound1OnClick() {
  SetLedState(7);
  SingleLedCmd(TX_pload, 8, leds[7]._state);
  rfState = RF_SEND_CMD;
  SetButtonState(7);
}

void ButtonRound2OnClick() {
  SetLedState(6);
  SingleLedCmd(TX_pload, 7, leds[6]._state);
  rfState = RF_SEND_CMD;
  SetButtonState(6);
}

void ButtonRound5OnClick() {
  SetLedState(3);
  SingleLedCmd(TX_pload, 4, leds[3]._state);
  rfState = RF_SEND_CMD;
  SetButtonState(3);
}

void ButtonRound6OnClick() {
  SetLedState(2);
  SingleLedCmd(TX_pload, 3, leds[2]._state);
  rfState = RF_SEND_CMD;
  SetButtonState(2);
}

void ButtonRound7OnClick() {
  SetLedState(1);
  SingleLedCmd(TX_pload, 2, leds[1]._state);
  rfState = RF_SEND_CMD;
  SetButtonState(1);
}

void ButtonRound8OnClick() {
  SetLedState(0);
  SingleLedCmd(TX_pload, 1, leds[0]._state);
  rfState = RF_SEND_CMD;
  SetButtonState(0);
}

void ButtonRound29OnClick() {
  unsigned char i;

  if(leds[4]._state == leds[5]._state && leds[4]._state == leds[6]._state && leds[4]._state == leds[7]._state)
  {
    for(i = 4; i < 8; i++)
    {
      SetLedState(i);
      SetButtonState(i);
    }

    if(leds[4]._state == 0)
      LedCmd(TX_pload, LED_CMD_COLUMN_OFF, LED_CLN_01);
    else
      LedCmd(TX_pload, LED_CMD_COLUMN_ON, LED_CLN_01);
  }
  else
  {
    LedCmd(TX_pload, LED_CMD_COLUMN_OFF, LED_CLN_01);

    for(i = 4; i < 8; i++)
    {
      leds[i]._state = 0;
      SetButtonState(i);
    }
  }

  rfState = RF_SEND_CMD;
}

void ButtonRound30OnClick() {
  unsigned char i;

  if(leds[0]._state == leds[1]._state && leds[0]._state == leds[2]._state && leds[0]._state == leds[3]._state)
  {
    for(i = 0; i < 4; i++)
    {
      SetLedState(i);
      SetButtonState(i);
    }
    if(leds[0]._state == 0)
      LedCmd(TX_pload, LED_CMD_COLUMN_OFF, LED_CLN_02);
    else
      LedCmd(TX_pload, LED_CMD_COLUMN_ON, LED_CLN_02);
  }
  else
  {
    LedCmd(TX_pload, LED_CMD_COLUMN_OFF, LED_CLN_02);

    for(i = 0; i < 4; i++)
    {
      leds[i]._state = 0;
      SetButtonState(i);
    }
  }

  rfState = RF_SEND_CMD;
}

void ButtonRound25OnClick() {
  SetLedRow(3, 7, LED_ROW_01);
  rfState = RF_SEND_CMD;
}

void ButtonRound26OnClick() {
  SetLedRow(2, 6, LED_ROW_02);
  rfState = RF_SEND_CMD;
}

void ButtonRound27OnClick() {
  SetLedRow(1, 5, LED_ROW_03);
  rfState = RF_SEND_CMD;
}

void ButtonRound28OnClick() {
  SetLedRow(0, 4, LED_ROW_04);
  rfState = RF_SEND_CMD;
}

void ButtonAllOnOnClick() {
  unsigned char i;

  LedCmd(TX_pload, LED_CMD_ALL_ON, 0);
  rfState = RF_SEND_CMD;

  for(i = 0; i < 8; i++)
  {
    leds[i]._state = 1;
    btns[i]->Gradient_Start_Color    = 0xF800;
    btns[i]->Gradient_End_Color      = 0x5000;

    DrawRoundButton(btns[i]);
  }
}

void ButtonAllOffOnClick() {
  unsigned char i;

  LedCmd(TX_pload, LED_CMD_ALL_OFF, 0);
  rfState = RF_SEND_CMD;

  for(i = 0; i < 8; i++)
  {
    leds[i]._state = 0;
    btns[i]->Gradient_Start_Color    = 0xC618;
    btns[i]->Gradient_End_Color      = 0x8410;

    DrawRoundButton(btns[i]);
  }
}
