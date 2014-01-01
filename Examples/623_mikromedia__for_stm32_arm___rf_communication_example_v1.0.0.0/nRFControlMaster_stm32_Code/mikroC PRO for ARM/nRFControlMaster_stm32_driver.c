#include "nRFControlMaster_stm32_objects.h"
#include "nRFControlMaster_stm32_resources.h"
#include "built_in.h"


// TFT module connections
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RST at GPIOF_ODR.B14;
sbit TFT_RS at GPIOF_ODR.B15;
sbit TFT_CS at GPIOF_ODR.B13;
sbit TFT_RD at GPIOF_ODR.B12;
sbit TFT_WR at GPIOF_ODR.B11;
sbit TFT_BLED at GPIOF_ODR.B10;

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
TButton *local_button;
TButton *exec_button;
int button_order;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TCLabel *local_clabel;
TCLabel *exec_clabel;
int clabel_order;
TImage *local_image;
TImage *exec_image;
int image_order;

void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
  unsigned int temp;
  temp = GPIOE_ODR;
  temp &= 0x00FF;
  GPIOE_ODR = temp | (_hi << 8);
  temp = GPIOG_ODR;
  temp &= 0xFF00;
  GPIOG_ODR = temp | _lo;
}

void TFT_mikromedia_Set_Index(unsigned short index) {
  TFT_RS = 0;
  Write_to_Data_Lines(0, index);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void TFT_mikromedia_Write_Command(unsigned short cmd) {
  TFT_RS = 1;
  Write_to_Data_Lines(0, cmd);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void TFT_Write_to_16bitPort(unsigned int _data) {
  TFT_RS = 1;
  Write_to_Data_Lines(Hi(_data), Lo(_data));
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}
static void InitializeTouchPanel() {
    TFT_Set_Active(&TFT_mikromedia_Set_Index, &TFT_mikromedia_Write_Command, &TFT_Write_to_16bitPort);
  TFT_Init_SSD1963(480, 272);

  TFT_Set_DBC_SSD1963(255);

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

  TScreen                Screen1;
  TImage               Image1;
  TButton_Round          ButtonRound1;
char ButtonRound1_Caption[1] = "";

  TButton_Round          ButtonRound2;
char ButtonRound2_Caption[1] = "";

  TButton_Round          ButtonRound3;
char ButtonRound3_Caption[1] = "";

  TButton_Round          ButtonRound4;
char ButtonRound4_Caption[1] = "";

  TButton_Round          ButtonRound5;
char ButtonRound5_Caption[1] = "";

  TButton_Round          ButtonRound6;
char ButtonRound6_Caption[1] = "";

  TButton_Round          ButtonRound7;
char ButtonRound7_Caption[1] = "";

  TButton_Round          ButtonRound8;
char ButtonRound8_Caption[1] = "";

  TButton               ButtonAllOn;
char ButtonAllOn_Caption[7] = "ALL ON";

  TButton               ButtonAllOff;
char ButtonAllOff_Caption[8] = "ALL OFF";

  TButton_Round          ButtonRound25;
char ButtonRound25_Caption[1] = "";

  TButton_Round          ButtonRound26;
char ButtonRound26_Caption[1] = "";

  TButton_Round          ButtonRound27;
char ButtonRound27_Caption[1] = "";

  TButton_Round          ButtonRound28;
char ButtonRound28_Caption[1] = "";

  TButton_Round          ButtonRound29;
char ButtonRound29_Caption[1] = "";

  TButton_Round          ButtonRound30;
char ButtonRound30_Caption[1] = "";

  TLabel                 Label1;
char Label1_Caption[9] = "PORT E/H";

  TCLabel          Label2 = 
         {
         &Screen1              , //   Label2.OwnerScreen
         18                    , //   Label2.Order          
         364                   , //   Label2.Left           
         36                    , //   Label2.Top             
         71                    , //   Label2.Width         
         36                    , //   Label2.Height       
         &Label2_Caption       , //   Label2.Caption        
         &Stencil_Std25x36_Regular, //   Label2.FontName       
         0xFFFF                , //   Label2.Font_Color     
         1                     , //   Label2.Visible        
         1                     , //   Label2.Active        
         0                     , //   Label2.OnUpPtr
         0                     , //   Label2.OnDownPtr
         0                     , //   Label2.OnClickPtr
         0                       //   Label2.OnPressPtr
         };
const char Label2_Caption[5] = "Leds";

  TButton                * const code Screen1_Buttons[2]=
         {
         &ButtonAllOn,         
         &ButtonAllOff         
         };
  TButton_Round          * const code Screen1_Buttons_Round[14]=
         {
         &ButtonRound1,        
         &ButtonRound2,        
         &ButtonRound3,        
         &ButtonRound4,        
         &ButtonRound5,        
         &ButtonRound6,        
         &ButtonRound7,        
         &ButtonRound8,        
         &ButtonRound25,       
         &ButtonRound26,       
         &ButtonRound27,       
         &ButtonRound28,       
         &ButtonRound29,       
         &ButtonRound30        
         };
  TLabel                 * const code Screen1_Labels[1]=
         {
         &Label1               
         };
  TCLabel                * const code Screen1_CLabels[1]=
         {
         &Label2               
         };
  TImage                 * const code Screen1_Images[1]=
         {
         &Image1               
         };



static void InitializeObjects() {
  Screen1.Color                     = 0x5AEB;
  Screen1.Width                     = 480;
  Screen1.Height                    = 272;
  Screen1.ButtonsCount              = 2;
  Screen1.Buttons                   = Screen1_Buttons;
  Screen1.Buttons_RoundCount        = 14;
  Screen1.Buttons_Round             = Screen1_Buttons_Round;
  Screen1.LabelsCount               = 1;
  Screen1.Labels                    = Screen1_Labels;
  Screen1.CLabelsCount              = 1;
  Screen1.CLabels                   = Screen1_CLabels;
  Screen1.ImagesCount               = 1;
  Screen1.Images                    = Screen1_Images;
  Screen1.ObjectsCount              = 19;


  Image1.OwnerScreen     = &Screen1;
  Image1.Order           = 0;
  Image1.Left            = 0;
  Image1.Top             = 0;
  Image1.Width           = 480;
  Image1.Height          = 272;
  Image1.Picture_Type    = 1;
  Image1.Picture_Ratio   = 1;
  Image1.Picture_Name    = bg_jpg;
  Image1.Visible         = 1;
  Image1.Active          = 1;
  Image1.OnUpPtr         = 0;
  Image1.OnDownPtr       = 0;
  Image1.OnClickPtr      = 0;
  Image1.OnPressPtr      = 0;

  ButtonRound1.OwnerScreen     = &Screen1;
  ButtonRound1.Order           = 1;
  ButtonRound1.Left            = 181;
  ButtonRound1.Top             = 61;
  ButtonRound1.Width           = 30;
  ButtonRound1.Height          = 30;
  ButtonRound1.Pen_Width       = 3;
  ButtonRound1.Pen_Color       = 0x2531;
  ButtonRound1.Visible         = 1;
  ButtonRound1.Active          = 1;
  ButtonRound1.Transparent     = 1;
  ButtonRound1.Caption         = ButtonRound1_Caption;
  ButtonRound1.TextAlign       = _taCenter;
  ButtonRound1.FontName        = Tahoma11x13_Regular;
  ButtonRound1.PressColEnabled = 1;
  ButtonRound1.Font_Color      = 0x0000;
  ButtonRound1.Gradient        = 1;
  ButtonRound1.Gradient_Orientation = 0;
  ButtonRound1.Gradient_Start_Color = 0xC618;
  ButtonRound1.Gradient_End_Color = 0x8410;
  ButtonRound1.Color           = 0xC618;
  ButtonRound1.Press_Color     = 0xE71C;
  ButtonRound1.Corner_Radius   = 3;
  ButtonRound1.OnUpPtr         = 0;
  ButtonRound1.OnDownPtr       = 0;
  ButtonRound1.OnClickPtr      = ButtonRound1OnClick;
  ButtonRound1.OnPressPtr      = 0;

  ButtonRound2.OwnerScreen     = &Screen1;
  ButtonRound2.Order           = 2;
  ButtonRound2.Left            = 181;
  ButtonRound2.Top             = 101;
  ButtonRound2.Width           = 30;
  ButtonRound2.Height          = 30;
  ButtonRound2.Pen_Width       = 3;
  ButtonRound2.Pen_Color       = 0x2531;
  ButtonRound2.Visible         = 1;
  ButtonRound2.Active          = 1;
  ButtonRound2.Transparent     = 1;
  ButtonRound2.Caption         = ButtonRound2_Caption;
  ButtonRound2.TextAlign       = _taCenter;
  ButtonRound2.FontName        = Tahoma11x13_Regular;
  ButtonRound2.PressColEnabled = 1;
  ButtonRound2.Font_Color      = 0x0000;
  ButtonRound2.Gradient        = 1;
  ButtonRound2.Gradient_Orientation = 0;
  ButtonRound2.Gradient_Start_Color = 0xC618;
  ButtonRound2.Gradient_End_Color = 0x8410;
  ButtonRound2.Color           = 0xC618;
  ButtonRound2.Press_Color     = 0xE71C;
  ButtonRound2.Corner_Radius   = 3;
  ButtonRound2.OnUpPtr         = 0;
  ButtonRound2.OnDownPtr       = 0;
  ButtonRound2.OnClickPtr      = ButtonRound2OnClick;
  ButtonRound2.OnPressPtr      = 0;

  ButtonRound3.OwnerScreen     = &Screen1;
  ButtonRound3.Order           = 3;
  ButtonRound3.Left            = 181;
  ButtonRound3.Top             = 142;
  ButtonRound3.Width           = 30;
  ButtonRound3.Height          = 30;
  ButtonRound3.Pen_Width       = 3;
  ButtonRound3.Pen_Color       = 0x2531;
  ButtonRound3.Visible         = 1;
  ButtonRound3.Active          = 1;
  ButtonRound3.Transparent     = 1;
  ButtonRound3.Caption         = ButtonRound3_Caption;
  ButtonRound3.TextAlign       = _taCenter;
  ButtonRound3.FontName        = Tahoma11x13_Regular;
  ButtonRound3.PressColEnabled = 1;
  ButtonRound3.Font_Color      = 0x0000;
  ButtonRound3.Gradient        = 1;
  ButtonRound3.Gradient_Orientation = 0;
  ButtonRound3.Gradient_Start_Color = 0xC618;
  ButtonRound3.Gradient_End_Color = 0x8410;
  ButtonRound3.Color           = 0xC618;
  ButtonRound3.Press_Color     = 0xE71C;
  ButtonRound3.Corner_Radius   = 3;
  ButtonRound3.OnUpPtr         = 0;
  ButtonRound3.OnDownPtr       = 0;
  ButtonRound3.OnClickPtr      = ButtonRound3OnClick;
  ButtonRound3.OnPressPtr      = 0;

  ButtonRound4.OwnerScreen     = &Screen1;
  ButtonRound4.Order           = 4;
  ButtonRound4.Left            = 181;
  ButtonRound4.Top             = 182;
  ButtonRound4.Width           = 30;
  ButtonRound4.Height          = 30;
  ButtonRound4.Pen_Width       = 3;
  ButtonRound4.Pen_Color       = 0x2531;
  ButtonRound4.Visible         = 1;
  ButtonRound4.Active          = 1;
  ButtonRound4.Transparent     = 1;
  ButtonRound4.Caption         = ButtonRound4_Caption;
  ButtonRound4.TextAlign       = _taCenter;
  ButtonRound4.FontName        = Tahoma11x13_Regular;
  ButtonRound4.PressColEnabled = 1;
  ButtonRound4.Font_Color      = 0x0000;
  ButtonRound4.Gradient        = 1;
  ButtonRound4.Gradient_Orientation = 0;
  ButtonRound4.Gradient_Start_Color = 0xC618;
  ButtonRound4.Gradient_End_Color = 0x8410;
  ButtonRound4.Color           = 0xC618;
  ButtonRound4.Press_Color     = 0xE71C;
  ButtonRound4.Corner_Radius   = 3;
  ButtonRound4.OnUpPtr         = 0;
  ButtonRound4.OnDownPtr       = 0;
  ButtonRound4.OnClickPtr      = ButtonRound4OnClick;
  ButtonRound4.OnPressPtr      = 0;

  ButtonRound5.OwnerScreen     = &Screen1;
  ButtonRound5.Order           = 5;
  ButtonRound5.Left            = 274;
  ButtonRound5.Top             = 61;
  ButtonRound5.Width           = 30;
  ButtonRound5.Height          = 30;
  ButtonRound5.Pen_Width       = 3;
  ButtonRound5.Pen_Color       = 0x2531;
  ButtonRound5.Visible         = 1;
  ButtonRound5.Active          = 1;
  ButtonRound5.Transparent     = 1;
  ButtonRound5.Caption         = ButtonRound5_Caption;
  ButtonRound5.TextAlign       = _taCenter;
  ButtonRound5.FontName        = Tahoma11x13_Regular;
  ButtonRound5.PressColEnabled = 1;
  ButtonRound5.Font_Color      = 0x0000;
  ButtonRound5.Gradient        = 1;
  ButtonRound5.Gradient_Orientation = 0;
  ButtonRound5.Gradient_Start_Color = 0xC618;
  ButtonRound5.Gradient_End_Color = 0x8410;
  ButtonRound5.Color           = 0xC618;
  ButtonRound5.Press_Color     = 0xE71C;
  ButtonRound5.Corner_Radius   = 3;
  ButtonRound5.OnUpPtr         = 0;
  ButtonRound5.OnDownPtr       = 0;
  ButtonRound5.OnClickPtr      = ButtonRound5OnClick;
  ButtonRound5.OnPressPtr      = 0;

  ButtonRound6.OwnerScreen     = &Screen1;
  ButtonRound6.Order           = 6;
  ButtonRound6.Left            = 273;
  ButtonRound6.Top             = 101;
  ButtonRound6.Width           = 30;
  ButtonRound6.Height          = 30;
  ButtonRound6.Pen_Width       = 3;
  ButtonRound6.Pen_Color       = 0x2531;
  ButtonRound6.Visible         = 1;
  ButtonRound6.Active          = 1;
  ButtonRound6.Transparent     = 1;
  ButtonRound6.Caption         = ButtonRound6_Caption;
  ButtonRound6.TextAlign       = _taCenter;
  ButtonRound6.FontName        = Tahoma11x13_Regular;
  ButtonRound6.PressColEnabled = 1;
  ButtonRound6.Font_Color      = 0x0000;
  ButtonRound6.Gradient        = 1;
  ButtonRound6.Gradient_Orientation = 0;
  ButtonRound6.Gradient_Start_Color = 0xC618;
  ButtonRound6.Gradient_End_Color = 0x8410;
  ButtonRound6.Color           = 0xC618;
  ButtonRound6.Press_Color     = 0xE71C;
  ButtonRound6.Corner_Radius   = 3;
  ButtonRound6.OnUpPtr         = 0;
  ButtonRound6.OnDownPtr       = 0;
  ButtonRound6.OnClickPtr      = ButtonRound6OnClick;
  ButtonRound6.OnPressPtr      = 0;

  ButtonRound7.OwnerScreen     = &Screen1;
  ButtonRound7.Order           = 7;
  ButtonRound7.Left            = 273;
  ButtonRound7.Top             = 142;
  ButtonRound7.Width           = 30;
  ButtonRound7.Height          = 30;
  ButtonRound7.Pen_Width       = 3;
  ButtonRound7.Pen_Color       = 0x2531;
  ButtonRound7.Visible         = 1;
  ButtonRound7.Active          = 1;
  ButtonRound7.Transparent     = 1;
  ButtonRound7.Caption         = ButtonRound7_Caption;
  ButtonRound7.TextAlign       = _taCenter;
  ButtonRound7.FontName        = Tahoma11x13_Regular;
  ButtonRound7.PressColEnabled = 1;
  ButtonRound7.Font_Color      = 0x0000;
  ButtonRound7.Gradient        = 1;
  ButtonRound7.Gradient_Orientation = 0;
  ButtonRound7.Gradient_Start_Color = 0xC618;
  ButtonRound7.Gradient_End_Color = 0x8410;
  ButtonRound7.Color           = 0xC618;
  ButtonRound7.Press_Color     = 0xE71C;
  ButtonRound7.Corner_Radius   = 3;
  ButtonRound7.OnUpPtr         = 0;
  ButtonRound7.OnDownPtr       = 0;
  ButtonRound7.OnClickPtr      = ButtonRound7OnClick;
  ButtonRound7.OnPressPtr      = 0;

  ButtonRound8.OwnerScreen     = &Screen1;
  ButtonRound8.Order           = 8;
  ButtonRound8.Left            = 273;
  ButtonRound8.Top             = 182;
  ButtonRound8.Width           = 30;
  ButtonRound8.Height          = 30;
  ButtonRound8.Pen_Width       = 3;
  ButtonRound8.Pen_Color       = 0x2531;
  ButtonRound8.Visible         = 1;
  ButtonRound8.Active          = 1;
  ButtonRound8.Transparent     = 1;
  ButtonRound8.Caption         = ButtonRound8_Caption;
  ButtonRound8.TextAlign       = _taCenter;
  ButtonRound8.FontName        = Tahoma11x13_Regular;
  ButtonRound8.PressColEnabled = 1;
  ButtonRound8.Font_Color      = 0x0000;
  ButtonRound8.Gradient        = 1;
  ButtonRound8.Gradient_Orientation = 0;
  ButtonRound8.Gradient_Start_Color = 0xC618;
  ButtonRound8.Gradient_End_Color = 0x8410;
  ButtonRound8.Color           = 0xC618;
  ButtonRound8.Press_Color     = 0xE71C;
  ButtonRound8.Corner_Radius   = 3;
  ButtonRound8.OnUpPtr         = 0;
  ButtonRound8.OnDownPtr       = 0;
  ButtonRound8.OnClickPtr      = ButtonRound8OnClick;
  ButtonRound8.OnPressPtr      = 0;

  ButtonAllOn.OwnerScreen     = &Screen1;
  ButtonAllOn.Order           = 9;
  ButtonAllOn.Left            = 11;
  ButtonAllOn.Top             = 228;
  ButtonAllOn.Width           = 75;
  ButtonAllOn.Height          = 31;
  ButtonAllOn.Pen_Width       = 4;
  ButtonAllOn.Pen_Color       = 0x2531;
  ButtonAllOn.Visible         = 1;
  ButtonAllOn.Active          = 1;
  ButtonAllOn.Transparent     = 1;
  ButtonAllOn.Caption         = ButtonAllOn_Caption;
  ButtonAllOn.TextAlign       = _taCenter;
  ButtonAllOn.FontName        = Tahoma13x13_Bold;
  ButtonAllOn.PressColEnabled = 1;
  ButtonAllOn.Font_Color      = 0x0000;
  ButtonAllOn.Gradient        = 1;
  ButtonAllOn.Gradient_Orientation = 0;
  ButtonAllOn.Gradient_Start_Color = 0xFFFF;
  ButtonAllOn.Gradient_End_Color = 0xC618;
  ButtonAllOn.Color           = 0xC618;
  ButtonAllOn.Press_Color     = 0xE71C;
  ButtonAllOn.OnUpPtr         = 0;
  ButtonAllOn.OnDownPtr       = 0;
  ButtonAllOn.OnClickPtr      = ButtonAllOnOnClick;
  ButtonAllOn.OnPressPtr      = 0;

  ButtonAllOff.OwnerScreen     = &Screen1;
  ButtonAllOff.Order           = 10;
  ButtonAllOff.Left            = 394;
  ButtonAllOff.Top             = 228;
  ButtonAllOff.Width           = 75;
  ButtonAllOff.Height          = 31;
  ButtonAllOff.Pen_Width       = 4;
  ButtonAllOff.Pen_Color       = 0x2531;
  ButtonAllOff.Visible         = 1;
  ButtonAllOff.Active          = 1;
  ButtonAllOff.Transparent     = 1;
  ButtonAllOff.Caption         = ButtonAllOff_Caption;
  ButtonAllOff.TextAlign       = _taCenter;
  ButtonAllOff.FontName        = Tahoma13x13_Bold;
  ButtonAllOff.PressColEnabled = 1;
  ButtonAllOff.Font_Color      = 0x0000;
  ButtonAllOff.Gradient        = 1;
  ButtonAllOff.Gradient_Orientation = 0;
  ButtonAllOff.Gradient_Start_Color = 0xFFFF;
  ButtonAllOff.Gradient_End_Color = 0xC618;
  ButtonAllOff.Color           = 0xC618;
  ButtonAllOff.Press_Color     = 0xE71C;
  ButtonAllOff.OnUpPtr         = 0;
  ButtonAllOff.OnDownPtr       = 0;
  ButtonAllOff.OnClickPtr      = ButtonAllOffOnClick;
  ButtonAllOff.OnPressPtr      = 0;

  ButtonRound25.OwnerScreen     = &Screen1;
  ButtonRound25.Order           = 11;
  ButtonRound25.Left            = 103;
  ButtonRound25.Top             = 61;
  ButtonRound25.Width           = 30;
  ButtonRound25.Height          = 30;
  ButtonRound25.Pen_Width       = 3;
  ButtonRound25.Pen_Color       = 0x2531;
  ButtonRound25.Visible         = 1;
  ButtonRound25.Active          = 1;
  ButtonRound25.Transparent     = 1;
  ButtonRound25.Caption         = ButtonRound25_Caption;
  ButtonRound25.TextAlign       = _taCenter;
  ButtonRound25.FontName        = Tahoma11x13_Regular;
  ButtonRound25.PressColEnabled = 1;
  ButtonRound25.Font_Color      = 0x0000;
  ButtonRound25.Gradient        = 1;
  ButtonRound25.Gradient_Orientation = 0;
  ButtonRound25.Gradient_Start_Color = 0x8410;
  ButtonRound25.Gradient_End_Color = 0x0000;
  ButtonRound25.Color           = 0xC618;
  ButtonRound25.Press_Color     = 0xE71C;
  ButtonRound25.Corner_Radius   = 3;
  ButtonRound25.OnUpPtr         = 0;
  ButtonRound25.OnDownPtr       = 0;
  ButtonRound25.OnClickPtr      = ButtonRound25OnClick;
  ButtonRound25.OnPressPtr      = 0;

  ButtonRound26.OwnerScreen     = &Screen1;
  ButtonRound26.Order           = 12;
  ButtonRound26.Left            = 103;
  ButtonRound26.Top             = 101;
  ButtonRound26.Width           = 30;
  ButtonRound26.Height          = 30;
  ButtonRound26.Pen_Width       = 3;
  ButtonRound26.Pen_Color       = 0x2531;
  ButtonRound26.Visible         = 1;
  ButtonRound26.Active          = 1;
  ButtonRound26.Transparent     = 1;
  ButtonRound26.Caption         = ButtonRound26_Caption;
  ButtonRound26.TextAlign       = _taCenter;
  ButtonRound26.FontName        = Tahoma11x13_Regular;
  ButtonRound26.PressColEnabled = 1;
  ButtonRound26.Font_Color      = 0x0000;
  ButtonRound26.Gradient        = 1;
  ButtonRound26.Gradient_Orientation = 0;
  ButtonRound26.Gradient_Start_Color = 0x8410;
  ButtonRound26.Gradient_End_Color = 0x0000;
  ButtonRound26.Color           = 0xC618;
  ButtonRound26.Press_Color     = 0xE71C;
  ButtonRound26.Corner_Radius   = 3;
  ButtonRound26.OnUpPtr         = 0;
  ButtonRound26.OnDownPtr       = 0;
  ButtonRound26.OnClickPtr      = ButtonRound26OnClick;
  ButtonRound26.OnPressPtr      = 0;

  ButtonRound27.OwnerScreen     = &Screen1;
  ButtonRound27.Order           = 13;
  ButtonRound27.Left            = 103;
  ButtonRound27.Top             = 142;
  ButtonRound27.Width           = 30;
  ButtonRound27.Height          = 30;
  ButtonRound27.Pen_Width       = 3;
  ButtonRound27.Pen_Color       = 0x2531;
  ButtonRound27.Visible         = 1;
  ButtonRound27.Active          = 1;
  ButtonRound27.Transparent     = 1;
  ButtonRound27.Caption         = ButtonRound27_Caption;
  ButtonRound27.TextAlign       = _taCenter;
  ButtonRound27.FontName        = Tahoma11x13_Regular;
  ButtonRound27.PressColEnabled = 1;
  ButtonRound27.Font_Color      = 0x0000;
  ButtonRound27.Gradient        = 1;
  ButtonRound27.Gradient_Orientation = 0;
  ButtonRound27.Gradient_Start_Color = 0x8410;
  ButtonRound27.Gradient_End_Color = 0x0000;
  ButtonRound27.Color           = 0xC618;
  ButtonRound27.Press_Color     = 0xE71C;
  ButtonRound27.Corner_Radius   = 3;
  ButtonRound27.OnUpPtr         = 0;
  ButtonRound27.OnDownPtr       = 0;
  ButtonRound27.OnClickPtr      = ButtonRound27OnClick;
  ButtonRound27.OnPressPtr      = 0;

  ButtonRound28.OwnerScreen     = &Screen1;
  ButtonRound28.Order           = 14;
  ButtonRound28.Left            = 103;
  ButtonRound28.Top             = 182;
  ButtonRound28.Width           = 30;
  ButtonRound28.Height          = 30;
  ButtonRound28.Pen_Width       = 3;
  ButtonRound28.Pen_Color       = 0x2531;
  ButtonRound28.Visible         = 1;
  ButtonRound28.Active          = 1;
  ButtonRound28.Transparent     = 1;
  ButtonRound28.Caption         = ButtonRound28_Caption;
  ButtonRound28.TextAlign       = _taCenter;
  ButtonRound28.FontName        = Tahoma11x13_Regular;
  ButtonRound28.PressColEnabled = 1;
  ButtonRound28.Font_Color      = 0x0000;
  ButtonRound28.Gradient        = 1;
  ButtonRound28.Gradient_Orientation = 0;
  ButtonRound28.Gradient_Start_Color = 0x8410;
  ButtonRound28.Gradient_End_Color = 0x0000;
  ButtonRound28.Color           = 0xC618;
  ButtonRound28.Press_Color     = 0xE71C;
  ButtonRound28.Corner_Radius   = 3;
  ButtonRound28.OnUpPtr         = 0;
  ButtonRound28.OnDownPtr       = 0;
  ButtonRound28.OnClickPtr      = ButtonRound28OnClick;
  ButtonRound28.OnPressPtr      = 0;

  ButtonRound29.OwnerScreen     = &Screen1;
  ButtonRound29.Order           = 15;
  ButtonRound29.Left            = 181;
  ButtonRound29.Top             = 8;
  ButtonRound29.Width           = 30;
  ButtonRound29.Height          = 30;
  ButtonRound29.Pen_Width       = 3;
  ButtonRound29.Pen_Color       = 0x2531;
  ButtonRound29.Visible         = 1;
  ButtonRound29.Active          = 1;
  ButtonRound29.Transparent     = 1;
  ButtonRound29.Caption         = ButtonRound29_Caption;
  ButtonRound29.TextAlign       = _taCenter;
  ButtonRound29.FontName        = Tahoma11x13_Regular;
  ButtonRound29.PressColEnabled = 1;
  ButtonRound29.Font_Color      = 0x0000;
  ButtonRound29.Gradient        = 1;
  ButtonRound29.Gradient_Orientation = 0;
  ButtonRound29.Gradient_Start_Color = 0x8410;
  ButtonRound29.Gradient_End_Color = 0x0000;
  ButtonRound29.Color           = 0xC618;
  ButtonRound29.Press_Color     = 0xE71C;
  ButtonRound29.Corner_Radius   = 3;
  ButtonRound29.OnUpPtr         = 0;
  ButtonRound29.OnDownPtr       = 0;
  ButtonRound29.OnClickPtr      = ButtonRound29OnClick;
  ButtonRound29.OnPressPtr      = 0;

  ButtonRound30.OwnerScreen     = &Screen1;
  ButtonRound30.Order           = 16;
  ButtonRound30.Left            = 273;
  ButtonRound30.Top             = 8;
  ButtonRound30.Width           = 30;
  ButtonRound30.Height          = 30;
  ButtonRound30.Pen_Width       = 3;
  ButtonRound30.Pen_Color       = 0x2531;
  ButtonRound30.Visible         = 1;
  ButtonRound30.Active          = 1;
  ButtonRound30.Transparent     = 1;
  ButtonRound30.Caption         = ButtonRound30_Caption;
  ButtonRound30.TextAlign       = _taCenter;
  ButtonRound30.FontName        = Tahoma11x13_Regular;
  ButtonRound30.PressColEnabled = 1;
  ButtonRound30.Font_Color      = 0x0000;
  ButtonRound30.Gradient        = 1;
  ButtonRound30.Gradient_Orientation = 0;
  ButtonRound30.Gradient_Start_Color = 0x8410;
  ButtonRound30.Gradient_End_Color = 0x0000;
  ButtonRound30.Color           = 0xC618;
  ButtonRound30.Press_Color     = 0xE71C;
  ButtonRound30.Corner_Radius   = 3;
  ButtonRound30.OnUpPtr         = 0;
  ButtonRound30.OnDownPtr       = 0;
  ButtonRound30.OnClickPtr      = ButtonRound30OnClick;
  ButtonRound30.OnPressPtr      = 0;

  Label1.OwnerScreen     = &Screen1;
  Label1.Order           = 17;
  Label1.Left            = 333;
  Label1.Top             = 6;
  Label1.Width           = 135;
  Label1.Height          = 36;
  Label1.Visible         = 1;
  Label1.Active          = 1;
  Label1.Caption         = Label1_Caption;
  Label1.FontName        = Stencil_Std25x36_Regular;
  Label1.Font_Color      = 0xFFFF;
  Label1.OnUpPtr         = 0;
  Label1.OnDownPtr       = 0;
  Label1.OnClickPtr      = 0;
  Label1.OnPressPtr      = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetButton(index)              CurrentScreen->Buttons[index]
#define GetRoundButton(index)         CurrentScreen->Buttons_Round[index]
#define GetLabel(index)               CurrentScreen->Labels[index]
#define GetCLabel(index)              CurrentScreen->CLabels[index]
#define GetImage(index)               CurrentScreen->Images[index]


void DrawButton(TButton *Abutton) {
  if (Abutton->Visible == 1) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
    }
    TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
    TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
    TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
    if (Abutton->TextAlign == _taLeft)
      TFT_Write_Text(Abutton->Caption, Abutton->Left + 4, (Abutton->Top + ((Abutton->Height - caption_height) / 2)));
    else if (Abutton->TextAlign == _taCenter)
      TFT_Write_Text(Abutton->Caption, (Abutton->Left + (Abutton->Width - caption_length) / 2), (Abutton->Top + ((Abutton->Height - caption_height) / 2)));
    else if (Abutton->TextAlign == _taRight)
      TFT_Write_Text(Abutton->Caption, Abutton->Left + (Abutton->Width - caption_length - 4), (Abutton->Top + (Abutton->Height - caption_height) / 2));
  }
}

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
      TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
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
    TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
  }
}

