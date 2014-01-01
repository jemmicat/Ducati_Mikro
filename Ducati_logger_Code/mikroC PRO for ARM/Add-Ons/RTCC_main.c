/*******************************************************************************
* RTC  - Function Set for RTC Example
* ------------------------------------------------------------------------------
* Example allows user to set up Time (RTCC module)
*   Also it allows users to connect to Time server over ethernet and synronize
*   with GMT Time.
*******************************************************************************/

#include "Ducati_logger_objects.h"
#include "Ducati_logger_resources.h"
#include "__Time.h"

typedef struct Time {
  short ampm;
  short seconds;
  short minutes;
  short hours;
  short day;
  short month;
  int year;
} TTime;

extern TTime MyTime;
extern sfr sbit TFT_CS;
char RTCC_Read(TTime *RTCC_Time);
void Set_RTC(TTime *RTCC_Time);

typedef struct  RollingWheel {
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  unsigned int  ImageHeight;
  const code char    *Picture_Name;
  unsigned int  currentlevel;
  int          active;
  int           position;
  char          levels;
} TRoller;

TRoller Hour1Roll, Hour2Roll, Minute1Roll, Minute2Roll, AmPm;

void Roll_Roller(TRoller *Roller, char dir, char step);
void Draw_Picture(TRoller *Image, int line, int xcoo, int ycoo);
void Roll_Get_Level(TRoller *Roller);

char Roll_flag;
unsigned int OldYcoo, OldDelta;
extern unsigned int Xcoord, Ycoord;

/*******************************************************************************
* Function MyBoxOnPress(TRoller *Roller)
* ------------------------------------------------------------------------------
* Overview: Function that scrolls desired roller for appropriate number of lines
* Input: Pointer to roller
* Output: Nothing
*******************************************************************************/
void MyBoxOnPress(TRoller *Roller){
int delta;
char dir, step;
  // if the roller was pressed for first Time save position and exit
  if (Roll_Flag == 0){
    Roll_Flag = 1;
    OldYcoo = Ycoord;
    OldDelta = 0;
    return;
  }
  // calculate difference in vertical axis and get direction
  delta = Ycoord - OldYcoo;
  if (delta > 0){
    dir = 0;
  }
  if (delta < 0){
    dir = 1;
    delta = - delta;
  }
  // if difference is too small exit
  if (delta < 4){
    OldDelta = delta;
    return;
  }
  // set rolling step
  step = 2;
  // if difference is large speed up scrolling
  if ((delta - OldDelta) > 5)
    delta += OldDelta + 5;
  else
    delta = delta + OldDelta;

  if (delta > 25){
    step = 3;
    if (delta > 40)
      step = 4;
    delta = 3 * delta;
  }
  delta = delta / 2;
  // roll for calculated number of lines
  while (delta > 0){
    Roll_Roller(Roller, dir, step);
    delta = delta - step;
  }
  // save latest vertical position
  OldYcoo = Ycoord;
  OldDelta = 0;
}

// const tables for displaying roller (should be long as half of roller height)
const unsigned int table[] = {9, 9, 8, 8, 7, 7, 6, 6, 5, 5, 5, 4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
                               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                             };

const unsigned int filter[] = {
  0xBDD7, 0xC618, 0xC618, 0xC618, 0xCE59, 0xCE59, 0xCE59, 0xCE59, 0xCE59, 0xCE59, 0xCE59, 0xCE59, 0xE71C, 0xE71C, 0xE71C, 0xEF5D, 0xEF5D, 0xEF5D, 0xF79E, 0xF79E,
  0xF79E, 0xFFDF, 0xFFDF, 0xFFDF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF,
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF,
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF,
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
};

const unsigned int *pFilter;
/*******************************************************************************
* Function DrawPictureLine(TRoller *Image, int line, int xcoo, int ycoo)
* ------------------------------------------------------------------------------
* Overview: Function draw desired picture line of a roller
* Input: pointer to roller, desired line of roller picture, coordinates where it should be drawn
* Output: Nothing
*******************************************************************************/
void DrawPictureLine(TRoller *Image, int line, int xcoo, int ycoo){
  long count;
  unsigned int color;
  const code char *ptr;

  TFT_CS = 0;
  count = (Image->Width * 2);
  ptr = Image->Picture_Name + 6 + (unsigned long)line * count;
  TFT_SSD1963_Set_Address_Ptr(xcoo, ycoo, xcoo + Image->Width - 1, ycoo);
  while(count>0){
      color = (*ptr++);
      color += (*ptr++) << 8;
      TFT_Write_Data_Ptr(color & *pFilter);
      count = count-2;
  }
  TFT_CS = 1;
}

