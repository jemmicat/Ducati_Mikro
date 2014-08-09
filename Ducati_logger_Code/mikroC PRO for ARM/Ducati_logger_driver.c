#include "Ducati_logger_objects.h"
#include "Ducati_logger_resources.h"
#include "built_in.h"

// Extern memory interface
// MMC/SD Connections
sbit Mmc_Chip_Select           at GPIOD_ODR.B3;
// end of MMC/SD
// TFT Get Data globals
char Ext_Data_Buffer[512];
unsigned long currentSector = -1, res_file_size;
// end of TFT Get Data
// End of extern memory interface


// TFT module connections
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RST at GPIOF_ODR.B14;
sbit TFT_RS at GPIOF_ODR.B15;
sbit TFT_CS at GPIOF_ODR.B13;
sbit TFT_RD at GPIOF_ODR.B12;
sbit TFT_WR at GPIOF_ODR.B11;
sbit TFT_BLED at GPIOF_ODR.B10;
// End TFT module connections


// Global variables
unsigned int Xcoord, Ycoord;
char PenDown;
typedef unsigned long TPointer;
TPointer PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TImage *local_image;
TImage *exec_image;
int image_order;
TCImage *local_cimage;
TCImage *exec_cimage;
int cimage_order;
TCircle *local_circle;
TCircle *exec_circle;
int circle_order;
TCircleButton *local_circle_button;
TCircleButton *exec_circle_button;
int circle_button_order;
TBox *local_box;
TBox *exec_box;
int box_order;
TCBox *local_cbox;
TCBox *exec_cbox;
int cbox_order;


