#include "Ducati_logger_objects.h"
#include "Ducati_logger_resources.h"

//--------------------- User code ---------------------//
void Calibrate();
void doRTC_Example();
void RTC_Example_init();
char Set_MyRTCC();
void checkRTC();
void MinutesOnes();
void MinutesTens();
void HoursOnes();
void HoursTens();
void Deactivate_All_Rollers();
void AmPmRun();
void doAccel();
void ACCEL_Start(char *test);
void Accel_Stop();

void checkPowerM();

typedef struct Time {
  short ampm;
  short seconds;
  short minutes;
  short hours;
  short day;
  short month;
  int year;
} TTime;
TTime Current_Time;
void Set_RTC(TTime *RTCC_Time);
char RTCC_Read(TTime *RTCC_Time);

void BLED_Fade_Out(){
  int i;

  for ( i = 255; i > 0 ; i-- ){
    TFT_Set_DBC_SSD1963(i);
    Delay_ms(1);
  }
  TFT_Set_DBC_SSD1963(0);
}

void BLED_Fade_In(){
  int i;

  for (i = 1; i < 255; i++){
    TFT_Set_DBC_SSD1963(i);
    Delay_ms(1);
  }
    TFT_Set_DBC_SSD1963(255);
}

extern char PenDown;
extern char Display_Bat_Stat;
extern sfr sbit TFT_BLED;

void ScrollPress();
void ScrollOnClick();
void Stop_Scroll();

char Init_FAT();
void Sensors_Init();
void Sensors_Read();
void Stop_sensors();
char Logger_State;
void doAccel();
void ACCEL_Start(char *test);
void Accel_Stop();

void Run_Logger(){
  switch (Logger_State) {
    case 0 : {
              checkRTC();            // Speedometer screen
              checkPowerM();
              Sensors_Read();
             }; break;
    case 1 : {
              checkRTC();            // Tachometer screen
              checkPowerM();
              Sensors_Read();
             }; break;
             
    case 2 : {
              checkRTC();            // Settings screen
              checkPowerM();
             }; break;
    case 3 : {                       // RTCC screen
              if (PenDown == 0)
                doRTC_Example();
             }; break;                
    case 4 : {
                 doAccel();
              };   break;                  // Sensor Test
    case 5 : {
              //doMp3();               // GPS Test
             }; break;
    case 6 : break;                   //Sensor Calibration
    case 7 : {                       // Oxygen sensor test
               //doSlide();
             }; break;
    case 8 : {                       // Shift Light Adjust
               //doTicTacToe();
             }; break;
  }
}

/*extern sfr sbit LED_R;
extern sfr sbit LED_G;
extern sfr sbit LED_B;

extern signed short Ext_fhandle;
extern char Ext_res_initialized;

extern char cACCEL_test_status;


void doAccel();
void ACCEL_Start(char *test);
void Accel_Stop();

void PickColor();
void RGB_Init();
void RGB_OFF();

typedef struct t_drawingTool{
  unsigned int pen_size;
  unsigned short EraserSelected;
  TBox *CurrentPen;
  TBox *PreviousPen;

  TBox *CurrentColor;
  TBox *PreviousColor;
};
extern unsigned int Xcoord, Ycoord;
extern struct t_drawingTool drawingTool;

void UpdatePenSelection();
void UpdatePenColor();
void SetDefaults();
void SelectColor(TBox *ColorBox);

*/
//----------------- End of User code ------------------//

// Event Handlers

void doSetClock() {
    BLED_Fade_Out();
    DrawScreen(&Set_clock);
    BLED_Fade_In();
    RTC_Example_init();
    Logger_State = 2;

}


void doCalibration(){
     Delay_ms(500);
     Calibrate();
     BLED_Fade_In();
     DrawScreen(&Settings);
     }
     
     
void Box10OnPress() {
  HoursTens();
}

void Box11OnPress() {
  HoursOnes();
}

void Box3OnPress() {
  MinutesTens();
}

void Box4OnPress() {
  MinutesOnes();
}

void Box5OnPress() {
  AmPmRun();
}

void Image18OnPress() {
  if (Set_MyRTCC() == 0)
    return;
  Logger_State = 2;
  BLED_Fade_Out();
  DrawScreen(&Settings);
  Display_Bat_Stat = 1;
  checkPowerM();
  BLED_Fade_In();
}

void Box8OnClick() {
  Deactivate_All_Rollers();
}

void doNextScreen() {
    BLED_Fade_Out();
    DrawScreen(&Tachometer_graphics);
    BLED_Fade_In();
    Logger_State = 1;
}

void doPrevScreen() {
    BLED_Fade_Out();
    DrawScreen(&Speedometer_graphics);
    BLED_Fade_In();
    Logger_State = 0;

}

void doLog() {

}

void doSettings() {
    BLED_Fade_Out();
    DrawScreen(&Settings);
    BLED_Fade_In();
    Logger_State = 2;

}

void doSensorTest() {
    BLED_Fade_Out();
    DrawScreen(&Sensor_test);
    BLED_Fade_In();
    Logger_State = 4;

}

void doGPSTest() {
    BLED_Fade_Out();
    DrawScreen(&GPS_test);
    BLED_Fade_In();
    Logger_State = 5;
}

void doSensorCalibration() {
    BLED_Fade_Out();
    //DrawScreen(&GPS_test);
    BLED_Fade_In();
    Logger_State = 6;
}