/*******************************************************************************
* Function DrawPictureLine(TRoller *Image, int line, int xcoo, int ycoo)
* ------------------------------------------------------------------------------
* Overview: Function draw entire roller from specified picture line
* Input: pointer to roller, desired line of roller picture, coordinates where it should be drawn
* Output: Nothing
*******************************************************************************/
void Draw_Picture(TRoller *Image, int line, int xcoo, int ycoo){
signed short i;
int temp;
  pFilter = filter;
  for (i = 0; i < (Image->Height)/2 - 2; i ++){
    temp = line - table[i];
    if ((temp) > (signed int)(Image->ImageHeight - 1))
      temp = temp - Image->ImageHeight - 1;
    if (temp < 0)
      temp = Image->ImageHeight - 1 + temp;
    DrawPictureLine(Image, temp, xcoo, ycoo);
    line ++;
    ycoo ++;
    pFilter ++;
  }
  pFilter = &filter[(Image->Height)/2 - 2];
  for (i = 95; i >= 0; i --){
    temp = line + table[i];
    if (temp > (signed int)(Image->ImageHeight - 1))
      temp = temp - Image->ImageHeight - 1;
    if (temp < 0)
      temp = Image->ImageHeight - 1 + temp;
    DrawPictureLine(Image, temp, xcoo, ycoo);
    line ++;
    ycoo ++;
    pFilter --;
  }
}

/*******************************************************************************
* Function Roll_Get_Level(TRoller *Roller)
* ------------------------------------------------------------------------------
* Overview: Function returns current level of desired roller
* Input: pointer to roller
* Output: Nothing
*******************************************************************************/
char Roll_Get_Level(TRoller *Roller){
  Roller->currentlevel = Roller->position / (Roller->ImageHeight / Roller->levels);
  return Roller->currentlevel;
}

/*******************************************************************************
* Function Roll_Set_Level(TRoller *Roller, char level)
* ------------------------------------------------------------------------------
* Overview: Function sets current level and possition of desired roller
* Input: pointer to roller, desired level
* Output: Nothing
*******************************************************************************/
void Roll_Set_Level(TRoller *Roller, char level){
  Roller->currentlevel = level;
  Roller->position = Roller->ImageHeight * level / Roller->levels;
}

/*******************************************************************************
* Function Roll_Roller(TRoller *Roller, char dir, char step)
* ------------------------------------------------------------------------------
* Overview: Function rolls desired roller in desired direction and for desired step
* Input: pointer to roller, direction and step to roll
* Output: Nothing
*******************************************************************************/
void Roll_Roller(TRoller *Roller, char dir, char step){
int temp;

  if (dir)
    Roller->position += step;
  else
    Roller->position -= step;

  if (Roller->position > (signed int)Roller->ImageHeight - 1)
    Roller->position = 0;
  if (Roller->position < 0)
    Roller->position = Roller->ImageHeight - 1;
  Draw_Picture(Roller, Roller->position - Roller->Height/2, Roller->Left, Roller->Top);
}

/*******************************************************************************
* Function Set_Roller(TRoller *Roller, int pos, char step)
* ------------------------------------------------------------------------------
* Overview: Function sets roller to desired possition by specified step
* Input: pointer to roller, desired possition and step
* Output: Nothing
*******************************************************************************/
void Set_Roller(TRoller *Roller, int pos, char step){
int temp;
char direction;
  temp = pos * Roller->ImageHeight / Roller->levels + Roller->ImageHeight / Roller->levels / 2;
  temp = temp - Roller->position;
  if (temp > 0)
    direction = 1;
  else{
    direction = 0;
    temp = -temp;
  }
  while (temp > step){
    Roll_Roller(Roller, direction, step);
    temp -= step;
  }
  Roll_Roller(Roller, direction, temp);
}