void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
  unsigned int temp;
  temp = GPIOE_ODR;
  temp &= 0x00FF;
  GPIOE_ODR = temp | (_hi << 8);
  temp = GPIOG_ODR;
  temp &= 0xFF00;
  GPIOG_ODR = temp | _lo;
}

 void Set_Index(unsigned short index) {
  TFT_RS = 0;
  Write_to_Data_Lines(0, index);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void Write_Command(unsigned short cmd) {
  TFT_RS = 1;
  Write_to_Data_Lines(0, cmd);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void Write_Data(unsigned int _data) {
  TFT_RS = 1;
  Write_to_Data_Lines(Hi(_data), Lo(_data));
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}


char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
unsigned long start_sector;
unsigned int fpos;

  start_sector = Mmc_Get_File_Write_Sector() + offset/512;
  fpos = (unsigned long)offset%512;

  if(start_sector == currentSector+1) {
    Mmc_Multi_Read_Sector(Ext_Data_Buffer);
    currentSector = start_sector;
  } else if (start_sector != currentSector) {
    if(currentSector != -1)
      Mmc_Multi_Read_Stop();
    Mmc_Multi_Read_Start(start_sector);
    Mmc_Multi_Read_Sector(Ext_Data_Buffer);
    currentSector = start_sector;
  }

  if(count>512-fpos)
    *num = 512-fpos;
  else
    *num = count;

  return Ext_Data_Buffer+fpos;
}
static void InitializeTouchPanel() {
  TFT_Set_Active(Set_Index, Write_Command, Write_Data);
  TFT_Init_SSD1963(480, 272);
  TFT_Set_Ext_Buffer(TFT_Get_Data);


  PenDown = 0;
  PressedObject = 0;
  PressedObjectType = -1;
}

void Calibrate() {
  TFT_Fill_Screen(CL_BLACK);
  TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
  TFT_Write_Text("Touch points on the screen as they", 125, 121);
  TFT_Write_Text("appear to calibrate touchscreen.", 135, 151);
  STMPE610_ClearInterruptFlagsAndFIFO();
  TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
  TFT_Circle(0, 0, 3);
  STMPE610_CalibratePoint(STMPE610_FIRST_CORNER);
  Delay_ms(500);
  TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
  TFT_Circle(0, 0, 3);
  STMPE610_ClearInterruptFlagsAndFIFO();
  TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
  TFT_Circle(0, TFT_DISP_HEIGHT-1, 3);
  STMPE610_CalibratePoint(STMPE610_SECOND_CORNER);
  Delay_ms(500);
  TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
  TFT_Circle(0, TFT_DISP_HEIGHT-1, 3);
  STMPE610_ClearInterruptFlagsAndFIFO();
  TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
  TFT_Circle(TFT_DISP_WIDTH-1, TFT_DISP_HEIGHT-1, 3);
  STMPE610_CalibratePoint(STMPE610_THIRD_CORNER);
  Delay_ms(500);
  TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
  TFT_Circle(TFT_DISP_WIDTH-1, TFT_DISP_HEIGHT-1, 3);
  STMPE610_ClearInterruptFlagsAndFIFO();
  TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
  TFT_Circle(TFT_DISP_WIDTH-1, 0, 3);
  STMPE610_CalibratePoint(STMPE610_FOURTH_CORNER);
  TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
  TFT_Circle(TFT_DISP_WIDTH-1, 0, 3);
  Delay_ms(500);
}


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                Boot;
  TImage               Image1;
  TImage               Image2;
  TImage               Image10;
  TImage               Image11;
  TImage               Image12;
  TImage               Image16;
  TImage               Image17;
  TImage               Image21;
  TImage               Image22;
  TImage               Image23;
  TImage               Image24;
  TImage               Image25;
  TImage               Image26;
  TImage               Image27;
  TImage               Image28;
  TImage               Image29;
  TImage               Image30;
  TImage               Image31;
  TImage               Image32;
  TImage               Image33;
  TImage               Image34;
  TImage               Image35;
  TImage               Image36;
  TImage               Image37;
  TImage               Image38;
  TImage               Image39;
  TImage                 * const code Screen1_Images[26]=
         {
         &Image1,              
         &Image2,              
         &Image10,             
         &Image11,             
         &Image12,             
         &Image16,             
         &Image17,             
         &Image21,             
         &Image22,             
         &Image23,             
         &Image24,             
         &Image25,             
         &Image26,             
         &Image27,             
         &Image28,             
         &Image29,             
         &Image30,             
         &Image31,             
         &Image32,             
         &Image33,             
         &Image34,             
         &Image35,             
         &Image36,             
         &Image37,             
         &Image38,             
         &Image39              
         };

  TScreen                Speedometer_graphics;
  TCImage               Image13 = 
         {
         &Speedometer_graphics , //   Image13.OwnerScreen
         0                     , //   Image13.Order          
         0                     , //   Image13.Left           
         0                     , //   Image13.Top            
         480                   , //   Image13.Width          
         272                   , //   Image13.Height         
         speedometer_background_bmp, //   Image13.Picture_Name  
         1                     , //   Image13.Visible      
         1                     , //   Image13.Active         
         0                     , //   Image13.Picture_Type        
         1                     , //   Image13.Picture_Ratio       
         0                     , //   Image13.OnUpPtr
         0                     , //   Image13.OnDownPtr
         0                     , //   Image13.OnClickPtr
         0                       //   Image13.OnPressPtr
         };
  TLabel                 Label19;
char Label19_Caption[9] = "12:56 AM";

  TImage               Image15;
  TImage               Image3;
  TImage               Image4;
  TImage               Image5;
  TImage               Image6;
  TImage               Image7;
  TImage               Image8;
  TImage               Image9;
  TLabel                 Label10;
char Label10_Caption[12] = "78.5°F";

  TLabel                 Label11;
char Label11_Caption[12] = "78.5°F";

  TCircleButton          CircleButton1;
char CircleButton1_Caption[1] = "";

  TLabel                 Label12;
char Label12_Caption[4] = "RPM";

  TLabel                 Label13;
char Label13_Caption[6] = "12000";

  TBox                   Box2;
  TLabel                 Label14;
char Label14_Caption[10] = "Lean Ang.";

  TLabel                 Label15;
char Label15_Caption[8] = "LOGGING";

  TLabel                 Label16;
char Label16_Caption[6] = "00000";

  TLabel                 Label17;
char Label17_Caption[2] = "N";

  TLine                  Line1;
  TLabel                 Label18;
char Label18_Caption[2] = "N";

  TButton_Round          ButtonRound8;
char ButtonRound8_Caption[4] = "Log";

  TButton_Round          * const code Screen2_Buttons_Round[1]=
         {
         &ButtonRound8         
         };
  TLabel                 * const code Screen2_Labels[10]=
         {
         &Label19,             
         &Label10,             
         &Label11,             
         &Label12,             
         &Label13,             
         &Label14,             
         &Label15,             
         &Label16,             
         &Label17,             
         &Label18              
         };
  TImage                 * const code Screen2_Images[8]=
         {
         &Image15,             
         &Image3,              
         &Image4,              
         &Image5,              
         &Image6,              
         &Image7,              
         &Image8,              
         &Image9               
         };
  TCImage                * const code Screen2_CImages[1]=
         {
         &Image13              
         };
  TCircleButton          * const code Screen2_CircleButtons[1]=
         {
         &CircleButton1        
         };
  TBox                   * const code Screen2_Boxes[1]=
         {
         &Box2                 
         };
  TLine                  * const code Screen2_Lines[1]=
         {
         &Line1                
         };

  TScreen                Tachometer_graphics;
  TCImage               Image14 = 
         {
         &Tachometer_graphics  , //   Image14.OwnerScreen
         0                     , //   Image14.Order          
         0                     , //   Image14.Left           
         0                     , //   Image14.Top            
         480                   , //   Image14.Width          
         272                   , //   Image14.Height         
         tachometer_background_bmp, //   Image14.Picture_Name  
         1                     , //   Image14.Visible      
         1                     , //   Image14.Active         
         0                     , //   Image14.Picture_Type        
         1                     , //   Image14.Picture_Ratio       
         0                     , //   Image14.OnUpPtr
         0                     , //   Image14.OnDownPtr
         0                     , //   Image14.OnClickPtr
         0                       //   Image14.OnPressPtr
         };
  TImage               Image40;
  TImage               Image41;
  TImage               Image42;
  TImage               Image43;
  TImage               Image44;
  TImage               Image45;
  TLabel                 Label20;
char Label20_Caption[4] = "MPH";

  TLabel                 Label21;
char Label21_Caption[4] = "100";

  TLabel                 Label22;
char Label22_Caption[12] = "78.5°F";

  TBox                   Box12;
  TLabel                 Label23;
char Label23_Caption[11] = "Lean Angle";

  TImage               Image46;
  TButton_Round          ButtonRound9;
char ButtonRound9_Caption[4] = "Log";

  TLabel                 Label24;
char Label24_Caption[12] = "78.5°F";

  TLabel                 Label25;
char Label25_Caption[9] = "12:56 AM";

  TImage               Image47;
  TLabel                 Label26;
char Label26_Caption[8] = "LOGGING";

  TLabel                 Label27;
char Label27_Caption[6] = "00000";

  TLabel                 Label28;
char Label28_Caption[2] = "N";

  TCircleButton          CircleButton2;
char CircleButton2_Caption[1] = "";

  TLine                  Line2;
  TLabel                 Label29;
char Label29_Caption[2] = "N";

  TCircle                Circle1;
  TButton_Round          * const code Screen3_Buttons_Round[1]=
         {
         &ButtonRound9         
         };
  TLabel                 * const code Screen3_Labels[10]=
         {
         &Label20,             
         &Label21,             
         &Label22,             
         &Label23,             
         &Label24,             
         &Label25,             
         &Label26,             
         &Label27,             
         &Label28,             
         &Label29              
         };
  TImage                 * const code Screen3_Images[8]=
         {
         &Image40,             
         &Image41,             
         &Image42,             
         &Image43,             
         &Image44,             
         &Image45,             
         &Image46,             
         &Image47              
         };
  TCImage                * const code Screen3_CImages[1]=
         {
         &Image14              
         };
  TCircle                * const code Screen3_Circles[1]=
         {
         &Circle1              
         };
  TCircleButton          * const code Screen3_CircleButtons[1]=
         {
         &CircleButton2        
         };
  TBox                   * const code Screen3_Boxes[1]=
         {
         &Box12                
         };
  TLine                  * const code Screen3_Lines[1]=
         {
         &Line2                
         };

  TScreen                Settings;
  TCBox                Box1 = 
         {
         &Settings             , //   Box1.OwnerScreen
         0                     , //   Box1.Order           
         0                     , //   Box1.Left           
         0                     , //   Box1.Top             
         480                   , //   Box1.Width           
         272                   , //   Box1.Height          
         1                     , //   Box1.Pen_Width       
         0x0000                , //   Box1.Pen_Color       
         1                     , //   Box1.Visible         
         1                     , //   Box1.Active          
         1                     , //   Box1.Transparent     
         1                     , //   Box1.Gradient        
         0                     , //   Box1.Gradient_Orientation    
         0xF800                , //   Box1.Gradient_Start_Color    
         0x0000                , //   Box1.Gradient_End_Color      
         0xF800                , //   Box1.Color           
         0                     , //   Box1.PressColEnabled 
         0xE71C                , //   Box1.Press_Color     
         0                     , //   Box1.OnUpPtr
         0                     , //   Box1.OnDownPtr
         0                     , //   Box1.OnClickPtr
         0                       //   Box1.OnPressPtr
         };
  TButton_Round          ButtonRound1;
char ButtonRound1_Caption[10] = "Set Clock";

  TButton_Round          ButtonRound2;
char ButtonRound2_Caption[19] = "Accelerometer Test";

  TButton_Round          ButtonRound3;
char ButtonRound3_Caption[9] = "GPS Test";

  TButton_Round          ButtonRound4;
char ButtonRound4_Caption[18] = "Magnetometer Test";

  TButton_Round          ButtonRound5;
char ButtonRound5_Caption[21] = "Pressure Sensor Test";

  TButton_Round          ButtonRound6;
char ButtonRound6_Caption[10] = "Gyro Test";

  TButton_Round          ButtonRound7;
char ButtonRound7_Caption[22] = "Calibrate Touchscreen";

  TImage               Image48;
  TLabel                 Label30;
char Label30_Caption[9] = "12:56 AM";

  TBox                   Box17;
  TImage               Image51;
  TLabel                 Label73;
char Label73_Caption[5] = "Done";

  TButton_Round          * const code Screen4_Buttons_Round[7]=
         {
         &ButtonRound1,        
         &ButtonRound2,        
         &ButtonRound3,        
         &ButtonRound4,        
         &ButtonRound5,        
         &ButtonRound6,        
         &ButtonRound7         
         };
  TLabel                 * const code Screen4_Labels[2]=
         {
         &Label30,             
         &Label73              
         };
  TImage                 * const code Screen4_Images[2]=
         {
         &Image48,             
         &Image51              
         };
  TBox                   * const code Screen4_Boxes[1]=
         {
         &Box17                
         };
  TCBox                  * const code Screen4_CBoxes[1]=
         {
         &Box1                 
         };

  TScreen                Set_clock;
  TBox                   Box7;
  TBox                   Box8;
  TLabel                 Label2;
char Label2_Caption[2] = ":";

  TBox                   Box10;
  TBox                   Box11;
  TLabel                 Label5;
char Label5_Caption[5] = "Done";

  TImage               Image18;
  TBox                   Box3;
  TBox                   Box4;
  TImage               Image19;
  TLabel                 Label6;
char Label6_Caption[51] = " ";

  TImage               Image20;
  TBox                   Box5;
  TLabel                 * const code Screen5_Labels[3]=
         {
         &Label2,              
         &Label5,              
         &Label6               
         };
  TImage                 * const code Screen5_Images[3]=
         {
         &Image18,             
         &Image19,             
         &Image20              
         };
  TBox                   * const code Screen5_Boxes[7]=
         {
         &Box7,                
         &Box8,                
         &Box10,               
         &Box11,               
         &Box3,                
         &Box4,                
         &Box5                 
         };

  TScreen                Accelerometer_test;
  TBox                   Box23;
  TBox                   Box6;
  TImage               Image49;
  TLabel                 Label1;
char Label1_Caption[20] = "Accelerometer Graph";

  TLabel                 Label3;
char Label3_Caption[4] = "X: ";

  TLabel                 Label4;
char Label4_Caption[4] = "Y: ";

  TLabel                 Label7;
char Label7_Caption[4] = "Z: ";

  TLabel                 * const code Screen6_Labels[4]=
         {
         &Label1,              
         &Label3,              
         &Label4,              
         &Label7               
         };
  TImage                 * const code Screen6_Images[1]=
         {
         &Image49              
         };
  TBox                   * const code Screen6_Boxes[2]=
         {
         &Box23,               
         &Box6                 
         };

  TScreen                GPS_Test;
  TBox                   Box9;
  TBox                   Box16;
  TImage               Image50;
  TLabel                 Label32;
char Label32_Caption[5] = "Done";

  TLabel                 Label53;
char Label53_Caption[10] = "Latitude:";

  TLabel                 Label54;
char Label54_Caption[5] = "0000";

  TLabel                 Label55;
char Label55_Caption[5] = "0000";

  TLabel                 Label56;
char Label56_Caption[2] = ".";

  TLabel                 Label57;
char Label57_Caption[11] = "Longitude:";

  TLabel                 Label58;
char Label58_Caption[5] = "0000";

  TLabel                 Label59;
char Label59_Caption[5] = "0000";

  TLabel                 Label60;
char Label60_Caption[2] = ".";

  TLabel                 Label61;
char Label61_Caption[7] = "Speed:";

  TLabel                 Label62;
char Label62_Caption[5] = "0000";

  TLabel                 Label63;
char Label63_Caption[5] = "0000";

  TLabel                 Label64;
char Label64_Caption[2] = ".";

  TLabel                 Label65;
char Label65_Caption[8] = "Height:";

  TLabel                 Label66;
char Label66_Caption[5] = "0000";

  TLabel                 Label67;
char Label67_Caption[5] = "0000";

  TLabel                 Label68;
char Label68_Caption[2] = ".";

  TLabel                 Label69;
char Label69_Caption[6] = "Time:";

  TLabel                 Label70;
char Label70_Caption[5] = "0000";

  TLabel                 Label71;
char Label71_Caption[5] = "0000";

  TLabel                 Label72;
char Label72_Caption[2] = ".";

  TLabel                 * const code Screen7_Labels[21]=
         {
         &Label32,             
         &Label53,             
         &Label54,             
         &Label55,             
         &Label56,             
         &Label57,             
         &Label58,             
         &Label59,             
         &Label60,             
         &Label61,             
         &Label62,             
         &Label63,             
         &Label64,             
         &Label65,             
         &Label66,             
         &Label67,             
         &Label68,             
         &Label69,             
         &Label70,             
         &Label71,             
         &Label72              
         };
  TImage                 * const code Screen7_Images[1]=
         {
         &Image50              
         };
  TBox                   * const code Screen7_Boxes[2]=
         {
         &Box9,                
         &Box16                
         };

  TScreen                Gyro_test;
  TBox                   Box13;
  TBox                   Box14;
  TImage               Image52;
  TLabel                 Label8;
char Label8_Caption[11] = "Gyro Graph";

  TLabel                 Label9;
char Label9_Caption[4] = "X: ";

  TLabel                 Label31;
char Label31_Caption[4] = "Y: ";

  TLabel                 Label33;
char Label33_Caption[4] = "Z: ";

  TLabel                 * const code Screen8_Labels[4]=
         {
         &Label8,              
         &Label9,              
         &Label31,             
         &Label33              
         };
  TImage                 * const code Screen8_Images[1]=
         {
         &Image52              
         };
  TBox                   * const code Screen8_Boxes[2]=
         {
         &Box13,               
         &Box14                
         };

  TScreen                Magnetometer_test;
  TBox                   Box15;
  TBox                   Box18;
  TImage               Image53;
  TLabel                 Label34;
char Label34_Caption[19] = "Magnetometer Graph";

  TLabel                 Label35;
char Label35_Caption[4] = "X: ";

  TLabel                 Label36;
char Label36_Caption[4] = "Y: ";

  TLabel                 Label37;
char Label37_Caption[4] = "Z: ";

  TLabel                 * const code Screen9_Labels[4]=
         {
         &Label34,             
         &Label35,             
         &Label36,             
         &Label37              
         };
  TImage                 * const code Screen9_Images[1]=
         {
         &Image53              
         };
  TBox                   * const code Screen9_Boxes[2]=
         {
         &Box15,               
         &Box18                
         };

  TScreen                Pressure_test;
  TBox                   Box19;
  TBox                   Box20;
  TImage               Image54;
  TLabel                 Label38;
char Label38_Caption[22] = "Pressure Sensor Graph";

  TLabel                 Label39;
char Label39_Caption[4] = "X: ";

  TLabel                 Label40;
char Label40_Caption[4] = "Y: ";

  TLabel                 Label41;
char Label41_Caption[4] = "Z: ";

  TLabel                 * const code Screen10_Labels[4]=
         {
         &Label38,             
         &Label39,             
         &Label40,             
         &Label41              
         };
  TImage                 * const code Screen10_Images[1]=
         {
         &Image54              
         };
  TBox                   * const code Screen10_Boxes[2]=
         {
         &Box19,               
         &Box20                
         };

  TScreen                Humidity_test;
  TBox                   Box21;
  TBox                   Box22;
  TImage               Image55;
  TLabel                 Label42;
char Label42_Caption[22] = "Humidity Sensor Graph";

  TLabel                 Label43;
char Label43_Caption[4] = "X: ";

  TLabel                 Label44;
char Label44_Caption[4] = "Y: ";

  TLabel                 Label45;
char Label45_Caption[4] = "Z: ";

  TLabel                 * const code Screen11_Labels[4]=
         {
         &Label42,             
         &Label43,             
         &Label44,             
         &Label45              
         };
  TImage                 * const code Screen11_Images[1]=
         {
         &Image55              
         };
  TBox                   * const code Screen11_Boxes[2]=
         {
         &Box21,               
         &Box22                
         };



static void InitializeObjects() {
  Boot.Color                     = 0x41E6;
  Boot.Width                     = 480;
  Boot.Height                    = 272;
  Boot.Buttons_RoundCount        = 0;
  Boot.LabelsCount               = 0;
  Boot.ImagesCount               = 26;
  Boot.Images                    = Screen1_Images;
  Boot.CImagesCount              = 0;
  Boot.CirclesCount              = 0;
  Boot.CircleButtonsCount        = 0;
  Boot.BoxesCount                = 0;
  Boot.CBoxesCount               = 0;
  Boot.LinesCount                = 0;
  Boot.ObjectsCount              = 26;

  Speedometer_graphics.Color                     = 0x5AEB;
  Speedometer_graphics.Width                     = 480;
  Speedometer_graphics.Height                    = 272;
  Speedometer_graphics.Buttons_RoundCount        = 1;
  Speedometer_graphics.Buttons_Round             = Screen2_Buttons_Round;
  Speedometer_graphics.LabelsCount               = 10;
  Speedometer_graphics.Labels                    = Screen2_Labels;
  Speedometer_graphics.ImagesCount               = 8;
  Speedometer_graphics.Images                    = Screen2_Images;
  Speedometer_graphics.CImagesCount              = 1;
  Speedometer_graphics.CImages                   = Screen2_CImages;
  Speedometer_graphics.CirclesCount              = 0;
  Speedometer_graphics.CircleButtonsCount        = 1;
  Speedometer_graphics.CircleButtons             = Screen2_CircleButtons;
  Speedometer_graphics.BoxesCount                = 1;
  Speedometer_graphics.Boxes                     = Screen2_Boxes;
  Speedometer_graphics.CBoxesCount               = 0;
  Speedometer_graphics.LinesCount                = 1;
  Speedometer_graphics.Lines                     = Screen2_Lines;
  Speedometer_graphics.ObjectsCount              = 23;

  Tachometer_graphics.Color                     = 0x5AEB;
  Tachometer_graphics.Width                     = 480;
  Tachometer_graphics.Height                    = 272;
  Tachometer_graphics.Buttons_RoundCount        = 1;
  Tachometer_graphics.Buttons_Round             = Screen3_Buttons_Round;
  Tachometer_graphics.LabelsCount               = 10;
  Tachometer_graphics.Labels                    = Screen3_Labels;
  Tachometer_graphics.ImagesCount               = 8;
  Tachometer_graphics.Images                    = Screen3_Images;
  Tachometer_graphics.CImagesCount              = 1;
  Tachometer_graphics.CImages                   = Screen3_CImages;
  Tachometer_graphics.CirclesCount              = 1;
  Tachometer_graphics.Circles                   = Screen3_Circles;
  Tachometer_graphics.CircleButtonsCount        = 1;
  Tachometer_graphics.CircleButtons             = Screen3_CircleButtons;
  Tachometer_graphics.BoxesCount                = 1;
  Tachometer_graphics.Boxes                     = Screen3_Boxes;
  Tachometer_graphics.CBoxesCount               = 0;
  Tachometer_graphics.LinesCount                = 1;
  Tachometer_graphics.Lines                     = Screen3_Lines;
  Tachometer_graphics.ObjectsCount              = 24;

  Settings.Color                     = 0x5AEB;
  Settings.Width                     = 480;
  Settings.Height                    = 272;
  Settings.Buttons_RoundCount        = 7;
  Settings.Buttons_Round             = Screen4_Buttons_Round;
  Settings.LabelsCount               = 2;
  Settings.Labels                    = Screen4_Labels;
  Settings.ImagesCount               = 2;
  Settings.Images                    = Screen4_Images;
  Settings.CImagesCount              = 0;
  Settings.CirclesCount              = 0;
  Settings.CircleButtonsCount        = 0;
  Settings.BoxesCount                = 1;
  Settings.Boxes                     = Screen4_Boxes;
  Settings.CBoxesCount               = 1;
  Settings.CBoxes                    = Screen4_CBoxes;
  Settings.LinesCount                = 0;
  Settings.ObjectsCount              = 13;

  Set_clock.Color                     = 0x0000;
  Set_clock.Width                     = 480;
  Set_clock.Height                    = 272;
  Set_clock.Buttons_RoundCount        = 0;
  Set_clock.LabelsCount               = 3;
  Set_clock.Labels                    = Screen5_Labels;
  Set_clock.ImagesCount               = 3;
  Set_clock.Images                    = Screen5_Images;
  Set_clock.CImagesCount              = 0;
  Set_clock.CirclesCount              = 0;
  Set_clock.CircleButtonsCount        = 0;
  Set_clock.BoxesCount                = 7;
  Set_clock.Boxes                     = Screen5_Boxes;
  Set_clock.CBoxesCount               = 0;
  Set_clock.LinesCount                = 0;
  Set_clock.ObjectsCount              = 13;

  Accelerometer_test.Color                     = 0x5AEB;
  Accelerometer_test.Width                     = 480;
  Accelerometer_test.Height                    = 272;
  Accelerometer_test.Buttons_RoundCount        = 0;
  Accelerometer_test.LabelsCount               = 4;
  Accelerometer_test.Labels                    = Screen6_Labels;
  Accelerometer_test.ImagesCount               = 1;
  Accelerometer_test.Images                    = Screen6_Images;
  Accelerometer_test.CImagesCount              = 0;
  Accelerometer_test.CirclesCount              = 0;
  Accelerometer_test.CircleButtonsCount        = 0;
  Accelerometer_test.BoxesCount                = 2;
  Accelerometer_test.Boxes                     = Screen6_Boxes;
  Accelerometer_test.CBoxesCount               = 0;
  Accelerometer_test.LinesCount                = 0;
  Accelerometer_test.ObjectsCount              = 7;

  GPS_Test.Color                     = 0x5AEB;
  GPS_Test.Width                     = 480;
  GPS_Test.Height                    = 272;
  GPS_Test.Buttons_RoundCount        = 0;
  GPS_Test.LabelsCount               = 21;
  GPS_Test.Labels                    = Screen7_Labels;
  GPS_Test.ImagesCount               = 1;
  GPS_Test.Images                    = Screen7_Images;
  GPS_Test.CImagesCount              = 0;
  GPS_Test.CirclesCount              = 0;
  GPS_Test.CircleButtonsCount        = 0;
  GPS_Test.BoxesCount                = 2;
  GPS_Test.Boxes                     = Screen7_Boxes;
  GPS_Test.CBoxesCount               = 0;
  GPS_Test.LinesCount                = 0;
  GPS_Test.ObjectsCount              = 24;

  Gyro_test.Color                     = 0x5AEB;
  Gyro_test.Width                     = 480;
  Gyro_test.Height                    = 272;
  Gyro_test.Buttons_RoundCount        = 0;
  Gyro_test.LabelsCount               = 4;
  Gyro_test.Labels                    = Screen8_Labels;
  Gyro_test.ImagesCount               = 1;
  Gyro_test.Images                    = Screen8_Images;
  Gyro_test.CImagesCount              = 0;
  Gyro_test.CirclesCount              = 0;
  Gyro_test.CircleButtonsCount        = 0;
  Gyro_test.BoxesCount                = 2;
  Gyro_test.Boxes                     = Screen8_Boxes;
  Gyro_test.CBoxesCount               = 0;
  Gyro_test.LinesCount                = 0;
  Gyro_test.ObjectsCount              = 7;

  Magnetometer_test.Color                     = 0x5AEB;
  Magnetometer_test.Width                     = 480;
  Magnetometer_test.Height                    = 272;
  Magnetometer_test.Buttons_RoundCount        = 0;
  Magnetometer_test.LabelsCount               = 4;
  Magnetometer_test.Labels                    = Screen9_Labels;
  Magnetometer_test.ImagesCount               = 1;
  Magnetometer_test.Images                    = Screen9_Images;
  Magnetometer_test.CImagesCount              = 0;
  Magnetometer_test.CirclesCount              = 0;
  Magnetometer_test.CircleButtonsCount        = 0;
  Magnetometer_test.BoxesCount                = 2;
  Magnetometer_test.Boxes                     = Screen9_Boxes;
  Magnetometer_test.CBoxesCount               = 0;
  Magnetometer_test.LinesCount                = 0;
  Magnetometer_test.ObjectsCount              = 7;

  Pressure_test.Color                     = 0x5AEB;
  Pressure_test.Width                     = 480;
  Pressure_test.Height                    = 272;
  Pressure_test.Buttons_RoundCount        = 0;
  Pressure_test.LabelsCount               = 4;
  Pressure_test.Labels                    = Screen10_Labels;
  Pressure_test.ImagesCount               = 1;
  Pressure_test.Images                    = Screen10_Images;
  Pressure_test.CImagesCount              = 0;
  Pressure_test.CirclesCount              = 0;
  Pressure_test.CircleButtonsCount        = 0;
  Pressure_test.BoxesCount                = 2;
  Pressure_test.Boxes                     = Screen10_Boxes;
  Pressure_test.CBoxesCount               = 0;
  Pressure_test.LinesCount                = 0;
  Pressure_test.ObjectsCount              = 7;

  Humidity_test.Color                     = 0x5AEB;
  Humidity_test.Width                     = 480;
  Humidity_test.Height                    = 272;
  Humidity_test.Buttons_RoundCount        = 0;
  Humidity_test.LabelsCount               = 4;
  Humidity_test.Labels                    = Screen11_Labels;
  Humidity_test.ImagesCount               = 1;
  Humidity_test.Images                    = Screen11_Images;
  Humidity_test.CImagesCount              = 0;
  Humidity_test.CirclesCount              = 0;
  Humidity_test.CircleButtonsCount        = 0;
  Humidity_test.BoxesCount                = 2;
  Humidity_test.Boxes                     = Screen11_Boxes;
  Humidity_test.CBoxesCount               = 0;
  Humidity_test.LinesCount                = 0;
  Humidity_test.ObjectsCount              = 7;


  Image1.OwnerScreen     = &Boot;
  Image1.Order           = 0;
  Image1.Left            = 115;
  Image1.Top             = 0;
  Image1.Width           = 249;
  Image1.Height          = 263;
  Image1.Picture_Type    = 1;
  Image1.Picture_Ratio   = 1;
  Image1.Picture_Name    = logo00_jpg;
  Image1.Visible         = 1;
  Image1.Active          = 1;
  Image1.OnUpPtr         = 0;
  Image1.OnDownPtr       = 0;
  Image1.OnClickPtr      = 0;
  Image1.OnPressPtr      = 0;

  Image2.OwnerScreen     = &Boot;
  Image2.Order           = 1;
  Image2.Left            = 115;
  Image2.Top             = 0;
  Image2.Width           = 249;
  Image2.Height          = 263;
  Image2.Picture_Type    = 1;
  Image2.Picture_Ratio   = 1;
  Image2.Picture_Name    = logo01_jpg;
  Image2.Visible         = 1;
  Image2.Active          = 1;
  Image2.OnUpPtr         = 0;
  Image2.OnDownPtr       = 0;
  Image2.OnClickPtr      = 0;
  Image2.OnPressPtr      = 0;

  Image10.OwnerScreen     = &Boot;
  Image10.Order           = 2;
  Image10.Left            = 115;
  Image10.Top             = 0;
  Image10.Width           = 249;
  Image10.Height          = 263;
  Image10.Picture_Type    = 1;
  Image10.Picture_Ratio   = 1;
  Image10.Picture_Name    = logo02_jpg;
  Image10.Visible         = 1;
  Image10.Active          = 1;
  Image10.OnUpPtr         = 0;
  Image10.OnDownPtr       = 0;
  Image10.OnClickPtr      = 0;
  Image10.OnPressPtr      = 0;

  Image11.OwnerScreen     = &Boot;
  Image11.Order           = 3;
  Image11.Left            = 115;
  Image11.Top             = 0;
  Image11.Width           = 249;
  Image11.Height          = 263;
  Image11.Picture_Type    = 1;
  Image11.Picture_Ratio   = 1;
  Image11.Picture_Name    = logo03_jpg;
  Image11.Visible         = 1;
  Image11.Active          = 1;
  Image11.OnUpPtr         = 0;
  Image11.OnDownPtr       = 0;
  Image11.OnClickPtr      = 0;
  Image11.OnPressPtr      = 0;

  Image12.OwnerScreen     = &Boot;
  Image12.Order           = 4;
  Image12.Left            = 115;
  Image12.Top             = 0;
  Image12.Width           = 249;
  Image12.Height          = 263;
  Image12.Picture_Type    = 1;
  Image12.Picture_Ratio   = 1;
  Image12.Picture_Name    = logo04_jpg;
  Image12.Visible         = 1;
  Image12.Active          = 1;
  Image12.OnUpPtr         = 0;
  Image12.OnDownPtr       = 0;
  Image12.OnClickPtr      = 0;
  Image12.OnPressPtr      = 0;

  Image16.OwnerScreen     = &Boot;
  Image16.Order           = 5;
  Image16.Left            = 115;
  Image16.Top             = 0;
  Image16.Width           = 249;
  Image16.Height          = 263;
  Image16.Picture_Type    = 1;
  Image16.Picture_Ratio   = 1;
  Image16.Picture_Name    = logo05_jpg;
  Image16.Visible         = 1;
  Image16.Active          = 1;
  Image16.OnUpPtr         = 0;
  Image16.OnDownPtr       = 0;
  Image16.OnClickPtr      = 0;
  Image16.OnPressPtr      = 0;

  Image17.OwnerScreen     = &Boot;
  Image17.Order           = 6;
  Image17.Left            = 115;
  Image17.Top             = 0;
  Image17.Width           = 249;
  Image17.Height          = 263;
  Image17.Picture_Type    = 1;
  Image17.Picture_Ratio   = 1;
  Image17.Picture_Name    = logo06_jpg;
  Image17.Visible         = 1;
  Image17.Active          = 1;
  Image17.OnUpPtr         = 0;
  Image17.OnDownPtr       = 0;
  Image17.OnClickPtr      = 0;
  Image17.OnPressPtr      = 0;

  Image21.OwnerScreen     = &Boot;
  Image21.Order           = 7;
  Image21.Left            = 115;
  Image21.Top             = 0;
  Image21.Width           = 249;
  Image21.Height          = 263;
  Image21.Picture_Type    = 1;
  Image21.Picture_Ratio   = 1;
  Image21.Picture_Name    = logo07_jpg;
  Image21.Visible         = 1;
  Image21.Active          = 1;
  Image21.OnUpPtr         = 0;
  Image21.OnDownPtr       = 0;
  Image21.OnClickPtr      = 0;
  Image21.OnPressPtr      = 0;

  Image22.OwnerScreen     = &Boot;
  Image22.Order           = 8;
  Image22.Left            = 115;
  Image22.Top             = 0;
  Image22.Width           = 249;
  Image22.Height          = 263;
  Image22.Picture_Type    = 1;
  Image22.Picture_Ratio   = 1;
  Image22.Picture_Name    = logo08_jpg;
  Image22.Visible         = 1;
  Image22.Active          = 1;
  Image22.OnUpPtr         = 0;
  Image22.OnDownPtr       = 0;
  Image22.OnClickPtr      = 0;
  Image22.OnPressPtr      = 0;

  Image23.OwnerScreen     = &Boot;
  Image23.Order           = 9;
  Image23.Left            = 115;
  Image23.Top             = 0;
  Image23.Width           = 249;
  Image23.Height          = 263;
  Image23.Picture_Type    = 1;
  Image23.Picture_Ratio   = 1;
  Image23.Picture_Name    = logo09_jpg;
  Image23.Visible         = 1;
  Image23.Active          = 1;
  Image23.OnUpPtr         = 0;
  Image23.OnDownPtr       = 0;
  Image23.OnClickPtr      = 0;
  Image23.OnPressPtr      = 0;

  Image24.OwnerScreen     = &Boot;
  Image24.Order           = 10;
  Image24.Left            = 115;
  Image24.Top             = 0;
  Image24.Width           = 249;
  Image24.Height          = 263;
  Image24.Picture_Type    = 1;
  Image24.Picture_Ratio   = 1;
  Image24.Picture_Name    = logo10_jpg;
  Image24.Visible         = 1;
  Image24.Active          = 1;
  Image24.OnUpPtr         = 0;
  Image24.OnDownPtr       = 0;
  Image24.OnClickPtr      = 0;
  Image24.OnPressPtr      = 0;

  Image25.OwnerScreen     = &Boot;
  Image25.Order           = 11;
  Image25.Left            = 115;
  Image25.Top             = 0;
  Image25.Width           = 249;
  Image25.Height          = 263;
  Image25.Picture_Type    = 1;
  Image25.Picture_Ratio   = 1;
  Image25.Picture_Name    = logo11_jpg;
  Image25.Visible         = 1;
  Image25.Active          = 1;
  Image25.OnUpPtr         = 0;
  Image25.OnDownPtr       = 0;
  Image25.OnClickPtr      = 0;
  Image25.OnPressPtr      = 0;

  Image26.OwnerScreen     = &Boot;
  Image26.Order           = 12;
  Image26.Left            = 115;
  Image26.Top             = 0;
  Image26.Width           = 249;
  Image26.Height          = 263;
  Image26.Picture_Type    = 1;
  Image26.Picture_Ratio   = 1;
  Image26.Picture_Name    = logo12_jpg;
  Image26.Visible         = 1;
  Image26.Active          = 1;
  Image26.OnUpPtr         = 0;
  Image26.OnDownPtr       = 0;
  Image26.OnClickPtr      = 0;
  Image26.OnPressPtr      = 0;

  Image27.OwnerScreen     = &Boot;
  Image27.Order           = 13;
  Image27.Left            = 115;
  Image27.Top             = 0;
  Image27.Width           = 249;
  Image27.Height          = 263;
  Image27.Picture_Type    = 1;
  Image27.Picture_Ratio   = 1;
  Image27.Picture_Name    = logo13_jpg;
  Image27.Visible         = 1;
  Image27.Active          = 1;
  Image27.OnUpPtr         = 0;
  Image27.OnDownPtr       = 0;
  Image27.OnClickPtr      = 0;
  Image27.OnPressPtr      = 0;

  Image28.OwnerScreen     = &Boot;
  Image28.Order           = 14;
  Image28.Left            = 115;
  Image28.Top             = 0;
  Image28.Width           = 249;
  Image28.Height          = 263;
  Image28.Picture_Type    = 1;
  Image28.Picture_Ratio   = 1;
  Image28.Picture_Name    = logo14_jpg;
  Image28.Visible         = 1;
  Image28.Active          = 1;
  Image28.OnUpPtr         = 0;
  Image28.OnDownPtr       = 0;
  Image28.OnClickPtr      = 0;
  Image28.OnPressPtr      = 0;

  Image29.OwnerScreen     = &Boot;
  Image29.Order           = 15;
  Image29.Left            = 115;
  Image29.Top             = 0;
  Image29.Width           = 249;
  Image29.Height          = 263;
  Image29.Picture_Type    = 1;
  Image29.Picture_Ratio   = 1;
  Image29.Picture_Name    = logo15_jpg;
  Image29.Visible         = 1;
  Image29.Active          = 1;
  Image29.OnUpPtr         = 0;
  Image29.OnDownPtr       = 0;
  Image29.OnClickPtr      = 0;
  Image29.OnPressPtr      = 0;

  Image30.OwnerScreen     = &Boot;
  Image30.Order           = 16;
  Image30.Left            = 115;
  Image30.Top             = 0;
  Image30.Width           = 249;
  Image30.Height          = 263;
  Image30.Picture_Type    = 1;
  Image30.Picture_Ratio   = 1;
  Image30.Picture_Name    = logo16_jpg;
  Image30.Visible         = 1;
  Image30.Active          = 1;
  Image30.OnUpPtr         = 0;
  Image30.OnDownPtr       = 0;
  Image30.OnClickPtr      = 0;
  Image30.OnPressPtr      = 0;

  Image31.OwnerScreen     = &Boot;
  Image31.Order           = 17;
  Image31.Left            = 115;
  Image31.Top             = 0;
  Image31.Width           = 249;
  Image31.Height          = 263;
  Image31.Picture_Type    = 1;
  Image31.Picture_Ratio   = 1;
  Image31.Picture_Name    = logo17_jpg;
  Image31.Visible         = 1;
  Image31.Active          = 1;
  Image31.OnUpPtr         = 0;
  Image31.OnDownPtr       = 0;
  Image31.OnClickPtr      = 0;
  Image31.OnPressPtr      = 0;

  Image32.OwnerScreen     = &Boot;
  Image32.Order           = 18;
  Image32.Left            = 115;
  Image32.Top             = 0;
  Image32.Width           = 249;
  Image32.Height          = 263;
  Image32.Picture_Type    = 1;
  Image32.Picture_Ratio   = 1;
  Image32.Picture_Name    = logo18_jpg;
  Image32.Visible         = 1;
  Image32.Active          = 1;
  Image32.OnUpPtr         = 0;
  Image32.OnDownPtr       = 0;
  Image32.OnClickPtr      = 0;
  Image32.OnPressPtr      = 0;

  Image33.OwnerScreen     = &Boot;
  Image33.Order           = 19;
  Image33.Left            = 115;
  Image33.Top             = 0;
  Image33.Width           = 249;
  Image33.Height          = 263;
  Image33.Picture_Type    = 1;
  Image33.Picture_Ratio   = 1;
  Image33.Picture_Name    = logo19_jpg;
  Image33.Visible         = 1;
  Image33.Active          = 1;
  Image33.OnUpPtr         = 0;
  Image33.OnDownPtr       = 0;
  Image33.OnClickPtr      = 0;
  Image33.OnPressPtr      = 0;

  Image34.OwnerScreen     = &Boot;
  Image34.Order           = 20;
  Image34.Left            = 115;
  Image34.Top             = 0;
  Image34.Width           = 249;
  Image34.Height          = 263;
  Image34.Picture_Type    = 1;
  Image34.Picture_Ratio   = 1;
  Image34.Picture_Name    = logo20_jpg;
  Image34.Visible         = 1;
  Image34.Active          = 1;
  Image34.OnUpPtr         = 0;
  Image34.OnDownPtr       = 0;
  Image34.OnClickPtr      = 0;
  Image34.OnPressPtr      = 0;

  Image35.OwnerScreen     = &Boot;
  Image35.Order           = 21;
  Image35.Left            = 115;
  Image35.Top             = 0;
  Image35.Width           = 249;
  Image35.Height          = 263;
  Image35.Picture_Type    = 1;
  Image35.Picture_Ratio   = 1;
  Image35.Picture_Name    = logo21_jpg;
  Image35.Visible         = 1;
  Image35.Active          = 1;
  Image35.OnUpPtr         = 0;
  Image35.OnDownPtr       = 0;
  Image35.OnClickPtr      = 0;
  Image35.OnPressPtr      = 0;

  Image36.OwnerScreen     = &Boot;
  Image36.Order           = 22;
  Image36.Left            = 115;
  Image36.Top             = 0;
  Image36.Width           = 249;
  Image36.Height          = 263;
  Image36.Picture_Type    = 1;
  Image36.Picture_Ratio   = 1;
  Image36.Picture_Name    = logo22_jpg;
  Image36.Visible         = 1;
  Image36.Active          = 1;
  Image36.OnUpPtr         = 0;
  Image36.OnDownPtr       = 0;
  Image36.OnClickPtr      = 0;
  Image36.OnPressPtr      = 0;

  Image37.OwnerScreen     = &Boot;
  Image37.Order           = 23;
  Image37.Left            = 115;
  Image37.Top             = 0;
  Image37.Width           = 249;
  Image37.Height          = 263;
  Image37.Picture_Type    = 1;
  Image37.Picture_Ratio   = 1;
  Image37.Picture_Name    = logo23_jpg;
  Image37.Visible         = 1;
  Image37.Active          = 1;
  Image37.OnUpPtr         = 0;
  Image37.OnDownPtr       = 0;
  Image37.OnClickPtr      = 0;
  Image37.OnPressPtr      = 0;

  Image38.OwnerScreen     = &Boot;
  Image38.Order           = 24;
  Image38.Left            = 115;
  Image38.Top             = 0;
  Image38.Width           = 249;
  Image38.Height          = 263;
  Image38.Picture_Type    = 1;
  Image38.Picture_Ratio   = 1;
  Image38.Picture_Name    = logo24_jpg;
  Image38.Visible         = 1;
  Image38.Active          = 1;
  Image38.OnUpPtr         = 0;
  Image38.OnDownPtr       = 0;
  Image38.OnClickPtr      = 0;
  Image38.OnPressPtr      = 0;

  Image39.OwnerScreen     = &Boot;
  Image39.Order           = 25;
  Image39.Left            = 115;
  Image39.Top             = 0;
  Image39.Width           = 249;
  Image39.Height          = 263;
  Image39.Picture_Type    = 1;
  Image39.Picture_Ratio   = 1;
  Image39.Picture_Name    = logo25_jpg;
  Image39.Visible         = 1;
  Image39.Active          = 1;
  Image39.OnUpPtr         = 0;
  Image39.OnDownPtr       = 0;
  Image39.OnClickPtr      = 0;
  Image39.OnPressPtr      = 0;

  Label19.OwnerScreen     = &Speedometer_graphics;
  Label19.Order           = 1;
  Label19.Left            = 365;
  Label19.Top             = 21;
  Label19.Width           = 109;
  Label19.Height          = 32;
  Label19.Visible         = 1;
  Label19.Active          = 1;
  Label19.Caption         = Label19_Caption;
  Label19.FontName        = Arial_Black21x30_Regular;
  Label19.Font_Color      = 0xFFFF;
  Label19.OnUpPtr         = 0;
  Label19.OnDownPtr       = 0;
  Label19.OnClickPtr      = 0;
  Label19.OnPressPtr      = 0;

  Image15.OwnerScreen     = &Speedometer_graphics;
  Image15.Order           = 2;
  Image15.Left            = 432;
  Image15.Top             = 2;
  Image15.Width           = 44;
  Image15.Height          = 20;
  Image15.Picture_Type    = 0;
  Image15.Picture_Ratio   = 1;
  Image15.Picture_Name    = icon_battery_bmp;
  Image15.Visible         = 1;
  Image15.Active          = 0;
  Image15.OnUpPtr         = 0;
  Image15.OnDownPtr       = 0;
  Image15.OnClickPtr      = 0;
  Image15.OnPressPtr      = 0;

  Image3.OwnerScreen     = &Speedometer_graphics;
  Image3.Order           = 3;
  Image3.Left            = 0;
  Image3.Top             = 0;
  Image3.Width           = 50;
  Image3.Height          = 50;
  Image3.Picture_Type    = 1;
  Image3.Picture_Ratio   = 1;
  Image3.Picture_Name    = WaterTemperatureIcon_jpg;
  Image3.Visible         = 1;
  Image3.Active          = 1;
  Image3.OnUpPtr         = 0;
  Image3.OnDownPtr       = 0;
  Image3.OnClickPtr      = 0;
  Image3.OnPressPtr      = 0;

  Image4.OwnerScreen     = &Speedometer_graphics;
  Image4.Order           = 4;
  Image4.Left            = 0;
  Image4.Top             = 49;
  Image4.Width           = 50;
  Image4.Height          = 50;
  Image4.Picture_Type    = 1;
  Image4.Picture_Ratio   = 1;
  Image4.Picture_Name    = fuel_jpg;
  Image4.Visible         = 1;
  Image4.Active          = 1;
  Image4.OnUpPtr         = 0;
  Image4.OnDownPtr       = 0;
  Image4.OnClickPtr      = 0;
  Image4.OnPressPtr      = 0;

  Image5.OwnerScreen     = &Speedometer_graphics;
  Image5.Order           = 5;
  Image5.Left            = 49;
  Image5.Top             = 0;
  Image5.Width           = 50;
  Image5.Height          = 50;
  Image5.Picture_Type    = 1;
  Image5.Picture_Ratio   = 1;
  Image5.Picture_Name    = HeadlightIcon_jpg;
  Image5.Visible         = 1;
  Image5.Active          = 1;
  Image5.OnUpPtr         = 0;
  Image5.OnDownPtr       = 0;
  Image5.OnClickPtr      = 0;
  Image5.OnPressPtr      = 0;

  Image6.OwnerScreen     = &Speedometer_graphics;
  Image6.Order           = 6;
  Image6.Left            = 49;
  Image6.Top             = 49;
  Image6.Width           = 50;
  Image6.Height          = 50;
  Image6.Picture_Type    = 1;
  Image6.Picture_Ratio   = 1;
  Image6.Picture_Name    = OilAlertIcon_jpg;
  Image6.Visible         = 1;
  Image6.Active          = 1;
  Image6.OnUpPtr         = 0;
  Image6.OnDownPtr       = 0;
  Image6.OnClickPtr      = 0;
  Image6.OnPressPtr      = 0;

  Image7.OwnerScreen     = &Speedometer_graphics;
  Image7.Order           = 7;
  Image7.Left            = 429;
  Image7.Top             = 221;
  Image7.Width           = 50;
  Image7.Height          = 50;
  Image7.Picture_Type    = 1;
  Image7.Picture_Ratio   = 1;
  Image7.Picture_Name    = Settings_icon_JPG;
  Image7.Visible         = 1;
  Image7.Active          = 1;
  Image7.OnUpPtr         = 0;
  Image7.OnDownPtr       = 0;
  Image7.OnClickPtr      = doSettings;
  Image7.OnPressPtr      = doSettings;

  Image8.OwnerScreen     = &Speedometer_graphics;
  Image8.Order           = 8;
  Image8.Left            = 55;
  Image8.Top             = 116;
  Image8.Width           = 51;
  Image8.Height          = 39;
  Image8.Picture_Type    = 1;
  Image8.Picture_Ratio   = 1;
  Image8.Picture_Name    = red_left_arrow_103_jpg;
  Image8.Visible         = 1;
  Image8.Active          = 1;
  Image8.OnUpPtr         = 0;
  Image8.OnDownPtr       = 0;
  Image8.OnClickPtr      = 0;
  Image8.OnPressPtr      = 0;

  Image9.OwnerScreen     = &Speedometer_graphics;
  Image9.Order           = 9;
  Image9.Left            = 373;
  Image9.Top             = 116;
  Image9.Width           = 51;
  Image9.Height          = 39;
  Image9.Picture_Type    = 1;
  Image9.Picture_Ratio   = 1;
  Image9.Picture_Name    = red_left_arrow_copy_jpg;
  Image9.Visible         = 1;
  Image9.Active          = 1;
  Image9.OnUpPtr         = 0;
  Image9.OnDownPtr       = 0;
  Image9.OnClickPtr      = 0;
  Image9.OnPressPtr      = 0;

  Label10.OwnerScreen     = &Speedometer_graphics;
  Label10.Order           = 10;
  Label10.Left            = 373;
  Label10.Top             = 46;
  Label10.Width           = 56;
  Label10.Height          = 25;
  Label10.Visible         = 1;
  Label10.Active          = 1;
  Label10.Caption         = Label10_Caption;
  Label10.FontName        = Arial_Black16x23_Regular;
  Label10.Font_Color      = 0xFFFF;
  Label10.OnUpPtr         = 0;
  Label10.OnDownPtr       = 0;
  Label10.OnClickPtr      = 0;
  Label10.OnPressPtr      = 0;

  Label11.OwnerScreen     = &Speedometer_graphics;
  Label11.Order           = 11;
  Label11.Left            = 6;
  Label11.Top             = 36;
  Label11.Width           = 39;
  Label11.Height          = 17;
  Label11.Visible         = 1;
  Label11.Active          = 1;
  Label11.Caption         = Label11_Caption;
  Label11.FontName        = Arial_Black11x15_Regular;
  Label11.Font_Color      = 0xFFFF;
  Label11.OnUpPtr         = 0;
  Label11.OnDownPtr       = 0;
  Label11.OnClickPtr      = 0;
  Label11.OnPressPtr      = 0;

  CircleButton1.OwnerScreen     = &Speedometer_graphics;
  CircleButton1.Order           = 12;
  CircleButton1.Left            = 216;
  CircleButton1.Top             = 112;
  CircleButton1.Radius          = 23;
  CircleButton1.Pen_Width       = 1;
  CircleButton1.Pen_Color       = 0x0000;
  CircleButton1.Visible         = 1;
  CircleButton1.Active          = 1;
  CircleButton1.Transparent     = 0;
  CircleButton1.Caption         = CircleButton1_Caption;
  CircleButton1.TextAlign       = _taCenter;
  CircleButton1.FontName        = Tahoma11x13_Regular;
  CircleButton1.PressColEnabled = 1;
  CircleButton1.Font_Color      = 0x0000;
  CircleButton1.Gradient        = 0;
  CircleButton1.Gradient_Orientation = 0;
  CircleButton1.Gradient_Start_Color = 0xFFFF;
  CircleButton1.Gradient_End_Color = 0xC618;
  CircleButton1.Color           = 0xC618;
  CircleButton1.Press_Color     = 0xE71C;
  CircleButton1.OnUpPtr         = 0;
  CircleButton1.OnDownPtr       = 0;
  CircleButton1.OnClickPtr      = doNextScreen;
  CircleButton1.OnPressPtr      = doNextScreen;

  Label12.OwnerScreen     = &Speedometer_graphics;
  Label12.Order           = 13;
  Label12.Left            = 33;
  Label12.Top             = 189;
  Label12.Width           = 68;
  Label12.Height          = 41;
  Label12.Visible         = 1;
  Label12.Active          = 1;
  Label12.Caption         = Label12_Caption;
  Label12.FontName        = Arial_Black27x38_Regular;
  Label12.Font_Color      = 0xFFFF;
  Label12.OnUpPtr         = 0;
  Label12.OnDownPtr       = 0;
  Label12.OnClickPtr      = 0;
  Label12.OnPressPtr      = 0;

  Label13.OwnerScreen     = &Speedometer_graphics;
  Label13.Order           = 14;
  Label13.Left            = 0;
  Label13.Top             = 213;
  Label13.Width           = 148;
  Label13.Height          = 66;
  Label13.Visible         = 1;
  Label13.Active          = 1;
  Label13.Caption         = Label13_Caption;
  Label13.FontName        = Arial_Black43x60_Regular;
  Label13.Font_Color      = 0xFFFF;
  Label13.OnUpPtr         = 0;
  Label13.OnDownPtr       = 0;
  Label13.OnClickPtr      = 0;
  Label13.OnPressPtr      = 0;

  Box2.OwnerScreen     = &Speedometer_graphics;
  Box2.Order           = 15;
  Box2.Left            = 350;
  Box2.Top             = 221;
  Box2.Width           = 75;
  Box2.Height          = 50;
  Box2.Pen_Width       = 1;
  Box2.Pen_Color       = 0x0000;
  Box2.Visible         = 1;
  Box2.Active          = 1;
  Box2.Transparent     = 1;
  Box2.Gradient        = 1;
  Box2.Gradient_Orientation = 0;
  Box2.Gradient_Start_Color = 0xFFFF;
  Box2.Gradient_End_Color = 0xC618;
  Box2.Color           = 0xC618;
  Box2.PressColEnabled = 1;
  Box2.Press_Color     = 0xE71C;
  Box2.OnUpPtr         = 0;
  Box2.OnDownPtr       = 0;
  Box2.OnClickPtr      = 0;
  Box2.OnPressPtr      = 0;

  Label14.OwnerScreen     = &Speedometer_graphics;
  Label14.Order           = 16;
  Label14.Left            = 358;
  Label14.Top             = 221;
  Label14.Width           = 62;
  Label14.Height          = 17;
  Label14.Visible         = 1;
  Label14.Active          = 1;
  Label14.Caption         = Label14_Caption;
  Label14.FontName        = Arial_Black11x15_Regular;
  Label14.Font_Color      = 0x0000;
  Label14.OnUpPtr         = 0;
  Label14.OnDownPtr       = 0;
  Label14.OnClickPtr      = 0;
  Label14.OnPressPtr      = 0;

  Label15.OwnerScreen     = &Speedometer_graphics;
  Label15.Order           = 17;
  Label15.Left            = 198;
  Label15.Top             = 203;
  Label15.Width           = 86;
  Label15.Height          = 25;
  Label15.Visible         = 1;
  Label15.Active          = 1;
  Label15.Caption         = Label15_Caption;
  Label15.FontName        = Arial_Black16x23_Regular;
  Label15.Font_Color      = 0x0000;
  Label15.OnUpPtr         = 0;
  Label15.OnDownPtr       = 0;
  Label15.OnClickPtr      = 0;
  Label15.OnPressPtr      = 0;

  Label16.OwnerScreen     = &Speedometer_graphics;
  Label16.Order           = 18;
  Label16.Left            = 218;
  Label16.Top             = 221;
  Label16.Width           = 38;
  Label16.Height          = 17;
  Label16.Visible         = 1;
  Label16.Active          = 1;
  Label16.Caption         = Label16_Caption;
  Label16.FontName        = Arial_Black11x15_Regular;
  Label16.Font_Color      = 0x0000;
  Label16.OnUpPtr         = 0;
  Label16.OnDownPtr       = 0;
  Label16.OnClickPtr      = 0;
  Label16.OnPressPtr      = 0;

  Label17.OwnerScreen     = &Speedometer_graphics;
  Label17.Order           = 19;
  Label17.Left            = 195;
  Label17.Top             = 192;
  Label17.Width           = 9;
  Label17.Height          = 17;
  Label17.Visible         = 1;
  Label17.Active          = 1;
  Label17.Caption         = Label17_Caption;
  Label17.FontName        = Arial_Black11x15_Regular;
  Label17.Font_Color      = 0x0000;
  Label17.OnUpPtr         = 0;
  Label17.OnDownPtr       = 0;
  Label17.OnClickPtr      = 0;
  Label17.OnPressPtr      = 0;

  Line1.OwnerScreen     = &Speedometer_graphics;
  Line1.Order           = 20;
  Line1.First_Point_X   = 238;
  Line1.First_Point_Y   = 135;
  Line1.Second_Point_X  = 160;
  Line1.Second_Point_Y  = 214;
  Line1.Visible         = 1;
  Line1.Pen_Width       = 5;
  Line1.Color           = 0xF800;

  Label18.OwnerScreen     = &Speedometer_graphics;
  Label18.Order           = 21;
  Label18.Left            = 222;
  Label18.Top             = 103;
  Label18.Width           = 37;
  Label18.Height          = 66;
  Label18.Visible         = 1;
  Label18.Active          = 1;
  Label18.Caption         = Label18_Caption;
  Label18.FontName        = Arial_Black43x60_Regular;
  Label18.Font_Color      = 0x07E0;
  Label18.OnUpPtr         = 0;
  Label18.OnDownPtr       = 0;
  Label18.OnClickPtr      = 0;
  Label18.OnPressPtr      = 0;

  ButtonRound8.OwnerScreen     = &Speedometer_graphics;
  ButtonRound8.Order           = 22;
  ButtonRound8.Left            = 378;
  ButtonRound8.Top             = 165;
  ButtonRound8.Width           = 100;
  ButtonRound8.Height          = 50;
  ButtonRound8.Pen_Width       = 1;
  ButtonRound8.Pen_Color       = 0x0000;
  ButtonRound8.Visible         = 1;
  ButtonRound8.Active          = 1;
  ButtonRound8.Transparent     = 1;
  ButtonRound8.Caption         = ButtonRound8_Caption;
  ButtonRound8.TextAlign       = _taCenter;
  ButtonRound8.FontName        = Arial_Black11x15_Regular;
  ButtonRound8.PressColEnabled = 1;
  ButtonRound8.Font_Color      = 0x0000;
  ButtonRound8.Gradient        = 1;
  ButtonRound8.Gradient_Orientation = 0;
  ButtonRound8.Gradient_Start_Color = 0xF800;
  ButtonRound8.Gradient_End_Color = 0x0000;
  ButtonRound8.Color           = 0xC618;
  ButtonRound8.Press_Color     = 0xE71C;
  ButtonRound8.Corner_Radius   = 3;
  ButtonRound8.OnUpPtr         = 0;
  ButtonRound8.OnDownPtr       = 0;
  ButtonRound8.OnClickPtr      = 0;
  ButtonRound8.OnPressPtr      = doLog;

  Image40.OwnerScreen     = &Tachometer_graphics;
  Image40.Order           = 1;
  Image40.Left            = 0;
  Image40.Top             = 0;
  Image40.Width           = 50;
  Image40.Height          = 50;
  Image40.Picture_Type    = 1;
  Image40.Picture_Ratio   = 1;
  Image40.Picture_Name    = WaterTemperatureIcon_jpg;
  Image40.Visible         = 1;
  Image40.Active          = 1;
  Image40.OnUpPtr         = 0;
  Image40.OnDownPtr       = 0;
  Image40.OnClickPtr      = 0;
  Image40.OnPressPtr      = 0;

  Image41.OwnerScreen     = &Tachometer_graphics;
  Image41.Order           = 2;
  Image41.Left            = 49;
  Image41.Top             = 0;
  Image41.Width           = 50;
  Image41.Height          = 50;
  Image41.Picture_Type    = 1;
  Image41.Picture_Ratio   = 1;
  Image41.Picture_Name    = HeadlightIcon_jpg;
  Image41.Visible         = 1;
  Image41.Active          = 1;
  Image41.OnUpPtr         = 0;
  Image41.OnDownPtr       = 0;
  Image41.OnClickPtr      = 0;
  Image41.OnPressPtr      = 0;

  Image42.OwnerScreen     = &Tachometer_graphics;
  Image42.Order           = 3;
  Image42.Left            = 0;
  Image42.Top             = 49;
  Image42.Width           = 50;
  Image42.Height          = 50;
  Image42.Picture_Type    = 1;
  Image42.Picture_Ratio   = 1;
  Image42.Picture_Name    = fuel_jpg;
  Image42.Visible         = 1;
  Image42.Active          = 1;
  Image42.OnUpPtr         = 0;
  Image42.OnDownPtr       = 0;
  Image42.OnClickPtr      = 0;
  Image42.OnPressPtr      = 0;

  Image43.OwnerScreen     = &Tachometer_graphics;
  Image43.Order           = 4;
  Image43.Left            = 49;
  Image43.Top             = 49;
  Image43.Width           = 50;
  Image43.Height          = 50;
  Image43.Picture_Type    = 1;
  Image43.Picture_Ratio   = 1;
  Image43.Picture_Name    = OilAlertIcon_jpg;
  Image43.Visible         = 1;
  Image43.Active          = 1;
  Image43.OnUpPtr         = 0;
  Image43.OnDownPtr       = 0;
  Image43.OnClickPtr      = 0;
  Image43.OnPressPtr      = 0;

  Image44.OwnerScreen     = &Tachometer_graphics;
  Image44.Order           = 5;
  Image44.Left            = 55;
  Image44.Top             = 116;
  Image44.Width           = 51;
  Image44.Height          = 39;
  Image44.Picture_Type    = 1;
  Image44.Picture_Ratio   = 1;
  Image44.Picture_Name    = red_left_arrow_103_jpg;
  Image44.Visible         = 1;
  Image44.Active          = 1;
  Image44.OnUpPtr         = 0;
  Image44.OnDownPtr       = 0;
  Image44.OnClickPtr      = 0;
  Image44.OnPressPtr      = 0;

  Image45.OwnerScreen     = &Tachometer_graphics;
  Image45.Order           = 6;
  Image45.Left            = 373;
  Image45.Top             = 116;
  Image45.Width           = 51;
  Image45.Height          = 39;
  Image45.Picture_Type    = 1;
  Image45.Picture_Ratio   = 1;
  Image45.Picture_Name    = red_left_arrow_copy_jpg;
  Image45.Visible         = 1;
  Image45.Active          = 1;
  Image45.OnUpPtr         = 0;
  Image45.OnDownPtr       = 0;
  Image45.OnClickPtr      = 0;
  Image45.OnPressPtr      = 0;

  Label20.OwnerScreen     = &Tachometer_graphics;
  Label20.Order           = 7;
  Label20.Left            = 33;
  Label20.Top             = 189;
  Label20.Width           = 69;
  Label20.Height          = 41;
  Label20.Visible         = 1;
  Label20.Active          = 1;
  Label20.Caption         = Label20_Caption;
  Label20.FontName        = Arial_Black27x38_Regular;
  Label20.Font_Color      = 0xFFFF;
  Label20.OnUpPtr         = 0;
  Label20.OnDownPtr       = 0;
  Label20.OnClickPtr      = 0;
  Label20.OnPressPtr      = 0;

  Label21.OwnerScreen     = &Tachometer_graphics;
  Label21.Order           = 8;
  Label21.Left            = 23;
  Label21.Top             = 213;
  Label21.Width           = 89;
  Label21.Height          = 66;
  Label21.Visible         = 1;
  Label21.Active          = 1;
  Label21.Caption         = Label21_Caption;
  Label21.FontName        = Arial_Black43x60_Regular;
  Label21.Font_Color      = 0xFFFF;
  Label21.OnUpPtr         = 0;
  Label21.OnDownPtr       = 0;
  Label21.OnClickPtr      = 0;
  Label21.OnPressPtr      = 0;

  Label22.OwnerScreen     = &Tachometer_graphics;
  Label22.Order           = 9;
  Label22.Left            = 6;
  Label22.Top             = 36;
  Label22.Width           = 39;
  Label22.Height          = 17;
  Label22.Visible         = 1;
  Label22.Active          = 1;
  Label22.Caption         = Label22_Caption;
  Label22.FontName        = Arial_Black11x15_Regular;
  Label22.Font_Color      = 0xFFFF;
  Label22.OnUpPtr         = 0;
  Label22.OnDownPtr       = 0;
  Label22.OnClickPtr      = 0;
  Label22.OnPressPtr      = 0;

  Box12.OwnerScreen     = &Tachometer_graphics;
  Box12.Order           = 10;
  Box12.Left            = 350;
  Box12.Top             = 221;
  Box12.Width           = 75;
  Box12.Height          = 50;
  Box12.Pen_Width       = 1;
  Box12.Pen_Color       = 0x0000;
  Box12.Visible         = 1;
  Box12.Active          = 1;
  Box12.Transparent     = 1;
  Box12.Gradient        = 1;
  Box12.Gradient_Orientation = 0;
  Box12.Gradient_Start_Color = 0xFFFF;
  Box12.Gradient_End_Color = 0xC618;
  Box12.Color           = 0xC618;
  Box12.PressColEnabled = 1;
  Box12.Press_Color     = 0xE71C;
  Box12.OnUpPtr         = 0;
  Box12.OnDownPtr       = 0;
  Box12.OnClickPtr      = 0;
  Box12.OnPressPtr      = 0;

  Label23.OwnerScreen     = &Tachometer_graphics;
  Label23.Order           = 11;
  Label23.Left            = 353;
  Label23.Top             = 221;
  Label23.Width           = 69;
  Label23.Height          = 17;
  Label23.Visible         = 1;
  Label23.Active          = 1;
  Label23.Caption         = Label23_Caption;
  Label23.FontName        = Arial_Black11x15_Regular;
  Label23.Font_Color      = 0x0000;
  Label23.OnUpPtr         = 0;
  Label23.OnDownPtr       = 0;
  Label23.OnClickPtr      = 0;
  Label23.OnPressPtr      = 0;

  Image46.OwnerScreen     = &Tachometer_graphics;
  Image46.Order           = 12;
  Image46.Left            = 429;
  Image46.Top             = 221;
  Image46.Width           = 50;
  Image46.Height          = 50;
  Image46.Picture_Type    = 1;
  Image46.Picture_Ratio   = 1;
  Image46.Picture_Name    = Settings_icon_JPG;
  Image46.Visible         = 1;
  Image46.Active          = 1;
  Image46.OnUpPtr         = 0;
  Image46.OnDownPtr       = 0;
  Image46.OnClickPtr      = 0;
  Image46.OnPressPtr      = doSettings;

  ButtonRound9.OwnerScreen     = &Tachometer_graphics;
  ButtonRound9.Order           = 13;
  ButtonRound9.Left            = 378;
  ButtonRound9.Top             = 165;
  ButtonRound9.Width           = 100;
  ButtonRound9.Height          = 50;
  ButtonRound9.Pen_Width       = 1;
  ButtonRound9.Pen_Color       = 0x0000;
  ButtonRound9.Visible         = 1;
  ButtonRound9.Active          = 1;
  ButtonRound9.Transparent     = 1;
  ButtonRound9.Caption         = ButtonRound9_Caption;
  ButtonRound9.TextAlign       = _taCenter;
  ButtonRound9.FontName        = Arial_Black11x15_Regular;
  ButtonRound9.PressColEnabled = 1;
  ButtonRound9.Font_Color      = 0x0000;
  ButtonRound9.Gradient        = 1;
  ButtonRound9.Gradient_Orientation = 0;
  ButtonRound9.Gradient_Start_Color = 0xF800;
  ButtonRound9.Gradient_End_Color = 0x0000;
  ButtonRound9.Color           = 0xC618;
  ButtonRound9.Press_Color     = 0xE71C;
  ButtonRound9.Corner_Radius   = 3;
  ButtonRound9.OnUpPtr         = 0;
  ButtonRound9.OnDownPtr       = 0;
  ButtonRound9.OnClickPtr      = 0;
  ButtonRound9.OnPressPtr      = doLog;

  Label24.OwnerScreen     = &Tachometer_graphics;
  Label24.Order           = 14;
  Label24.Left            = 373;
  Label24.Top             = 46;
  Label24.Width           = 56;
  Label24.Height          = 25;
  Label24.Visible         = 1;
  Label24.Active          = 1;
  Label24.Caption         = Label24_Caption;
  Label24.FontName        = Arial_Black16x23_Regular;
  Label24.Font_Color      = 0xFFFF;
  Label24.OnUpPtr         = 0;
  Label24.OnDownPtr       = 0;
  Label24.OnClickPtr      = 0;
  Label24.OnPressPtr      = 0;

  Label25.OwnerScreen     = &Tachometer_graphics;
  Label25.Order           = 15;
  Label25.Left            = 365;
  Label25.Top             = 21;
  Label25.Width           = 109;
  Label25.Height          = 32;
  Label25.Visible         = 1;
  Label25.Active          = 1;
  Label25.Caption         = Label25_Caption;
  Label25.FontName        = Arial_Black21x30_Regular;
  Label25.Font_Color      = 0xFFFF;
  Label25.OnUpPtr         = 0;
  Label25.OnDownPtr       = 0;
  Label25.OnClickPtr      = 0;
  Label25.OnPressPtr      = 0;

  Image47.OwnerScreen     = &Tachometer_graphics;
  Image47.Order           = 16;
  Image47.Left            = 432;
  Image47.Top             = 2;
  Image47.Width           = 44;
  Image47.Height          = 20;
  Image47.Picture_Type    = 0;
  Image47.Picture_Ratio   = 1;
  Image47.Picture_Name    = icon_battery_bmp;
  Image47.Visible         = 1;
  Image47.Active          = 0;
  Image47.OnUpPtr         = 0;
  Image47.OnDownPtr       = 0;
  Image47.OnClickPtr      = 0;
  Image47.OnPressPtr      = 0;

  Label26.OwnerScreen     = &Tachometer_graphics;
  Label26.Order           = 17;
  Label26.Left            = 198;
  Label26.Top             = 203;
  Label26.Width           = 86;
  Label26.Height          = 25;
  Label26.Visible         = 1;
  Label26.Active          = 1;
  Label26.Caption         = Label26_Caption;
  Label26.FontName        = Arial_Black16x23_Regular;
  Label26.Font_Color      = 0x0000;
  Label26.OnUpPtr         = 0;
  Label26.OnDownPtr       = 0;
  Label26.OnClickPtr      = 0;
  Label26.OnPressPtr      = 0;

  Label27.OwnerScreen     = &Tachometer_graphics;
  Label27.Order           = 18;
  Label27.Left            = 218;
  Label27.Top             = 221;
  Label27.Width           = 38;
  Label27.Height          = 17;
  Label27.Visible         = 1;
  Label27.Active          = 1;
  Label27.Caption         = Label27_Caption;
  Label27.FontName        = Arial_Black11x15_Regular;
  Label27.Font_Color      = 0x0000;
  Label27.OnUpPtr         = 0;
  Label27.OnDownPtr       = 0;
  Label27.OnClickPtr      = 0;
  Label27.OnPressPtr      = 0;

  Label28.OwnerScreen     = &Tachometer_graphics;
  Label28.Order           = 19;
  Label28.Left            = 195;
  Label28.Top             = 192;
  Label28.Width           = 9;
  Label28.Height          = 17;
  Label28.Visible         = 1;
  Label28.Active          = 1;
  Label28.Caption         = Label28_Caption;
  Label28.FontName        = Arial_Black11x15_Regular;
  Label28.Font_Color      = 0x0000;
  Label28.OnUpPtr         = 0;
  Label28.OnDownPtr       = 0;
  Label28.OnClickPtr      = 0;
  Label28.OnPressPtr      = 0;

  CircleButton2.OwnerScreen     = &Tachometer_graphics;
  CircleButton2.Order           = 20;
  CircleButton2.Left            = 216;
  CircleButton2.Top             = 112;
  CircleButton2.Radius          = 23;
  CircleButton2.Pen_Width       = 1;
  CircleButton2.Pen_Color       = 0x0000;
  CircleButton2.Visible         = 1;
  CircleButton2.Active          = 1;
  CircleButton2.Transparent     = 0;
  CircleButton2.Caption         = CircleButton2_Caption;
  CircleButton2.TextAlign       = _taCenter;
  CircleButton2.FontName        = Tahoma11x13_Regular;
  CircleButton2.PressColEnabled = 1;
  CircleButton2.Font_Color      = 0x0000;
  CircleButton2.Gradient        = 0;
  CircleButton2.Gradient_Orientation = 0;
  CircleButton2.Gradient_Start_Color = 0xFFFF;
  CircleButton2.Gradient_End_Color = 0xC618;
  CircleButton2.Color           = 0xC618;
  CircleButton2.Press_Color     = 0xE71C;
  CircleButton2.OnUpPtr         = 0;
  CircleButton2.OnDownPtr       = 0;
  CircleButton2.OnClickPtr      = 0;
  CircleButton2.OnPressPtr      = doPrevScreen;

  Line2.OwnerScreen     = &Tachometer_graphics;
  Line2.Order           = 21;
  Line2.First_Point_X   = 238;
  Line2.First_Point_Y   = 135;
  Line2.Second_Point_X  = 160;
  Line2.Second_Point_Y  = 214;
  Line2.Visible         = 1;
  Line2.Pen_Width       = 5;
  Line2.Color           = 0xF800;

  Label29.OwnerScreen     = &Tachometer_graphics;
  Label29.Order           = 22;
  Label29.Left            = 222;
  Label29.Top             = 103;
  Label29.Width           = 37;
  Label29.Height          = 66;
  Label29.Visible         = 1;
  Label29.Active          = 1;
  Label29.Caption         = Label29_Caption;
  Label29.FontName        = Arial_Black43x60_Regular;
  Label29.Font_Color      = 0x07E0;
  Label29.OnUpPtr         = 0;
  Label29.OnDownPtr       = 0;
  Label29.OnClickPtr      = 0;
  Label29.OnPressPtr      = 0;

  Circle1.OwnerScreen     = &Tachometer_graphics;
  Circle1.Order           = 23;
  Circle1.Left            = 331;
  Circle1.Top             = 138;
  Circle1.Radius          = 5;
  Circle1.Pen_Width       = 1;
  Circle1.Pen_Color       = 0x0000;
  Circle1.Visible         = 1;
  Circle1.Active          = 1;
  Circle1.Transparent     = 1;
  Circle1.Gradient        = 0;
  Circle1.Gradient_Orientation = 0;
  Circle1.Gradient_Start_Color = 0xFFFF;
  Circle1.Gradient_End_Color = 0xC618;
  Circle1.Color           = 0xF800;
  Circle1.PressColEnabled = 1;
  Circle1.Press_Color     = 0xE71C;
  Circle1.OnUpPtr         = 0;
  Circle1.OnDownPtr       = 0;
  Circle1.OnClickPtr      = 0;
  Circle1.OnPressPtr      = 0;

  ButtonRound1.OwnerScreen     = &Settings;
  ButtonRound1.Order           = 1;
  ButtonRound1.Left            = 194;
  ButtonRound1.Top             = 10;
  ButtonRound1.Width           = 90;
  ButtonRound1.Height          = 40;
  ButtonRound1.Pen_Width       = 1;
  ButtonRound1.Pen_Color       = 0x0000;
  ButtonRound1.Visible         = 1;
  ButtonRound1.Active          = 1;
  ButtonRound1.Transparent     = 1;
  ButtonRound1.Caption         = ButtonRound1_Caption;
  ButtonRound1.TextAlign       = _taCenter;
  ButtonRound1.FontName        = Impact13x20_Regular;
  ButtonRound1.PressColEnabled = 1;
  ButtonRound1.Font_Color      = 0x0000;
  ButtonRound1.Gradient        = 1;
  ButtonRound1.Gradient_Orientation = 0;
  ButtonRound1.Gradient_Start_Color = 0xFFFF;
  ButtonRound1.Gradient_End_Color = 0xC618;
  ButtonRound1.Color           = 0xC618;
  ButtonRound1.Press_Color     = 0xE71C;
  ButtonRound1.Corner_Radius   = 3;
  ButtonRound1.OnUpPtr         = 0;
  ButtonRound1.OnDownPtr       = 0;
  ButtonRound1.OnClickPtr      = doSetClock;
  ButtonRound1.OnPressPtr      = doSetClock;

  ButtonRound2.OwnerScreen     = &Settings;
  ButtonRound2.Order           = 2;
  ButtonRound2.Left            = 52;
  ButtonRound2.Top             = 60;
  ButtonRound2.Width           = 164;
  ButtonRound2.Height          = 48;
  ButtonRound2.Pen_Width       = 1;
  ButtonRound2.Pen_Color       = 0x0000;
  ButtonRound2.Visible         = 1;
  ButtonRound2.Active          = 1;
  ButtonRound2.Transparent     = 1;
  ButtonRound2.Caption         = ButtonRound2_Caption;
  ButtonRound2.TextAlign       = _taCenter;
  ButtonRound2.FontName        = Impact13x20_Regular;
  ButtonRound2.PressColEnabled = 1;
  ButtonRound2.Font_Color      = 0x0000;
  ButtonRound2.Gradient        = 1;
  ButtonRound2.Gradient_Orientation = 0;
  ButtonRound2.Gradient_Start_Color = 0xFFFF;
  ButtonRound2.Gradient_End_Color = 0xC618;
  ButtonRound2.Color           = 0xC618;
  ButtonRound2.Press_Color     = 0xE71C;
  ButtonRound2.Corner_Radius   = 3;
  ButtonRound2.OnUpPtr         = 0;
  ButtonRound2.OnDownPtr       = 0;
  ButtonRound2.OnClickPtr      = doAccelerometerTest;
  ButtonRound2.OnPressPtr      = doAccelerometerTest;

  ButtonRound3.OwnerScreen     = &Settings;
  ButtonRound3.Order           = 3;
  ButtonRound3.Left            = 262;
  ButtonRound3.Top             = 60;
  ButtonRound3.Width           = 164;
  ButtonRound3.Height          = 48;
  ButtonRound3.Pen_Width       = 1;
  ButtonRound3.Pen_Color       = 0x0000;
  ButtonRound3.Visible         = 1;
  ButtonRound3.Active          = 1;
  ButtonRound3.Transparent     = 1;
  ButtonRound3.Caption         = ButtonRound3_Caption;
  ButtonRound3.TextAlign       = _taCenter;
  ButtonRound3.FontName        = Impact13x20_Regular;
  ButtonRound3.PressColEnabled = 1;
  ButtonRound3.Font_Color      = 0x0000;
  ButtonRound3.Gradient        = 1;
  ButtonRound3.Gradient_Orientation = 0;
  ButtonRound3.Gradient_Start_Color = 0xFFFF;
  ButtonRound3.Gradient_End_Color = 0xC618;
  ButtonRound3.Color           = 0xC618;
  ButtonRound3.Press_Color     = 0xE71C;
  ButtonRound3.Corner_Radius   = 3;
  ButtonRound3.OnUpPtr         = 0;
  ButtonRound3.OnDownPtr       = 0;
  ButtonRound3.OnClickPtr      = doGPSTest;
  ButtonRound3.OnPressPtr      = doGPSTest;

  ButtonRound4.OwnerScreen     = &Settings;
  ButtonRound4.Order           = 4;
  ButtonRound4.Left            = 52;
  ButtonRound4.Top             = 208;
  ButtonRound4.Width           = 164;
  ButtonRound4.Height          = 48;
  ButtonRound4.Pen_Width       = 1;
  ButtonRound4.Pen_Color       = 0x0000;
  ButtonRound4.Visible         = 1;
  ButtonRound4.Active          = 1;
  ButtonRound4.Transparent     = 1;
  ButtonRound4.Caption         = ButtonRound4_Caption;
  ButtonRound4.TextAlign       = _taCenter;
  ButtonRound4.FontName        = Impact13x20_Regular;
  ButtonRound4.PressColEnabled = 1;
  ButtonRound4.Font_Color      = 0x0000;
  ButtonRound4.Gradient        = 1;
  ButtonRound4.Gradient_Orientation = 0;
  ButtonRound4.Gradient_Start_Color = 0xFFFF;
  ButtonRound4.Gradient_End_Color = 0xC618;
  ButtonRound4.Color           = 0xC618;
  ButtonRound4.Press_Color     = 0xE71C;
  ButtonRound4.Corner_Radius   = 3;
  ButtonRound4.OnUpPtr         = 0;
  ButtonRound4.OnDownPtr       = 0;
  ButtonRound4.OnClickPtr      = doMagnetTest;
  ButtonRound4.OnPressPtr      = doMagnetTest;

  ButtonRound5.OwnerScreen     = &Settings;
  ButtonRound5.Order           = 5;
  ButtonRound5.Left            = 262;
  ButtonRound5.Top             = 208;
  ButtonRound5.Width           = 164;
  ButtonRound5.Height          = 48;
  ButtonRound5.Pen_Width       = 1;
  ButtonRound5.Pen_Color       = 0x0000;
  ButtonRound5.Visible         = 1;
  ButtonRound5.Active          = 1;
  ButtonRound5.Transparent     = 1;
  ButtonRound5.Caption         = ButtonRound5_Caption;
  ButtonRound5.TextAlign       = _taCenter;
  ButtonRound5.FontName        = Impact13x20_Regular;
  ButtonRound5.PressColEnabled = 1;
  ButtonRound5.Font_Color      = 0x0000;
  ButtonRound5.Gradient        = 1;
  ButtonRound5.Gradient_Orientation = 0;
  ButtonRound5.Gradient_Start_Color = 0xFFFF;
  ButtonRound5.Gradient_End_Color = 0xC618;
  ButtonRound5.Color           = 0xC618;
  ButtonRound5.Press_Color     = 0xE71C;
  ButtonRound5.Corner_Radius   = 3;
  ButtonRound5.OnUpPtr         = 0;
  ButtonRound5.OnDownPtr       = 0;
  ButtonRound5.OnClickPtr      = doPressureTest;
  ButtonRound5.OnPressPtr      = doPressureTest;

  ButtonRound6.OwnerScreen     = &Settings;
  ButtonRound6.Order           = 6;
  ButtonRound6.Left            = 52;
  ButtonRound6.Top             = 134;
  ButtonRound6.Width           = 164;
  ButtonRound6.Height          = 48;
  ButtonRound6.Pen_Width       = 1;
  ButtonRound6.Pen_Color       = 0x0000;
  ButtonRound6.Visible         = 1;
  ButtonRound6.Active          = 1;
  ButtonRound6.Transparent     = 1;
  ButtonRound6.Caption         = ButtonRound6_Caption;
  ButtonRound6.TextAlign       = _taCenter;
  ButtonRound6.FontName        = Impact13x20_Regular;
  ButtonRound6.PressColEnabled = 1;
  ButtonRound6.Font_Color      = 0x0000;
  ButtonRound6.Gradient        = 1;
  ButtonRound6.Gradient_Orientation = 0;
  ButtonRound6.Gradient_Start_Color = 0xFFFF;
  ButtonRound6.Gradient_End_Color = 0xC618;
  ButtonRound6.Color           = 0xC618;
  ButtonRound6.Press_Color     = 0xE71C;
  ButtonRound6.Corner_Radius   = 3;
  ButtonRound6.OnUpPtr         = 0;
  ButtonRound6.OnDownPtr       = 0;
  ButtonRound6.OnClickPtr      = doGyroTest;
  ButtonRound6.OnPressPtr      = doGyroTest;

  ButtonRound7.OwnerScreen     = &Settings;
  ButtonRound7.Order           = 7;
  ButtonRound7.Left            = 262;
  ButtonRound7.Top             = 134;
  ButtonRound7.Width           = 164;
  ButtonRound7.Height          = 48;
  ButtonRound7.Pen_Width       = 1;
  ButtonRound7.Pen_Color       = 0x0000;
  ButtonRound7.Visible         = 1;
  ButtonRound7.Active          = 1;
  ButtonRound7.Transparent     = 1;
  ButtonRound7.Caption         = ButtonRound7_Caption;
  ButtonRound7.TextAlign       = _taCenter;
  ButtonRound7.FontName        = Impact13x20_Regular;
  ButtonRound7.PressColEnabled = 1;
  ButtonRound7.Font_Color      = 0x0000;
  ButtonRound7.Gradient        = 1;
  ButtonRound7.Gradient_Orientation = 0;
  ButtonRound7.Gradient_Start_Color = 0xFFFF;
  ButtonRound7.Gradient_End_Color = 0xC618;
  ButtonRound7.Color           = 0xC618;
  ButtonRound7.Press_Color     = 0xE71C;
  ButtonRound7.Corner_Radius   = 3;
  ButtonRound7.OnUpPtr         = 0;
  ButtonRound7.OnDownPtr       = 0;
  ButtonRound7.OnClickPtr      = doCalibration;
  ButtonRound7.OnPressPtr      = doCalibration;

  Image48.OwnerScreen     = &Settings;
  Image48.Order           = 8;
  Image48.Left            = 432;
  Image48.Top             = 2;
  Image48.Width           = 44;
  Image48.Height          = 20;
  Image48.Picture_Type    = 0;
  Image48.Picture_Ratio   = 1;
  Image48.Picture_Name    = icon_battery_bmp;
  Image48.Visible         = 1;
  Image48.Active          = 0;
  Image48.OnUpPtr         = 0;
  Image48.OnDownPtr       = 0;
  Image48.OnClickPtr      = 0;
  Image48.OnPressPtr      = 0;

  Label30.OwnerScreen     = &Settings;
  Label30.Order           = 9;
  Label30.Left            = 365;
  Label30.Top             = 21;
  Label30.Width           = 109;
  Label30.Height          = 32;
  Label30.Visible         = 1;
  Label30.Active          = 1;
  Label30.Caption         = Label30_Caption;
  Label30.FontName        = Arial_Black21x30_Regular;
  Label30.Font_Color      = 0xFFFF;
  Label30.OnUpPtr         = 0;
  Label30.OnDownPtr       = 0;
  Label30.OnClickPtr      = 0;
  Label30.OnPressPtr      = 0;

  Box17.OwnerScreen     = &Settings;
  Box17.Order           = 10;
  Box17.Left            = 25;
  Box17.Top             = 15;
  Box17.Width           = 78;
  Box17.Height          = 26;
  Box17.Pen_Width       = 1;
  Box17.Pen_Color       = 0x0000;
  Box17.Visible         = 0;
  Box17.Active          = 1;
  Box17.Transparent     = 1;
  Box17.Gradient        = 1;
  Box17.Gradient_Orientation = 0;
  Box17.Gradient_Start_Color = 0xFFFF;
  Box17.Gradient_End_Color = 0xC618;
  Box17.Color           = 0xC618;
  Box17.PressColEnabled = 0;
  Box17.Press_Color     = 0xE71C;
  Box17.OnUpPtr         = 0;
  Box17.OnDownPtr       = 0;
  Box17.OnClickPtr      = Image18OnPress;
  Box17.OnPressPtr      = 0;

  Image51.OwnerScreen     = &Settings;
  Image51.Order           = 11;
  Image51.Left            = 29;
  Image51.Top             = 17;
  Image51.Width           = 22;
  Image51.Height          = 22;
  Image51.Picture_Type    = 0;
  Image51.Picture_Ratio   = 1;
  Image51.Picture_Name    = icon_ok_bmp;
  Image51.Visible         = 1;
  Image51.Active          = 0;
  Image51.OnUpPtr         = 0;
  Image51.OnDownPtr       = 0;
  Image51.OnClickPtr      = 0;
  Image51.OnPressPtr      = Image18OnPress;

  Label73.OwnerScreen     = &Settings;
  Label73.Order           = 12;
  Label73.Left            = 57;
  Label73.Top             = 17;
  Label73.Width           = 46;
  Label73.Height          = 25;
  Label73.Visible         = 1;
  Label73.Active          = 0;
  Label73.Caption         = Label73_Caption;
  Label73.FontName        = Arial_Black16x23_Regular;
  Label73.Font_Color      = 0x0000;
  Label73.OnUpPtr         = 0;
  Label73.OnDownPtr       = 0;
  Label73.OnClickPtr      = 0;
  Label73.OnPressPtr      = 0;

  Box7.OwnerScreen     = &Set_clock;
  Box7.Order           = 0;
  Box7.Left            = 376;
  Box7.Top             = 234;
  Box7.Width           = 78;
  Box7.Height          = 26;
  Box7.Pen_Width       = 1;
  Box7.Pen_Color       = 0x0000;
  Box7.Visible         = 0;
  Box7.Active          = 1;
  Box7.Transparent     = 1;
  Box7.Gradient        = 1;
  Box7.Gradient_Orientation = 0;
  Box7.Gradient_Start_Color = 0xFFFF;
  Box7.Gradient_End_Color = 0xC618;
  Box7.Color           = 0xC618;
  Box7.PressColEnabled = 0;
  Box7.Press_Color     = 0xE71C;
  Box7.OnUpPtr         = 0;
  Box7.OnDownPtr       = 0;
  Box7.OnClickPtr      = Image18OnPress;
  Box7.OnPressPtr      = Image18OnPress;

  Box8.OwnerScreen     = &Set_clock;
  Box8.Order           = 1;
  Box8.Left            = 0;
  Box8.Top             = 38;
  Box8.Width           = 480;
  Box8.Height          = 193;
  Box8.Pen_Width       = 0;
  Box8.Pen_Color       = 0x0000;
  Box8.Visible         = 0;
  Box8.Active          = 1;
  Box8.Transparent     = 0;
  Box8.Gradient        = 0;
  Box8.Gradient_Orientation = 0;
  Box8.Gradient_Start_Color = 0xFFFF;
  Box8.Gradient_End_Color = 0xC618;
  Box8.Color           = 0x54C3;
  Box8.PressColEnabled = 0;
  Box8.Press_Color     = 0xE71C;
  Box8.OnUpPtr         = 0;
  Box8.OnDownPtr       = 0;
  Box8.OnClickPtr      = Box8OnClick;
  Box8.OnPressPtr      = 0;

  Label2.OwnerScreen     = &Set_clock;
  Label2.Order           = 2;
  Label2.Left            = 191;
  Label2.Top             = 94;
  Label2.Width           = 14;
  Label2.Height          = 85;
  Label2.Visible         = 1;
  Label2.Active          = 1;
  Label2.Caption         = Label2_Caption;
  Label2.FontName        = Open_Sans_Light51x78_Regular;
  Label2.Font_Color      = 0xFFFF;
  Label2.OnUpPtr         = 0;
  Label2.OnDownPtr       = 0;
  Label2.OnClickPtr      = 0;
  Label2.OnPressPtr      = 0;

  Box10.OwnerScreen     = &Set_clock;
  Box10.Order           = 3;
  Box10.Left            = 108;
  Box10.Top             = 42;
  Box10.Width           = 37;
  Box10.Height          = 194;
  Box10.Pen_Width       = 0;
  Box10.Pen_Color       = 0x0000;
  Box10.Visible         = 0;
  Box10.Active          = 1;
  Box10.Transparent     = 0;
  Box10.Gradient        = 0;
  Box10.Gradient_Orientation = 0;
  Box10.Gradient_Start_Color = 0xFFFF;
  Box10.Gradient_End_Color = 0xC618;
  Box10.Color           = 0xC618;
  Box10.PressColEnabled = 1;
  Box10.Press_Color     = 0xE71C;
  Box10.OnUpPtr         = 0;
  Box10.OnDownPtr       = 0;
  Box10.OnClickPtr      = 0;
  Box10.OnPressPtr      = Box10OnPress;

  Box11.OwnerScreen     = &Set_clock;
  Box11.Order           = 4;
  Box11.Left            = 146;
  Box11.Top             = 42;
  Box11.Width           = 37;
  Box11.Height          = 194;
  Box11.Pen_Width       = 0;
  Box11.Pen_Color       = 0x0000;
  Box11.Visible         = 0;
  Box11.Active          = 1;
  Box11.Transparent     = 0;
  Box11.Gradient        = 0;
  Box11.Gradient_Orientation = 0;
  Box11.Gradient_Start_Color = 0xFFFF;
  Box11.Gradient_End_Color = 0xC618;
  Box11.Color           = 0xC618;
  Box11.PressColEnabled = 1;
  Box11.Press_Color     = 0xE71C;
  Box11.OnUpPtr         = 0;
  Box11.OnDownPtr       = 0;
  Box11.OnClickPtr      = 0;
  Box11.OnPressPtr      = Box11OnPress;

  Label5.OwnerScreen     = &Set_clock;
  Label5.Order           = 5;
  Label5.Left            = 408;
  Label5.Top             = 236;
  Label5.Width           = 46;
  Label5.Height          = 25;
  Label5.Visible         = 1;
  Label5.Active          = 0;
  Label5.Caption         = Label5_Caption;
  Label5.FontName        = Arial_Black16x23_Regular;
  Label5.Font_Color      = 0x0000;
  Label5.OnUpPtr         = 0;
  Label5.OnDownPtr       = 0;
  Label5.OnClickPtr      = 0;
  Label5.OnPressPtr      = 0;

  Image18.OwnerScreen     = &Set_clock;
  Image18.Order           = 6;
  Image18.Left            = 380;
  Image18.Top             = 236;
  Image18.Width           = 22;
  Image18.Height          = 22;
  Image18.Picture_Type    = 0;
  Image18.Picture_Ratio   = 1;
  Image18.Picture_Name    = icon_ok_bmp;
  Image18.Visible         = 1;
  Image18.Active          = 0;
  Image18.OnUpPtr         = 0;
  Image18.OnDownPtr       = 0;
  Image18.OnClickPtr      = Image18OnPress;
  Image18.OnPressPtr      = Image18OnPress;

  Box3.OwnerScreen     = &Set_clock;
  Box3.Order           = 7;
  Box3.Left            = 212;
  Box3.Top             = 42;
  Box3.Width           = 37;
  Box3.Height          = 194;
  Box3.Pen_Width       = 0;
  Box3.Pen_Color       = 0x0000;
  Box3.Visible         = 0;
  Box3.Active          = 1;
  Box3.Transparent     = 0;
  Box3.Gradient        = 0;
  Box3.Gradient_Orientation = 0;
  Box3.Gradient_Start_Color = 0xFFFF;
  Box3.Gradient_End_Color = 0xC618;
  Box3.Color           = 0xC618;
  Box3.PressColEnabled = 1;
  Box3.Press_Color     = 0xE71C;
  Box3.OnUpPtr         = 0;
  Box3.OnDownPtr       = 0;
  Box3.OnClickPtr      = 0;
  Box3.OnPressPtr      = Box3OnPress;

  Box4.OwnerScreen     = &Set_clock;
  Box4.Order           = 8;
  Box4.Left            = 250;
  Box4.Top             = 42;
  Box4.Width           = 37;
  Box4.Height          = 194;
  Box4.Pen_Width       = 0;
  Box4.Pen_Color       = 0x0000;
  Box4.Visible         = 0;
  Box4.Active          = 1;
  Box4.Transparent     = 0;
  Box4.Gradient        = 0;
  Box4.Gradient_Orientation = 0;
  Box4.Gradient_Start_Color = 0xFFFF;
  Box4.Gradient_End_Color = 0xC618;
  Box4.Color           = 0xC618;
  Box4.PressColEnabled = 1;
  Box4.Press_Color     = 0xE71C;
  Box4.OnUpPtr         = 0;
  Box4.OnDownPtr       = 0;
  Box4.OnClickPtr      = 0;
  Box4.OnPressPtr      = Box4OnPress;

  Image19.OwnerScreen     = &Set_clock;
  Image19.Order           = 9;
  Image19.Left            = 475;
  Image19.Top             = 248;
  Image19.Width           = 36;
  Image19.Height          = 740;
  Image19.Picture_Type    = 0;
  Image19.Picture_Ratio   = 1;
  Image19.Picture_Name    = stripe_black_bmp;
  Image19.Visible         = 0;
  Image19.Active          = 0;
  Image19.OnUpPtr         = 0;
  Image19.OnDownPtr       = 0;
  Image19.OnClickPtr      = 0;
  Image19.OnPressPtr      = 0;

  Label6.OwnerScreen     = &Set_clock;
  Label6.Order           = 10;
  Label6.Left            = 15;
  Label6.Top             = 235;
  Label6.Width           = 0;
  Label6.Height          = 19;
  Label6.Visible         = 1;
  Label6.Active          = 0;
  Label6.Caption         = Label6_Caption;
  Label6.FontName        = Open_Sans_Light12x18_Regular;
  Label6.Font_Color      = 0xFFFF;
  Label6.OnUpPtr         = 0;
  Label6.OnDownPtr       = 0;
  Label6.OnClickPtr      = 0;
  Label6.OnPressPtr      = 0;

  Image20.OwnerScreen     = &Set_clock;
  Image20.Order           = 11;
  Image20.Left            = 474;
  Image20.Top             = 17;
  Image20.Width           = 90;
  Image20.Height          = 151;
  Image20.Picture_Type    = 0;
  Image20.Picture_Ratio   = 1;
  Image20.Picture_Name    = am_pm_bmp;
  Image20.Visible         = 0;
  Image20.Active          = 0;
  Image20.OnUpPtr         = 0;
  Image20.OnDownPtr       = 0;
  Image20.OnClickPtr      = 0;
  Image20.OnPressPtr      = 0;

  Box5.OwnerScreen     = &Set_clock;
  Box5.Order           = 12;
  Box5.Left            = 305;
  Box5.Top             = 42;
  Box5.Width           = 90;
  Box5.Height          = 194;
  Box5.Pen_Width       = 0;
  Box5.Pen_Color       = 0x0000;
  Box5.Visible         = 0;
  Box5.Active          = 1;
  Box5.Transparent     = 0;
  Box5.Gradient        = 0;
  Box5.Gradient_Orientation = 0;
  Box5.Gradient_Start_Color = 0xFFFF;
  Box5.Gradient_End_Color = 0xC618;
  Box5.Color           = 0xC618;
  Box5.PressColEnabled = 1;
  Box5.Press_Color     = 0xE71C;
  Box5.OnUpPtr         = 0;
  Box5.OnDownPtr       = 0;
  Box5.OnClickPtr      = 0;
  Box5.OnPressPtr      = Box5OnPress;

  Box23.OwnerScreen     = &Accelerometer_test;
  Box23.Order           = 0;
  Box23.Left            = 4;
  Box23.Top             = 5;
  Box23.Width           = 236;
  Box23.Height          = 23;
  Box23.Pen_Width       = 1;
  Box23.Pen_Color       = 0x0000;
  Box23.Visible         = 0;
  Box23.Active          = 1;
  Box23.Transparent     = 1;
  Box23.Gradient        = 0;
  Box23.Gradient_Orientation = 0;
  Box23.Gradient_Start_Color = 0xFFFF;
  Box23.Gradient_End_Color = 0xC618;
  Box23.Color           = 0xC618;
  Box23.PressColEnabled = 0;
  Box23.Press_Color     = 0xE71C;
  Box23.OnUpPtr         = 0;
  Box23.OnDownPtr       = 0;
  Box23.OnClickPtr      = doSettings;
  Box23.OnPressPtr      = 0;

  Box6.OwnerScreen     = &Accelerometer_test;
  Box6.Order           = 1;
  Box6.Left            = 0;
  Box6.Top             = 40;
  Box6.Width           = 480;
  Box6.Height          = 207;
  Box6.Pen_Width       = 1;
  Box6.Pen_Color       = 0xFFFF;
  Box6.Visible         = 1;
  Box6.Active          = 1;
  Box6.Transparent     = 1;
  Box6.Gradient        = 0;
  Box6.Gradient_Orientation = 0;
  Box6.Gradient_Start_Color = 0xFFFF;
  Box6.Gradient_End_Color = 0xFFFF;
  Box6.Color           = 0xFFFF;
  Box6.PressColEnabled = 0;
  Box6.Press_Color     = 0xFFFF;
  Box6.OnUpPtr         = 0;
  Box6.OnDownPtr       = 0;
  Box6.OnClickPtr      = 0;
  Box6.OnPressPtr      = 0;

  Image49.OwnerScreen     = &Accelerometer_test;
  Image49.Order           = 2;
  Image49.Left            = 5;
  Image49.Top             = 6;
  Image49.Width           = 22;
  Image49.Height          = 22;
  Image49.Picture_Type    = 0;
  Image49.Picture_Ratio   = 1;
  Image49.Picture_Name    = icon_back_accel_bmp;
  Image49.Visible         = 1;
  Image49.Active          = 0;
  Image49.OnUpPtr         = 0;
  Image49.OnDownPtr       = 0;
  Image49.OnClickPtr      = doSettings;
  Image49.OnPressPtr      = doSettings;

  Label1.OwnerScreen     = &Accelerometer_test;
  Label1.Order           = 3;
  Label1.Left            = 32;
  Label1.Top             = 2;
  Label1.Width           = 209;
  Label1.Height          = 31;
  Label1.Visible         = 1;
  Label1.Active          = 0;
  Label1.Caption         = Label1_Caption;
  Label1.FontName        = Open_Sans_Light19x28_Regular;
  Label1.Font_Color      = 0xFFFF;
  Label1.OnUpPtr         = 0;
  Label1.OnDownPtr       = 0;
  Label1.OnClickPtr      = 0;
  Label1.OnPressPtr      = 0;

  Label3.OwnerScreen     = &Accelerometer_test;
  Label3.Order           = 4;
  Label3.Left            = 75;
  Label3.Top             = 250;
  Label3.Width           = 13;
  Label3.Height          = 24;
  Label3.Visible         = 1;
  Label3.Active          = 1;
  Label3.Caption         = Label3_Caption;
  Label3.FontName        = Open_Sans_Light14x22_Regular;
  Label3.Font_Color      = 0xF800;
  Label3.OnUpPtr         = 0;
  Label3.OnDownPtr       = 0;
  Label3.OnClickPtr      = 0;
  Label3.OnPressPtr      = 0;

  Label4.OwnerScreen     = &Accelerometer_test;
  Label4.Order           = 5;
  Label4.Left            = 225;
  Label4.Top             = 250;
  Label4.Width           = 13;
  Label4.Height          = 24;
  Label4.Visible         = 1;
  Label4.Active          = 1;
  Label4.Caption         = Label4_Caption;
  Label4.FontName        = Open_Sans_Light14x22_Regular;
  Label4.Font_Color      = 0x001F;
  Label4.OnUpPtr         = 0;
  Label4.OnDownPtr       = 0;
  Label4.OnClickPtr      = 0;
  Label4.OnPressPtr      = 0;

  Label7.OwnerScreen     = &Accelerometer_test;
  Label7.Order           = 6;
  Label7.Left            = 375;
  Label7.Top             = 250;
  Label7.Width           = 13;
  Label7.Height          = 24;
  Label7.Visible         = 1;
  Label7.Active          = 1;
  Label7.Caption         = Label7_Caption;
  Label7.FontName        = Open_Sans_Light14x22_Regular;
  Label7.Font_Color      = 0x0400;
  Label7.OnUpPtr         = 0;
  Label7.OnDownPtr       = 0;
  Label7.OnClickPtr      = 0;
  Label7.OnPressPtr      = 0;

  Box9.OwnerScreen     = &GPS_Test;
  Box9.Order           = 0;
  Box9.Left            = 0;
  Box9.Top             = 0;
  Box9.Width           = 480;
  Box9.Height          = 272;
  Box9.Pen_Width       = 1;
  Box9.Pen_Color       = 0x0000;
  Box9.Visible         = 1;
  Box9.Active          = 1;
  Box9.Transparent     = 1;
  Box9.Gradient        = 1;
  Box9.Gradient_Orientation = 0;
  Box9.Gradient_Start_Color = 0xF800;
  Box9.Gradient_End_Color = 0x8410;
  Box9.Color           = 0xC618;
  Box9.PressColEnabled = 1;
  Box9.Press_Color     = 0xE71C;
  Box9.OnUpPtr         = 0;
  Box9.OnDownPtr       = 0;
  Box9.OnClickPtr      = 0;
  Box9.OnPressPtr      = 0;

  Box16.OwnerScreen     = &GPS_Test;
  Box16.Order           = 1;
  Box16.Left            = 12;
  Box16.Top             = 12;
  Box16.Width           = 78;
  Box16.Height          = 26;
  Box16.Pen_Width       = 1;
  Box16.Pen_Color       = 0x0000;
  Box16.Visible         = 0;
  Box16.Active          = 1;
  Box16.Transparent     = 1;
  Box16.Gradient        = 1;
  Box16.Gradient_Orientation = 0;
  Box16.Gradient_Start_Color = 0xFFFF;
  Box16.Gradient_End_Color = 0xC618;
  Box16.Color           = 0xC618;
  Box16.PressColEnabled = 0;
  Box16.Press_Color     = 0xE71C;
  Box16.OnUpPtr         = 0;
  Box16.OnDownPtr       = 0;
  Box16.OnClickPtr      = Image18OnPress;
  Box16.OnPressPtr      = Image18OnPress;

  Image50.OwnerScreen     = &GPS_Test;
  Image50.Order           = 2;
  Image50.Left            = 16;
  Image50.Top             = 14;
  Image50.Width           = 22;
  Image50.Height          = 22;
  Image50.Picture_Type    = 0;
  Image50.Picture_Ratio   = 1;
  Image50.Picture_Name    = icon_ok_bmp;
  Image50.Visible         = 1;
  Image50.Active          = 0;
  Image50.OnUpPtr         = 0;
  Image50.OnDownPtr       = 0;
  Image50.OnClickPtr      = Image18OnPress;
  Image50.OnPressPtr      = Image18OnPress;

  Label32.OwnerScreen     = &GPS_Test;
  Label32.Order           = 3;
  Label32.Left            = 44;
  Label32.Top             = 14;
  Label32.Width           = 46;
  Label32.Height          = 25;
  Label32.Visible         = 1;
  Label32.Active          = 0;
  Label32.Caption         = Label32_Caption;
  Label32.FontName        = Arial_Black16x23_Regular;
  Label32.Font_Color      = 0x0000;
  Label32.OnUpPtr         = 0;
  Label32.OnDownPtr       = 0;
  Label32.OnClickPtr      = 0;
  Label32.OnPressPtr      = 0;

  Label53.OwnerScreen     = &GPS_Test;
  Label53.Order           = 4;
  Label53.Left            = 159;
  Label53.Top             = 85;
  Label53.Width           = 65;
  Label53.Height          = 20;
  Label53.Visible         = 1;
  Label53.Active          = 1;
  Label53.Caption         = Label53_Caption;
  Label53.FontName        = Arial_Black13x18_Regular;
  Label53.Font_Color      = 0x0000;
  Label53.OnUpPtr         = 0;
  Label53.OnDownPtr       = 0;
  Label53.OnClickPtr      = 0;
  Label53.OnPressPtr      = 0;

  Label54.OwnerScreen     = &GPS_Test;
  Label54.Order           = 5;
  Label54.Left            = 243;
  Label54.Top             = 85;
  Label54.Width           = 36;
  Label54.Height          = 20;
  Label54.Visible         = 1;
  Label54.Active          = 1;
  Label54.Caption         = Label54_Caption;
  Label54.FontName        = Arial_Black13x18_Regular;
  Label54.Font_Color      = 0x0000;
  Label54.OnUpPtr         = 0;
  Label54.OnDownPtr       = 0;
  Label54.OnClickPtr      = 0;
  Label54.OnPressPtr      = 0;

  Label55.OwnerScreen     = &GPS_Test;
  Label55.Order           = 6;
  Label55.Left            = 284;
  Label55.Top             = 85;
  Label55.Width           = 36;
  Label55.Height          = 20;
  Label55.Visible         = 1;
  Label55.Active          = 1;
  Label55.Caption         = Label55_Caption;
  Label55.FontName        = Arial_Black13x18_Regular;
  Label55.Font_Color      = 0x0000;
  Label55.OnUpPtr         = 0;
  Label55.OnDownPtr       = 0;
  Label55.OnClickPtr      = 0;
  Label55.OnPressPtr      = 0;

  Label56.OwnerScreen     = &GPS_Test;
  Label56.Order           = 7;
  Label56.Left            = 279;
  Label56.Top             = 85;
  Label56.Width           = 4;
  Label56.Height          = 20;
  Label56.Visible         = 1;
  Label56.Active          = 1;
  Label56.Caption         = Label56_Caption;
  Label56.FontName        = Arial_Black13x18_Regular;
  Label56.Font_Color      = 0x0000;
  Label56.OnUpPtr         = 0;
  Label56.OnDownPtr       = 0;
  Label56.OnClickPtr      = 0;
  Label56.OnPressPtr      = 0;

  Label57.OwnerScreen     = &GPS_Test;
  Label57.Order           = 8;
  Label57.Left            = 159;
  Label57.Top             = 108;
  Label57.Width           = 77;
  Label57.Height          = 20;
  Label57.Visible         = 1;
  Label57.Active          = 1;
  Label57.Caption         = Label57_Caption;
  Label57.FontName        = Arial_Black13x18_Regular;
  Label57.Font_Color      = 0x0000;
  Label57.OnUpPtr         = 0;
  Label57.OnDownPtr       = 0;
  Label57.OnClickPtr      = 0;
  Label57.OnPressPtr      = 0;

  Label58.OwnerScreen     = &GPS_Test;
  Label58.Order           = 9;
  Label58.Left            = 243;
  Label58.Top             = 108;
  Label58.Width           = 36;
  Label58.Height          = 20;
  Label58.Visible         = 1;
  Label58.Active          = 1;
  Label58.Caption         = Label58_Caption;
  Label58.FontName        = Arial_Black13x18_Regular;
  Label58.Font_Color      = 0x0000;
  Label58.OnUpPtr         = 0;
  Label58.OnDownPtr       = 0;
  Label58.OnClickPtr      = 0;
  Label58.OnPressPtr      = 0;

  Label59.OwnerScreen     = &GPS_Test;
  Label59.Order           = 10;
  Label59.Left            = 284;
  Label59.Top             = 108;
  Label59.Width           = 36;
  Label59.Height          = 20;
  Label59.Visible         = 1;
  Label59.Active          = 1;
  Label59.Caption         = Label59_Caption;
  Label59.FontName        = Arial_Black13x18_Regular;
  Label59.Font_Color      = 0x0000;
  Label59.OnUpPtr         = 0;
  Label59.OnDownPtr       = 0;
  Label59.OnClickPtr      = 0;
  Label59.OnPressPtr      = 0;

  Label60.OwnerScreen     = &GPS_Test;
  Label60.Order           = 11;
  Label60.Left            = 279;
  Label60.Top             = 108;
  Label60.Width           = 4;
  Label60.Height          = 20;
  Label60.Visible         = 1;
  Label60.Active          = 1;
  Label60.Caption         = Label60_Caption;
  Label60.FontName        = Arial_Black13x18_Regular;
  Label60.Font_Color      = 0x0000;
  Label60.OnUpPtr         = 0;
  Label60.OnDownPtr       = 0;
  Label60.OnClickPtr      = 0;
  Label60.OnPressPtr      = 0;

  Label61.OwnerScreen     = &GPS_Test;
  Label61.Order           = 12;
  Label61.Left            = 159;
  Label61.Top             = 131;
  Label61.Width           = 50;
  Label61.Height          = 20;
  Label61.Visible         = 1;
  Label61.Active          = 1;
  Label61.Caption         = Label61_Caption;
  Label61.FontName        = Arial_Black13x18_Regular;
  Label61.Font_Color      = 0x0000;
  Label61.OnUpPtr         = 0;
  Label61.OnDownPtr       = 0;
  Label61.OnClickPtr      = 0;
  Label61.OnPressPtr      = 0;

  Label62.OwnerScreen     = &GPS_Test;
  Label62.Order           = 13;
  Label62.Left            = 243;
  Label62.Top             = 131;
  Label62.Width           = 36;
  Label62.Height          = 20;
  Label62.Visible         = 1;
  Label62.Active          = 1;
  Label62.Caption         = Label62_Caption;
  Label62.FontName        = Arial_Black13x18_Regular;
  Label62.Font_Color      = 0x0000;
  Label62.OnUpPtr         = 0;
  Label62.OnDownPtr       = 0;
  Label62.OnClickPtr      = 0;
  Label62.OnPressPtr      = 0;

  Label63.OwnerScreen     = &GPS_Test;
  Label63.Order           = 14;
  Label63.Left            = 284;
  Label63.Top             = 131;
  Label63.Width           = 36;
  Label63.Height          = 20;
  Label63.Visible         = 1;
  Label63.Active          = 1;
  Label63.Caption         = Label63_Caption;
  Label63.FontName        = Arial_Black13x18_Regular;
  Label63.Font_Color      = 0x0000;
  Label63.OnUpPtr         = 0;
  Label63.OnDownPtr       = 0;
  Label63.OnClickPtr      = 0;
  Label63.OnPressPtr      = 0;

  Label64.OwnerScreen     = &GPS_Test;
  Label64.Order           = 15;
  Label64.Left            = 279;
  Label64.Top             = 131;
  Label64.Width           = 4;
  Label64.Height          = 20;
  Label64.Visible         = 1;
  Label64.Active          = 1;
  Label64.Caption         = Label64_Caption;
  Label64.FontName        = Arial_Black13x18_Regular;
  Label64.Font_Color      = 0x0000;
  Label64.OnUpPtr         = 0;
  Label64.OnDownPtr       = 0;
  Label64.OnClickPtr      = 0;
  Label64.OnPressPtr      = 0;

  Label65.OwnerScreen     = &GPS_Test;
  Label65.Order           = 16;
  Label65.Left            = 159;
  Label65.Top             = 154;
  Label65.Width           = 53;
  Label65.Height          = 20;
  Label65.Visible         = 1;
  Label65.Active          = 1;
  Label65.Caption         = Label65_Caption;
  Label65.FontName        = Arial_Black13x18_Regular;
  Label65.Font_Color      = 0x0000;
  Label65.OnUpPtr         = 0;
  Label65.OnDownPtr       = 0;
  Label65.OnClickPtr      = 0;
  Label65.OnPressPtr      = 0;

  Label66.OwnerScreen     = &GPS_Test;
  Label66.Order           = 17;
  Label66.Left            = 243;
  Label66.Top             = 154;
  Label66.Width           = 36;
  Label66.Height          = 20;
  Label66.Visible         = 1;
  Label66.Active          = 1;
  Label66.Caption         = Label66_Caption;
  Label66.FontName        = Arial_Black13x18_Regular;
  Label66.Font_Color      = 0x0000;
  Label66.OnUpPtr         = 0;
  Label66.OnDownPtr       = 0;
  Label66.OnClickPtr      = 0;
  Label66.OnPressPtr      = 0;

  Label67.OwnerScreen     = &GPS_Test;
  Label67.Order           = 18;
  Label67.Left            = 284;
  Label67.Top             = 154;
  Label67.Width           = 36;
  Label67.Height          = 20;
  Label67.Visible         = 1;
  Label67.Active          = 1;
  Label67.Caption         = Label67_Caption;
  Label67.FontName        = Arial_Black13x18_Regular;
  Label67.Font_Color      = 0x0000;
  Label67.OnUpPtr         = 0;
  Label67.OnDownPtr       = 0;
  Label67.OnClickPtr      = 0;
  Label67.OnPressPtr      = 0;

  Label68.OwnerScreen     = &GPS_Test;
  Label68.Order           = 19;
  Label68.Left            = 279;
  Label68.Top             = 154;
  Label68.Width           = 4;
  Label68.Height          = 20;
  Label68.Visible         = 1;
  Label68.Active          = 1;
  Label68.Caption         = Label68_Caption;
  Label68.FontName        = Arial_Black13x18_Regular;
  Label68.Font_Color      = 0x0000;
  Label68.OnUpPtr         = 0;
  Label68.OnDownPtr       = 0;
  Label68.OnClickPtr      = 0;
  Label68.OnPressPtr      = 0;

  Label69.OwnerScreen     = &GPS_Test;
  Label69.Order           = 20;
  Label69.Left            = 159;
  Label69.Top             = 177;
  Label69.Width           = 41;
  Label69.Height          = 20;
  Label69.Visible         = 1;
  Label69.Active          = 1;
  Label69.Caption         = Label69_Caption;
  Label69.FontName        = Arial_Black13x18_Regular;
  Label69.Font_Color      = 0x0000;
  Label69.OnUpPtr         = 0;
  Label69.OnDownPtr       = 0;
  Label69.OnClickPtr      = 0;
  Label69.OnPressPtr      = 0;

  Label70.OwnerScreen     = &GPS_Test;
  Label70.Order           = 21;
  Label70.Left            = 243;
  Label70.Top             = 177;
  Label70.Width           = 36;
  Label70.Height          = 20;
  Label70.Visible         = 1;
  Label70.Active          = 1;
  Label70.Caption         = Label70_Caption;
  Label70.FontName        = Arial_Black13x18_Regular;
  Label70.Font_Color      = 0x0000;
  Label70.OnUpPtr         = 0;
  Label70.OnDownPtr       = 0;
  Label70.OnClickPtr      = 0;
  Label70.OnPressPtr      = 0;

  Label71.OwnerScreen     = &GPS_Test;
  Label71.Order           = 22;
  Label71.Left            = 284;
  Label71.Top             = 177;
  Label71.Width           = 36;
  Label71.Height          = 20;
  Label71.Visible         = 1;
  Label71.Active          = 1;
  Label71.Caption         = Label71_Caption;
  Label71.FontName        = Arial_Black13x18_Regular;
  Label71.Font_Color      = 0x0000;
  Label71.OnUpPtr         = 0;
  Label71.OnDownPtr       = 0;
  Label71.OnClickPtr      = 0;
  Label71.OnPressPtr      = 0;

  Label72.OwnerScreen     = &GPS_Test;
  Label72.Order           = 23;
  Label72.Left            = 279;
  Label72.Top             = 177;
  Label72.Width           = 4;
  Label72.Height          = 20;
  Label72.Visible         = 1;
  Label72.Active          = 1;
  Label72.Caption         = Label72_Caption;
  Label72.FontName        = Arial_Black13x18_Regular;
  Label72.Font_Color      = 0x0000;
  Label72.OnUpPtr         = 0;
  Label72.OnDownPtr       = 0;
  Label72.OnClickPtr      = 0;
  Label72.OnPressPtr      = 0;

  Box13.OwnerScreen     = &Gyro_test;
  Box13.Order           = 0;
  Box13.Left            = 4;
  Box13.Top             = 5;
  Box13.Width           = 150;
  Box13.Height          = 23;
  Box13.Pen_Width       = 1;
  Box13.Pen_Color       = 0x0000;
  Box13.Visible         = 0;
  Box13.Active          = 1;
  Box13.Transparent     = 1;
  Box13.Gradient        = 0;
  Box13.Gradient_Orientation = 0;
  Box13.Gradient_Start_Color = 0xFFFF;
  Box13.Gradient_End_Color = 0xC618;
  Box13.Color           = 0xC618;
  Box13.PressColEnabled = 0;
  Box13.Press_Color     = 0xE71C;
  Box13.OnUpPtr         = 0;
  Box13.OnDownPtr       = 0;
  Box13.OnClickPtr      = doSettings;
  Box13.OnPressPtr      = 0;

  Box14.OwnerScreen     = &Gyro_test;
  Box14.Order           = 1;
  Box14.Left            = 0;
  Box14.Top             = 40;
  Box14.Width           = 480;
  Box14.Height          = 207;
  Box14.Pen_Width       = 1;
  Box14.Pen_Color       = 0xFFFF;
  Box14.Visible         = 1;
  Box14.Active          = 1;
  Box14.Transparent     = 1;
  Box14.Gradient        = 0;
  Box14.Gradient_Orientation = 0;
  Box14.Gradient_Start_Color = 0xFFFF;
  Box14.Gradient_End_Color = 0xFFFF;
  Box14.Color           = 0xFFFF;
  Box14.PressColEnabled = 0;
  Box14.Press_Color     = 0xFFFF;
  Box14.OnUpPtr         = 0;
  Box14.OnDownPtr       = 0;
  Box14.OnClickPtr      = 0;
  Box14.OnPressPtr      = 0;

  Image52.OwnerScreen     = &Gyro_test;
  Image52.Order           = 2;
  Image52.Left            = 5;
  Image52.Top             = 6;
  Image52.Width           = 22;
  Image52.Height          = 22;
  Image52.Picture_Type    = 0;
  Image52.Picture_Ratio   = 1;
  Image52.Picture_Name    = icon_back_gyro_bmp;
  Image52.Visible         = 1;
  Image52.Active          = 0;
  Image52.OnUpPtr         = 0;
  Image52.OnDownPtr       = 0;
  Image52.OnClickPtr      = doSettings;
  Image52.OnPressPtr      = doSettings;

  Label8.OwnerScreen     = &Gyro_test;
  Label8.Order           = 3;
  Label8.Left            = 32;
  Label8.Top             = 2;
  Label8.Width           = 113;
  Label8.Height          = 31;
  Label8.Visible         = 1;
  Label8.Active          = 0;
  Label8.Caption         = Label8_Caption;
  Label8.FontName        = Open_Sans_Light19x28_Regular;
  Label8.Font_Color      = 0xFFFF;
  Label8.OnUpPtr         = 0;
  Label8.OnDownPtr       = 0;
  Label8.OnClickPtr      = 0;
  Label8.OnPressPtr      = 0;

  Label9.OwnerScreen     = &Gyro_test;
  Label9.Order           = 4;
  Label9.Left            = 75;
  Label9.Top             = 250;
  Label9.Width           = 13;
  Label9.Height          = 24;
  Label9.Visible         = 1;
  Label9.Active          = 1;
  Label9.Caption         = Label9_Caption;
  Label9.FontName        = Open_Sans_Light14x22_Regular;
  Label9.Font_Color      = 0xF800;
  Label9.OnUpPtr         = 0;
  Label9.OnDownPtr       = 0;
  Label9.OnClickPtr      = 0;
  Label9.OnPressPtr      = 0;

  Label31.OwnerScreen     = &Gyro_test;
  Label31.Order           = 5;
  Label31.Left            = 225;
  Label31.Top             = 250;
  Label31.Width           = 13;
  Label31.Height          = 24;
  Label31.Visible         = 1;
  Label31.Active          = 1;
  Label31.Caption         = Label31_Caption;
  Label31.FontName        = Open_Sans_Light14x22_Regular;
  Label31.Font_Color      = 0x001F;
  Label31.OnUpPtr         = 0;
  Label31.OnDownPtr       = 0;
  Label31.OnClickPtr      = 0;
  Label31.OnPressPtr      = 0;

  Label33.OwnerScreen     = &Gyro_test;
  Label33.Order           = 6;
  Label33.Left            = 375;
  Label33.Top             = 250;
  Label33.Width           = 13;
  Label33.Height          = 24;
  Label33.Visible         = 1;
  Label33.Active          = 1;
  Label33.Caption         = Label33_Caption;
  Label33.FontName        = Open_Sans_Light14x22_Regular;
  Label33.Font_Color      = 0x0400;
  Label33.OnUpPtr         = 0;
  Label33.OnDownPtr       = 0;
  Label33.OnClickPtr      = 0;
  Label33.OnPressPtr      = 0;

  Box15.OwnerScreen     = &Magnetometer_test;
  Box15.Order           = 0;
  Box15.Left            = 4;
  Box15.Top             = 5;
  Box15.Width           = 240;
  Box15.Height          = 23;
  Box15.Pen_Width       = 1;
  Box15.Pen_Color       = 0x0000;
  Box15.Visible         = 0;
  Box15.Active          = 1;
  Box15.Transparent     = 1;
  Box15.Gradient        = 0;
  Box15.Gradient_Orientation = 0;
  Box15.Gradient_Start_Color = 0xFFFF;
  Box15.Gradient_End_Color = 0xC618;
  Box15.Color           = 0xC618;
  Box15.PressColEnabled = 0;
  Box15.Press_Color     = 0xE71C;
  Box15.OnUpPtr         = 0;
  Box15.OnDownPtr       = 0;
  Box15.OnClickPtr      = doSettings;
  Box15.OnPressPtr      = 0;

  Box18.OwnerScreen     = &Magnetometer_test;
  Box18.Order           = 1;
  Box18.Left            = 0;
  Box18.Top             = 40;
  Box18.Width           = 480;
  Box18.Height          = 207;
  Box18.Pen_Width       = 1;
  Box18.Pen_Color       = 0xFFFF;
  Box18.Visible         = 1;
  Box18.Active          = 1;
  Box18.Transparent     = 1;
  Box18.Gradient        = 0;
  Box18.Gradient_Orientation = 0;
  Box18.Gradient_Start_Color = 0xFFFF;
  Box18.Gradient_End_Color = 0xFFFF;
  Box18.Color           = 0xFFFF;
  Box18.PressColEnabled = 0;
  Box18.Press_Color     = 0xFFFF;
  Box18.OnUpPtr         = 0;
  Box18.OnDownPtr       = 0;
  Box18.OnClickPtr      = 0;
  Box18.OnPressPtr      = 0;

  Image53.OwnerScreen     = &Magnetometer_test;
  Image53.Order           = 2;
  Image53.Left            = 5;
  Image53.Top             = 6;
  Image53.Width           = 22;
  Image53.Height          = 22;
  Image53.Picture_Type    = 0;
  Image53.Picture_Ratio   = 1;
  Image53.Picture_Name    = icon_back_magnet_bmp;
  Image53.Visible         = 1;
  Image53.Active          = 0;
  Image53.OnUpPtr         = 0;
  Image53.OnDownPtr       = 0;
  Image53.OnClickPtr      = doSettings;
  Image53.OnPressPtr      = doSettings;

  Label34.OwnerScreen     = &Magnetometer_test;
  Label34.Order           = 3;
  Label34.Left            = 32;
  Label34.Top             = 2;
  Label34.Width           = 211;
  Label34.Height          = 31;
  Label34.Visible         = 1;
  Label34.Active          = 0;
  Label34.Caption         = Label34_Caption;
  Label34.FontName        = Open_Sans_Light19x28_Regular;
  Label34.Font_Color      = 0xFFFF;
  Label34.OnUpPtr         = 0;
  Label34.OnDownPtr       = 0;
  Label34.OnClickPtr      = 0;
  Label34.OnPressPtr      = 0;

  Label35.OwnerScreen     = &Magnetometer_test;
  Label35.Order           = 4;
  Label35.Left            = 75;
  Label35.Top             = 250;
  Label35.Width           = 13;
  Label35.Height          = 24;
  Label35.Visible         = 1;
  Label35.Active          = 1;
  Label35.Caption         = Label35_Caption;
  Label35.FontName        = Open_Sans_Light14x22_Regular;
  Label35.Font_Color      = 0xF800;
  Label35.OnUpPtr         = 0;
  Label35.OnDownPtr       = 0;
  Label35.OnClickPtr      = 0;
  Label35.OnPressPtr      = 0;

  Label36.OwnerScreen     = &Magnetometer_test;
  Label36.Order           = 5;
  Label36.Left            = 225;
  Label36.Top             = 250;
  Label36.Width           = 13;
  Label36.Height          = 24;
  Label36.Visible         = 1;
  Label36.Active          = 1;
  Label36.Caption         = Label36_Caption;
  Label36.FontName        = Open_Sans_Light14x22_Regular;
  Label36.Font_Color      = 0x001F;
  Label36.OnUpPtr         = 0;
  Label36.OnDownPtr       = 0;
  Label36.OnClickPtr      = 0;
  Label36.OnPressPtr      = 0;

  Label37.OwnerScreen     = &Magnetometer_test;
  Label37.Order           = 6;
  Label37.Left            = 375;
  Label37.Top             = 250;
  Label37.Width           = 13;
  Label37.Height          = 24;
  Label37.Visible         = 1;
  Label37.Active          = 1;
  Label37.Caption         = Label37_Caption;
  Label37.FontName        = Open_Sans_Light14x22_Regular;
  Label37.Font_Color      = 0x0400;
  Label37.OnUpPtr         = 0;
  Label37.OnDownPtr       = 0;
  Label37.OnClickPtr      = 0;
  Label37.OnPressPtr      = 0;

  Box19.OwnerScreen     = &Pressure_test;
  Box19.Order           = 0;
  Box19.Left            = 4;
  Box19.Top             = 5;
  Box19.Width           = 265;
  Box19.Height          = 23;
  Box19.Pen_Width       = 1;
  Box19.Pen_Color       = 0x0000;
  Box19.Visible         = 0;
  Box19.Active          = 1;
  Box19.Transparent     = 1;
  Box19.Gradient        = 0;
  Box19.Gradient_Orientation = 0;
  Box19.Gradient_Start_Color = 0xFFFF;
  Box19.Gradient_End_Color = 0xC618;
  Box19.Color           = 0xC618;
  Box19.PressColEnabled = 0;
  Box19.Press_Color     = 0xE71C;
  Box19.OnUpPtr         = 0;
  Box19.OnDownPtr       = 0;
  Box19.OnClickPtr      = doSettings;
  Box19.OnPressPtr      = 0;

  Box20.OwnerScreen     = &Pressure_test;
  Box20.Order           = 1;
  Box20.Left            = 0;
  Box20.Top             = 40;
  Box20.Width           = 480;
  Box20.Height          = 207;
  Box20.Pen_Width       = 1;
  Box20.Pen_Color       = 0xFFFF;
  Box20.Visible         = 1;
  Box20.Active          = 1;
  Box20.Transparent     = 1;
  Box20.Gradient        = 0;
  Box20.Gradient_Orientation = 0;
  Box20.Gradient_Start_Color = 0xFFFF;
  Box20.Gradient_End_Color = 0xFFFF;
  Box20.Color           = 0xFFFF;
  Box20.PressColEnabled = 0;
  Box20.Press_Color     = 0xFFFF;
  Box20.OnUpPtr         = 0;
  Box20.OnDownPtr       = 0;
  Box20.OnClickPtr      = 0;
  Box20.OnPressPtr      = 0;

  Image54.OwnerScreen     = &Pressure_test;
  Image54.Order           = 2;
  Image54.Left            = 5;
  Image54.Top             = 6;
  Image54.Width           = 22;
  Image54.Height          = 22;
  Image54.Picture_Type    = 0;
  Image54.Picture_Ratio   = 1;
  Image54.Picture_Name    = icon_back_pressure_bmp;
  Image54.Visible         = 1;
  Image54.Active          = 0;
  Image54.OnUpPtr         = 0;
  Image54.OnDownPtr       = 0;
  Image54.OnClickPtr      = doPrevScreen;
  Image54.OnPressPtr      = doPrevScreen;

  Label38.OwnerScreen     = &Pressure_test;
  Label38.Order           = 3;
  Label38.Left            = 32;
  Label38.Top             = 2;
  Label38.Width           = 226;
  Label38.Height          = 31;
  Label38.Visible         = 1;
  Label38.Active          = 0;
  Label38.Caption         = Label38_Caption;
  Label38.FontName        = Open_Sans_Light19x28_Regular;
  Label38.Font_Color      = 0xFFFF;
  Label38.OnUpPtr         = 0;
  Label38.OnDownPtr       = 0;
  Label38.OnClickPtr      = 0;
  Label38.OnPressPtr      = 0;

  Label39.OwnerScreen     = &Pressure_test;
  Label39.Order           = 4;
  Label39.Left            = 75;
  Label39.Top             = 250;
  Label39.Width           = 13;
  Label39.Height          = 24;
  Label39.Visible         = 1;
  Label39.Active          = 1;
  Label39.Caption         = Label39_Caption;
  Label39.FontName        = Open_Sans_Light14x22_Regular;
  Label39.Font_Color      = 0xF800;
  Label39.OnUpPtr         = 0;
  Label39.OnDownPtr       = 0;
  Label39.OnClickPtr      = 0;
  Label39.OnPressPtr      = 0;

  Label40.OwnerScreen     = &Pressure_test;
  Label40.Order           = 5;
  Label40.Left            = 225;
  Label40.Top             = 250;
  Label40.Width           = 13;
  Label40.Height          = 24;
  Label40.Visible         = 1;
  Label40.Active          = 1;
  Label40.Caption         = Label40_Caption;
  Label40.FontName        = Open_Sans_Light14x22_Regular;
  Label40.Font_Color      = 0x001F;
  Label40.OnUpPtr         = 0;
  Label40.OnDownPtr       = 0;
  Label40.OnClickPtr      = 0;
  Label40.OnPressPtr      = 0;

  Label41.OwnerScreen     = &Pressure_test;
  Label41.Order           = 6;
  Label41.Left            = 375;
  Label41.Top             = 250;
  Label41.Width           = 13;
  Label41.Height          = 24;
  Label41.Visible         = 1;
  Label41.Active          = 1;
  Label41.Caption         = Label41_Caption;
  Label41.FontName        = Open_Sans_Light14x22_Regular;
  Label41.Font_Color      = 0x0400;
  Label41.OnUpPtr         = 0;
  Label41.OnDownPtr       = 0;
  Label41.OnClickPtr      = 0;
  Label41.OnPressPtr      = 0;

  Box21.OwnerScreen     = &Humidity_test;
  Box21.Order           = 0;
  Box21.Left            = 4;
  Box21.Top             = 5;
  Box21.Width           = 265;
  Box21.Height          = 23;
  Box21.Pen_Width       = 1;
  Box21.Pen_Color       = 0x0000;
  Box21.Visible         = 0;
  Box21.Active          = 1;
  Box21.Transparent     = 1;
  Box21.Gradient        = 0;
  Box21.Gradient_Orientation = 0;
  Box21.Gradient_Start_Color = 0xFFFF;
  Box21.Gradient_End_Color = 0xC618;
  Box21.Color           = 0xC618;
  Box21.PressColEnabled = 0;
  Box21.Press_Color     = 0xE71C;
  Box21.OnUpPtr         = 0;
  Box21.OnDownPtr       = 0;
  Box21.OnClickPtr      = doSettings;
  Box21.OnPressPtr      = 0;

  Box22.OwnerScreen     = &Humidity_test;
  Box22.Order           = 1;
  Box22.Left            = 0;
  Box22.Top             = 40;
  Box22.Width           = 480;
  Box22.Height          = 207;
  Box22.Pen_Width       = 1;
  Box22.Pen_Color       = 0xFFFF;
  Box22.Visible         = 1;
  Box22.Active          = 1;
  Box22.Transparent     = 1;
  Box22.Gradient        = 0;
  Box22.Gradient_Orientation = 0;
  Box22.Gradient_Start_Color = 0xFFFF;
  Box22.Gradient_End_Color = 0xFFFF;
  Box22.Color           = 0xFFFF;
  Box22.PressColEnabled = 0;
  Box22.Press_Color     = 0xFFFF;
  Box22.OnUpPtr         = 0;
  Box22.OnDownPtr       = 0;
  Box22.OnClickPtr      = 0;
  Box22.OnPressPtr      = 0;

  Image55.OwnerScreen     = &Humidity_test;
  Image55.Order           = 2;
  Image55.Left            = 5;
  Image55.Top             = 6;
  Image55.Width           = 22;
  Image55.Height          = 22;
  Image55.Picture_Type    = 0;
  Image55.Picture_Ratio   = 1;
  Image55.Picture_Name    = icon_back_pressure_bmp;
  Image55.Visible         = 1;
  Image55.Active          = 0;
  Image55.OnUpPtr         = 0;
  Image55.OnDownPtr       = 0;
  Image55.OnClickPtr      = doPrevScreen;
  Image55.OnPressPtr      = doPrevScreen;

  Label42.OwnerScreen     = &Humidity_test;
  Label42.Order           = 3;
  Label42.Left            = 32;
  Label42.Top             = 2;
  Label42.Width           = 227;
  Label42.Height          = 31;
  Label42.Visible         = 1;
  Label42.Active          = 0;
  Label42.Caption         = Label42_Caption;
  Label42.FontName        = Open_Sans_Light19x28_Regular;
  Label42.Font_Color      = 0xFFFF;
  Label42.OnUpPtr         = 0;
  Label42.OnDownPtr       = 0;
  Label42.OnClickPtr      = 0;
  Label42.OnPressPtr      = 0;

  Label43.OwnerScreen     = &Humidity_test;
  Label43.Order           = 4;
  Label43.Left            = 75;
  Label43.Top             = 250;
  Label43.Width           = 13;
  Label43.Height          = 24;
  Label43.Visible         = 1;
  Label43.Active          = 1;
  Label43.Caption         = Label43_Caption;
  Label43.FontName        = Open_Sans_Light14x22_Regular;
  Label43.Font_Color      = 0xF800;
  Label43.OnUpPtr         = 0;
  Label43.OnDownPtr       = 0;
  Label43.OnClickPtr      = 0;
  Label43.OnPressPtr      = 0;

  Label44.OwnerScreen     = &Humidity_test;
  Label44.Order           = 5;
  Label44.Left            = 225;
  Label44.Top             = 250;
  Label44.Width           = 13;
  Label44.Height          = 24;
  Label44.Visible         = 1;
  Label44.Active          = 1;
  Label44.Caption         = Label44_Caption;
  Label44.FontName        = Open_Sans_Light14x22_Regular;
  Label44.Font_Color      = 0x001F;
  Label44.OnUpPtr         = 0;
  Label44.OnDownPtr       = 0;
  Label44.OnClickPtr      = 0;
  Label44.OnPressPtr      = 0;

  Label45.OwnerScreen     = &Humidity_test;
  Label45.Order           = 6;
  Label45.Left            = 375;
  Label45.Top             = 250;
  Label45.Width           = 13;
  Label45.Height          = 24;
  Label45.Visible         = 1;
  Label45.Active          = 1;
  Label45.Caption         = Label45_Caption;
  Label45.FontName        = Open_Sans_Light14x22_Regular;
  Label45.Font_Color      = 0x0400;
  Label45.OnUpPtr         = 0;
  Label45.OnDownPtr       = 0;
  Label45.OnClickPtr      = 0;
  Label45.OnPressPtr      = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetRoundButton(index)         CurrentScreen->Buttons_Round[index]
#define GetLabel(index)               CurrentScreen->Labels[index]
#define GetImage(index)               CurrentScreen->Images[index]
#define GetCImage(index)              CurrentScreen->CImages[index]
#define GetCircle(index)              CurrentScreen->Circles[index]
#define GetCircleButton(index)        CurrentScreen->CircleButtons[index]
#define GetBox(index)                 CurrentScreen->Boxes[index]
#define GetCBox(index)                CurrentScreen->CBoxes[index]
#define GetLine(index)                CurrentScreen->Lines[index]


void DrawRoundButton(TButton_Round *Around_button) {
    if (Around_button->Visible == 1) {
      if (object_pressed == 1) {
        object_pressed = 0;
        TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
                      Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
      }
      else {
        TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
                      Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
      }
      TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
      TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
        Around_button->Left + Around_button->Width - 2,
        Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
      TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
      TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
      if (Around_button->TextAlign == _taLeft)
        TFT_Write_Text(Around_button->Caption, Around_button->Left + 4, (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
      else if (Around_button->TextAlign == _taCenter)
        TFT_Write_Text(Around_button->Caption, (Around_button->Left + (Around_button->Width - caption_length) / 2), (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
      else if (Around_button->TextAlign == _taRight)
        TFT_Write_Text(Around_button->Caption, Around_button->Left + (Around_button->Width - caption_length - 4), (Around_button->Top + (Around_button->Height - caption_height) / 2));
    }
}

void DrawLabel(TLabel *ALabel) {
  if (ALabel->Visible == 1) {
    TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
  }
}

void DrawImage(TImage *AImage) {
  if (AImage->Visible) {
    TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
  }
}

void DrawCImage(TCImage *AImage) {
  if (AImage->Visible) {
    TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
  }
}

void DrawCircle(TCircle *ACircle) {
  if (ACircle->Visible == 1) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
                    ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
                    ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
    }
    TFT_Set_Pen(ACircle->Pen_Color, ACircle->Pen_Width);
    TFT_Circle(ACircle->Left + ACircle->Radius,
               ACircle->Top + ACircle->Radius,
               ACircle->Radius);
  }
}

void DrawCircleButton(TCircleButton *ACircle_button) {
  if (ACircle_button->Visible == 1) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
                    ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
                    ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
    }
    TFT_Set_Pen(ACircle_button->Pen_Color, ACircle_button->Pen_Width);
    TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
               ACircle_button->Top + ACircle_button->Radius,
               ACircle_button->Radius);
    TFT_Set_Ext_Font(ACircle_button->FontName, ACircle_button->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(ACircle_button->Caption, ACircle_button->Left, ACircle_button->Top);
    if (ACircle_button->TextAlign == _taLeft)
      TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + 4, (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
    else if (ACircle_button->TextAlign == _taCenter)
      TFT_Write_Text(ACircle_button->Caption, (ACircle_button->Left + (ACircle_button->Radius*2 - caption_length) / 2), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
    else if (ACircle_button->TextAlign == _taRight)
      TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + (ACircle_button->Radius*2 - caption_length - 4), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
  }
}

void DrawBox(TBox *ABox) {
  if (ABox->Visible == 1) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
    }
    TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
    TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
  }
}

void DrawCBox(TCBox *ABox) {
  if (ABox->Visible == 1) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
    }
    TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
    TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
  }
}

