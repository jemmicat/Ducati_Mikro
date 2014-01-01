/*******************************************************************************
* Power Management  - Function Set used for Power Management
* ------------------------------------------------------------------------------
* reads battery voltage gets power source
*******************************************************************************/
#define VOLTAGE_GREEN   360
#define VOLTAGE_YELLOW  340
#include "mikromedia_STM32plus_objects.h"

// external pin declarations
sbit USB_VBUS at GPIOA_IDR.B9;
sbit DC_VBUS  at GPIOF_IDR.B3;
sbit BAT_STAT at GPIOF_IDR.B4;

// TypeDefs
typedef enum { BAT_CHARGING, BAT_DISCHARGING, BAT_UNPLUGGED, BAT_FULL } Batt_Status;
typedef enum { SRC_BATTERY, SRC_USB, SRC_DC } Pwr_Source;

// Global variables
static char      s_voltage[10];
static float     f_voltage;
static int       OldPosition = 0;
static int       NewPosition = 0;
struct    { Batt_Status  Battery_state;
            Pwr_Source   Source;
            float        f_Voltage;
            unsigned     ui_Voltage;
          } Power_State, Power_State_Old;

/*******************************************************************************
* Function Power_Man_Init()
* ------------------------------------------------------------------------------
* Overview: Function initializes input pins for Power Management
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Power_Man_Init() {
  GPIO_Analog_Input(&GPIOF_BASE, _GPIO_PINMASK_6);
  ADC3_Init();
//  ADC_Set_Input_Channel(_ADC_CHANNEL_0);

  GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_9);            // USB_VBUS
  GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_3);            // DC_VBUS
  GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_4);            // BAT_STAT

  Power_State_Old.Battery_state = -1;
  Power_State_Old.Source = -1;
  Power_State_Old.ui_Voltage = -1;
}

/*******************************************************************************
* Function ui_ReadBatteryVoltage()
* ------------------------------------------------------------------------------
* Overview: Function reads Battery Voltage and returns integer value
* Input: Nothing
* Output: Battery Voltage
*******************************************************************************/
static unsigned int ui_ReadBatteryVoltage() {
  unsigned int ui_voltage;
  char cntr;

  for(cntr=0, ui_voltage=0; cntr<8; cntr++) {
     ui_voltage += ADC3_Get_Sample(4);
     Delay_10ms();
    }
  return ui_voltage >> 3;
}

/*******************************************************************************
* Function f_ReadBatteryVoltage()
* ------------------------------------------------------------------------------
* Overview: Function reads Battery Voltage and returns float value
* Input: Nothing
* Output: Battery Voltage
*******************************************************************************/
static float f_ReadBatteryVoltage() {
  int ui_voltage;

  ui_voltage = ui_ReadBatteryVoltage();
  return (float)ui_voltage*0.0015;         // 3*2.048/4096
}

/*******************************************************************************
* Function GetPowerStatus()
* ------------------------------------------------------------------------------
* Overview: Function sets power status
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static void GetPowerStatus() {
  Power_State.f_Voltage   = f_ReadBatteryVoltage();
  Power_State.ui_Voltage  = (unsigned int)(Power_State.f_Voltage*100);

  if (DC_VBUS==0)
    Power_State.Source = SRC_DC;      // Works if Vdc>5V(Vusb), if Vdc<Vusb priority is changed
  else {
    if (USB_VBUS==1)
      Power_State.Source = SRC_USB;
    else {
      Power_State.Source = SRC_BATTERY;
    }
  }

  if (BAT_STAT == 0)
    Power_State.Battery_state = BAT_CHARGING;
  else {
    if (Power_State.Source == SRC_BATTERY) {
      Power_State.Battery_state = BAT_DISCHARGING;
    }
    else {
      if (Power_State.ui_Voltage>=425)
        Power_State.Battery_state = BAT_UNPLUGGED;
      else
        Power_State.Battery_state = BAT_FULL;
    }
  }
}

char Display_Bat_Stat = 1;
/*******************************************************************************
* Function checkPowerM()
* ------------------------------------------------------------------------------
* Overview: Function update battery status
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void checkPowerM(){
  int Bar_Width;

  GetPowerStatus();
  
      if (Power_State.Battery_state != Power_State_Old.Battery_state) {
        switch (Power_State.Battery_state) {
          case BAT_CHARGING   : {
                                }; break;
          case BAT_DISCHARGING: {
                                }; break;
          case BAT_FULL       : {
                                }; break;
          case BAT_UNPLUGGED  : {
                                }; break;
        }
        
        Power_State_Old.Battery_state = Power_State.Battery_state;
      }
      
      if (Power_State.Source != Power_State_Old.Source) {
        switch (Power_State.Source) {
          case SRC_BATTERY: {
                            }; break;
          case SRC_DC     : {
                            }; break;
          case SRC_USB    : {
                            }; break;
        }
        Power_State_Old.Source = Power_State.Source;
      }
      
     if ((Power_State.Battery_state != BAT_UNPLUGGED) && (Display_Bat_Stat)){
       Bar_Width = ((signed int)Power_State.ui_Voltage - 295) / 5;
       if ((Bar_Width > 0) && (Bar_Width < 25)){

         if (Power_State.ui_Voltage > 330)
           TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
         else
           TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
         TFT_Set_Pen(CL_WHITE, 0);
         TFT_Rectangle(19, 12, 19 + Bar_width, 19);

         TFT_Set_Brush(1, Home.Color, 0, 0, 0, 0);
         TFT_Set_Pen(CL_WHITE, 0);
         TFT_Rectangle(19 + Bar_width, 12, 43, 19);

         Display_Bat_Stat = 0;
       }
       else {
         TFT_Set_Brush(1, Home.Color, 0, 0, 0, 0);
         TFT_Set_Pen(CL_WHITE, 0);
         TFT_Rectangle(19, 12, 43, 19);
       }
     }
}