/*******************************************************************************
* Function Roller_Deactivate(TRoller *Roller, unsigned int xpos, unsigned int ypos)
* ------------------------------------------------------------------------------
* Overview: Function deactivates roller and displays its value instead
* Input: pointer to roller, coordinates where it should display
* Output: Nothing
*******************************************************************************/
void Roller_Deactivate(TRoller *Roller, unsigned int xpos, unsigned int ypos){
char text[2];
  TFT_Set_Pen(Set_clock.Color, 0);
  TFT_Set_Brush(1, Set_clock.Color, 0, 0, 0, 0);
  TFT_Rectangle(Roller->Left, Roller->Top, Roller->Left + Roller->Width, Roller->Top + Roller->Height);
  text[0] = Roller->currentlevel + 48;
  text[1] = 0;
  TFT_Set_Font(Label2.FontName, CL_WHITE, FO_HORIZONTAL);
  if (Roller == &AmPm){
    if (Roller->currentlevel == 0)
      TFT_Write_Text("AM", xpos, ypos);
    else if (Roller->currentlevel == 1)
      TFT_Write_Text("PM", xpos, ypos);
  }
  else
    TFT_Write_Text(text, xpos, ypos);
}

/*******************************************************************************
* Function Roller_Init()
* ------------------------------------------------------------------------------
* Overview: Function sets default values for rollers
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Roller_Init(){
  Hour1Roll.Left = 108;
  Hour1Roll.Top  = 42;
  Hour1Roll.Width = 36;
  Hour1Roll.Height = 194;
  Hour1Roll.ImageHeight = 148;
  Hour1Roll.active = 0;
  Hour1Roll.Picture_Name = stripe_black_bmp;
  Hour1Roll.position = 148 / 2 / 2; // 740 / 10 / 2;
  Hour1Roll.levels = 2;

  Hour2Roll.Left = 146;
  Hour2Roll.Top  = 42;
  Hour2Roll.Width = 36;
  Hour2Roll.Height = 194;
  Hour2Roll.ImageHeight = 740;
  Hour2Roll.active = 0;
  Hour2Roll.Picture_Name = stripe_black_bmp;
  Hour2Roll.position =  740 / 10 / 2;
  Hour2Roll.levels = 10;

  Minute1Roll.Left = 212;
  Minute1Roll.Top  = 42;
  Minute1Roll.Width = 36;
  Minute1Roll.Height = 194;
  Minute1Roll.ImageHeight = 444;
  Minute1Roll.active = 0;
  Minute1Roll.Picture_Name = stripe_black_bmp;
  Minute1Roll.position =  444 / 6 / 2;
  Minute1Roll.levels = 6;

  Minute2Roll.Left = 250;
  Minute2Roll.Top  = 42;
  Minute2Roll.Width = 36;
  Minute2Roll.Height = 194;
  Minute2Roll.ImageHeight = 740;
  Minute2Roll.active = 0;
  Minute2Roll.Picture_Name = stripe_black_bmp;
  Minute2Roll.position =  740 / 10 / 2;
  Minute2Roll.levels = 10;
  
  AmPm.Left         = 305;
  AmPm.Top          = 42;
  AmPm.Width        = 90;
  AmPm.Height       = 194;
  AmPm.ImageHeight  = 151;
  AmPm.Picture_Name = am_pm_bmp;
  AmPm.currentlevel = 0;
  AmPm.active       = 0;
  AmPm.position     = 151 / 2 / 2;
  AmPm.levels       = 2;
}

/*******************************************************************************
* Function HoursTens()
* ------------------------------------------------------------------------------
* Overview: Function should be run on appropriate roller press
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void HoursTens(){
  // deactivate if any other roller is active
  if (Hour1Roll.active == 0){
    if (Hour2Roll.active == 1){
      Roller_Deactivate(&Hour2Roll, 149, 96);
      Hour2Roll.active = 0;
    }
    if (Minute1Roll.active == 1){
      Roller_Deactivate(&Minute1Roll, 215, 96);
      Minute1Roll.active = 0;
    }
    if (Minute2Roll.active == 1){
      Roller_Deactivate(&Minute2Roll, 253, 96);
      Minute2Roll.active = 0;
    }
    if (AmPm.active == 1){
      Roller_Deactivate(&AmPm, 307, 96);
      AmPm.active = 0;
    }
    // Draw current position
    Draw_Picture(&Hour1Roll, Hour1Roll.position - 96, Hour1Roll.Left, Hour1Roll.Top);
  }
  // run roller
  MyBoxOnPress(&Hour1Roll);
  Hour1Roll.active = 1;
}

/*******************************************************************************
* Function HoursOnes()
* ------------------------------------------------------------------------------
* Overview: Function should be run on appropriate roller press
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void HoursOnes(){
  // deactivate if any other roller is active
  if (Hour2Roll.active == 0){
    if (Hour1Roll.active == 1){
      Roller_Deactivate(&Hour1Roll, 111, 96);
      Hour1Roll.active = 0;
    }
    if (Minute1Roll.active == 1){
      Roller_Deactivate(&Minute1Roll, 215, 96);
      Minute1Roll.active = 0;
    }
    if (Minute2Roll.active == 1){
      Roller_Deactivate(&Minute2Roll, 253, 96);
      Minute2Roll.active = 0;
    }
    if (AmPm.active == 1){
      Roller_Deactivate(&AmPm, 307, 96);
      AmPm.active = 0;
    }
    // Draw current position
    Draw_Picture(&Hour2Roll, Hour2Roll.position - 96, Hour2Roll.Left, Hour2Roll.Top);
  }
  // run roller
  MyBoxOnPress(&Hour2Roll);
  Hour2Roll.active = 1;
}

/*******************************************************************************
* Function MinutesTens()
* ------------------------------------------------------------------------------
* Overview: Function should be run on appropriate roller press
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void MinutesTens(){
  // deactivate if any other roller is active
  if (Minute1Roll.active == 0){
    if (Hour1Roll.active == 1){
      Roller_Deactivate(&Hour1Roll, 111, 96);
      Hour1Roll.active = 0;
    }
    if (Hour2Roll.active == 1){
      Roller_Deactivate(&Hour2Roll, 149, 96);
      Hour2Roll.active = 0;
    }
    if (Minute2Roll.active == 1){
      Roller_Deactivate(&Minute2Roll, 253, 96);
      Minute2Roll.active = 0;
    }
    if (AmPm.active == 1){
      Roller_Deactivate(&AmPm, 307, 96);
      AmPm.active = 0;
    }
    // Draw current position
    Draw_Picture(&Minute1Roll, Minute1Roll.position - 95, Minute1Roll.Left, Minute1Roll.Top);
  }
  // run roller
  MyBoxOnPress(&Minute1Roll);
  Minute1Roll.active = 1;
}

/*******************************************************************************
* Function MinutesOnes()
* ------------------------------------------------------------------------------
* Overview: Function should be run on appropriate roller press
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void MinutesOnes(){
  // deactivate if any other roller is active
  if (Minute2Roll.active == 0){
    if (Hour1Roll.active == 1){
      Roller_Deactivate(&Hour1Roll, 111, 96);
      Hour1Roll.active = 0;
    }
    if (Hour2Roll.active == 1){
      Roller_Deactivate(&Hour2Roll, 149, 96);
      Hour2Roll.active = 0;
    }
    if (Minute1Roll.active == 1){
      Roller_Deactivate(&Minute1Roll, 215, 96);
      Minute1Roll.active = 0;
    }
    if (AmPm.active == 1){
      Roller_Deactivate(&AmPm, 307, 96);
      AmPm.active = 0;
    }
    // Draw current position
    Draw_Picture(&Minute2Roll, Minute2Roll.position - 95, Minute2Roll.Left, Minute2Roll.Top);
  }
  // run roller
  MyBoxOnPress(&Minute2Roll);
  Minute2Roll.active = 1;
}

/*******************************************************************************
* Function AmPmRun()
* ------------------------------------------------------------------------------
* Overview: Function should be run on appropriate roller press
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void AmPmRun(){
  // deactivate if any other roller is active
  if (AmPm.active == 0){
    if (Hour1Roll.active == 1){
      Roller_Deactivate(&Hour1Roll, 111, 96);
      Hour1Roll.active = 0;
    }
    if (Hour2Roll.active == 1){
      Roller_Deactivate(&Hour2Roll, 149, 96);
      Hour2Roll.active = 0;
    }
    if (Minute1Roll.active == 1){
      Roller_Deactivate(&Minute1Roll, 215, 96);
      Minute1Roll.active = 0;
    }
    if (Minute2Roll.active == 1){
      Roller_Deactivate(&Minute2Roll, 253, 96);
      Minute2Roll.active = 0;
    }
    // Draw current position
    Draw_Picture(&AmPm, AmPm.position - 75, AmPm.Left, AmPm.Top);
  }
  // run roller
  MyBoxOnPress(&AmPm);
  AmPm.active = 1;
}

/*******************************************************************************
* Function Deactivate_All_Rollers()
* ------------------------------------------------------------------------------
* Overview: Function deactivates all rollers
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Deactivate_All_Rollers(){
  if (Hour1Roll.active == 1){
    Roller_Deactivate(&Hour1Roll, 111, 96);
    Hour1Roll.active = 0;
  }
  if (Hour2Roll.active == 1){
    Roller_Deactivate(&Hour2Roll, 149, 96);
    Hour2Roll.active = 0;
  }
  if (Minute1Roll.active == 1){
    Roller_Deactivate(&Minute1Roll, 215, 96);
    Minute1Roll.active = 0;
  }
  if (Minute2Roll.active == 1){
    Roller_Deactivate(&Minute2Roll, 253, 96);
    Minute2Roll.active = 0;
  }
  if (AmPm.active == 1){
    Roller_Deactivate(&AmPm, 307, 96);
    AmPm.active = 0;
  }
}

/*******************************************************************************
* Function RTC_Example_init()
* ------------------------------------------------------------------------------
* Overview: Function initializes RTC example (sets default possitions and values)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void RTC_Example_init(){
  Roller_Init();
  RTCC_Read(&MyTime);
  Roll_Set_Level(&Hour1Roll, MyTime.hours / 10);
  Roll_Set_Level(&Hour2Roll, MyTime.hours % 10);
  Roll_Set_Level(&Minute1Roll, MyTime.minutes / 10);
  Roll_Set_Level(&Minute2Roll, MyTime.minutes % 10);
  Roll_Set_Level(&AmPm, MyTime.ampm);
  Roller_Deactivate(&Hour1Roll, 111, 96);
  Roller_Deactivate(&Hour2Roll, 149, 96);
  Roller_Deactivate(&Minute1Roll, 215, 96);
  Roller_Deactivate(&Minute2Roll, 253, 96);
  Roller_Deactivate(&AmPM, 307, 96);
}

/*******************************************************************************
* Function doRTC_Example()
* ------------------------------------------------------------------------------
* Overview: Function should be called from main while loop when no press is detected
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void doRTC_Example(){
  // reset roll flag
  Roll_Flag = 0;
  // if roller is active and released set it to nearest possition
  if (Hour1Roll.active){
    Roll_Get_Level(&Hour1Roll);
    Set_Roller(&Hour1Roll, Hour1Roll.currentlevel, 1);
  }
  // if roller is active and released set it to nearest possition
  if (Hour2Roll.active){
    Roll_Get_Level(&Hour2Roll);
    Set_Roller(&Hour2Roll, Hour2Roll.currentlevel, 1);
  }
  // if roller is active and released set it to nearest possition
  if (Minute1Roll.active){
    Roll_Get_Level(&Minute1Roll);
    Set_Roller(&Minute1Roll, Minute1Roll.currentlevel, 1);
  }
  // if roller is active and released set it to nearest possition
  if (Minute2Roll.active){
    Roll_Get_Level(&Minute2Roll);
    Set_Roller(&Minute2Roll, Minute2Roll.currentlevel, 1);
  }
  // if roller is active and released set it to nearest possition
  if (AmPm.active){
    Roll_Get_Level(&AmPm);
    Set_Roller(&AmPm, AmPm.currentlevel, 1);
  }
}

/*******************************************************************************
* Function Set_MyRTCC()
* ------------------------------------------------------------------------------
* Overview: Function reads current Time and modifyies hours and minutes as set on display
* Input: Nothing
* Output: Nothing
*******************************************************************************/
char Set_MyRTCC(){
char temp;
  RTCC_Read(&MyTime);
  temp = Hour1Roll.currentlevel * 10 + Hour2Roll.currentlevel;
  if (temp > 12)
    return 0;
  MyTime.hours = temp;
  MyTime.minutes = Minute1Roll.currentlevel * 10 + Minute2Roll.currentlevel;
  MyTime.ampm = AmPm.currentlevel;
  Set_RTC(&MyTime);
  return 1;
}