void DrawLine(TLine *Aline) {
  if (Aline->Visible == 1) {
    TFT_Set_Pen(Aline->Color, Aline->Pen_Width);
    TFT_Line(Aline->First_Point_X, Aline->First_Point_Y, Aline->Second_Point_X, Aline->Second_Point_Y);
  }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
  unsigned short round_button_idx;
  TButton_Round *local_round_button;
  unsigned short label_idx;
  TLabel *local_label;
  unsigned short image_idx;
  TImage *local_image;
  unsigned short cimage_idx;
  TCImage *local_cimage;
  unsigned short circle_idx;
  TCircle *local_circle;
  unsigned short circle_button_idx;
  TCircleButton *local_circle_button;
  unsigned short box_idx;
  TBox *local_box;
  unsigned short cbox_idx;
  TCBox *local_cbox;
  unsigned short line_idx;
  TLine *local_line;
  char save_bled, save_bled_direction;

  object_pressed = 0;
  order = 0;
  round_button_idx = 0;
  label_idx = 0;
  image_idx = 0;
  cimage_idx = 0;
  circle_idx = 0;
  circle_button_idx = 0;
  box_idx = 0;
  cbox_idx = 0;
  line_idx = 0;
  CurrentScreen = aScreen;

  if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
    save_bled = TFT_BLED;
    TFT_BLED           = 0;
    TFT_Set_Active(Set_Index, Write_Command, Write_Data);
    TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
    STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Set_Ext_Buffer(TFT_Get_Data);
    TFT_Fill_Screen(CurrentScreen->Color);
    display_width = CurrentScreen->Width;
    display_height = CurrentScreen->Height;
    TFT_BLED           = save_bled;
  }
  else
    TFT_Fill_Screen(CurrentScreen->Color);


  while (order < CurrentScreen->ObjectsCount) {
    if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
      local_round_button = GetRoundButton(round_button_idx);
      if (order == local_round_button->Order) {
        round_button_idx++;
        order++;
        DrawRoundButton(local_round_button);
      }
    }

    if (label_idx < CurrentScreen->LabelsCount) {
      local_label = GetLabel(label_idx);
      if (order == local_label->Order) {
        label_idx++;
        order++;
        DrawLabel(local_label);
      }
    }

    if (circle_idx < CurrentScreen->CirclesCount) {
      local_circle = GetCircle(circle_idx);
      if (order == local_circle->Order) {
        circle_idx++;
        order++;
        DrawCircle(local_circle);
      }
    }

    if (circle_button_idx < CurrentScreen->CircleButtonsCount) {
      local_circle_button = GetCircleButton(circle_button_idx);
      if (order == local_circle_button->Order) {
        circle_button_idx++;
        order++;
        DrawCircleButton(local_circle_button);
      }
    }

    if (box_idx < CurrentScreen->BoxesCount) {
      local_box = GetBox(box_idx);
      if (order == local_box->Order) {
        box_idx++;
        order++;
        DrawBox(local_box);
      }
    }

    if (cbox_idx < CurrentScreen->CBoxesCount) {
      local_cbox = GetCBox(cbox_idx);
      if (order == local_cbox->Order) {
        cbox_idx++;
        order++;
        DrawCBox(local_cbox);
      }
    }

    if (line_idx < CurrentScreen->LinesCount) {
      local_line = GetLine(line_idx);
      if (order == local_line->Order) {
        line_idx++;
        order++;
        DrawLine(local_line);
      }
    }

    if (image_idx < CurrentScreen->ImagesCount) {
      local_image = GetImage(image_idx);
      if (order == local_image->Order) {
        image_idx++;
        order++;
        DrawImage(local_image);
      }
    }

    if (cimage_idx < CurrentScreen->CImagesCount) {
      local_cimage = GetCImage(cimage_idx);
      if (order == local_cimage->Order) {
        cimage_idx++;
        order++;
        DrawCImage(local_cimage);
      }
    }

  }
}

