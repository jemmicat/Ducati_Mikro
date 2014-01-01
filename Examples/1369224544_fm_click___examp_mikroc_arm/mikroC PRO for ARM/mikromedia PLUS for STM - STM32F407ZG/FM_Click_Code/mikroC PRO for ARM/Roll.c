/*******************************************************************************
* RTC  - Function Set for RTC Example
* ------------------------------------------------------------------------------
* Example allows user to set up Time (RTCC module)
*   Also it allows users to connect to Time server over ethernet and synronize
*   with GMT Time.
*******************************************************************************/
#include "FM_Click_resources.h"

extern sfr sbit TFT_CS;

typedef struct  RollingWheel {
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  unsigned int  ImageHeight;
  const code char    *Picture_Name;
  unsigned int  currentlevel;
  int           active;
  int           position;
  char          levels;
} TRoller;

TRoller Tunner;

void Roll_Roller(TRoller *Roller, char dir, char step);
void Draw_Picture(TRoller *Image, int line, int xcoo, int ycoo);
char Roll_Get_Level(TRoller *Roller);
void Ethernet_Message(char *text);

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
char roller_old_level = 0xFF;
void MyBoxOnPress(TRoller *Roller){
int delta;
char dir, step;
  // if the roller was pressed for first Time save position and exit
  if ((Roll_Flag == 0) || (Roll_Flag == 2)){
    Roll_Flag = 1;
    OldYcoo = Ycoord;
    return;
  }
  // calculate difference in vertical axis and get direction
  delta = Ycoord - OldYcoo;
  if (delta >= 0){
    dir = 0;
  }
  if (delta < 0){
    dir = 1;
    delta = - delta;
  }
  // if difference is too small exit
  if (delta < 6)
    return;

  // set rolling step
  step = 6;

  Roll_Roller(Roller, dir, step);
  Sound_Play( 500, 5);
  // save latest vertical position
  OldYcoo = Ycoord;
  OldDelta = 0;
}

const unsigned int table2[] = {255, 255, 250, 250, 245, 240, 235, 225, 220, 215, 210, 205, 200, 195, 190, 185, 180, 175, 170, 165, 160, 155, 150, 145, 140, 135, 130, 125, 120, 115, 110, 105, 100, 96, 92, 88, 84, 80, 76, 72, 68,
                               64, 60, 56, 52, 48, 44, 30, 27, 24, 21, 18, 15, 12, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                             };

const unsigned int *pFilter;
char color_level;
unsigned int old_color, old_grad_color = 0xFFFF;
/*******************************************************************************
* Function Get_Gradient_Color(unsigned int color, char count)
* ------------------------------------------------------------------------------
* Overview: gradients color towards black color depending on count factor [0..255]
* Input: pointer to roller, desired line of roller picture, coordinates where it should be drawn
* Output: Nothing
*******************************************************************************/
unsigned int Get_Gradient_Color(unsigned int color, char count){
char red_part, blue_part, green_part;
char red_grad, blue_grad, green_grad;
unsigned int color_part;

  if (color_level == 0)
    return color;

  if (color == old_color)
    return old_grad_color;
  old_color = color;

  TFT_Color16bitToRGB(color & 0xFFDF, &red_part, &green_part, &blue_part);
  red_grad = red_part - ((unsigned int)color_level * red_part) / 256;
  blue_grad = blue_part - ((unsigned int)color_level * blue_part) / 256;
  green_grad = green_part - ((unsigned int)color_level * green_part) / 256;

  old_grad_color = TFT_RGBToColor16bit(red_grad, green_grad, blue_grad);

  return old_grad_color;
}

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
    TFT_Write_Data_Ptr(Get_Gradient_Color(color, color_level));
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
signed int i;
int temp;

  for (i = 0; i < (Image->Height)/2; i ++){
    color_level = table2[i];
    temp = line; // - table[i];

    if ((temp) > (signed int)(Image->ImageHeight - 1))
      temp = temp - Image->ImageHeight - 1;
    if (temp < 0)
      temp = Image->ImageHeight - 1 + temp;

    old_color = 0xFFFF;
    DrawPictureLine(Image, temp, xcoo, ycoo);
    line ++;
    ycoo ++;
  }
  color_level = 0;
  for (i = (Image->Height)/2; i >= 0; i --){
    color_level = table2[i];
    temp = line; // + table[i];

    if (temp > (signed int)(Image->ImageHeight - 1))
      temp = temp - Image->ImageHeight - 1;
    if (temp < 0)
      temp = Image->ImageHeight - 1 + temp;

    old_color = 0xFFFF;
    DrawPictureLine(Image, temp, xcoo, ycoo);
    line ++;
    ycoo ++;
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
  Roller->currentlevel = Roller->position / (Roller->ImageHeight / Roller->levels);

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
  temp = (long)pos * Roller->ImageHeight / Roller->levels + Roller->ImageHeight / Roller->levels / 2;
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
* Function Roller_Init()
* ------------------------------------------------------------------------------
* Overview: Function sets default values for rollers
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Roller_Init(){
  Tunner.Left = 411;
  Tunner.Top  = 0;
  Tunner.Width = 69;
  Tunner.Height = 272;
  Tunner.ImageHeight = 1320;
  Tunner.active = 0;
  Tunner.Picture_Name = tunner_stripe_3_bmp;
  Tunner.position = 1320 / 2 / 220;
  Tunner.levels = 220;
  Tunner.currentlevel = 0;

  Draw_Picture(&Tunner, Tunner.position - Tunner.Height/2, Tunner.Left, Tunner.Top);
}

/*******************************************************************************
* Function AmPmRun()
* ------------------------------------------------------------------------------
* Overview: Function should be run on appropriate roller press
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void TunnerRun(){
  // run roller
  MyBoxOnPress(&Tunner);
  Tunner.active = 1;
}

/*******************************************************************************
* Function RTC_Example_init()
* ------------------------------------------------------------------------------
* Overview: Function initializes RTC example (sets default possitions and values)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Tunner_Init(){
  Roller_Init();
  Roll_Set_Level(&Tunner, 0);
}

/*******************************************************************************
* Function doRTC_Example()
* ------------------------------------------------------------------------------
* Overview: Function should be called from main while loop when no press is detected
* Input: Nothing
* Output: returns level on which the roller stoped
*******************************************************************************/
char doTunner(){
char level;
  // reset roll flag
  Roll_Flag = 0;
  // if roller is active and released set it to nearest possition
  if (Tunner.active){
    level = Roll_Get_Level(&Tunner);
    Set_Roller(&Tunner, level, 3);
    Tunner.active = 0;
  }
  return Tunner.currentlevel;
}

extern char channel_offset;
void Set_Tunner(int channel){
char level;

  level = (channel - 875) + channel_offset;
  Set_Roller(&Tunner, level, 24);
}