/*******************************************************************************
* Function UpdateTime(TTime *RTCC_Time)
* ------------------------------------------------------------------------------
* Overview: Function reads Time and displays it on Home screen
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void UpdateTime(TTime *RTCC_Time){
  Label19_Caption[0] = (RTCC_Time->hours / 10) + 48;
  Label19_Caption[1] = (RTCC_Time->hours % 10) + 48;
  Label19_Caption[2] = ':';
  Label19_Caption[3] = (RTCC_Time->minutes / 10) + 48;
  Label19_Caption[4] = (RTCC_Time->minutes % 10) + 48;
  Label19_Caption[5] = ' ';
  if (RTCC_Time->ampm == 0){
    Label19_Caption[6] = 'A';
    Label19_Caption[7] = 'M';
  }
  else if (RTCC_Time->ampm == 1){
    Label19_Caption[6] = 'P';
    Label19_Caption[7] = 'M';
  }
  Label19_Caption[8] = 0;
  TFT_Set_Brush(1, Speedometer_graphics.Color, 0, 0, 0, 0);
  TFT_Set_Pen(Speedometer_graphics.Color, 0);
  TFT_Rectangle(Label19.Left, Label19.Top, Label19.Left + 60, Label19.Top + 20);
  DrawLabel(&Label19);
}

TTime OldMyTime = {0, 0, 0, 0, 0, 0};
/*******************************************************************************
* Function checkRTC()
* ------------------------------------------------------------------------------
* Overview: Function checks if Time has changed (for polling purposes)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void checkRTC(){
  if (RTCC_Read(&MyTime)){
    if ((MyTime.minutes != OldMyTime.minutes) || (MyTime.hours != OldMyTime.hours) || (MyTime.ampm != OldMyTime.ampm)){
      UpdateTime(&MyTime);
      OldMyTime = MyTime;
    }
  }
}

extern TimeStruct my_time;
/*/*******************************************************************************
* Function check_time_server()
* ------------------------------------------------------------------------------
* Overview: Function updates Time which was retreived from Time server
* Input: Nothing
* Output: Nothing
*******************************************************************************/
/*void check_time_server(){
  if (Time_Obtained == 1){
    Time_Obtained = 0;
    MyTime.seconds = my_time.ss;
    MyTime.minutes = my_time.mn;
    if (my_time.hh == 0){
      MyTime.ampm  = 0;
      MyTime.hours = 12;
    }
    else if (my_time.hh == 12){
      MyTime.ampm  = 1;
      MyTime.hours = 12;
    }
    else{
      MyTime.hours   = my_time.hh % 12;
      MyTime.ampm    = my_time.hh / 12;
    }
    MyTime.day     = my_time.md;
    MyTime.month   = my_time.mo;
    MyTime.year    = my_time.yy;
    Set_RTC(&MyTime);

    Roll_Set_Level(&Hour1Roll, MyTime.hours / 10);
    Roll_Set_Level(&Hour2Roll, MyTime.hours % 10);
    Roll_Set_Level(&Minute1Roll, MyTime.minutes / 10);
    Roll_Set_Level(&Minute2Roll, MyTime.minutes % 10);
    Roll_Set_Level(&AmPm, MyTime.ampm % 10);

    Set_Roller(&Hour1Roll, Hour1Roll.currentlevel, 5);
    Roller_Deactivate(&Hour1Roll, 111, 96);
    Set_Roller(&Hour2Roll, Hour1Roll.currentlevel, 5);
    Roller_Deactivate(&Hour2Roll, 149, 96);
    Set_Roller(&Minute1Roll, Hour1Roll.currentlevel, 5);
    Roller_Deactivate(&Minute1Roll, 215, 96);
    Set_Roller(&Minute2Roll, Hour1Roll.currentlevel, 5);
    Roller_Deactivate(&Minute2Roll, 253, 96);
    Set_Roller(&AmPm, AmPm.currentlevel, 5);
    Roller_Deactivate(&AmPm, 307, 96);
  }
}*/