void DrawCLabel(TCLabel *ALabel) {
  if (ALabel->Visible == 1) {
    TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
  }
}

void DrawImage(TImage *AImage) {
  if (AImage->Visible) {
    TFT_Image_Jpeg(AImage->Left, AImage->Top, AImage->Picture_Name);
  }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
  unsigned short button_idx;
  TButton *local_button;
  unsigned short round_button_idx;
  TButton_Round *local_round_button;
  unsigned short label_idx;
  TLabel *local_label;
  unsigned short clabel_idx;
  TCLabel *local_clabel;
  unsigned short image_idx;
  TImage *local_image;
  char save_bled, save_bled_direction;

  object_pressed = 0;
  order = 0;
  button_idx = 0;
  round_button_idx = 0;
  label_idx = 0;
  clabel_idx = 0;
  image_idx = 0;
  CurrentScreen = aScreen;

  if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
    save_bled = TFT_BLED;
    TFT_BLED           = 0;
    TFT_Set_Active(&TFT_mikromedia_Set_Index, &TFT_mikromedia_Write_Command, &TFT_Write_to_16bitPort);
    TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Set_DBC_SSD1963(255);
    STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Fill_Screen(CurrentScreen->Color);
    display_width = CurrentScreen->Width;
    display_height = CurrentScreen->Height;
    TFT_BLED           = save_bled;
  }
  else
    TFT_Fill_Screen(CurrentScreen->Color);


  while (order < CurrentScreen->ObjectsCount) {
    if (button_idx < CurrentScreen->ButtonsCount) {
      local_button = GetButton(button_idx);
      if (order == local_button->Order) {
        button_idx++;
        order++;
        DrawButton(local_button);
      }
    }

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

    if (clabel_idx < CurrentScreen->CLabelsCount) {
      local_clabel = GetCLabel(clabel_idx);
      if (order == local_clabel->Order) {
        clabel_idx++;
        order++;
        DrawCLabel(local_clabel);
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

  }
}

void Get_Object(unsigned int X, unsigned int Y) {
  button_order        = -1;
  round_button_order  = -1;
  label_order         = -1;
  clabel_order        = -1;
  image_order         = -1;
  //  Buttons
  for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
    local_button = GetButton(_object_count);
    if (local_button->Active == 1) {
      if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
                         local_button->Width, local_button->Height) == 1) {
        button_order = local_button->Order;
        exec_button = local_button;
      }
    }
  }

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

  //  CLabels
  for ( _object_count = 0 ; _object_count < CurrentScreen->CLabelsCount ; _object_count++ ) {
    local_clabel = GetCLabel(_object_count);
    if (local_clabel->Active == 1) {
      if (IsInsideObject(X, Y, local_clabel->Left, local_clabel->Top,
                         local_clabel->Width, local_clabel->Height) == 1) {
        clabel_order = local_clabel->Order;
        exec_clabel = local_clabel;
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

  _object_count = -1;
  if (button_order >  _object_count )
    _object_count = button_order;
  if (round_button_order >  _object_count )
    _object_count = round_button_order;
  if (label_order >  _object_count )
    _object_count = label_order;
  if (clabel_order >  _object_count )
    _object_count = clabel_order;
  if (image_order >  _object_count )
    _object_count = image_order;
}


static void Process_TP_Press(unsigned int X, unsigned int Y) {
  exec_button         = 0;
  exec_round_button   = 0;
  exec_label          = 0;
  exec_clabel         = 0;
  exec_image          = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == button_order) {
      if (exec_button->Active == 1) {
        if (exec_button->OnPressPtr != 0) {
          exec_button->OnPressPtr();
          return;
        }
      }
    }

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

    if (_object_count == clabel_order) {
      if (exec_clabel->Active == 1) {
        if (exec_clabel->OnPressPtr != 0) {
          exec_clabel->OnPressPtr();
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

  }
}

static void Process_TP_Up(unsigned int X, unsigned int Y) {

  switch (PressedObjectType) {
    // Button
    case 0: {
      if (PressedObject != 0) {
        exec_button = (TButton*)PressedObject;
        if ((exec_button->PressColEnabled == 1) && (exec_button->OwnerScreen == CurrentScreen)) {
          DrawButton(exec_button);
        }
        break;
      }
      break;
    }
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
  }

  exec_label          = 0;
  exec_clabel          = 0;
  exec_image          = 0;

  Get_Object(X, Y);


  if (_object_count != -1) {
  // Buttons
    if (_object_count == button_order) {
      if (exec_button->Active == 1) {
        if (exec_button->OnUpPtr != 0)
          exec_button->OnUpPtr();
        if (PressedObject == (TPointer)exec_button)
          if (exec_button->OnClickPtr != 0)
            exec_button->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

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

  // CLabels
    if (_object_count == clabel_order) {
      if (exec_clabel->Active == 1) {
        if (exec_clabel->OnUpPtr != 0)
          exec_clabel->OnUpPtr();
        if (PressedObject == (TPointer)exec_clabel)
          if (exec_clabel->OnClickPtr != 0)
            exec_clabel->OnClickPtr();
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

  }
  PressedObject = 0;
  PressedObjectType = -1;
}

static void Process_TP_Down(unsigned int X, unsigned int Y) {

  object_pressed      = 0;
  exec_button         = 0;
  exec_round_button   = 0;
  exec_label          = 0;
  exec_clabel         = 0;
  exec_image          = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == button_order) {
      if (exec_button->Active == 1) {
        if (exec_button->PressColEnabled == 1) {
          object_pressed = 1;
          DrawButton(exec_button);
        }
        PressedObject = (TPointer)exec_button;
        PressedObjectType = 0;
        if (exec_button->OnDownPtr != 0) {
          exec_button->OnDownPtr();
          return;
        }
      }
    }

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

    if (_object_count == clabel_order) {
      if (exec_clabel->Active == 1) {
        PressedObject = (TPointer)exec_clabel;
        PressedObjectType = 10;
        if (exec_clabel->OnDownPtr != 0) {
          exec_clabel->OnDownPtr();
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

  }
}

void Check_TP() {
  if (STMPE610_PressDetect()) {
    // After a PRESS is detected read X-Y and convert it to Display dimensions space
    if (STMPE610_GetLastCoordinates(&Xcoord, &Ycoord) == 0) {
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
  // Place your code here

  // If bus is busy wait SDA high before initializing I2C module
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
  GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
  GPIOB_ODR.B6 = 1;
  while (GPIOB_IDR.B7 == 0) {
    GPIOB_ODR.B6 = 0;
    Delay_us(10);
    GPIOB_ODR.B6 = 1;
    Delay_us(10);
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

char STMPE610_Config() {
  STMPE610_SetI2CAddress(STMPE610_I2C_ADDR1);
  if(STMPE610_IsOperational()) {
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
  STMPE610_SetTouchPressureThreshold(45);
  STMPE610_ClearInterrupts();
  STMPE610_WriteReg(STMPE610_INT_CTRL_REG, 0x01);
  return STMPE610_OK;
}


void Start_TP() {
  Init_MCU();

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
  display_width = Screen1.Width;
  display_height = Screen1.Height;
  DrawScreen(&Screen1);
}