void Get_Object(unsigned int X, unsigned int Y) {
  round_button_order  = -1;
  label_order         = -1;
  image_order         = -1;
  cimage_order        = -1;
  circle_order        = -1;
  circle_button_order = -1;
  box_order           = -1;
  cbox_order          = -1;
  //  Buttons with Round Edges
  for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
    local_round_button = GetRoundButton(_object_count);
    if (local_round_button->Active == 1) {
      if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
                         local_round_button->Width, local_round_button->Height) == 1) {
        round_button_order = local_round_button->Order;
        exec_round_button = local_round_button;
      }
    }
  }

  //  Labels
  for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
    local_label = GetLabel(_object_count);
    if (local_label->Active == 1) {
      if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
                         local_label->Width, local_label->Height) == 1) {
        label_order = local_label->Order;
        exec_label = local_label;
      }
    }
  }

  //  Images
  for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
    local_image = GetImage(_object_count);
    if (local_image->Active == 1) {
      if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
                         local_image->Width, local_image->Height) == 1) {
        image_order = local_image->Order;
        exec_image = local_image;
      }
    }
  }

  //  CImages
  for ( _object_count = 0 ; _object_count < CurrentScreen->CImagesCount ; _object_count++ ) {
    local_cimage = GetCImage(_object_count);
    if (local_cimage->Active == 1) {
      if (IsInsideObject(X, Y, local_cimage->Left, local_cimage->Top,
                         local_cimage->Width, local_cimage->Height) == 1) {
        cimage_order = local_cimage->Order;
        exec_cimage = local_cimage;
      }
    }
  }

  //  Circles
  for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
    local_circle = GetCircle(_object_count);
    if (local_circle->Active == 1) {
      if (IsInsideObject(X, Y, local_circle->Left, local_circle->Top,
                        (local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
        circle_order = local_circle->Order;
        exec_circle = local_circle;
      }
    }
  }

  //  Circle Buttons
  for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
    local_circle_button = GetCircleButton(_object_count);
    if (local_circle_button->Active == 1) {
      if (IsInsideObject(X, Y, local_circle_button->Left, local_circle_button->Top,
                        (local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
        circle_button_order = local_circle_button->Order;
        exec_circle_button = local_circle_button;
      }
    }
  }

  //  Boxes
  for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
    local_box = GetBox(_object_count);
    if (local_box->Active == 1) {
      if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
                         local_box->Width, local_box->Height) == 1) {
        box_order = local_box->Order;
        exec_box = local_box;
      }
    }
  }

  //  CBoxes
  for ( _object_count = 0 ; _object_count < CurrentScreen->CBoxesCount ; _object_count++ ) {
    local_cbox = GetCBox(_object_count);
    if (local_cbox->Active == 1) {
      if (IsInsideObject(X, Y, local_cbox->Left, local_cbox->Top,
                         local_cbox->Width, local_cbox->Height) == 1) {
        cbox_order = local_cbox->Order;
        exec_cbox = local_cbox;
      }
    }
  }

  _object_count = -1;
  if (round_button_order >  _object_count )
    _object_count = round_button_order;
  if (label_order >  _object_count )
    _object_count = label_order;
  if (image_order >  _object_count )
    _object_count = image_order;
  if (cimage_order >  _object_count )
    _object_count = cimage_order;
  if (circle_order >  _object_count )
    _object_count = circle_order;
  if (circle_button_order >  _object_count )
    _object_count = circle_button_order;
  if (box_order >  _object_count )
    _object_count = box_order;
  if (cbox_order >  _object_count )
    _object_count = cbox_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_cimage         = 0;
  exec_circle         = 0;
  exec_circle_button  = 0;
  exec_box            = 0;
  exec_cbox           = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == round_button_order) {
      if (exec_round_button->Active == 1) {
        if (exec_round_button->OnPressPtr != 0) {
          exec_round_button->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active == 1) {
        if (exec_label->OnPressPtr != 0) {
          exec_label->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active == 1) {
        if (exec_image->OnPressPtr != 0) {
          exec_image->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == cimage_order) {
      if (exec_cimage->Active == 1) {
        if (exec_cimage->OnPressPtr != 0) {
          exec_cimage->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == circle_order) {
      if (exec_circle->Active == 1) {
        if (exec_circle->OnPressPtr != 0) {
          exec_circle->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == circle_button_order) {
      if (exec_circle_button->Active == 1) {
        if (exec_circle_button->OnPressPtr != 0) {
          exec_circle_button->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == box_order) {
      if (exec_box->Active == 1) {
        if (exec_box->OnPressPtr != 0) {
          exec_box->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == cbox_order) {
      if (exec_cbox->Active == 1) {
        if (exec_cbox->OnPressPtr != 0) {
          exec_cbox->OnPressPtr();
          return;
        }
      }
    }

  }
}

void Process_TP_Up(unsigned int X, unsigned int Y) {

  switch (PressedObjectType) {
    // Round Button
    case 1: {
      if (PressedObject != 0) {
        exec_round_button = (TButton_Round*)PressedObject;
        if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
          DrawRoundButton(exec_round_button);
        }
        break;
      }
      break;
    }
    // Circle
    case 4: {
      if (PressedObject != 0) {
        exec_circle = (TCircle*)PressedObject;
        if ((exec_circle->PressColEnabled == 1) && (exec_circle->OwnerScreen == CurrentScreen)) {
          DrawCircle(exec_circle);
        }
        break;
      }
      break;
    }
    // Circle Button
    case 5: {
      if (PressedObject != 0) {
        exec_circle_button = (TCircleButton*)PressedObject;
        if ((exec_circle_button->PressColEnabled == 1) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
          DrawCircleButton(exec_circle_button);
        }
        break;
      }
      break;
    }
    // Box
    case 6: {
      if (PressedObject != 0) {
        exec_box = (TBox*)PressedObject;
        if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
          DrawBox(exec_box);
        }
        break;
      }
      break;
    }
    // CBox
    case 14: {
      if (PressedObject != 0) {
        exec_cbox = (TCBox*)PressedObject;
        if ((exec_cbox->PressColEnabled == 1) && (exec_cbox->OwnerScreen == CurrentScreen)) {
          DrawCBox(exec_cbox);
        }
        break;
      }
      break;
    }
  }

  exec_label          = 0;
  exec_image          = 0;
  exec_cimage          = 0;

  Get_Object(X, Y);


  if (_object_count != -1) {
  // Buttons with Round Edges
    if (_object_count == round_button_order) {
      if (exec_round_button->Active == 1) {
        if (exec_round_button->OnUpPtr != 0)
          exec_round_button->OnUpPtr();
        if (PressedObject == (TPointer)exec_round_button)
          if (exec_round_button->OnClickPtr != 0)
            exec_round_button->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Labels
    if (_object_count == label_order) {
      if (exec_label->Active == 1) {
        if (exec_label->OnUpPtr != 0)
          exec_label->OnUpPtr();
        if (PressedObject == (TPointer)exec_label)
          if (exec_label->OnClickPtr != 0)
            exec_label->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Images
    if (_object_count == image_order) {
      if (exec_image->Active == 1) {
        if (exec_image->OnUpPtr != 0)
          exec_image->OnUpPtr();
        if (PressedObject == (TPointer)exec_image)
          if (exec_image->OnClickPtr != 0)
            exec_image->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // CImages
    if (_object_count == cimage_order) {
      if (exec_cimage->Active == 1) {
        if (exec_cimage->OnUpPtr != 0)
          exec_cimage->OnUpPtr();
        if (PressedObject == (TPointer)exec_cimage)
          if (exec_cimage->OnClickPtr != 0)
            exec_cimage->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Circles
    if (_object_count == circle_order) {
      if (exec_circle->Active == 1) {
        if (exec_circle->OnUpPtr != 0)
          exec_circle->OnUpPtr();
        if (PressedObject == (TPointer)exec_circle)
          if (exec_circle->OnClickPtr != 0)
            exec_circle->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Circle Buttons
    if (_object_count == circle_button_order) {
      if (exec_circle_button->Active == 1) {
        if (exec_circle_button->OnUpPtr != 0)
          exec_circle_button->OnUpPtr();
        if (PressedObject == (TPointer)exec_circle_button)
          if (exec_circle_button->OnClickPtr != 0)
            exec_circle_button->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Boxes
    if (_object_count == box_order) {
      if (exec_box->Active == 1) {
        if (exec_box->OnUpPtr != 0)
          exec_box->OnUpPtr();
        if (PressedObject == (TPointer)exec_box)
          if (exec_box->OnClickPtr != 0)
            exec_box->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // CBoxes
    if (_object_count == cbox_order) {
      if (exec_cbox->Active == 1) {
        if (exec_cbox->OnUpPtr != 0)
          exec_cbox->OnUpPtr();
        if (PressedObject == (TPointer)exec_cbox)
          if (exec_cbox->OnClickPtr != 0)
            exec_cbox->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  }
  PressedObject = 0;
  PressedObjectType = -1;
}

void Process_TP_Down(unsigned int X, unsigned int Y) {

  object_pressed      = 0;
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_cimage         = 0;
  exec_circle         = 0;
  exec_circle_button  = 0;
  exec_box            = 0;
  exec_cbox           = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == round_button_order) {
      if (exec_round_button->Active == 1) {
        if (exec_round_button->PressColEnabled == 1) {
          object_pressed = 1;
          DrawRoundButton(exec_round_button);
        }
        PressedObject = (TPointer)exec_round_button;
        PressedObjectType = 1;
        if (exec_round_button->OnDownPtr != 0) {
          exec_round_button->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active == 1) {
        PressedObject = (TPointer)exec_label;
        PressedObjectType = 2;
        if (exec_label->OnDownPtr != 0) {
          exec_label->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active == 1) {
        PressedObject = (TPointer)exec_image;
        PressedObjectType = 3;
        if (exec_image->OnDownPtr != 0) {
          exec_image->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == cimage_order) {
      if (exec_cimage->Active == 1) {
        PressedObject = (TPointer)exec_cimage;
        PressedObjectType = 11;
        if (exec_cimage->OnDownPtr != 0) {
          exec_cimage->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == circle_order) {
      if (exec_circle->Active == 1) {
        if (exec_circle->PressColEnabled == 1) {
          object_pressed = 1;
          DrawCircle(exec_circle);
        }
        PressedObject = (TPointer)exec_circle;
        PressedObjectType = 4;
        if (exec_circle->OnDownPtr != 0) {
          exec_circle->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == circle_button_order) {
      if (exec_circle_button->Active == 1) {
        if (exec_circle_button->PressColEnabled == 1) {
          object_pressed = 1;
          DrawCircleButton(exec_circle_button);
        }
        PressedObject = (TPointer)exec_circle_button;
        PressedObjectType = 5;
        if (exec_circle_button->OnDownPtr != 0) {
          exec_circle_button->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == box_order) {
      if (exec_box->Active == 1) {
        if (exec_box->PressColEnabled == 1) {
          object_pressed = 1;
          DrawBox(exec_box);
        }
        PressedObject = (TPointer)exec_box;
        PressedObjectType = 6;
        if (exec_box->OnDownPtr != 0) {
          exec_box->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == cbox_order) {
      if (exec_cbox->Active == 1) {
        if (exec_cbox->PressColEnabled == 1) {
          object_pressed = 1;
          DrawCBox(exec_cbox);
        }
        PressedObject = (TPointer)exec_cbox;
        PressedObjectType = 14;
        if (exec_cbox->OnDownPtr != 0) {
          exec_cbox->OnDownPtr();
          return;
        }
      }
    }

  }
}

void Check_TP() {
  if (STMPE610_PressDetect()) {
    if (STMPE610_GetLastCoordinates(&Xcoord, &Ycoord) == 0) {
    // After a PRESS is detected read X-Y and convert it to Display dimensions space
      Process_TP_Press(Xcoord, Ycoord);
      if (PenDown == 0) {
        PenDown = 1;
        Process_TP_Down(Xcoord, Ycoord);
      }
    }
  }
  else if (PenDown == 1) {
    PenDown = 0;
    Process_TP_Up(Xcoord, Ycoord);
  }
}

void Init_MCU() {
char _cnt;
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
  for (_cnt = 0; _cnt < 20; _cnt++) {
    GPIOB_ODR.B6 = 0;
    Delay_ms(1);
    GPIOB_ODR.B6 = 1;
    Delay_ms(1);
  }

  I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
  TFT_Set_Default_Mode();
  GPIO_Digital_Output(&GPIOG_BASE, 0x00FF);
  GPIO_Digital_Output(&GPIOE_BASE, 0xFF00);
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
  GPIOB_ODR.B4 = 0;
  TFT_Set_Default_Mode();
  TFT_Set_MM_Plus();
  STMPE610_SetDefaultMode();
}

void Init_Ext_Mem() {
    // Initialize SDIO
    SDIO_Reset();

    SDIO_Init(_SDIO_CFG_POWER_SAVE_DISABLE | _SDIO_CFG_4_WIDE_BUS_MODE | _SDIO_CFG_CLOCK_BYPASS_DISABLE
            | _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 125, &_GPIO_MODULE_SDIO_D0_D3);

    // Set pull-ups on SDIO lines
    GPIOD_PUPDRbits.PUPDR2 = 1;
    GPIOC_PUPDRbits.PUPDR8 = 1;
    GPIOC_PUPDRbits.PUPDR9 = 1;
    GPIOC_PUPDRbits.PUPDR10 = 1;
    GPIOC_PUPDRbits.PUPDR11 = 1;

    Mmc_Set_Interface(_MMC_INTERFACE_SDIO);

    // Init the FAT library
    if (!Mmc_Fat_Init()) {
      // Increase SDIO speed (SDIO_CK)
      SDIO_Init(_SDIO_CFG_POWER_SAVE_DISABLE | _SDIO_CFG_4_WIDE_BUS_MODE | _SDIO_CFG_CLOCK_BYPASS_DISABLE
              | _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 1, &_GPIO_MODULE_SDIO_D0_D3);

      // Open resource file for read
      Mmc_Fat_Assign("Ducati_l.RES", 0);
      Mmc_Fat_Reset(&res_file_size);
    }
}

char STMPE610_Config()  {
  STMPE610_SetI2CAddress(STMPE610_I2C_ADDR1);
  if (STMPE610_IsOperational() != 0){
    return STMPE610_IO_NOT_OPERATIONAL;
  }

  STMPE610_Reset();
  STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
  STMPE610_AlternateFunction(STMPE610_GPIO_PIN1, STMPE610_ENABLE);
  STMPE610_SetGPIOPin(STMPE610_GPIO_PIN1, 0);   // IN1 to "0" -> I2C communication
  STMPE610_SetSize(480,272);
  STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
  STMPE610_EnableInterrupt(STMPE610_IE_TOUCH_DET | STMPE610_IE_FIFO_TH | STMPE610_IE_FIFO_0FLOW, STMPE610_ENABLE);
  STMPE610_ConfigureInterrupt(STMPE610_INT_POLARITY_ACTIVE_HIGH | STMPE610_INT_TYPE_EDGE | STMPE610_INT_ENABLE_ALL);
  STMPE610_SetADC(STMPE610_ADC_CTRL1_SAMPLETIME_44 | STMPE610_ADC_CTRL1_ADC_12BIT | STMPE610_ADC_CTRL1_INT_REFERENCE);
  Delay_10ms(); Delay_10ms();
  STMPE610_SetADCClock(STMPE610_ADC_CTRL2_3250_kHZ);
  STMPE610_AlternateFunction(STMPE610_GPIO_PIN4 | STMPE610_GPIO_PIN5 | STMPE610_GPIO_PIN6 | STMPE610_GPIO_PIN7, STMPE610_DISABLE);
  STMPE610_ConfigureTSC(STMPE610_TSC_CFG_AVE_CTRL_4S, STMPE610_TSC_CFG_TOUCH_DET_DELAY_500uS, STMPE610_TSC_CFG_TOUCH_SETTLING_500uS);
  STMPE610_SetFIFOThreshold(1);
  STMPE610_ResetFIFO();
  STMPE610_TSIDrive(STMPE610_TSC_I_DRIVE_20mA);
  STMPE610_TSControl(STMPE610_TSC_CTRL_TRACK0 | STMPE610_TSC_CTRL_ACQU_XYZ | STMPE610_TSC_CTRL_ENABLE);
  STMPE610_ZDataFraction(STMPE610_FRACP4_WHOLP4);
  STMPE610_SetTouchPressureThreshold(70);
  STMPE610_ClearInterrupts();
  STMPE610_WriteReg(STMPE610_INT_CTRL_REG, 0x01);
  return STMPE610_OK;
}


void Start_TP() {
  Init_MCU();

  Init_Ext_Mem();

  InitializeTouchPanel();
  if (STMPE610_Config() == STMPE610_OK) {
  } else {
    while(1);
  }


  Delay_ms(1000);
  TFT_Fill_Screen(0);
  Calibrate();
  TFT_Fill_Screen(0);

  InitializeObjects();
  display_width = Tachometer_graphics.Width;
  display_height = Tachometer_graphics.Height;
  DrawScreen(&Tachometer_graphics);
}
