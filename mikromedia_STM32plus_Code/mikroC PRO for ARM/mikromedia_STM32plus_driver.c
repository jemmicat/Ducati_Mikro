#include "mikromedia_STM32plus_objects.h"
#include "mikromedia_STM32plus_resources.h"
#include "built_in.h"


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
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton *local_button;
TButton *exec_button;
int button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TImage *local_image;
TImage *exec_image;
int image_order;
TCircle *local_circle;
TCircle *exec_circle;
int circle_order;
TBox *local_box;
TBox *exec_box;
int box_order;
TCheckBox *local_checkbox;
TCheckBox *exec_checkbox;
int checkbox_order;


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

static void InitializeTouchPanel() {
  TFT_Set_Active(Set_Index, Write_Command, Write_Data);
  TFT_Init_SSD1963(480, 272);

  TFT_Set_DBC_SSD1963(255);

  PenDown = 0;
  PressedObject = 0;
  PressedObjectType = -1;
}


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                Home;
  TImage               Image1;
  TImage               Image3;
  TLabel                 Label5;
char Label5_Caption[16] = "mikromedia PLUS";

  TLabel                 Label7;
char Label7_Caption[14] = "Accelerometer";

  TLabel                 Label8;
char Label8_Caption[10] = "RGB Light";

  TImage               Image6;
  TLabel                 Label14;
char Label14_Caption[6] = "Clock";

  TImage               Image10;
  TLabel                 Label19;
char Label19_Caption[9] = "12:56 AM";

  TImage               Image9;
  TLabel                 Label20;
char Label20_Caption[8] = "Sensors";

  TImage               Image16;
  TLabel                 Label25;
char Label25_Caption[11] = "MP3 Player";

  TImage               Image24;
  TLabel                 Label30;
char Label30_Caption[6] = "Paint";

  TImage               Image18;
  TLabel                 Label34;
char Label34_Caption[11] = "Slide Show";

  TImage               TicTacToe;
  TLabel                 Label40;
char Label40_Caption[12] = "Tic Tac Toe";

  TImage               BatteryStatus;
  TLabel                 * const code Screen1_Labels[10]=
         {
         &Label5,              
         &Label7,              
         &Label8,              
         &Label14,             
         &Label19,             
         &Label20,             
         &Label25,             
         &Label30,             
         &Label34,             
         &Label40              
         };
  TImage                 * const code Screen1_Images[10]=
         {
         &Image1,              
         &Image3,              
         &Image6,              
         &Image10,             
         &Image9,              
         &Image16,             
         &Image24,             
         &Image18,             
         &TicTacToe,           
         &BatteryStatus        
         };

  TScreen                Accelerometer;
  TBox                   Box23;
  TBox                   Box1;
  TImage               Image2;
  TLabel                 Label1;
char Label1_Caption[20] = "Accelerometer Graph";

  TLabel                 Label2;
char Label2_Caption[4] = "X: ";

  TLabel                 Label3;
char Label3_Caption[4] = "Y: ";

  TLabel                 Label4;
char Label4_Caption[4] = "Z: ";

  TLabel                 * const code Screen2_Labels[4]=
         {
         &Label1,              
         &Label2,              
         &Label3,              
         &Label4               
         };
  TImage                 * const code Screen2_Images[1]=
         {
         &Image2               
         };
  TBox                   * const code Screen2_Boxes[2]=
         {
         &Box23,               
         &Box1                 
         };

  TScreen                RGBLight;
  TBox                   Box22;
  TLabel                 Label9;
char Label9_Caption[10] = "RGB Light";

  TImage               Image5;
  TLabel                 Label10;
char Label10_Caption[13] = "Pick a Color";

  TCircle                Circle1;
  TLabel                 Label11;
char Label11_Caption[4] = "R: ";

  TLabel                 Label12;
char Label12_Caption[4] = "G: ";

  TLabel                 Label13;
char Label13_Caption[4] = "B: ";

  TBox                   RGB_Active_area;
  TLabel                 * const code Screen3_Labels[5]=
         {
         &Label9,              
         &Label10,             
         &Label11,             
         &Label12,             
         &Label13              
         };
  TImage                 * const code Screen3_Images[1]=
         {
         &Image5               
         };
  TCircle                * const code Screen3_Circles[1]=
         {
         &Circle1              
         };
  TBox                   * const code Screen3_Boxes[2]=
         {
         &Box22,               
         &RGB_Active_area      
         };

  TScreen                Clock;
  TBox                   Box16;
  TBox                   Box15;
  TBox                   Box13;
  TBox                   Box12;
  TLabel                 Label15;
char Label15_Caption[2] = ":";

  TBox                   Box2;
  TBox                   Box3;
  TLabel                 Label16;
char Label16_Caption[6] = "Clock";

  TImage               ClockBack;
  TLabel                 Label17;
char Label17_Caption[5] = "Sync";

  TLabel                 Label18;
char Label18_Caption[5] = "Done";

  TImage               SyncIcon;
  TImage               Image8;
  TBox                   Box4;
  TBox                   Box5;
  TImage               Image7;
  TLabel                 Label42;
char Label42_Caption[51] = " ";

  TImage               Image17;
  TBox                   Box14;
  TLabel                 * const code Screen4_Labels[5]=
         {
         &Label15,             
         &Label16,             
         &Label17,             
         &Label18,             
         &Label42              
         };
  TImage                 * const code Screen4_Images[5]=
         {
         &ClockBack,           
         &SyncIcon,            
         &Image8,              
         &Image7,              
         &Image17              
         };
  TBox                   * const code Screen4_Boxes[9]=
         {
         &Box16,               
         &Box15,               
         &Box13,               
         &Box12,               
         &Box2,                
         &Box3,                
         &Box4,                
         &Box5,                
         &Box14                
         };

  TScreen                Sensors;
  TBox                   Box21;
  TBox                   Diagram5_Box1;
  TImage               TempIcon;
  TImage               LightIcon;
  TLabel                 Diagram5_Label1;
char Diagram5_Label1_Caption[12] = "Temperature";

  TLabel                 Diagram5_Label2;
char Diagram5_Label2_Caption[12] = "26.5°C";

  TLabel                 Diagram5_Label3;
char Diagram5_Label3_Caption[15] = "Light Intesity";

  TLabel                 Diagram5_Label4;
char Diagram5_Label4_Caption[9] = "96.5%";

  TLabel                 Diagram5_Label5;
char Diagram5_Label5_Caption[12] = "78.5°F";

  TImage               BackIconSensors;
  TLabel                 Diagram5_Label6;
char Diagram5_Label6_Caption[8] = "Sensors";

  TLabel                 Label21;
char Label21_Caption[2] = "/";

  TLabel                 * const code Screen5_Labels[7]=
         {
         &Diagram5_Label1,     
         &Diagram5_Label2,     
         &Diagram5_Label3,     
         &Diagram5_Label4,     
         &Diagram5_Label5,     
         &Diagram5_Label6,     
         &Label21              
         };
  TImage                 * const code Screen5_Images[3]=
         {
         &TempIcon,            
         &LightIcon,           
         &BackIconSensors      
         };
  TBox                   * const code Screen5_Boxes[2]=
         {
         &Box21,               
         &Diagram5_Box1        
         };

  TScreen                MP3_SD;
  TBox                   Box20;
  TLabel                 Label22;
char Label22_Caption[11] = "MP3 Player";

  TLabel                 Label23;
char Label23_Caption[20] = "Insert microSD card";

  TImage               Image11;
  TImage               Image12;
  TImage               Image13;
  TImage               Image14;
  TImage               mp3_back_icon;
  TLabel                 * const code Screen6_Labels[2]=
         {
         &Label22,             
         &Label23              
         };
  TImage                 * const code Screen6_Images[5]=
         {
         &Image11,             
         &Image12,             
         &Image13,             
         &Image14,             
         &mp3_back_icon        
         };
  TBox                   * const code Screen6_Boxes[1]=
         {
         &Box20                
         };

  TScreen                MP3_SongList;
  TBox                   Box19;
  TBox                   Box6;
  TLabel                 Label24;
char Label24_Caption[11] = "MP3 Player";

  TImage               mp3_back_icon2;
  TLabel                 Label26;
char Label26_Caption[22] = "Choose a song to play";

  TImage               folder_icon;
  TImage               file_icon;
  TLabel                 * const code Screen7_Labels[2]=
         {
         &Label24,             
         &Label26              
         };
  TImage                 * const code Screen7_Images[3]=
         {
         &mp3_back_icon2,      
         &folder_icon,         
         &file_icon            
         };
  TBox                   * const code Screen7_Boxes[2]=
         {
         &Box19,               
         &Box6                 
         };

  TScreen                MP3_Player;
  TBox                   Box17;
  TLabel                 Label27;
char Label27_Caption[11] = "MP3 Player";

  TImage               Icon_back_mp3;
  TBox                   VolmeBar;
  TImage               Image15;
  TBox                   ProgressBar;
  TLabel                 Label28;
char Label28_Caption[15] = "Song01";

  TImage               previous_icon;
  TImage               pause_icon;
  TImage               Play_icon;
  TImage               stop_icon;
  TImage               next_icon;
  TImage               songlist_icon;
  TLabel                 Label6;
char Label6_Caption[6] = "00:00";

  TLabel                 * const code Screen8_Labels[3]=
         {
         &Label27,             
         &Label28,             
         &Label6               
         };
  TImage                 * const code Screen8_Images[8]=
         {
         &Icon_back_mp3,       
         &Image15,             
         &previous_icon,       
         &pause_icon,          
         &Play_icon,           
         &stop_icon,           
         &next_icon,           
         &songlist_icon        
         };
  TBox                   * const code Screen8_Boxes[3]=
         {
         &Box17,               
         &VolmeBar,            
         &ProgressBar          
         };

  TScreen                Paint;
  TBox                   Box18;
  TImage               Image4;
  TImage               NewScreen;
  TImage               Image25;
  TImage               Pen;
  TImage               Image27;
  TImage               Eraser;
  TImage               Image29;
  TBox                   DrawingArea;
  TImage               icon_paint_back;
  TLabel                 Label29;
char Label29_Caption[6] = "Paint";

  TBox                   Color01;
  TBox                   Color02;
  TBox                   Color03;
  TBox                   Color04;
  TBox                   Color05;
  TBox                   Color06;
  TBox                   Color07;
  TBox                   Color08;
  TBox                   Color09;
  TBox                   Color10;
  TBox                   Color11;
  TBox                   Color12;
  TBox                   Color13;
  TBox                   Color14;
  TBox                   Color15;
  TBox                   Color16;
  TBox                   Color17;
  TBox                   Color18;
  TBox                   Color19;
  TBox                   Color20;
  TBox                   Color21;
  TBox                   Color22;
  TBox                   Color23;
  TBox                   Color24;
  TBox                   Color25;
  TBox                   Color26;
  TBox                   Color27;
  TBox                   Color28;
  TBox                   Color29;
  TBox                   Color30;
  TImage               BackGroundColor;
  TBox                   Pen1;
  TBox                   Pen2;
  TBox                   Pen3;
  TLabel                 * const code Screen9_Labels[1]=
         {
         &Label29              
         };
  TImage                 * const code Screen9_Images[9]=
         {
         &Image4,              
         &NewScreen,           
         &Image25,             
         &Pen,                 
         &Image27,             
         &Eraser,              
         &Image29,             
         &icon_paint_back,     
         &BackGroundColor      
         };
  TBox                   * const code Screen9_Boxes[35]=
         {
         &Box18,               
         &DrawingArea,         
         &Color01,             
         &Color02,             
         &Color03,             
         &Color04,             
         &Color05,             
         &Color06,             
         &Color07,             
         &Color08,             
         &Color09,             
         &Color10,             
         &Color11,             
         &Color12,             
         &Color13,             
         &Color14,             
         &Color15,             
         &Color16,             
         &Color17,             
         &Color18,             
         &Color19,             
         &Color20,             
         &Color21,             
         &Color22,             
         &Color23,             
         &Color24,             
         &Color25,             
         &Color26,             
         &Color27,             
         &Color28,             
         &Color29,             
         &Color30,             
         &Pen1,                
         &Pen2,                
         &Pen3                 
         };

  TScreen                SlideShow;
  TBox                   Box7;
  TBox                   icon_previous_box;
  TBox                   Icon_next_box;
  TLabel                 Label31;
char Label31_Caption[11] = "Slide Show";

  TImage               back_slide_show;
  TLabel                 Label32;
char Label32_Caption[14] = "Slide up/down";

  TLabel                 Label33;
char Label33_Caption[5] = "of 8";

  TImage               icon_previous;
  TImage               Icon_next;
  TLabel                 Label35;
char Label35_Caption[6] = "  ";

  TBox                   Slide_Active_area;
  TLabel                 * const code Screen10_Labels[4]=
         {
         &Label31,             
         &Label32,             
         &Label33,             
         &Label35              
         };
  TImage                 * const code Screen10_Images[3]=
         {
         &back_slide_show,     
         &icon_previous,       
         &Icon_next            
         };
  TBox                   * const code Screen10_Boxes[4]=
         {
         &Box7,                
         &icon_previous_box,   
         &Icon_next_box,       
         &Slide_Active_area    
         };

  TScreen                Tic_Tac_Toe;
  TBox                   Box10;
  TBox                   Box11;
  TBox                   Box9;
  TButton               Button9;
char Button9_Caption[1] = "";

  TButton               Button8;
char Button8_Caption[1] = "";

  TButton               Button7;
char Button7_Caption[1] = "";

  TButton               Button6;
char Button6_Caption[1] = "";

  TButton               Button5;
char Button5_Caption[1] = "";

  TButton               Button4;
char Button4_Caption[1] = "";

  TButton               Button3;
char Button3_Caption[1] = "";

  TButton               Button2;
char Button2_Caption[1] = "";

  TButton               Button1;
char Button1_Caption[1] = "";

  TBox                   Box8;
  TLabel                 Label36;
char Label36_Caption[17] = "Tic-Tac-Toe Game";

  TImage               Image20;
  TLabel                 Label37;
char Label37_Caption[9] = "New Game";

  TImage               Image21;
  TLabel                 Label38;
char Label38_Caption[11] = " ";

  TLabel                 Label39;
char Label39_Caption[12] = "Time: 00:00";

  TLabel                 XO1;
char XO1_Caption[2] = " ";

  TLabel                 XO2;
char XO2_Caption[2] = " ";

  TLabel                 XO3;
char XO3_Caption[2] = " ";

  TLabel                 XO4;
char XO4_Caption[2] = " ";

  TLabel                 XO5;
char XO5_Caption[2] = " ";

  TLabel                 XO6;
char XO6_Caption[2] = " ";

  TLabel                 XO7;
char XO7_Caption[2] = " ";

  TLabel                 XO8;
char XO8_Caption[2] = " ";

  TLabel                 XO9;
char XO9_Caption[2] = " ";

  TCheckBox                 CheckBox1;
char CheckBox1_Caption[1] = "";

  TLabel                 Label41;
char Label41_Caption[12] = "Remote Play";

  TButton                * const code Screen11_Buttons[9]=
         {
         &Button9,             
         &Button8,             
         &Button7,             
         &Button6,             
         &Button5,             
         &Button4,             
         &Button3,             
         &Button2,             
         &Button1              
         };
  TLabel                 * const code Screen11_Labels[14]=
         {
         &Label36,             
         &Label37,             
         &Label38,             
         &Label39,             
         &XO1,                 
         &XO2,                 
         &XO3,                 
         &XO4,                 
         &XO5,                 
         &XO6,                 
         &XO7,                 
         &XO8,                 
         &XO9,                 
         &Label41              
         };
  TImage                 * const code Screen11_Images[2]=
         {
         &Image20,             
         &Image21              
         };
  TBox                   * const code Screen11_Boxes[4]=
         {
         &Box10,               
         &Box11,               
         &Box9,                
         &Box8                 
         };
  TCheckBox              * const code Screen11_CheckBoxes[1]=
         {
         &CheckBox1            
         };



static void InitializeObjects() {
  Home.Color                     = 0x2D33;
  Home.Width                     = 480;
  Home.Height                    = 272;
  Home.ButtonsCount              = 0;
  Home.LabelsCount               = 10;
  Home.Labels                    = Screen1_Labels;
  Home.ImagesCount               = 10;
  Home.Images                    = Screen1_Images;
  Home.CirclesCount              = 0;
  Home.BoxesCount                = 0;
  Home.CheckBoxesCount           = 0;
  Home.ObjectsCount              = 20;

  Accelerometer.Color                     = 0x4229;
  Accelerometer.Width                     = 480;
  Accelerometer.Height                    = 272;
  Accelerometer.ButtonsCount              = 0;
  Accelerometer.LabelsCount               = 4;
  Accelerometer.Labels                    = Screen2_Labels;
  Accelerometer.ImagesCount               = 1;
  Accelerometer.Images                    = Screen2_Images;
  Accelerometer.CirclesCount              = 0;
  Accelerometer.BoxesCount                = 2;
  Accelerometer.Boxes                     = Screen2_Boxes;
  Accelerometer.CheckBoxesCount           = 0;
  Accelerometer.ObjectsCount              = 7;

  RGBLight.Color                     = 0x4229;
  RGBLight.Width                     = 480;
  RGBLight.Height                    = 272;
  RGBLight.ButtonsCount              = 0;
  RGBLight.LabelsCount               = 5;
  RGBLight.Labels                    = Screen3_Labels;
  RGBLight.ImagesCount               = 1;
  RGBLight.Images                    = Screen3_Images;
  RGBLight.CirclesCount              = 1;
  RGBLight.Circles                   = Screen3_Circles;
  RGBLight.BoxesCount                = 2;
  RGBLight.Boxes                     = Screen3_Boxes;
  RGBLight.CheckBoxesCount           = 0;
  RGBLight.ObjectsCount              = 9;

  Clock.Color                     = 0x54C3;
  Clock.Width                     = 480;
  Clock.Height                    = 272;
  Clock.ButtonsCount              = 0;
  Clock.LabelsCount               = 5;
  Clock.Labels                    = Screen4_Labels;
  Clock.ImagesCount               = 5;
  Clock.Images                    = Screen4_Images;
  Clock.CirclesCount              = 0;
  Clock.BoxesCount                = 9;
  Clock.Boxes                     = Screen4_Boxes;
  Clock.CheckBoxesCount           = 0;
  Clock.ObjectsCount              = 19;

  Sensors.Color                     = 0xA948;
  Sensors.Width                     = 480;
  Sensors.Height                    = 272;
  Sensors.ButtonsCount              = 0;
  Sensors.LabelsCount               = 7;
  Sensors.Labels                    = Screen5_Labels;
  Sensors.ImagesCount               = 3;
  Sensors.Images                    = Screen5_Images;
  Sensors.CirclesCount              = 0;
  Sensors.BoxesCount                = 2;
  Sensors.Boxes                     = Screen5_Boxes;
  Sensors.CheckBoxesCount           = 0;
  Sensors.ObjectsCount              = 12;

  MP3_SD.Color                     = 0x4457;
  MP3_SD.Width                     = 480;
  MP3_SD.Height                    = 272;
  MP3_SD.ButtonsCount              = 0;
  MP3_SD.LabelsCount               = 2;
  MP3_SD.Labels                    = Screen6_Labels;
  MP3_SD.ImagesCount               = 5;
  MP3_SD.Images                    = Screen6_Images;
  MP3_SD.CirclesCount              = 0;
  MP3_SD.BoxesCount                = 1;
  MP3_SD.Boxes                     = Screen6_Boxes;
  MP3_SD.CheckBoxesCount           = 0;
  MP3_SD.ObjectsCount              = 8;

  MP3_SongList.Color                     = 0x4457;
  MP3_SongList.Width                     = 480;
  MP3_SongList.Height                    = 272;
  MP3_SongList.ButtonsCount              = 0;
  MP3_SongList.LabelsCount               = 2;
  MP3_SongList.Labels                    = Screen7_Labels;
  MP3_SongList.ImagesCount               = 3;
  MP3_SongList.Images                    = Screen7_Images;
  MP3_SongList.CirclesCount              = 0;
  MP3_SongList.BoxesCount                = 2;
  MP3_SongList.Boxes                     = Screen7_Boxes;
  MP3_SongList.CheckBoxesCount           = 0;
  MP3_SongList.ObjectsCount              = 7;

  MP3_Player.Color                     = 0x4457;
  MP3_Player.Width                     = 480;
  MP3_Player.Height                    = 272;
  MP3_Player.ButtonsCount              = 0;
  MP3_Player.LabelsCount               = 3;
  MP3_Player.Labels                    = Screen8_Labels;
  MP3_Player.ImagesCount               = 8;
  MP3_Player.Images                    = Screen8_Images;
  MP3_Player.CirclesCount              = 0;
  MP3_Player.BoxesCount                = 3;
  MP3_Player.Boxes                     = Screen8_Boxes;
  MP3_Player.CheckBoxesCount           = 0;
  MP3_Player.ObjectsCount              = 14;

  Paint.Color                     = 0x4229;
  Paint.Width                     = 480;
  Paint.Height                    = 272;
  Paint.ButtonsCount              = 0;
  Paint.LabelsCount               = 1;
  Paint.Labels                    = Screen9_Labels;
  Paint.ImagesCount               = 9;
  Paint.Images                    = Screen9_Images;
  Paint.CirclesCount              = 0;
  Paint.BoxesCount                = 35;
  Paint.Boxes                     = Screen9_Boxes;
  Paint.CheckBoxesCount           = 0;
  Paint.ObjectsCount              = 45;

  SlideShow.Color                     = 0x4229;
  SlideShow.Width                     = 480;
  SlideShow.Height                    = 272;
  SlideShow.ButtonsCount              = 0;
  SlideShow.LabelsCount               = 4;
  SlideShow.Labels                    = Screen10_Labels;
  SlideShow.ImagesCount               = 3;
  SlideShow.Images                    = Screen10_Images;
  SlideShow.CirclesCount              = 0;
  SlideShow.BoxesCount                = 4;
  SlideShow.Boxes                     = Screen10_Boxes;
  SlideShow.CheckBoxesCount           = 0;
  SlideShow.ObjectsCount              = 11;

  Tic_Tac_Toe.Color                     = 0xA1AE;
  Tic_Tac_Toe.Width                     = 480;
  Tic_Tac_Toe.Height                    = 272;
  Tic_Tac_Toe.ButtonsCount              = 9;
  Tic_Tac_Toe.Buttons                   = Screen11_Buttons;
  Tic_Tac_Toe.LabelsCount               = 14;
  Tic_Tac_Toe.Labels                    = Screen11_Labels;
  Tic_Tac_Toe.ImagesCount               = 2;
  Tic_Tac_Toe.Images                    = Screen11_Images;
  Tic_Tac_Toe.CirclesCount              = 0;
  Tic_Tac_Toe.BoxesCount                = 4;
  Tic_Tac_Toe.Boxes                     = Screen11_Boxes;
  Tic_Tac_Toe.CheckBoxesCount           = 1;
  Tic_Tac_Toe.CheckBoxes                = Screen11_CheckBoxes;
  Tic_Tac_Toe.ObjectsCount              = 30;


  Image1.OwnerScreen     = &Home;
  Image1.Order           = 0;
  Image1.Left            = 46;
  Image1.Top             = 46;
  Image1.Width           = 76;
  Image1.Height          = 76;
  Image1.Picture_Type    = 0;
  Image1.Picture_Ratio   = 1;
  Image1.Picture_Name    = icon_accel_bmp;
  Image1.Visible         = 1;
  Image1.Active          = 1;
  Image1.OnUpPtr         = 0;
  Image1.OnDownPtr       = 0;
  Image1.OnClickPtr      = 0;
  Image1.OnPressPtr      = Image1OnPress;

  Image3.OwnerScreen     = &Home;
  Image3.Order           = 1;
  Image3.Left            = 360;
  Image3.Top             = 160;
  Image3.Width           = 76;
  Image3.Height          = 76;
  Image3.Picture_Type    = 0;
  Image3.Picture_Ratio   = 1;
  Image3.Picture_Name    = icon_rgb_light_bmp;
  Image3.Visible         = 1;
  Image3.Active          = 1;
  Image3.OnUpPtr         = 0;
  Image3.OnDownPtr       = 0;
  Image3.OnClickPtr      = 0;
  Image3.OnPressPtr      = Image3OnPress;

  Label5.OwnerScreen     = &Home;
  Label5.Order           = 2;
  Label5.Left            = 146;
  Label5.Top             = 7;
  Label5.Width           = 172;
  Label5.Height          = 31;
  Label5.Visible         = 1;
  Label5.Active          = 1;
  Label5.Caption         = Label5_Caption;
  Label5.FontName        = Open_Sans_Light19x28_Regular;
  Label5.Font_Color      = 0xFFFF;
  Label5.OnUpPtr         = 0;
  Label5.OnDownPtr       = 0;
  Label5.OnClickPtr      = 0;
  Label5.OnPressPtr      = 0;

  Label7.OwnerScreen     = &Home;
  Label7.Order           = 3;
  Label7.Left            = 37;
  Label7.Top             = 120;
  Label7.Width           = 108;
  Label7.Height          = 24;
  Label7.Visible         = 1;
  Label7.Active          = 1;
  Label7.Caption         = Label7_Caption;
  Label7.FontName        = Open_Sans_Light14x22_Regular;
  Label7.Font_Color      = 0xFFFF;
  Label7.OnUpPtr         = 0;
  Label7.OnDownPtr       = 0;
  Label7.OnClickPtr      = 0;
  Label7.OnPressPtr      = 0;

  Label8.OwnerScreen     = &Home;
  Label8.Order           = 4;
  Label8.Left            = 368;
  Label8.Top             = 230;
  Label8.Width           = 72;
  Label8.Height          = 24;
  Label8.Visible         = 1;
  Label8.Active          = 1;
  Label8.Caption         = Label8_Caption;
  Label8.FontName        = Open_Sans_Light14x22_Regular;
  Label8.Font_Color      = 0xFFFF;
  Label8.OnUpPtr         = 0;
  Label8.OnDownPtr       = 0;
  Label8.OnClickPtr      = 0;
  Label8.OnPressPtr      = 0;

  Image6.OwnerScreen     = &Home;
  Image6.Order           = 5;
  Image6.Left            = 150;
  Image6.Top             = 160;
  Image6.Width           = 76;
  Image6.Height          = 76;
  Image6.Picture_Type    = 0;
  Image6.Picture_Ratio   = 1;
  Image6.Picture_Name    = icon_clock_bmp;
  Image6.Visible         = 1;
  Image6.Active          = 1;
  Image6.OnUpPtr         = 0;
  Image6.OnDownPtr       = 0;
  Image6.OnClickPtr      = Image6OnClick;
  Image6.OnPressPtr      = 0;

  Label14.OwnerScreen     = &Home;
  Label14.Order           = 6;
  Label14.Left            = 168;
  Label14.Top             = 230;
  Label14.Width           = 39;
  Label14.Height          = 24;
  Label14.Visible         = 1;
  Label14.Active          = 1;
  Label14.Caption         = Label14_Caption;
  Label14.FontName        = Open_Sans_Light14x22_Regular;
  Label14.Font_Color      = 0xFFFF;
  Label14.OnUpPtr         = 0;
  Label14.OnDownPtr       = 0;
  Label14.OnClickPtr      = 0;
  Label14.OnPressPtr      = 0;

  Image10.OwnerScreen     = &Home;
  Image10.Order           = 7;
  Image10.Left            = 392;
  Image10.Top             = 9;
  Image10.Width           = 23;
  Image10.Height          = 20;
  Image10.Picture_Type    = 0;
  Image10.Picture_Ratio   = 1;
  Image10.Picture_Name    = icon_time_bmp;
  Image10.Visible         = 1;
  Image10.Active          = 1;
  Image10.OnUpPtr         = 0;
  Image10.OnDownPtr       = 0;
  Image10.OnClickPtr      = 0;
  Image10.OnPressPtr      = 0;

  Label19.OwnerScreen     = &Home;
  Label19.Order           = 8;
  Label19.Left            = 416;
  Label19.Top             = 10;
  Label19.Width           = 57;
  Label19.Height          = 19;
  Label19.Visible         = 1;
  Label19.Active          = 1;
  Label19.Caption         = Label19_Caption;
  Label19.FontName        = Open_Sans_Light12x18_Regular;
  Label19.Font_Color      = 0xFFFF;
  Label19.OnUpPtr         = 0;
  Label19.OnDownPtr       = 0;
  Label19.OnClickPtr      = 0;
  Label19.OnPressPtr      = 0;

  Image9.OwnerScreen     = &Home;
  Image9.Order           = 9;
  Image9.Left            = 46;
  Image9.Top             = 160;
  Image9.Width           = 76;
  Image9.Height          = 76;
  Image9.Picture_Type    = 0;
  Image9.Picture_Ratio   = 1;
  Image9.Picture_Name    = icon_temp_bmp;
  Image9.Visible         = 1;
  Image9.Active          = 1;
  Image9.OnUpPtr         = 0;
  Image9.OnDownPtr       = 0;
  Image9.OnClickPtr      = 0;
  Image9.OnPressPtr      = Image9OnPress;

  Label20.OwnerScreen     = &Home;
  Label20.Order           = 10;
  Label20.Left            = 55;
  Label20.Top             = 230;
  Label20.Width           = 59;
  Label20.Height          = 24;
  Label20.Visible         = 1;
  Label20.Active          = 1;
  Label20.Caption         = Label20_Caption;
  Label20.FontName        = Open_Sans_Light14x22_Regular;
  Label20.Font_Color      = 0xFFFF;
  Label20.OnUpPtr         = 0;
  Label20.OnDownPtr       = 0;
  Label20.OnClickPtr      = 0;
  Label20.OnPressPtr      = 0;

  Image16.OwnerScreen     = &Home;
  Image16.Order           = 11;
  Image16.Left            = 360;
  Image16.Top             = 46;
  Image16.Width           = 76;
  Image16.Height          = 76;
  Image16.Picture_Type    = 0;
  Image16.Picture_Ratio   = 1;
  Image16.Picture_Name    = icon_mp3_player_bmp;
  Image16.Visible         = 1;
  Image16.Active          = 1;
  Image16.OnUpPtr         = 0;
  Image16.OnDownPtr       = 0;
  Image16.OnClickPtr      = Image16OnClick;
  Image16.OnPressPtr      = 0;

  Label25.OwnerScreen     = &Home;
  Label25.Order           = 12;
  Label25.Left            = 360;
  Label25.Top             = 120;
  Label25.Width           = 83;
  Label25.Height          = 24;
  Label25.Visible         = 1;
  Label25.Active          = 1;
  Label25.Caption         = Label25_Caption;
  Label25.FontName        = Open_Sans_Light14x22_Regular;
  Label25.Font_Color      = 0xFFFF;
  Label25.OnUpPtr         = 0;
  Label25.OnDownPtr       = 0;
  Label25.OnClickPtr      = 0;
  Label25.OnPressPtr      = 0;

  Image24.OwnerScreen     = &Home;
  Image24.Order           = 13;
  Image24.Left            = 150;
  Image24.Top             = 46;
  Image24.Width           = 76;
  Image24.Height          = 76;
  Image24.Picture_Type    = 0;
  Image24.Picture_Ratio   = 1;
  Image24.Picture_Name    = icon_paint_bmp;
  Image24.Visible         = 1;
  Image24.Active          = 1;
  Image24.OnUpPtr         = 0;
  Image24.OnDownPtr       = 0;
  Image24.OnClickPtr      = 0;
  Image24.OnPressPtr      = Image24OnPress;

  Label30.OwnerScreen     = &Home;
  Label30.Order           = 14;
  Label30.Left            = 168;
  Label30.Top             = 120;
  Label30.Width           = 37;
  Label30.Height          = 24;
  Label30.Visible         = 1;
  Label30.Active          = 1;
  Label30.Caption         = Label30_Caption;
  Label30.FontName        = Open_Sans_Light14x22_Regular;
  Label30.Font_Color      = 0xFFFF;
  Label30.OnUpPtr         = 0;
  Label30.OnDownPtr       = 0;
  Label30.OnClickPtr      = 0;
  Label30.OnPressPtr      = 0;

  Image18.OwnerScreen     = &Home;
  Image18.Order           = 15;
  Image18.Left            = 255;
  Image18.Top             = 160;
  Image18.Width           = 76;
  Image18.Height          = 76;
  Image18.Picture_Type    = 0;
  Image18.Picture_Ratio   = 1;
  Image18.Picture_Name    = icon_slide_show_bmp;
  Image18.Visible         = 1;
  Image18.Active          = 1;
  Image18.OnUpPtr         = 0;
  Image18.OnDownPtr       = 0;
  Image18.OnClickPtr      = Image18OnClick;
  Image18.OnPressPtr      = 0;

  Label34.OwnerScreen     = &Home;
  Label34.Order           = 16;
  Label34.Left            = 254;
  Label34.Top             = 230;
  Label34.Width           = 80;
  Label34.Height          = 24;
  Label34.Visible         = 1;
  Label34.Active          = 1;
  Label34.Caption         = Label34_Caption;
  Label34.FontName        = Open_Sans_Light14x22_Regular;
  Label34.Font_Color      = 0xFFFF;
  Label34.OnUpPtr         = 0;
  Label34.OnDownPtr       = 0;
  Label34.OnClickPtr      = 0;
  Label34.OnPressPtr      = 0;

  TicTacToe.OwnerScreen     = &Home;
  TicTacToe.Order           = 17;
  TicTacToe.Left            = 255;
  TicTacToe.Top             = 46;
  TicTacToe.Width           = 76;
  TicTacToe.Height          = 76;
  TicTacToe.Picture_Type    = 0;
  TicTacToe.Picture_Ratio   = 1;
  TicTacToe.Picture_Name    = icon_tic_tac_toe_bmp;
  TicTacToe.Visible         = 1;
  TicTacToe.Active          = 1;
  TicTacToe.OnUpPtr         = 0;
  TicTacToe.OnDownPtr       = 0;
  TicTacToe.OnClickPtr      = Image22OnClick;
  TicTacToe.OnPressPtr      = 0;

  Label40.OwnerScreen     = &Home;
  Label40.Order           = 18;
  Label40.Left            = 253;
  Label40.Top             = 120;
  Label40.Width           = 81;
  Label40.Height          = 24;
  Label40.Visible         = 1;
  Label40.Active          = 1;
  Label40.Caption         = Label40_Caption;
  Label40.FontName        = Open_Sans_Light14x22_Regular;
  Label40.Font_Color      = 0xFFFF;
  Label40.OnUpPtr         = 0;
  Label40.OnDownPtr       = 0;
  Label40.OnClickPtr      = 0;
  Label40.OnPressPtr      = 0;

  BatteryStatus.OwnerScreen     = &Home;
  BatteryStatus.Order           = 19;
  BatteryStatus.Left            = 10;
  BatteryStatus.Top             = 6;
  BatteryStatus.Width           = 44;
  BatteryStatus.Height          = 20;
  BatteryStatus.Picture_Type    = 0;
  BatteryStatus.Picture_Ratio   = 1;
  BatteryStatus.Picture_Name    = icon_battery_bmp;
  BatteryStatus.Visible         = 1;
  BatteryStatus.Active          = 0;
  BatteryStatus.OnUpPtr         = 0;
  BatteryStatus.OnDownPtr       = 0;
  BatteryStatus.OnClickPtr      = 0;
  BatteryStatus.OnPressPtr      = 0;

  Box23.OwnerScreen     = &Accelerometer;
  Box23.Order           = 0;
  Box23.Left            = 4;
  Box23.Top             = 5;
  Box23.Width           = 236;
  Box23.Height          = 25;
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
  Box23.OnClickPtr      = Image2OnPress;
  Box23.OnPressPtr      = 0;

  Box1.OwnerScreen     = &Accelerometer;
  Box1.Order           = 1;
  Box1.Left            = 0;
  Box1.Top             = 40;
  Box1.Width           = 480;
  Box1.Height          = 207;
  Box1.Pen_Width       = 1;
  Box1.Pen_Color       = 0xFFFF;
  Box1.Visible         = 1;
  Box1.Active          = 1;
  Box1.Transparent     = 1;
  Box1.Gradient        = 0;
  Box1.Gradient_Orientation = 0;
  Box1.Gradient_Start_Color = 0xFFFF;
  Box1.Gradient_End_Color = 0xFFFF;
  Box1.Color           = 0xFFFF;
  Box1.PressColEnabled = 0;
  Box1.Press_Color     = 0xFFFF;
  Box1.OnUpPtr         = 0;
  Box1.OnDownPtr       = 0;
  Box1.OnClickPtr      = 0;
  Box1.OnPressPtr      = 0;

  Image2.OwnerScreen     = &Accelerometer;
  Image2.Order           = 2;
  Image2.Left            = 5;
  Image2.Top             = 6;
  Image2.Width           = 22;
  Image2.Height          = 22;
  Image2.Picture_Type    = 0;
  Image2.Picture_Ratio   = 1;
  Image2.Picture_Name    = icon_back_accel_bmp;
  Image2.Visible         = 1;
  Image2.Active          = 0;
  Image2.OnUpPtr         = 0;
  Image2.OnDownPtr       = 0;
  Image2.OnClickPtr      = 0;
  Image2.OnPressPtr      = Image2OnPress;

  Label1.OwnerScreen     = &Accelerometer;
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

  Label2.OwnerScreen     = &Accelerometer;
  Label2.Order           = 4;
  Label2.Left            = 75;
  Label2.Top             = 250;
  Label2.Width           = 13;
  Label2.Height          = 24;
  Label2.Visible         = 1;
  Label2.Active          = 1;
  Label2.Caption         = Label2_Caption;
  Label2.FontName        = Open_Sans_Light14x22_Regular;
  Label2.Font_Color      = 0xF800;
  Label2.OnUpPtr         = 0;
  Label2.OnDownPtr       = 0;
  Label2.OnClickPtr      = 0;
  Label2.OnPressPtr      = 0;

  Label3.OwnerScreen     = &Accelerometer;
  Label3.Order           = 5;
  Label3.Left            = 225;
  Label3.Top             = 250;
  Label3.Width           = 13;
  Label3.Height          = 24;
  Label3.Visible         = 1;
  Label3.Active          = 1;
  Label3.Caption         = Label3_Caption;
  Label3.FontName        = Open_Sans_Light14x22_Regular;
  Label3.Font_Color      = 0x001F;
  Label3.OnUpPtr         = 0;
  Label3.OnDownPtr       = 0;
  Label3.OnClickPtr      = 0;
  Label3.OnPressPtr      = 0;

  Label4.OwnerScreen     = &Accelerometer;
  Label4.Order           = 6;
  Label4.Left            = 375;
  Label4.Top             = 250;
  Label4.Width           = 13;
  Label4.Height          = 24;
  Label4.Visible         = 1;
  Label4.Active          = 1;
  Label4.Caption         = Label4_Caption;
  Label4.FontName        = Open_Sans_Light14x22_Regular;
  Label4.Font_Color      = 0x0400;
  Label4.OnUpPtr         = 0;
  Label4.OnDownPtr       = 0;
  Label4.OnClickPtr      = 0;
  Label4.OnPressPtr      = 0;

  Box22.OwnerScreen     = &RGBLight;
  Box22.Order           = 0;
  Box22.Left            = 5;
  Box22.Top             = 4;
  Box22.Width           = 126;
  Box22.Height          = 25;
  Box22.Pen_Width       = 1;
  Box22.Pen_Color       = 0x0000;
  Box22.Visible         = 0;
  Box22.Active          = 1;
  Box22.Transparent     = 1;
  Box22.Gradient        = 0;
  Box22.Gradient_Orientation = 0;
  Box22.Gradient_Start_Color = 0xFFFF;
  Box22.Gradient_End_Color = 0xC618;
  Box22.Color           = 0xC618;
  Box22.PressColEnabled = 0;
  Box22.Press_Color     = 0xE71C;
  Box22.OnUpPtr         = 0;
  Box22.OnDownPtr       = 0;
  Box22.OnClickPtr      = Image5OnPress;
  Box22.OnPressPtr      = 0;

  Label9.OwnerScreen     = &RGBLight;
  Label9.Order           = 1;
  Label9.Left            = 32;
  Label9.Top             = 2;
  Label9.Width           = 95;
  Label9.Height          = 31;
  Label9.Visible         = 1;
  Label9.Active          = 0;
  Label9.Caption         = Label9_Caption;
  Label9.FontName        = Open_Sans_Light19x28_Regular;
  Label9.Font_Color      = 0xFFFF;
  Label9.OnUpPtr         = 0;
  Label9.OnDownPtr       = 0;
  Label9.OnClickPtr      = 0;
  Label9.OnPressPtr      = 0;

  Image5.OwnerScreen     = &RGBLight;
  Image5.Order           = 2;
  Image5.Left            = 5;
  Image5.Top             = 6;
  Image5.Width           = 22;
  Image5.Height          = 22;
  Image5.Picture_Type    = 0;
  Image5.Picture_Ratio   = 1;
  Image5.Picture_Name    = icon_back_rgb_bmp;
  Image5.Visible         = 1;
  Image5.Active          = 0;
  Image5.OnUpPtr         = 0;
  Image5.OnDownPtr       = 0;
  Image5.OnClickPtr      = 0;
  Image5.OnPressPtr      = Image5OnPress;

  Label10.OwnerScreen     = &RGBLight;
  Label10.Order           = 3;
  Label10.Left            = 25;
  Label10.Top             = 250;
  Label10.Width           = 86;
  Label10.Height          = 24;
  Label10.Visible         = 1;
  Label10.Active          = 1;
  Label10.Caption         = Label10_Caption;
  Label10.FontName        = Open_Sans_Light14x22_Regular;
  Label10.Font_Color      = 0xFFFF;
  Label10.OnUpPtr         = 0;
  Label10.OnDownPtr       = 0;
  Label10.OnClickPtr      = 0;
  Label10.OnPressPtr      = 0;

  Circle1.OwnerScreen     = &RGBLight;
  Circle1.Order           = 4;
  Circle1.Left            = 294;
  Circle1.Top             = 252;
  Circle1.Radius          = 8;
  Circle1.Pen_Width       = 0;
  Circle1.Pen_Color       = 0x0000;
  Circle1.Visible         = 1;
  Circle1.Active          = 1;
  Circle1.Transparent     = 1;
  Circle1.Gradient        = 0;
  Circle1.Gradient_Orientation = 0;
  Circle1.Gradient_Start_Color = 0xFFFF;
  Circle1.Gradient_End_Color = 0xC618;
  Circle1.Color           = 0x0023;
  Circle1.PressColEnabled = 1;
  Circle1.Press_Color     = 0x19E0;
  Circle1.OnUpPtr         = 0;
  Circle1.OnDownPtr       = 0;
  Circle1.OnClickPtr      = 0;
  Circle1.OnPressPtr      = 0;

  Label11.OwnerScreen     = &RGBLight;
  Label11.Order           = 5;
  Label11.Left            = 325;
  Label11.Top             = 250;
  Label11.Width           = 14;
  Label11.Height          = 24;
  Label11.Visible         = 1;
  Label11.Active          = 1;
  Label11.Caption         = Label11_Caption;
  Label11.FontName        = Open_Sans_Light14x22_Regular;
  Label11.Font_Color      = 0xFFFF;
  Label11.OnUpPtr         = 0;
  Label11.OnDownPtr       = 0;
  Label11.OnClickPtr      = 0;
  Label11.OnPressPtr      = 0;

  Label12.OwnerScreen     = &RGBLight;
  Label12.Order           = 6;
  Label12.Left            = 375;
  Label12.Top             = 250;
  Label12.Width           = 16;
  Label12.Height          = 24;
  Label12.Visible         = 1;
  Label12.Active          = 1;
  Label12.Caption         = Label12_Caption;
  Label12.FontName        = Open_Sans_Light14x22_Regular;
  Label12.Font_Color      = 0xFFFF;
  Label12.OnUpPtr         = 0;
  Label12.OnDownPtr       = 0;
  Label12.OnClickPtr      = 0;
  Label12.OnPressPtr      = 0;

  Label13.OwnerScreen     = &RGBLight;
  Label13.Order           = 7;
  Label13.Left            = 425;
  Label13.Top             = 250;
  Label13.Width           = 14;
  Label13.Height          = 24;
  Label13.Visible         = 1;
  Label13.Active          = 1;
  Label13.Caption         = Label13_Caption;
  Label13.FontName        = Open_Sans_Light14x22_Regular;
  Label13.Font_Color      = 0xFFFF;
  Label13.OnUpPtr         = 0;
  Label13.OnDownPtr       = 0;
  Label13.OnClickPtr      = 0;
  Label13.OnPressPtr      = 0;

  RGB_Active_area.OwnerScreen     = &RGBLight;
  RGB_Active_area.Order           = 8;
  RGB_Active_area.Left            = 0;
  RGB_Active_area.Top             = 38;
  RGB_Active_area.Width           = 480;
  RGB_Active_area.Height          = 209;
  RGB_Active_area.Pen_Width       = 1;
  RGB_Active_area.Pen_Color       = 0x0000;
  RGB_Active_area.Visible         = 0;
  RGB_Active_area.Active          = 1;
  RGB_Active_area.Transparent     = 1;
  RGB_Active_area.Gradient        = 0;
  RGB_Active_area.Gradient_Orientation = 0;
  RGB_Active_area.Gradient_Start_Color = 0xFFFF;
  RGB_Active_area.Gradient_End_Color = 0xC618;
  RGB_Active_area.Color           = 0xC618;
  RGB_Active_area.PressColEnabled = 0;
  RGB_Active_area.Press_Color     = 0xE71C;
  RGB_Active_area.OnUpPtr         = 0;
  RGB_Active_area.OnDownPtr       = 0;
  RGB_Active_area.OnClickPtr      = 0;
  RGB_Active_area.OnPressPtr      = RGB_Active_areaOnPress;

  Box16.OwnerScreen     = &Clock;
  Box16.Order           = 0;
  Box16.Left            = 5;
  Box16.Top             = 5;
  Box16.Width           = 84;
  Box16.Height          = 25;
  Box16.Pen_Width       = 1;
  Box16.Pen_Color       = 0x0000;
  Box16.Visible         = 0;
  Box16.Active          = 1;
  Box16.Transparent     = 1;
  Box16.Gradient        = 0;
  Box16.Gradient_Orientation = 0;
  Box16.Gradient_Start_Color = 0xFFFF;
  Box16.Gradient_End_Color = 0xC618;
  Box16.Color           = 0xC618;
  Box16.PressColEnabled = 0;
  Box16.Press_Color     = 0xE71C;
  Box16.OnUpPtr         = 0;
  Box16.OnDownPtr       = 0;
  Box16.OnClickPtr      = ClockBackOnPress;
  Box16.OnPressPtr      = 0;

  Box15.OwnerScreen     = &Clock;
  Box15.Order           = 1;
  Box15.Left            = 376;
  Box15.Top             = 234;
  Box15.Width           = 78;
  Box15.Height          = 26;
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
  Box15.OnClickPtr      = Image8OnPress;
  Box15.OnPressPtr      = 0;

  Box13.OwnerScreen     = &Clock;
  Box13.Order           = 2;
  Box13.Left            = 0;
  Box13.Top             = 38;
  Box13.Width           = 480;
  Box13.Height          = 193;
  Box13.Pen_Width       = 0;
  Box13.Pen_Color       = 0x0000;
  Box13.Visible         = 0;
  Box13.Active          = 1;
  Box13.Transparent     = 1;
  Box13.Gradient        = 0;
  Box13.Gradient_Orientation = 0;
  Box13.Gradient_Start_Color = 0xFFFF;
  Box13.Gradient_End_Color = 0xC618;
  Box13.Color           = 0x54C3;
  Box13.PressColEnabled = 0;
  Box13.Press_Color     = 0xE71C;
  Box13.OnUpPtr         = 0;
  Box13.OnDownPtr       = 0;
  Box13.OnClickPtr      = Box13OnClick;
  Box13.OnPressPtr      = 0;

  Box12.OwnerScreen     = &Clock;
  Box12.Order           = 3;
  Box12.Left            = 280;
  Box12.Top             = 235;
  Box12.Width           = 68;
  Box12.Height          = 25;
  Box12.Pen_Width       = 1;
  Box12.Pen_Color       = 0x0000;
  Box12.Visible         = 0;
  Box12.Active          = 1;
  Box12.Transparent     = 1;
  Box12.Gradient        = 0;
  Box12.Gradient_Orientation = 0;
  Box12.Gradient_Start_Color = 0xFFFF;
  Box12.Gradient_End_Color = 0xC618;
  Box12.Color           = 0xC618;
  Box12.PressColEnabled = 0;
  Box12.Press_Color     = 0xE71C;
  Box12.OnUpPtr         = 0;
  Box12.OnDownPtr       = 0;
  Box12.OnClickPtr      = Box12OnClick;
  Box12.OnPressPtr      = 0;

  Label15.OwnerScreen     = &Clock;
  Label15.Order           = 4;
  Label15.Left            = 191;
  Label15.Top             = 94;
  Label15.Width           = 14;
  Label15.Height          = 85;
  Label15.Visible         = 1;
  Label15.Active          = 1;
  Label15.Caption         = Label15_Caption;
  Label15.FontName        = Open_Sans_Light51x78_Regular;
  Label15.Font_Color      = 0xFFFF;
  Label15.OnUpPtr         = 0;
  Label15.OnDownPtr       = 0;
  Label15.OnClickPtr      = 0;
  Label15.OnPressPtr      = 0;

  Box2.OwnerScreen     = &Clock;
  Box2.Order           = 5;
  Box2.Left            = 108;
  Box2.Top             = 42;
  Box2.Width           = 37;
  Box2.Height          = 194;
  Box2.Pen_Width       = 0;
  Box2.Pen_Color       = 0x0000;
  Box2.Visible         = 0;
  Box2.Active          = 1;
  Box2.Transparent     = 0;
  Box2.Gradient        = 0;
  Box2.Gradient_Orientation = 0;
  Box2.Gradient_Start_Color = 0xFFFF;
  Box2.Gradient_End_Color = 0xC618;
  Box2.Color           = 0xC618;
  Box2.PressColEnabled = 1;
  Box2.Press_Color     = 0xE71C;
  Box2.OnUpPtr         = 0;
  Box2.OnDownPtr       = 0;
  Box2.OnClickPtr      = 0;
  Box2.OnPressPtr      = Box2OnPress;

  Box3.OwnerScreen     = &Clock;
  Box3.Order           = 6;
  Box3.Left            = 146;
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

  Label16.OwnerScreen     = &Clock;
  Label16.Order           = 7;
  Label16.Left            = 32;
  Label16.Top             = 2;
  Label16.Width           = 52;
  Label16.Height          = 31;
  Label16.Visible         = 1;
  Label16.Active          = 0;
  Label16.Caption         = Label16_Caption;
  Label16.FontName        = Open_Sans_Light19x28_Regular;
  Label16.Font_Color      = 0xFFFF;
  Label16.OnUpPtr         = 0;
  Label16.OnDownPtr       = 0;
  Label16.OnClickPtr      = 0;
  Label16.OnPressPtr      = 0;

  ClockBack.OwnerScreen     = &Clock;
  ClockBack.Order           = 8;
  ClockBack.Left            = 5;
  ClockBack.Top             = 6;
  ClockBack.Width           = 22;
  ClockBack.Height          = 22;
  ClockBack.Picture_Type    = 0;
  ClockBack.Picture_Ratio   = 1;
  ClockBack.Picture_Name    = icon_back_bmp;
  ClockBack.Visible         = 1;
  ClockBack.Active          = 0;
  ClockBack.OnUpPtr         = 0;
  ClockBack.OnDownPtr       = 0;
  ClockBack.OnClickPtr      = 0;
  ClockBack.OnPressPtr      = ClockBackOnPress;

  Label17.OwnerScreen     = &Clock;
  Label17.Order           = 9;
  Label17.Left            = 310;
  Label17.Top             = 235;
  Label17.Width           = 34;
  Label17.Height          = 24;
  Label17.Visible         = 1;
  Label17.Active          = 0;
  Label17.Caption         = Label17_Caption;
  Label17.FontName        = Open_Sans_Light14x22_Regular;
  Label17.Font_Color      = 0xFFFF;
  Label17.OnUpPtr         = 0;
  Label17.OnDownPtr       = 0;
  Label17.OnClickPtr      = 0;
  Label17.OnPressPtr      = 0;

  Label18.OwnerScreen     = &Clock;
  Label18.Order           = 10;
  Label18.Left            = 408;
  Label18.Top             = 236;
  Label18.Width           = 40;
  Label18.Height          = 24;
  Label18.Visible         = 1;
  Label18.Active          = 0;
  Label18.Caption         = Label18_Caption;
  Label18.FontName        = Open_Sans_Light14x22_Regular;
  Label18.Font_Color      = 0xFFFF;
  Label18.OnUpPtr         = 0;
  Label18.OnDownPtr       = 0;
  Label18.OnClickPtr      = 0;
  Label18.OnPressPtr      = 0;

  SyncIcon.OwnerScreen     = &Clock;
  SyncIcon.Order           = 11;
  SyncIcon.Left            = 285;
  SyncIcon.Top             = 236;
  SyncIcon.Width           = 22;
  SyncIcon.Height          = 22;
  SyncIcon.Picture_Type    = 0;
  SyncIcon.Picture_Ratio   = 1;
  SyncIcon.Picture_Name    = icon_sync_bmp;
  SyncIcon.Visible         = 1;
  SyncIcon.Active          = 0;
  SyncIcon.OnUpPtr         = 0;
  SyncIcon.OnDownPtr       = 0;
  SyncIcon.OnClickPtr      = 0;
  SyncIcon.OnPressPtr      = 0;

  Image8.OwnerScreen     = &Clock;
  Image8.Order           = 12;
  Image8.Left            = 380;
  Image8.Top             = 236;
  Image8.Width           = 22;
  Image8.Height          = 22;
  Image8.Picture_Type    = 0;
  Image8.Picture_Ratio   = 1;
  Image8.Picture_Name    = icon_ok_bmp;
  Image8.Visible         = 1;
  Image8.Active          = 0;
  Image8.OnUpPtr         = 0;
  Image8.OnDownPtr       = 0;
  Image8.OnClickPtr      = 0;
  Image8.OnPressPtr      = Image8OnPress;

  Box4.OwnerScreen     = &Clock;
  Box4.Order           = 13;
  Box4.Left            = 212;
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

  Box5.OwnerScreen     = &Clock;
  Box5.Order           = 14;
  Box5.Left            = 250;
  Box5.Top             = 42;
  Box5.Width           = 37;
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

  Image7.OwnerScreen     = &Clock;
  Image7.Order           = 15;
  Image7.Left            = 475;
  Image7.Top             = 248;
  Image7.Width           = 36;
  Image7.Height          = 740;
  Image7.Picture_Type    = 0;
  Image7.Picture_Ratio   = 1;
  Image7.Picture_Name    = stripe_green_bmp;
  Image7.Visible         = 0;
  Image7.Active          = 0;
  Image7.OnUpPtr         = 0;
  Image7.OnDownPtr       = 0;
  Image7.OnClickPtr      = 0;
  Image7.OnPressPtr      = 0;

  Label42.OwnerScreen     = &Clock;
  Label42.Order           = 16;
  Label42.Left            = 15;
  Label42.Top             = 235;
  Label42.Width           = 50;
  Label42.Height          = 19;
  Label42.Visible         = 1;
  Label42.Active          = 0;
  Label42.Caption         = Label42_Caption;
  Label42.FontName        = Open_Sans_Light12x18_Regular;
  Label42.Font_Color      = 0xFFFF;
  Label42.OnUpPtr         = 0;
  Label42.OnDownPtr       = 0;
  Label42.OnClickPtr      = 0;
  Label42.OnPressPtr      = 0;

  Image17.OwnerScreen     = &Clock;
  Image17.Order           = 17;
  Image17.Left            = 474;
  Image17.Top             = 17;
  Image17.Width           = 90;
  Image17.Height          = 151;
  Image17.Picture_Type    = 0;
  Image17.Picture_Ratio   = 1;
  Image17.Picture_Name    = am_pm_bmp;
  Image17.Visible         = 0;
  Image17.Active          = 0;
  Image17.OnUpPtr         = 0;
  Image17.OnDownPtr       = 0;
  Image17.OnClickPtr      = 0;
  Image17.OnPressPtr      = 0;

  Box14.OwnerScreen     = &Clock;
  Box14.Order           = 18;
  Box14.Left            = 305;
  Box14.Top             = 42;
  Box14.Width           = 90;
  Box14.Height          = 194;
  Box14.Pen_Width       = 0;
  Box14.Pen_Color       = 0x0000;
  Box14.Visible         = 0;
  Box14.Active          = 1;
  Box14.Transparent     = 0;
  Box14.Gradient        = 0;
  Box14.Gradient_Orientation = 0;
  Box14.Gradient_Start_Color = 0xFFFF;
  Box14.Gradient_End_Color = 0xC618;
  Box14.Color           = 0xC618;
  Box14.PressColEnabled = 1;
  Box14.Press_Color     = 0xE71C;
  Box14.OnUpPtr         = 0;
  Box14.OnDownPtr       = 0;
  Box14.OnClickPtr      = 0;
  Box14.OnPressPtr      = Box14OnPress;

  Box21.OwnerScreen     = &Sensors;
  Box21.Order           = 0;
  Box21.Left            = 4;
  Box21.Top             = 3;
  Box21.Width           = 108;
  Box21.Height          = 28;
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
  Box21.OnClickPtr      = BackIconSensorsOnPress;
  Box21.OnPressPtr      = 0;

  Diagram5_Box1.OwnerScreen     = &Sensors;
  Diagram5_Box1.Order           = 1;
  Diagram5_Box1.Left            = 320;
  Diagram5_Box1.Top             = 0;
  Diagram5_Box1.Width           = 161;
  Diagram5_Box1.Height          = 273;
  Diagram5_Box1.Pen_Width       = 0;
  Diagram5_Box1.Pen_Color       = 0x0000;
  Diagram5_Box1.Visible         = 1;
  Diagram5_Box1.Active          = 0;
  Diagram5_Box1.Transparent     = 1;
  Diagram5_Box1.Gradient        = 0;
  Diagram5_Box1.Gradient_Orientation = 0;
  Diagram5_Box1.Gradient_Start_Color = 0xFFFF;
  Diagram5_Box1.Gradient_End_Color = 0xC618;
  Diagram5_Box1.Color           = 0x7907;
  Diagram5_Box1.PressColEnabled = 1;
  Diagram5_Box1.Press_Color     = 0xE71C;
  Diagram5_Box1.OnUpPtr         = 0;
  Diagram5_Box1.OnDownPtr       = 0;
  Diagram5_Box1.OnClickPtr      = 0;
  Diagram5_Box1.OnPressPtr      = 0;

  TempIcon.OwnerScreen     = &Sensors;
  TempIcon.Order           = 2;
  TempIcon.Left            = 138;
  TempIcon.Top             = 62;
  TempIcon.Width           = 45;
  TempIcon.Height          = 50;
  TempIcon.Picture_Type    = 0;
  TempIcon.Picture_Ratio   = 1;
  TempIcon.Picture_Name    = icon_temp_sensor_bmp;
  TempIcon.Visible         = 1;
  TempIcon.Active          = 1;
  TempIcon.OnUpPtr         = 0;
  TempIcon.OnDownPtr       = 0;
  TempIcon.OnClickPtr      = 0;
  TempIcon.OnPressPtr      = 0;

  LightIcon.OwnerScreen     = &Sensors;
  LightIcon.Order           = 3;
  LightIcon.Left            = 377;
  LightIcon.Top             = 62;
  LightIcon.Width           = 45;
  LightIcon.Height          = 50;
  LightIcon.Picture_Type    = 0;
  LightIcon.Picture_Ratio   = 1;
  LightIcon.Picture_Name    = icon_light_sensor_BMP;
  LightIcon.Visible         = 1;
  LightIcon.Active          = 1;
  LightIcon.OnUpPtr         = 0;
  LightIcon.OnDownPtr       = 0;
  LightIcon.OnClickPtr      = 0;
  LightIcon.OnPressPtr      = 0;

  Diagram5_Label1.OwnerScreen     = &Sensors;
  Diagram5_Label1.Order           = 4;
  Diagram5_Label1.Left            = 120;
  Diagram5_Label1.Top             = 111;
  Diagram5_Label1.Width           = 97;
  Diagram5_Label1.Height          = 24;
  Diagram5_Label1.Visible         = 1;
  Diagram5_Label1.Active          = 1;
  Diagram5_Label1.Caption         = Diagram5_Label1_Caption;
  Diagram5_Label1.FontName        = Open_Sans_Light14x22_Regular;
  Diagram5_Label1.Font_Color      = 0xFFFF;
  Diagram5_Label1.OnUpPtr         = 0;
  Diagram5_Label1.OnDownPtr       = 0;
  Diagram5_Label1.OnClickPtr      = 0;
  Diagram5_Label1.OnPressPtr      = 0;

  Diagram5_Label2.OwnerScreen     = &Sensors;
  Diagram5_Label2.Order           = 5;
  Diagram5_Label2.Left            = 49;
  Diagram5_Label2.Top             = 158;
  Diagram5_Label2.Width           = 141;
  Diagram5_Label2.Height          = 67;
  Diagram5_Label2.Visible         = 1;
  Diagram5_Label2.Active          = 1;
  Diagram5_Label2.Caption         = Diagram5_Label2_Caption;
  Diagram5_Label2.FontName        = Open_Sans42x61_Regular;
  Diagram5_Label2.Font_Color      = 0xFFFF;
  Diagram5_Label2.OnUpPtr         = 0;
  Diagram5_Label2.OnDownPtr       = 0;
  Diagram5_Label2.OnClickPtr      = 0;
  Diagram5_Label2.OnPressPtr      = 0;

  Diagram5_Label3.OwnerScreen     = &Sensors;
  Diagram5_Label3.Order           = 6;
  Diagram5_Label3.Left            = 358;
  Diagram5_Label3.Top             = 114;
  Diagram5_Label3.Width           = 93;
  Diagram5_Label3.Height          = 24;
  Diagram5_Label3.Visible         = 1;
  Diagram5_Label3.Active          = 1;
  Diagram5_Label3.Caption         = Diagram5_Label3_Caption;
  Diagram5_Label3.FontName        = Open_Sans_Light14x22_Regular;
  Diagram5_Label3.Font_Color      = 0xFFFF;
  Diagram5_Label3.OnUpPtr         = 0;
  Diagram5_Label3.OnDownPtr       = 0;
  Diagram5_Label3.OnClickPtr      = 0;
  Diagram5_Label3.OnPressPtr      = 0;

  Diagram5_Label4.OwnerScreen     = &Sensors;
  Diagram5_Label4.Order           = 7;
  Diagram5_Label4.Left            = 339;
  Diagram5_Label4.Top             = 158;
  Diagram5_Label4.Width           = 130;
  Diagram5_Label4.Height          = 67;
  Diagram5_Label4.Visible         = 1;
  Diagram5_Label4.Active          = 1;
  Diagram5_Label4.Caption         = Diagram5_Label4_Caption;
  Diagram5_Label4.FontName        = Open_Sans42x61_Regular;
  Diagram5_Label4.Font_Color      = 0xFFFF;
  Diagram5_Label4.OnUpPtr         = 0;
  Diagram5_Label4.OnDownPtr       = 0;
  Diagram5_Label4.OnClickPtr      = 0;
  Diagram5_Label4.OnPressPtr      = 0;

  Diagram5_Label5.OwnerScreen     = &Sensors;
  Diagram5_Label5.Order           = 8;
  Diagram5_Label5.Left            = 204;
  Diagram5_Label5.Top             = 162;
  Diagram5_Label5.Width           = 62;
  Diagram5_Label5.Height          = 31;
  Diagram5_Label5.Visible         = 1;
  Diagram5_Label5.Active          = 1;
  Diagram5_Label5.Caption         = Diagram5_Label5_Caption;
  Diagram5_Label5.FontName        = Open_Sans_Light19x28_Regular;
  Diagram5_Label5.Font_Color      = 0xFFFF;
  Diagram5_Label5.OnUpPtr         = 0;
  Diagram5_Label5.OnDownPtr       = 0;
  Diagram5_Label5.OnClickPtr      = 0;
  Diagram5_Label5.OnPressPtr      = 0;

  BackIconSensors.OwnerScreen     = &Sensors;
  BackIconSensors.Order           = 9;
  BackIconSensors.Left            = 5;
  BackIconSensors.Top             = 6;
  BackIconSensors.Width           = 22;
  BackIconSensors.Height          = 22;
  BackIconSensors.Picture_Type    = 0;
  BackIconSensors.Picture_Ratio   = 1;
  BackIconSensors.Picture_Name    = icon_back_sensors_bmp;
  BackIconSensors.Visible         = 1;
  BackIconSensors.Active          = 0;
  BackIconSensors.OnUpPtr         = 0;
  BackIconSensors.OnDownPtr       = 0;
  BackIconSensors.OnClickPtr      = 0;
  BackIconSensors.OnPressPtr      = BackIconSensorsOnPress;

  Diagram5_Label6.OwnerScreen     = &Sensors;
  Diagram5_Label6.Order           = 10;
  Diagram5_Label6.Left            = 32;
  Diagram5_Label6.Top             = 2;
  Diagram5_Label6.Width           = 78;
  Diagram5_Label6.Height          = 31;
  Diagram5_Label6.Visible         = 1;
  Diagram5_Label6.Active          = 0;
  Diagram5_Label6.Caption         = Diagram5_Label6_Caption;
  Diagram5_Label6.FontName        = Open_Sans_Light19x28_Regular;
  Diagram5_Label6.Font_Color      = 0xFFFF;
  Diagram5_Label6.OnUpPtr         = 0;
  Diagram5_Label6.OnDownPtr       = 0;
  Diagram5_Label6.OnClickPtr      = 0;
  Diagram5_Label6.OnPressPtr      = BackIconSensorsOnPress;

  Label21.OwnerScreen     = &Sensors;
  Label21.Order           = 11;
  Label21.Left            = 192;
  Label21.Top             = 161;
  Label21.Width           = 7;
  Label21.Height          = 31;
  Label21.Visible         = 1;
  Label21.Active          = 1;
  Label21.Caption         = Label21_Caption;
  Label21.FontName        = Open_Sans_Light19x28_Regular;
  Label21.Font_Color      = 0xFFFF;
  Label21.OnUpPtr         = 0;
  Label21.OnDownPtr       = 0;
  Label21.OnClickPtr      = 0;
  Label21.OnPressPtr      = 0;

  Box20.OwnerScreen     = &MP3_SD;
  Box20.Order           = 0;
  Box20.Left            = 5;
  Box20.Top             = 4;
  Box20.Width           = 138;
  Box20.Height          = 27;
  Box20.Pen_Width       = 1;
  Box20.Pen_Color       = 0x0000;
  Box20.Visible         = 0;
  Box20.Active          = 1;
  Box20.Transparent     = 1;
  Box20.Gradient        = 0;
  Box20.Gradient_Orientation = 0;
  Box20.Gradient_Start_Color = 0xFFFF;
  Box20.Gradient_End_Color = 0xC618;
  Box20.Color           = 0xC618;
  Box20.PressColEnabled = 0;
  Box20.Press_Color     = 0xE71C;
  Box20.OnUpPtr         = 0;
  Box20.OnDownPtr       = 0;
  Box20.OnClickPtr      = mp3_back_iconOnPress;
  Box20.OnPressPtr      = 0;

  Label22.OwnerScreen     = &MP3_SD;
  Label22.Order           = 1;
  Label22.Left            = 32;
  Label22.Top             = 2;
  Label22.Width           = 112;
  Label22.Height          = 26;
  Label22.Visible         = 1;
  Label22.Active          = 0;
  Label22.Caption         = Label22_Caption;
  Label22.FontName        = Open_Sans_Light19x28_Regular;
  Label22.Font_Color      = 0xFFFF;
  Label22.OnUpPtr         = 0;
  Label22.OnDownPtr       = 0;
  Label22.OnClickPtr      = 0;
  Label22.OnPressPtr      = Label22OnPress;

  Label23.OwnerScreen     = &MP3_SD;
  Label23.Order           = 2;
  Label23.Left            = 160;
  Label23.Top             = 128;
  Label23.Width           = 145;
  Label23.Height          = 20;
  Label23.Visible         = 1;
  Label23.Active          = 1;
  Label23.Caption         = Label23_Caption;
  Label23.FontName        = Open_Sans_Light14x22_Regular;
  Label23.Font_Color      = 0xFFFF;
  Label23.OnUpPtr         = 0;
  Label23.OnDownPtr       = 0;
  Label23.OnClickPtr      = 0;
  Label23.OnPressPtr      = 0;

  Image11.OwnerScreen     = &MP3_SD;
  Image11.Order           = 3;
  Image11.Left            = 427;
  Image11.Top             = 18;
  Image11.Width           = 45;
  Image11.Height          = 34;
  Image11.Picture_Type    = 0;
  Image11.Picture_Ratio   = 1;
  Image11.Picture_Name    = icon_microsd_bmp;
  Image11.Visible         = 1;
  Image11.Active          = 1;
  Image11.OnUpPtr         = 0;
  Image11.OnDownPtr       = 0;
  Image11.OnClickPtr      = 0;
  Image11.OnPressPtr      = 0;

  Image12.OwnerScreen     = &MP3_SD;
  Image12.Order           = 4;
  Image12.Left            = 400;
  Image12.Top             = 28;
  Image12.Width           = 23;
  Image12.Height          = 12;
  Image12.Picture_Type    = 0;
  Image12.Picture_Ratio   = 1;
  Image12.Picture_Name    = icon_anim_01_bmp;
  Image12.Visible         = 1;
  Image12.Active          = 1;
  Image12.OnUpPtr         = 0;
  Image12.OnDownPtr       = 0;
  Image12.OnClickPtr      = 0;
  Image12.OnPressPtr      = 0;

  Image13.OwnerScreen     = &MP3_SD;
  Image13.Order           = 5;
  Image13.Left            = 400;
  Image13.Top             = 28;
  Image13.Width           = 23;
  Image13.Height          = 12;
  Image13.Picture_Type    = 0;
  Image13.Picture_Ratio   = 1;
  Image13.Picture_Name    = icon_anim_02_bmp;
  Image13.Visible         = 1;
  Image13.Active          = 1;
  Image13.OnUpPtr         = 0;
  Image13.OnDownPtr       = 0;
  Image13.OnClickPtr      = 0;
  Image13.OnPressPtr      = 0;

  Image14.OwnerScreen     = &MP3_SD;
  Image14.Order           = 6;
  Image14.Left            = 400;
  Image14.Top             = 28;
  Image14.Width           = 23;
  Image14.Height          = 12;
  Image14.Picture_Type    = 0;
  Image14.Picture_Ratio   = 1;
  Image14.Picture_Name    = icon_anim_03_bmp;
  Image14.Visible         = 1;
  Image14.Active          = 1;
  Image14.OnUpPtr         = 0;
  Image14.OnDownPtr       = 0;
  Image14.OnClickPtr      = 0;
  Image14.OnPressPtr      = 0;

  mp3_back_icon.OwnerScreen     = &MP3_SD;
  mp3_back_icon.Order           = 7;
  mp3_back_icon.Left            = 5;
  mp3_back_icon.Top             = 6;
  mp3_back_icon.Width           = 22;
  mp3_back_icon.Height          = 22;
  mp3_back_icon.Picture_Type    = 0;
  mp3_back_icon.Picture_Ratio   = 1;
  mp3_back_icon.Picture_Name    = icon_back_mp3_bmp;
  mp3_back_icon.Visible         = 1;
  mp3_back_icon.Active          = 0;
  mp3_back_icon.OnUpPtr         = 0;
  mp3_back_icon.OnDownPtr       = 0;
  mp3_back_icon.OnClickPtr      = 0;
  mp3_back_icon.OnPressPtr      = mp3_back_iconOnPress;

  Box19.OwnerScreen     = &MP3_SongList;
  Box19.Order           = 0;
  Box19.Left            = 4;
  Box19.Top             = 3;
  Box19.Width           = 139;
  Box19.Height          = 28;
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
  Box19.OnClickPtr      = Image15OnPress;
  Box19.OnPressPtr      = 0;

  Box6.OwnerScreen     = &MP3_SongList;
  Box6.Order           = 1;
  Box6.Left            = 0;
  Box6.Top             = 38;
  Box6.Width           = 480;
  Box6.Height          = 210;
  Box6.Pen_Width       = 0;
  Box6.Pen_Color       = 0x0000;
  Box6.Visible         = 1;
  Box6.Active          = 1;
  Box6.Transparent     = 1;
  Box6.Gradient        = 0;
  Box6.Gradient_Orientation = 0;
  Box6.Gradient_Start_Color = 0xFFFF;
  Box6.Gradient_End_Color = 0xC618;
  Box6.Color           = 0x2B31;
  Box6.PressColEnabled = 0;
  Box6.Press_Color     = 0xE71C;
  Box6.OnUpPtr         = 0;
  Box6.OnDownPtr       = 0;
  Box6.OnClickPtr      = Box6OnClick;
  Box6.OnPressPtr      = Box6OnPress;

  Label24.OwnerScreen     = &MP3_SongList;
  Label24.Order           = 2;
  Label24.Left            = 32;
  Label24.Top             = 2;
  Label24.Width           = 109;
  Label24.Height          = 31;
  Label24.Visible         = 1;
  Label24.Active          = 0;
  Label24.Caption         = Label24_Caption;
  Label24.FontName        = Open_Sans_Light19x28_Regular;
  Label24.Font_Color      = 0xFFFF;
  Label24.OnUpPtr         = 0;
  Label24.OnDownPtr       = 0;
  Label24.OnClickPtr      = 0;
  Label24.OnPressPtr      = Label24OnPress;

  mp3_back_icon2.OwnerScreen     = &MP3_SongList;
  mp3_back_icon2.Order           = 3;
  mp3_back_icon2.Left            = 5;
  mp3_back_icon2.Top             = 6;
  mp3_back_icon2.Width           = 22;
  mp3_back_icon2.Height          = 22;
  mp3_back_icon2.Picture_Type    = 0;
  mp3_back_icon2.Picture_Ratio   = 1;
  mp3_back_icon2.Picture_Name    = icon_back_mp3_bmp;
  mp3_back_icon2.Visible         = 1;
  mp3_back_icon2.Active          = 0;
  mp3_back_icon2.OnUpPtr         = 0;
  mp3_back_icon2.OnDownPtr       = 0;
  mp3_back_icon2.OnClickPtr      = 0;
  mp3_back_icon2.OnPressPtr      = Image15OnPress;

  Label26.OwnerScreen     = &MP3_SongList;
  Label26.Order           = 4;
  Label26.Left            = 168;
  Label26.Top             = 248;
  Label26.Width           = 163;
  Label26.Height          = 24;
  Label26.Visible         = 1;
  Label26.Active          = 1;
  Label26.Caption         = Label26_Caption;
  Label26.FontName        = Open_Sans_Light14x22_Regular;
  Label26.Font_Color      = 0xFFFF;
  Label26.OnUpPtr         = 0;
  Label26.OnDownPtr       = 0;
  Label26.OnClickPtr      = 0;
  Label26.OnPressPtr      = 0;

  folder_icon.OwnerScreen     = &MP3_SongList;
  folder_icon.Order           = 5;
  folder_icon.Left            = 434;
  folder_icon.Top             = 22;
  folder_icon.Width           = 13;
  folder_icon.Height          = 10;
  folder_icon.Picture_Type    = 0;
  folder_icon.Picture_Ratio   = 1;
  folder_icon.Picture_Name    = icon_folder_bmp;
  folder_icon.Visible         = 0;
  folder_icon.Active          = 0;
  folder_icon.OnUpPtr         = 0;
  folder_icon.OnDownPtr       = 0;
  folder_icon.OnClickPtr      = 0;
  folder_icon.OnPressPtr      = 0;

  file_icon.OwnerScreen     = &MP3_SongList;
  file_icon.Order           = 6;
  file_icon.Left            = 434;
  file_icon.Top             = 10;
  file_icon.Width           = 10;
  file_icon.Height          = 10;
  file_icon.Picture_Type    = 0;
  file_icon.Picture_Ratio   = 1;
  file_icon.Picture_Name    = icon_mp3_file_bmp;
  file_icon.Visible         = 0;
  file_icon.Active          = 0;
  file_icon.OnUpPtr         = 0;
  file_icon.OnDownPtr       = 0;
  file_icon.OnClickPtr      = 0;
  file_icon.OnPressPtr      = 0;

  Box17.OwnerScreen     = &MP3_Player;
  Box17.Order           = 0;
  Box17.Left            = 2;
  Box17.Top             = 3;
  Box17.Width           = 142;
  Box17.Height          = 28;
  Box17.Pen_Width       = 1;
  Box17.Pen_Color       = 0x0000;
  Box17.Visible         = 0;
  Box17.Active          = 1;
  Box17.Transparent     = 1;
  Box17.Gradient        = 0;
  Box17.Gradient_Orientation = 0;
  Box17.Gradient_Start_Color = 0xFFFF;
  Box17.Gradient_End_Color = 0xC618;
  Box17.Color           = 0xC618;
  Box17.PressColEnabled = 0;
  Box17.Press_Color     = 0xE71C;
  Box17.OnUpPtr         = 0;
  Box17.OnDownPtr       = 0;
  Box17.OnClickPtr      = Icon_back_mp3OnClick;
  Box17.OnPressPtr      = 0;

  Label27.OwnerScreen     = &MP3_Player;
  Label27.Order           = 1;
  Label27.Left            = 32;
  Label27.Top             = 2;
  Label27.Width           = 109;
  Label27.Height          = 31;
  Label27.Visible         = 1;
  Label27.Active          = 0;
  Label27.Caption         = Label27_Caption;
  Label27.FontName        = Open_Sans_Light19x28_Regular;
  Label27.Font_Color      = 0xFFFF;
  Label27.OnUpPtr         = 0;
  Label27.OnDownPtr       = 0;
  Label27.OnClickPtr      = 0;
  Label27.OnPressPtr      = Icon_back_mp3OnClick;

  Icon_back_mp3.OwnerScreen     = &MP3_Player;
  Icon_back_mp3.Order           = 2;
  Icon_back_mp3.Left            = 5;
  Icon_back_mp3.Top             = 6;
  Icon_back_mp3.Width           = 22;
  Icon_back_mp3.Height          = 22;
  Icon_back_mp3.Picture_Type    = 0;
  Icon_back_mp3.Picture_Ratio   = 1;
  Icon_back_mp3.Picture_Name    = icon_back_mp3_bmp_1;
  Icon_back_mp3.Visible         = 1;
  Icon_back_mp3.Active          = 0;
  Icon_back_mp3.OnUpPtr         = 0;
  Icon_back_mp3.OnDownPtr       = 0;
  Icon_back_mp3.OnClickPtr      = Icon_back_mp3OnClick;
  Icon_back_mp3.OnPressPtr      = Icon_back_mp3OnClick;

  VolmeBar.OwnerScreen     = &MP3_Player;
  VolmeBar.Order           = 3;
  VolmeBar.Left            = 399;
  VolmeBar.Top             = 10;
  VolmeBar.Width           = 75;
  VolmeBar.Height          = 12;
  VolmeBar.Pen_Width       = 0;
  VolmeBar.Pen_Color       = 0x0000;
  VolmeBar.Visible         = 1;
  VolmeBar.Active          = 1;
  VolmeBar.Transparent     = 1;
  VolmeBar.Gradient        = 0;
  VolmeBar.Gradient_Orientation = 0;
  VolmeBar.Gradient_Start_Color = 0xFFFF;
  VolmeBar.Gradient_End_Color = 0xC618;
  VolmeBar.Color           = 0x2B31;
  VolmeBar.PressColEnabled = 0;
  VolmeBar.Press_Color     = 0xE71C;
  VolmeBar.OnUpPtr         = 0;
  VolmeBar.OnDownPtr       = 0;
  VolmeBar.OnClickPtr      = 0;
  VolmeBar.OnPressPtr      = VolmeBarOnPress;

  Image15.OwnerScreen     = &MP3_Player;
  Image15.Order           = 4;
  Image15.Left            = 374;
  Image15.Top             = 10;
  Image15.Width           = 19;
  Image15.Height          = 13;
  Image15.Picture_Type    = 0;
  Image15.Picture_Ratio   = 1;
  Image15.Picture_Name    = icon_volume_BMP;
  Image15.Visible         = 1;
  Image15.Active          = 1;
  Image15.OnUpPtr         = 0;
  Image15.OnDownPtr       = 0;
  Image15.OnClickPtr      = 0;
  Image15.OnPressPtr      = 0;

  ProgressBar.OwnerScreen     = &MP3_Player;
  ProgressBar.Order           = 5;
  ProgressBar.Left            = 180;
  ProgressBar.Top             = 225;
  ProgressBar.Width           = 250;
  ProgressBar.Height          = 12;
  ProgressBar.Pen_Width       = 0;
  ProgressBar.Pen_Color       = 0x0000;
  ProgressBar.Visible         = 1;
  ProgressBar.Active          = 1;
  ProgressBar.Transparent     = 1;
  ProgressBar.Gradient        = 0;
  ProgressBar.Gradient_Orientation = 0;
  ProgressBar.Gradient_Start_Color = 0xFFFF;
  ProgressBar.Gradient_End_Color = 0xC618;
  ProgressBar.Color           = 0x2B31;
  ProgressBar.PressColEnabled = 0;
  ProgressBar.Press_Color     = 0xE71C;
  ProgressBar.OnUpPtr         = 0;
  ProgressBar.OnDownPtr       = 0;
  ProgressBar.OnClickPtr      = 0;
  ProgressBar.OnPressPtr      = ProgreesBarOnPress;

  Label28.OwnerScreen     = &MP3_Player;
  Label28.Order           = 6;
  Label28.Left            = 209;
  Label28.Top             = 171;
  Label28.Width           = 73;
  Label28.Height          = 31;
  Label28.Visible         = 1;
  Label28.Active          = 1;
  Label28.Caption         = Label28_Caption;
  Label28.FontName        = Open_Sans_Light19x28_Regular;
  Label28.Font_Color      = 0xFFFF;
  Label28.OnUpPtr         = 0;
  Label28.OnDownPtr       = 0;
  Label28.OnClickPtr      = 0;
  Label28.OnPressPtr      = 0;

  previous_icon.OwnerScreen     = &MP3_Player;
  previous_icon.Order           = 7;
  previous_icon.Left            = 75;
  previous_icon.Top             = 224;
  previous_icon.Width           = 13;
  previous_icon.Height          = 13;
  previous_icon.Picture_Type    = 0;
  previous_icon.Picture_Ratio   = 1;
  previous_icon.Picture_Name    = icon_prev_bmp;
  previous_icon.Visible         = 1;
  previous_icon.Active          = 1;
  previous_icon.OnUpPtr         = 0;
  previous_icon.OnDownPtr       = previous_iconOnDown;
  previous_icon.OnClickPtr      = 0;
  previous_icon.OnPressPtr      = 0;

  pause_icon.OwnerScreen     = &MP3_Player;
  pause_icon.Order           = 8;
  pause_icon.Left            = 103;
  pause_icon.Top             = 225;
  pause_icon.Width           = 13;
  pause_icon.Height          = 13;
  pause_icon.Picture_Type    = 0;
  pause_icon.Picture_Ratio   = 1;
  pause_icon.Picture_Name    = icon_pause_bmp;
  pause_icon.Visible         = 1;
  pause_icon.Active          = 1;
  pause_icon.OnUpPtr         = 0;
  pause_icon.OnDownPtr       = pause_iconOnPress;
  pause_icon.OnClickPtr      = pause_iconOnPress;
  pause_icon.OnPressPtr      = 0;

  Play_icon.OwnerScreen     = &MP3_Player;
  Play_icon.Order           = 9;
  Play_icon.Left            = 102;
  Play_icon.Top             = 225;
  Play_icon.Width           = 13;
  Play_icon.Height          = 13;
  Play_icon.Picture_Type    = 0;
  Play_icon.Picture_Ratio   = 1;
  Play_icon.Picture_Name    = icon_play_bmp;
  Play_icon.Visible         = 1;
  Play_icon.Active          = 0;
  Play_icon.OnUpPtr         = 0;
  Play_icon.OnDownPtr       = Play_iconOnDown;
  Play_icon.OnClickPtr      = 0;
  Play_icon.OnPressPtr      = 0;

  stop_icon.OwnerScreen     = &MP3_Player;
  stop_icon.Order           = 10;
  stop_icon.Left            = 131;
  stop_icon.Top             = 225;
  stop_icon.Width           = 13;
  stop_icon.Height          = 13;
  stop_icon.Picture_Type    = 0;
  stop_icon.Picture_Ratio   = 1;
  stop_icon.Picture_Name    = icon_stop_bmp;
  stop_icon.Visible         = 1;
  stop_icon.Active          = 1;
  stop_icon.OnUpPtr         = 0;
  stop_icon.OnDownPtr       = stop_iconOnDown;
  stop_icon.OnClickPtr      = 0;
  stop_icon.OnPressPtr      = 0;

  next_icon.OwnerScreen     = &MP3_Player;
  next_icon.Order           = 11;
  next_icon.Left            = 158;
  next_icon.Top             = 225;
  next_icon.Width           = 13;
  next_icon.Height          = 13;
  next_icon.Picture_Type    = 0;
  next_icon.Picture_Ratio   = 1;
  next_icon.Picture_Name    = icon_next_bmp;
  next_icon.Visible         = 1;
  next_icon.Active          = 1;
  next_icon.OnUpPtr         = 0;
  next_icon.OnDownPtr       = next_iconOnDown;
  next_icon.OnClickPtr      = 0;
  next_icon.OnPressPtr      = 0;

  songlist_icon.OwnerScreen     = &MP3_Player;
  songlist_icon.Order           = 12;
  songlist_icon.Left            = 39;
  songlist_icon.Top             = 221;
  songlist_icon.Width           = 19;
  songlist_icon.Height          = 19;
  songlist_icon.Picture_Type    = 0;
  songlist_icon.Picture_Ratio   = 1;
  songlist_icon.Picture_Name    = icon_playlist_bmp;
  songlist_icon.Visible         = 1;
  songlist_icon.Active          = 1;
  songlist_icon.OnUpPtr         = 0;
  songlist_icon.OnDownPtr       = songlist_iconOnPress;
  songlist_icon.OnClickPtr      = songlist_iconOnPress;
  songlist_icon.OnPressPtr      = 0;

  Label6.OwnerScreen     = &MP3_Player;
  Label6.Order           = 13;
  Label6.Left            = 432;
  Label6.Top             = 221;
  Label6.Width           = 34;
  Label6.Height          = 19;
  Label6.Visible         = 1;
  Label6.Active          = 1;
  Label6.Caption         = Label6_Caption;
  Label6.FontName        = Open_Sans_Light12x18_Regular;
  Label6.Font_Color      = 0xFFFF;
  Label6.OnUpPtr         = 0;
  Label6.OnDownPtr       = 0;
  Label6.OnClickPtr      = 0;
  Label6.OnPressPtr      = 0;

  Box18.OwnerScreen     = &Paint;
  Box18.Order           = 0;
  Box18.Left            = 2;
  Box18.Top             = 4;
  Box18.Width           = 82;
  Box18.Height          = 25;
  Box18.Pen_Width       = 1;
  Box18.Pen_Color       = 0x0000;
  Box18.Visible         = 0;
  Box18.Active          = 1;
  Box18.Transparent     = 1;
  Box18.Gradient        = 0;
  Box18.Gradient_Orientation = 0;
  Box18.Gradient_Start_Color = 0xFFFF;
  Box18.Gradient_End_Color = 0xC618;
  Box18.Color           = 0xC618;
  Box18.PressColEnabled = 0;
  Box18.Press_Color     = 0xE71C;
  Box18.OnUpPtr         = 0;
  Box18.OnDownPtr       = 0;
  Box18.OnClickPtr      = icon_paint_backOnPress;
  Box18.OnPressPtr      = 0;

  Image4.OwnerScreen     = &Paint;
  Image4.Order           = 1;
  Image4.Left            = 0;
  Image4.Top             = 46;
  Image4.Width           = 32;
  Image4.Height          = 32;
  Image4.Picture_Type    = 0;
  Image4.Picture_Ratio   = 1;
  Image4.Picture_Name    = icon_new_screen_selected_bmp;
  Image4.Visible         = 0;
  Image4.Active          = 1;
  Image4.OnUpPtr         = 0;
  Image4.OnDownPtr       = 0;
  Image4.OnClickPtr      = 0;
  Image4.OnPressPtr      = 0;

  NewScreen.OwnerScreen     = &Paint;
  NewScreen.Order           = 2;
  NewScreen.Left            = 0;
  NewScreen.Top             = 46;
  NewScreen.Width           = 32;
  NewScreen.Height          = 32;
  NewScreen.Picture_Type    = 0;
  NewScreen.Picture_Ratio   = 1;
  NewScreen.Picture_Name    = icon_new_screen_bmp;
  NewScreen.Visible         = 1;
  NewScreen.Active          = 1;
  NewScreen.OnUpPtr         = 0;
  NewScreen.OnDownPtr       = 0;
  NewScreen.OnClickPtr      = 0;
  NewScreen.OnPressPtr      = NewScreenOnPress;

  Image25.OwnerScreen     = &Paint;
  Image25.Order           = 3;
  Image25.Left            = 0;
  Image25.Top             = 86;
  Image25.Width           = 32;
  Image25.Height          = 32;
  Image25.Picture_Type    = 0;
  Image25.Picture_Ratio   = 1;
  Image25.Picture_Name    = icon_brush_selected_bmp;
  Image25.Visible         = 0;
  Image25.Active          = 1;
  Image25.OnUpPtr         = 0;
  Image25.OnDownPtr       = 0;
  Image25.OnClickPtr      = 0;
  Image25.OnPressPtr      = 0;

  Pen.OwnerScreen     = &Paint;
  Pen.Order           = 4;
  Pen.Left            = 0;
  Pen.Top             = 86;
  Pen.Width           = 32;
  Pen.Height          = 32;
  Pen.Picture_Type    = 0;
  Pen.Picture_Ratio   = 1;
  Pen.Picture_Name    = icon_brush_bmp;
  Pen.Visible         = 1;
  Pen.Active          = 1;
  Pen.OnUpPtr         = 0;
  Pen.OnDownPtr       = 0;
  Pen.OnClickPtr      = 0;
  Pen.OnPressPtr      = PenOnPress;

  Image27.OwnerScreen     = &Paint;
  Image27.Order           = 5;
  Image27.Left            = 0;
  Image27.Top             = 124;
  Image27.Width           = 32;
  Image27.Height          = 32;
  Image27.Picture_Type    = 0;
  Image27.Picture_Ratio   = 1;
  Image27.Picture_Name    = icon_eraser_selected_bmp;
  Image27.Visible         = 0;
  Image27.Active          = 1;
  Image27.OnUpPtr         = 0;
  Image27.OnDownPtr       = 0;
  Image27.OnClickPtr      = 0;
  Image27.OnPressPtr      = 0;

  Eraser.OwnerScreen     = &Paint;
  Eraser.Order           = 6;
  Eraser.Left            = 0;
  Eraser.Top             = 124;
  Eraser.Width           = 32;
  Eraser.Height          = 32;
  Eraser.Picture_Type    = 0;
  Eraser.Picture_Ratio   = 1;
  Eraser.Picture_Name    = icon_eraser_bmp;
  Eraser.Visible         = 1;
  Eraser.Active          = 1;
  Eraser.OnUpPtr         = 0;
  Eraser.OnDownPtr       = 0;
  Eraser.OnClickPtr      = 0;
  Eraser.OnPressPtr      = EraserOnPress;

  Image29.OwnerScreen     = &Paint;
  Image29.Order           = 7;
  Image29.Left            = 0;
  Image29.Top             = 166;
  Image29.Width           = 32;
  Image29.Height          = 32;
  Image29.Picture_Type    = 0;
  Image29.Picture_Ratio   = 1;
  Image29.Picture_Name    = icon_fill_back_selected_bmp;
  Image29.Visible         = 0;
  Image29.Active          = 1;
  Image29.OnUpPtr         = 0;
  Image29.OnDownPtr       = 0;
  Image29.OnClickPtr      = 0;
  Image29.OnPressPtr      = 0;

  DrawingArea.OwnerScreen     = &Paint;
  DrawingArea.Order           = 8;
  DrawingArea.Left            = 32;
  DrawingArea.Top             = 32;
  DrawingArea.Width           = 449;
  DrawingArea.Height          = 241;
  DrawingArea.Pen_Width       = 0;
  DrawingArea.Pen_Color       = 0x0000;
  DrawingArea.Visible         = 1;
  DrawingArea.Active          = 1;
  DrawingArea.Transparent     = 1;
  DrawingArea.Gradient        = 0;
  DrawingArea.Gradient_Orientation = 0;
  DrawingArea.Gradient_Start_Color = 0xFFFF;
  DrawingArea.Gradient_End_Color = 0xC618;
  DrawingArea.Color           = 0xFFFF;
  DrawingArea.PressColEnabled = 0;
  DrawingArea.Press_Color     = 0xE71C;
  DrawingArea.OnUpPtr         = 0;
  DrawingArea.OnDownPtr       = 0;
  DrawingArea.OnClickPtr      = 0;
  DrawingArea.OnPressPtr      = DrawingAreaOnPress;

  icon_paint_back.OwnerScreen     = &Paint;
  icon_paint_back.Order           = 9;
  icon_paint_back.Left            = 5;
  icon_paint_back.Top             = 6;
  icon_paint_back.Width           = 22;
  icon_paint_back.Height          = 22;
  icon_paint_back.Picture_Type    = 0;
  icon_paint_back.Picture_Ratio   = 1;
  icon_paint_back.Picture_Name    = icon_back_paint_bmp;
  icon_paint_back.Visible         = 1;
  icon_paint_back.Active          = 0;
  icon_paint_back.OnUpPtr         = 0;
  icon_paint_back.OnDownPtr       = 0;
  icon_paint_back.OnClickPtr      = 0;
  icon_paint_back.OnPressPtr      = icon_paint_backOnPress;

  Label29.OwnerScreen     = &Paint;
  Label29.Order           = 10;
  Label29.Left            = 31;
  Label29.Top             = 2;
  Label29.Width           = 49;
  Label29.Height          = 31;
  Label29.Visible         = 1;
  Label29.Active          = 0;
  Label29.Caption         = Label29_Caption;
  Label29.FontName        = Open_Sans_Light19x28_Regular;
  Label29.Font_Color      = 0xFFFF;
  Label29.OnUpPtr         = 0;
  Label29.OnDownPtr       = 0;
  Label29.OnClickPtr      = 0;
  Label29.OnPressPtr      = icon_paint_backOnPress;

  Color01.OwnerScreen     = &Paint;
  Color01.Order           = 11;
  Color01.Left            = 91;
  Color01.Top             = 0;
  Color01.Width           = 12;
  Color01.Height          = 31;
  Color01.Pen_Width       = 1;
  Color01.Pen_Color       = 0x0000;
  Color01.Visible         = 1;
  Color01.Active          = 1;
  Color01.Transparent     = 1;
  Color01.Gradient        = 0;
  Color01.Gradient_Orientation = 0;
  Color01.Gradient_Start_Color = 0xFFFF;
  Color01.Gradient_End_Color = 0xC618;
  Color01.Color           = 0x0000;
  Color01.PressColEnabled = 0;
  Color01.Press_Color     = 0xE71C;
  Color01.OnUpPtr         = 0;
  Color01.OnDownPtr       = 0;
  Color01.OnClickPtr      = 0;
  Color01.OnPressPtr      = Color01OnPress;

  Color02.OwnerScreen     = &Paint;
  Color02.Order           = 12;
  Color02.Left            = 104;
  Color02.Top             = 0;
  Color02.Width           = 12;
  Color02.Height          = 31;
  Color02.Pen_Width       = 1;
  Color02.Pen_Color       = 0x8410;
  Color02.Visible         = 1;
  Color02.Active          = 1;
  Color02.Transparent     = 1;
  Color02.Gradient        = 0;
  Color02.Gradient_Orientation = 0;
  Color02.Gradient_Start_Color = 0xFFFF;
  Color02.Gradient_End_Color = 0xC618;
  Color02.Color           = 0x8410;
  Color02.PressColEnabled = 0;
  Color02.Press_Color     = 0xE71C;
  Color02.OnUpPtr         = 0;
  Color02.OnDownPtr       = 0;
  Color02.OnClickPtr      = 0;
  Color02.OnPressPtr      = Color02OnPress;

  Color03.OwnerScreen     = &Paint;
  Color03.Order           = 13;
  Color03.Left            = 117;
  Color03.Top             = 0;
  Color03.Width           = 12;
  Color03.Height          = 31;
  Color03.Pen_Width       = 1;
  Color03.Pen_Color       = 0xA534;
  Color03.Visible         = 1;
  Color03.Active          = 1;
  Color03.Transparent     = 1;
  Color03.Gradient        = 0;
  Color03.Gradient_Orientation = 0;
  Color03.Gradient_Start_Color = 0xFFFF;
  Color03.Gradient_End_Color = 0xC618;
  Color03.Color           = 0xA534;
  Color03.PressColEnabled = 0;
  Color03.Press_Color     = 0xE71C;
  Color03.OnUpPtr         = 0;
  Color03.OnDownPtr       = 0;
  Color03.OnClickPtr      = 0;
  Color03.OnPressPtr      = Color03OnPress;

  Color04.OwnerScreen     = &Paint;
  Color04.Order           = 14;
  Color04.Left            = 130;
  Color04.Top             = 0;
  Color04.Width           = 12;
  Color04.Height          = 31;
  Color04.Pen_Width       = 1;
  Color04.Pen_Color       = 0xDEDB;
  Color04.Visible         = 1;
  Color04.Active          = 1;
  Color04.Transparent     = 1;
  Color04.Gradient        = 0;
  Color04.Gradient_Orientation = 0;
  Color04.Gradient_Start_Color = 0xFFFF;
  Color04.Gradient_End_Color = 0xC618;
  Color04.Color           = 0xDEDB;
  Color04.PressColEnabled = 0;
  Color04.Press_Color     = 0xE71C;
  Color04.OnUpPtr         = 0;
  Color04.OnDownPtr       = 0;
  Color04.OnClickPtr      = 0;
  Color04.OnPressPtr      = Color04OnPress;

  Color05.OwnerScreen     = &Paint;
  Color05.Order           = 15;
  Color05.Left            = 143;
  Color05.Top             = 0;
  Color05.Width           = 12;
  Color05.Height          = 31;
  Color05.Pen_Width       = 1;
  Color05.Pen_Color       = 0xFFFF;
  Color05.Visible         = 1;
  Color05.Active          = 1;
  Color05.Transparent     = 1;
  Color05.Gradient        = 0;
  Color05.Gradient_Orientation = 0;
  Color05.Gradient_Start_Color = 0xFFFF;
  Color05.Gradient_End_Color = 0xC618;
  Color05.Color           = 0xFFFF;
  Color05.PressColEnabled = 0;
  Color05.Press_Color     = 0xE71C;
  Color05.OnUpPtr         = 0;
  Color05.OnDownPtr       = 0;
  Color05.OnClickPtr      = 0;
  Color05.OnPressPtr      = Color05OnPress;

  Color06.OwnerScreen     = &Paint;
  Color06.Order           = 16;
  Color06.Left            = 156;
  Color06.Top             = 0;
  Color06.Width           = 12;
  Color06.Height          = 31;
  Color06.Pen_Width       = 1;
  Color06.Pen_Color       = 0xFF5B;
  Color06.Visible         = 1;
  Color06.Active          = 1;
  Color06.Transparent     = 1;
  Color06.Gradient        = 0;
  Color06.Gradient_Orientation = 0;
  Color06.Gradient_Start_Color = 0xFFFF;
  Color06.Gradient_End_Color = 0xC618;
  Color06.Color           = 0xFF5B;
  Color06.PressColEnabled = 0;
  Color06.Press_Color     = 0xE71C;
  Color06.OnUpPtr         = 0;
  Color06.OnDownPtr       = 0;
  Color06.OnClickPtr      = 0;
  Color06.OnPressPtr      = Color06OnPress;

  Color07.OwnerScreen     = &Paint;
  Color07.Order           = 17;
  Color07.Left            = 169;
  Color07.Top             = 0;
  Color07.Width           = 12;
  Color07.Height          = 31;
  Color07.Pen_Width       = 1;
  Color07.Pen_Color       = 0xFE53;
  Color07.Visible         = 1;
  Color07.Active          = 1;
  Color07.Transparent     = 1;
  Color07.Gradient        = 0;
  Color07.Gradient_Orientation = 0;
  Color07.Gradient_Start_Color = 0xFFFF;
  Color07.Gradient_End_Color = 0xC618;
  Color07.Color           = 0xFE53;
  Color07.PressColEnabled = 0;
  Color07.Press_Color     = 0xE71C;
  Color07.OnUpPtr         = 0;
  Color07.OnDownPtr       = 0;
  Color07.OnClickPtr      = 0;
  Color07.OnPressPtr      = Color07OnPress;

  Color08.OwnerScreen     = &Paint;
  Color08.Order           = 18;
  Color08.Left            = 182;
  Color08.Top             = 0;
  Color08.Width           = 12;
  Color08.Height          = 31;
  Color08.Pen_Width       = 1;
  Color08.Pen_Color       = 0x9B26;
  Color08.Visible         = 1;
  Color08.Active          = 1;
  Color08.Transparent     = 1;
  Color08.Gradient        = 0;
  Color08.Gradient_Orientation = 0;
  Color08.Gradient_Start_Color = 0xFFFF;
  Color08.Gradient_End_Color = 0xC618;
  Color08.Color           = 0x9B26;
  Color08.PressColEnabled = 0;
  Color08.Press_Color     = 0xE71C;
  Color08.OnUpPtr         = 0;
  Color08.OnDownPtr       = 0;
  Color08.OnClickPtr      = 0;
  Color08.OnPressPtr      = Color08OnPress;

  Color09.OwnerScreen     = &Paint;
  Color09.Order           = 19;
  Color09.Left            = 195;
  Color09.Top             = 0;
  Color09.Width           = 12;
  Color09.Height          = 31;
  Color09.Pen_Width       = 1;
  Color09.Pen_Color       = 0x61A0;
  Color09.Visible         = 1;
  Color09.Active          = 1;
  Color09.Transparent     = 1;
  Color09.Gradient        = 0;
  Color09.Gradient_Orientation = 0;
  Color09.Gradient_Start_Color = 0xFFFF;
  Color09.Gradient_End_Color = 0xC618;
  Color09.Color           = 0x61A0;
  Color09.PressColEnabled = 0;
  Color09.Press_Color     = 0xE71C;
  Color09.OnUpPtr         = 0;
  Color09.OnDownPtr       = 0;
  Color09.OnClickPtr      = 0;
  Color09.OnPressPtr      = Color09OnPress;

  Color10.OwnerScreen     = &Paint;
  Color10.Order           = 20;
  Color10.Left            = 208;
  Color10.Top             = 0;
  Color10.Width           = 12;
  Color10.Height          = 31;
  Color10.Pen_Width       = 1;
  Color10.Pen_Color       = 0x8800;
  Color10.Visible         = 1;
  Color10.Active          = 1;
  Color10.Transparent     = 1;
  Color10.Gradient        = 0;
  Color10.Gradient_Orientation = 0;
  Color10.Gradient_Start_Color = 0xFFFF;
  Color10.Gradient_End_Color = 0xC618;
  Color10.Color           = 0x8800;
  Color10.PressColEnabled = 0;
  Color10.Press_Color     = 0xE71C;
  Color10.OnUpPtr         = 0;
  Color10.OnDownPtr       = 0;
  Color10.OnClickPtr      = 0;
  Color10.OnPressPtr      = Color10OnPress;

  Color11.OwnerScreen     = &Paint;
  Color11.Order           = 21;
  Color11.Left            = 221;
  Color11.Top             = 0;
  Color11.Width           = 12;
  Color11.Height          = 31;
  Color11.Pen_Width       = 1;
  Color11.Pen_Color       = 0xF800;
  Color11.Visible         = 1;
  Color11.Active          = 1;
  Color11.Transparent     = 1;
  Color11.Gradient        = 0;
  Color11.Gradient_Orientation = 0;
  Color11.Gradient_Start_Color = 0xFFFF;
  Color11.Gradient_End_Color = 0xC618;
  Color11.Color           = 0xF800;
  Color11.PressColEnabled = 0;
  Color11.Press_Color     = 0xE71C;
  Color11.OnUpPtr         = 0;
  Color11.OnDownPtr       = 0;
  Color11.OnClickPtr      = 0;
  Color11.OnPressPtr      = Color11OnPress;

  Color12.OwnerScreen     = &Paint;
  Color12.Order           = 22;
  Color12.Left            = 234;
  Color12.Top             = 0;
  Color12.Width           = 12;
  Color12.Height          = 31;
  Color12.Pen_Width       = 1;
  Color12.Pen_Color       = 0xFB20;
  Color12.Visible         = 1;
  Color12.Active          = 1;
  Color12.Transparent     = 1;
  Color12.Gradient        = 0;
  Color12.Gradient_Orientation = 0;
  Color12.Gradient_Start_Color = 0xFFFF;
  Color12.Gradient_End_Color = 0xC618;
  Color12.Color           = 0xFB20;
  Color12.PressColEnabled = 0;
  Color12.Press_Color     = 0xE71C;
  Color12.OnUpPtr         = 0;
  Color12.OnDownPtr       = 0;
  Color12.OnClickPtr      = 0;
  Color12.OnPressPtr      = Color12OnPress;

  Color13.OwnerScreen     = &Paint;
  Color13.Order           = 23;
  Color13.Left            = 247;
  Color13.Top             = 0;
  Color13.Width           = 12;
  Color13.Height          = 31;
  Color13.Pen_Width       = 1;
  Color13.Pen_Color       = 0xFDC0;
  Color13.Visible         = 1;
  Color13.Active          = 1;
  Color13.Transparent     = 1;
  Color13.Gradient        = 0;
  Color13.Gradient_Orientation = 0;
  Color13.Gradient_Start_Color = 0xFFFF;
  Color13.Gradient_End_Color = 0xC618;
  Color13.Color           = 0xFDC0;
  Color13.PressColEnabled = 0;
  Color13.Press_Color     = 0xE71C;
  Color13.OnUpPtr         = 0;
  Color13.OnDownPtr       = 0;
  Color13.OnClickPtr      = 0;
  Color13.OnPressPtr      = Color13OnPress;

  Color14.OwnerScreen     = &Paint;
  Color14.Order           = 24;
  Color14.Left            = 260;
  Color14.Top             = 0;
  Color14.Width           = 12;
  Color14.Height          = 31;
  Color14.Pen_Width       = 1;
  Color14.Pen_Color       = 0xFEA4;
  Color14.Visible         = 1;
  Color14.Active          = 1;
  Color14.Transparent     = 1;
  Color14.Gradient        = 0;
  Color14.Gradient_Orientation = 0;
  Color14.Gradient_Start_Color = 0xFFFF;
  Color14.Gradient_End_Color = 0xC618;
  Color14.Color           = 0xFEA4;
  Color14.PressColEnabled = 0;
  Color14.Press_Color     = 0xE71C;
  Color14.OnUpPtr         = 0;
  Color14.OnDownPtr       = 0;
  Color14.OnClickPtr      = 0;
  Color14.OnPressPtr      = Color14OnPress;

  Color15.OwnerScreen     = &Paint;
  Color15.Order           = 25;
  Color15.Left            = 273;
  Color15.Top             = 0;
  Color15.Width           = 12;
  Color15.Height          = 31;
  Color15.Pen_Width       = 1;
  Color15.Pen_Color       = 0xFFE0;
  Color15.Visible         = 1;
  Color15.Active          = 1;
  Color15.Transparent     = 1;
  Color15.Gradient        = 0;
  Color15.Gradient_Orientation = 0;
  Color15.Gradient_Start_Color = 0xFFFF;
  Color15.Gradient_End_Color = 0xC618;
  Color15.Color           = 0xFFE0;
  Color15.PressColEnabled = 0;
  Color15.Press_Color     = 0xE71C;
  Color15.OnUpPtr         = 0;
  Color15.OnDownPtr       = 0;
  Color15.OnClickPtr      = 0;
  Color15.OnPressPtr      = Color15OnPress;

  Color16.OwnerScreen     = &Paint;
  Color16.Order           = 26;
  Color16.Left            = 286;
  Color16.Top             = 0;
  Color16.Width           = 12;
  Color16.Height          = 31;
  Color16.Pen_Width       = 1;
  Color16.Pen_Color       = 0xFFF3;
  Color16.Visible         = 1;
  Color16.Active          = 1;
  Color16.Transparent     = 1;
  Color16.Gradient        = 0;
  Color16.Gradient_Orientation = 0;
  Color16.Gradient_Start_Color = 0xFFFF;
  Color16.Gradient_End_Color = 0xC618;
  Color16.Color           = 0xFFF3;
  Color16.PressColEnabled = 0;
  Color16.Press_Color     = 0xE71C;
  Color16.OnUpPtr         = 0;
  Color16.OnDownPtr       = 0;
  Color16.OnClickPtr      = 0;
  Color16.OnPressPtr      = Color16OnPress;

  Color17.OwnerScreen     = &Paint;
  Color17.Order           = 27;
  Color17.Left            = 299;
  Color17.Top             = 0;
  Color17.Width           = 12;
  Color17.Height          = 31;
  Color17.Pen_Width       = 1;
  Color17.Pen_Color       = 0xCFED;
  Color17.Visible         = 1;
  Color17.Active          = 1;
  Color17.Transparent     = 1;
  Color17.Gradient        = 0;
  Color17.Gradient_Orientation = 0;
  Color17.Gradient_Start_Color = 0xFFFF;
  Color17.Gradient_End_Color = 0xC618;
  Color17.Color           = 0xCFED;
  Color17.PressColEnabled = 0;
  Color17.Press_Color     = 0xE71C;
  Color17.OnUpPtr         = 0;
  Color17.OnDownPtr       = 0;
  Color17.OnClickPtr      = 0;
  Color17.OnPressPtr      = Color17OnPress;

  Color18.OwnerScreen     = &Paint;
  Color18.Order           = 28;
  Color18.Left            = 312;
  Color18.Top             = 0;
  Color18.Width           = 12;
  Color18.Height          = 31;
  Color18.Pen_Width       = 1;
  Color18.Pen_Color       = 0x97F3;
  Color18.Visible         = 1;
  Color18.Active          = 1;
  Color18.Transparent     = 1;
  Color18.Gradient        = 0;
  Color18.Gradient_Orientation = 0;
  Color18.Gradient_Start_Color = 0xFFFF;
  Color18.Gradient_End_Color = 0xC618;
  Color18.Color           = 0x97F3;
  Color18.PressColEnabled = 0;
  Color18.Press_Color     = 0xE71C;
  Color18.OnUpPtr         = 0;
  Color18.OnDownPtr       = 0;
  Color18.OnClickPtr      = 0;
  Color18.OnPressPtr      = Color18OnPress;

  Color19.OwnerScreen     = &Paint;
  Color19.Order           = 29;
  Color19.Left            = 325;
  Color19.Top             = 0;
  Color19.Width           = 12;
  Color19.Height          = 31;
  Color19.Pen_Width       = 1;
  Color19.Pen_Color       = 0x0E21;
  Color19.Visible         = 1;
  Color19.Active          = 1;
  Color19.Transparent     = 1;
  Color19.Gradient        = 0;
  Color19.Gradient_Orientation = 0;
  Color19.Gradient_Start_Color = 0xFFFF;
  Color19.Gradient_End_Color = 0xC618;
  Color19.Color           = 0x0E21;
  Color19.PressColEnabled = 0;
  Color19.Press_Color     = 0xE71C;
  Color19.OnUpPtr         = 0;
  Color19.OnDownPtr       = 0;
  Color19.OnClickPtr      = 0;
  Color19.OnPressPtr      = Color19OnPress;

  Color20.OwnerScreen     = &Paint;
  Color20.Order           = 30;
  Color20.Left            = 338;
  Color20.Top             = 0;
  Color20.Width           = 12;
  Color20.Height          = 31;
  Color20.Pen_Width       = 1;
  Color20.Pen_Color       = 0x0400;
  Color20.Visible         = 1;
  Color20.Active          = 1;
  Color20.Transparent     = 1;
  Color20.Gradient        = 0;
  Color20.Gradient_Orientation = 0;
  Color20.Gradient_Start_Color = 0xFFFF;
  Color20.Gradient_End_Color = 0xC618;
  Color20.Color           = 0x0400;
  Color20.PressColEnabled = 0;
  Color20.Press_Color     = 0xE71C;
  Color20.OnUpPtr         = 0;
  Color20.OnDownPtr       = 0;
  Color20.OnClickPtr      = 0;
  Color20.OnPressPtr      = Color20OnPress;

  Color21.OwnerScreen     = &Paint;
  Color21.Order           = 31;
  Color21.Left            = 351;
  Color21.Top             = 0;
  Color21.Width           = 12;
  Color21.Height          = 31;
  Color21.Pen_Width       = 1;
  Color21.Pen_Color       = 0x2CEB;
  Color21.Visible         = 1;
  Color21.Active          = 1;
  Color21.Transparent     = 1;
  Color21.Gradient        = 0;
  Color21.Gradient_Orientation = 0;
  Color21.Gradient_Start_Color = 0xFFFF;
  Color21.Gradient_End_Color = 0xC618;
  Color21.Color           = 0x2CEB;
  Color21.PressColEnabled = 0;
  Color21.Press_Color     = 0xE71C;
  Color21.OnUpPtr         = 0;
  Color21.OnDownPtr       = 0;
  Color21.OnClickPtr      = 0;
  Color21.OnPressPtr      = Color21OnPress;

  Color22.OwnerScreen     = &Paint;
  Color22.Order           = 32;
  Color22.Left            = 364;
  Color22.Top             = 0;
  Color22.Width           = 12;
  Color22.Height          = 31;
  Color22.Pen_Width       = 1;
  Color22.Pen_Color       = 0x059E;
  Color22.Visible         = 1;
  Color22.Active          = 1;
  Color22.Transparent     = 1;
  Color22.Gradient        = 0;
  Color22.Gradient_Orientation = 0;
  Color22.Gradient_Start_Color = 0xFFFF;
  Color22.Gradient_End_Color = 0xC618;
  Color22.Color           = 0x059E;
  Color22.PressColEnabled = 0;
  Color22.Press_Color     = 0xE71C;
  Color22.OnUpPtr         = 0;
  Color22.OnDownPtr       = 0;
  Color22.OnClickPtr      = 0;
  Color22.OnPressPtr      = Color22OnPress;

  Color23.OwnerScreen     = &Paint;
  Color23.Order           = 33;
  Color23.Left            = 377;
  Color23.Top             = 0;
  Color23.Width           = 12;
  Color23.Height          = 31;
  Color23.Pen_Width       = 1;
  Color23.Pen_Color       = 0x001F;
  Color23.Visible         = 1;
  Color23.Active          = 1;
  Color23.Transparent     = 1;
  Color23.Gradient        = 0;
  Color23.Gradient_Orientation = 0;
  Color23.Gradient_Start_Color = 0xFFFF;
  Color23.Gradient_End_Color = 0xC618;
  Color23.Color           = 0x001F;
  Color23.PressColEnabled = 0;
  Color23.Press_Color     = 0xE71C;
  Color23.OnUpPtr         = 0;
  Color23.OnDownPtr       = 0;
  Color23.OnClickPtr      = 0;
  Color23.OnPressPtr      = Color23OnPress;

  Color24.OwnerScreen     = &Paint;
  Color24.Order           = 34;
  Color24.Left            = 390;
  Color24.Top             = 0;
  Color24.Width           = 12;
  Color24.Height          = 31;
  Color24.Pen_Width       = 1;
  Color24.Pen_Color       = 0x0013;
  Color24.Visible         = 1;
  Color24.Active          = 1;
  Color24.Transparent     = 1;
  Color24.Gradient        = 0;
  Color24.Gradient_Orientation = 0;
  Color24.Gradient_Start_Color = 0xFFFF;
  Color24.Gradient_End_Color = 0xC618;
  Color24.Color           = 0x0013;
  Color24.PressColEnabled = 0;
  Color24.Press_Color     = 0xE71C;
  Color24.OnUpPtr         = 0;
  Color24.OnDownPtr       = 0;
  Color24.OnClickPtr      = 0;
  Color24.OnPressPtr      = Color24OnPress;

  Color25.OwnerScreen     = &Paint;
  Color25.Order           = 35;
  Color25.Left            = 403;
  Color25.Top             = 0;
  Color25.Width           = 12;
  Color25.Height          = 31;
  Color25.Pen_Width       = 1;
  Color25.Pen_Color       = 0x5013;
  Color25.Visible         = 1;
  Color25.Active          = 1;
  Color25.Transparent     = 1;
  Color25.Gradient        = 0;
  Color25.Gradient_Orientation = 0;
  Color25.Gradient_Start_Color = 0xFFFF;
  Color25.Gradient_End_Color = 0xC618;
  Color25.Color           = 0x5013;
  Color25.PressColEnabled = 0;
  Color25.Press_Color     = 0xE71C;
  Color25.OnUpPtr         = 0;
  Color25.OnDownPtr       = 0;
  Color25.OnClickPtr      = 0;
  Color25.OnPressPtr      = Color25OnPress;

  Color26.OwnerScreen     = &Paint;
  Color26.Order           = 36;
  Color26.Left            = 416;
  Color26.Top             = 0;
  Color26.Width           = 12;
  Color26.Height          = 31;
  Color26.Pen_Width       = 1;
  Color26.Pen_Color       = 0x7194;
  Color26.Visible         = 1;
  Color26.Active          = 1;
  Color26.Transparent     = 1;
  Color26.Gradient        = 0;
  Color26.Gradient_Orientation = 0;
  Color26.Gradient_Start_Color = 0xFFFF;
  Color26.Gradient_End_Color = 0xC618;
  Color26.Color           = 0x7194;
  Color26.PressColEnabled = 0;
  Color26.Press_Color     = 0xE71C;
  Color26.OnUpPtr         = 0;
  Color26.OnDownPtr       = 0;
  Color26.OnClickPtr      = 0;
  Color26.OnPressPtr      = Color26OnPress;

  Color27.OwnerScreen     = &Paint;
  Color27.Order           = 37;
  Color27.Left            = 428;
  Color27.Top             = 0;
  Color27.Width           = 12;
  Color27.Height          = 31;
  Color27.Pen_Width       = 1;
  Color27.Pen_Color       = 0x935F;
  Color27.Visible         = 1;
  Color27.Active          = 1;
  Color27.Transparent     = 1;
  Color27.Gradient        = 0;
  Color27.Gradient_Orientation = 0;
  Color27.Gradient_Start_Color = 0xFFFF;
  Color27.Gradient_End_Color = 0xC618;
  Color27.Color           = 0x935F;
  Color27.PressColEnabled = 0;
  Color27.Press_Color     = 0xE71C;
  Color27.OnUpPtr         = 0;
  Color27.OnDownPtr       = 0;
  Color27.OnClickPtr      = 0;
  Color27.OnPressPtr      = Color27OnPress;

  Color28.OwnerScreen     = &Paint;
  Color28.Order           = 38;
  Color28.Left            = 441;
  Color28.Top             = 0;
  Color28.Width           = 12;
  Color28.Height          = 31;
  Color28.Pen_Width       = 1;
  Color28.Pen_Color       = 0xFCDF;
  Color28.Visible         = 1;
  Color28.Active          = 1;
  Color28.Transparent     = 1;
  Color28.Gradient        = 0;
  Color28.Gradient_Orientation = 0;
  Color28.Gradient_Start_Color = 0xFFFF;
  Color28.Gradient_End_Color = 0xC618;
  Color28.Color           = 0xFCDF;
  Color28.PressColEnabled = 0;
  Color28.Press_Color     = 0xE71C;
  Color28.OnUpPtr         = 0;
  Color28.OnDownPtr       = 0;
  Color28.OnClickPtr      = 0;
  Color28.OnPressPtr      = Color28OnPress;

  Color29.OwnerScreen     = &Paint;
  Color29.Order           = 39;
  Color29.Left            = 454;
  Color29.Top             = 0;
  Color29.Width           = 12;
  Color29.Height          = 31;
  Color29.Pen_Width       = 1;
  Color29.Pen_Color       = 0xF992;
  Color29.Visible         = 1;
  Color29.Active          = 1;
  Color29.Transparent     = 1;
  Color29.Gradient        = 0;
  Color29.Gradient_Orientation = 0;
  Color29.Gradient_Start_Color = 0xFFFF;
  Color29.Gradient_End_Color = 0xC618;
  Color29.Color           = 0xF992;
  Color29.PressColEnabled = 0;
  Color29.Press_Color     = 0xE71C;
  Color29.OnUpPtr         = 0;
  Color29.OnDownPtr       = 0;
  Color29.OnClickPtr      = 0;
  Color29.OnPressPtr      = Color29OnPress;

  Color30.OwnerScreen     = &Paint;
  Color30.Order           = 40;
  Color30.Left            = 467;
  Color30.Top             = 0;
  Color30.Width           = 12;
  Color30.Height          = 31;
  Color30.Pen_Width       = 1;
  Color30.Pen_Color       = 0xC813;
  Color30.Visible         = 1;
  Color30.Active          = 1;
  Color30.Transparent     = 1;
  Color30.Gradient        = 0;
  Color30.Gradient_Orientation = 0;
  Color30.Gradient_Start_Color = 0xFFFF;
  Color30.Gradient_End_Color = 0xC618;
  Color30.Color           = 0xC813;
  Color30.PressColEnabled = 0;
  Color30.Press_Color     = 0xE71C;
  Color30.OnUpPtr         = 0;
  Color30.OnDownPtr       = 0;
  Color30.OnClickPtr      = 0;
  Color30.OnPressPtr      = Color30OnPress;

  BackGroundColor.OwnerScreen     = &Paint;
  BackGroundColor.Order           = 41;
  BackGroundColor.Left            = 0;
  BackGroundColor.Top             = 166;
  BackGroundColor.Width           = 32;
  BackGroundColor.Height          = 32;
  BackGroundColor.Picture_Type    = 0;
  BackGroundColor.Picture_Ratio   = 1;
  BackGroundColor.Picture_Name    = icon_fill_back_bmp;
  BackGroundColor.Visible         = 1;
  BackGroundColor.Active          = 1;
  BackGroundColor.OnUpPtr         = 0;
  BackGroundColor.OnDownPtr       = 0;
  BackGroundColor.OnClickPtr      = 0;
  BackGroundColor.OnPressPtr      = BackGroundColorOnPress;

  Pen1.OwnerScreen     = &Paint;
  Pen1.Order           = 42;
  Pen1.Left            = 6;
  Pen1.Top             = 212;
  Pen1.Width           = 19;
  Pen1.Height          = 5;
  Pen1.Pen_Width       = 1;
  Pen1.Pen_Color       = 0xFFFF;
  Pen1.Visible         = 1;
  Pen1.Active          = 1;
  Pen1.Transparent     = 1;
  Pen1.Gradient        = 0;
  Pen1.Gradient_Orientation = 0;
  Pen1.Gradient_Start_Color = 0xFFFF;
  Pen1.Gradient_End_Color = 0xC618;
  Pen1.Color           = 0xFFFF;
  Pen1.PressColEnabled = 0;
  Pen1.Press_Color     = 0xE71C;
  Pen1.OnUpPtr         = 0;
  Pen1.OnDownPtr       = 0;
  Pen1.OnClickPtr      = 0;
  Pen1.OnPressPtr      = Pen1OnPress;

  Pen2.OwnerScreen     = &Paint;
  Pen2.Order           = 43;
  Pen2.Left            = 6;
  Pen2.Top             = 229;
  Pen2.Width           = 19;
  Pen2.Height          = 6;
  Pen2.Pen_Width       = 1;
  Pen2.Pen_Color       = 0xFFFF;
  Pen2.Visible         = 1;
  Pen2.Active          = 1;
  Pen2.Transparent     = 1;
  Pen2.Gradient        = 0;
  Pen2.Gradient_Orientation = 0;
  Pen2.Gradient_Start_Color = 0xFFFF;
  Pen2.Gradient_End_Color = 0xC618;
  Pen2.Color           = 0xFFFF;
  Pen2.PressColEnabled = 0;
  Pen2.Press_Color     = 0xE71C;
  Pen2.OnUpPtr         = 0;
  Pen2.OnDownPtr       = 0;
  Pen2.OnClickPtr      = 0;
  Pen2.OnPressPtr      = Pen2OnPress;

  Pen3.OwnerScreen     = &Paint;
  Pen3.Order           = 44;
  Pen3.Left            = 6;
  Pen3.Top             = 248;
  Pen3.Width           = 19;
  Pen3.Height          = 8;
  Pen3.Pen_Width       = 1;
  Pen3.Pen_Color       = 0xFFFF;
  Pen3.Visible         = 1;
  Pen3.Active          = 1;
  Pen3.Transparent     = 1;
  Pen3.Gradient        = 0;
  Pen3.Gradient_Orientation = 0;
  Pen3.Gradient_Start_Color = 0xFFFF;
  Pen3.Gradient_End_Color = 0xC618;
  Pen3.Color           = 0xFFFF;
  Pen3.PressColEnabled = 0;
  Pen3.Press_Color     = 0xE71C;
  Pen3.OnUpPtr         = 0;
  Pen3.OnDownPtr       = 0;
  Pen3.OnClickPtr      = 0;
  Pen3.OnPressPtr      = Pen3OnPress;

  Box7.OwnerScreen     = &SlideShow;
  Box7.Order           = 0;
  Box7.Left            = 0;
  Box7.Top             = 0;
  Box7.Width           = 140;
  Box7.Height          = 30;
  Box7.Pen_Width       = 1;
  Box7.Pen_Color       = 0x0000;
  Box7.Visible         = 0;
  Box7.Active          = 1;
  Box7.Transparent     = 1;
  Box7.Gradient        = 0;
  Box7.Gradient_Orientation = 0;
  Box7.Gradient_Start_Color = 0xFFFF;
  Box7.Gradient_End_Color = 0xC618;
  Box7.Color           = 0xC618;
  Box7.PressColEnabled = 0;
  Box7.Press_Color     = 0xE71C;
  Box7.OnUpPtr         = 0;
  Box7.OnDownPtr       = Box7OnDown;
  Box7.OnClickPtr      = 0;
  Box7.OnPressPtr      = 0;

  icon_previous_box.OwnerScreen     = &SlideShow;
  icon_previous_box.Order           = 1;
  icon_previous_box.Left            = 244;
  icon_previous_box.Top             = 244;
  icon_previous_box.Width           = 30;
  icon_previous_box.Height          = 23;
  icon_previous_box.Pen_Width       = 1;
  icon_previous_box.Pen_Color       = 0x0000;
  icon_previous_box.Visible         = 0;
  icon_previous_box.Active          = 1;
  icon_previous_box.Transparent     = 1;
  icon_previous_box.Gradient        = 0;
  icon_previous_box.Gradient_Orientation = 0;
  icon_previous_box.Gradient_Start_Color = 0xFFFF;
  icon_previous_box.Gradient_End_Color = 0xC618;
  icon_previous_box.Color           = 0xC618;
  icon_previous_box.PressColEnabled = 0;
  icon_previous_box.Press_Color     = 0xE71C;
  icon_previous_box.OnUpPtr         = 0;
  icon_previous_box.OnDownPtr       = 0;
  icon_previous_box.OnClickPtr      = 0;
  icon_previous_box.OnPressPtr      = icon_previous_boxOnPress;

  Icon_next_box.OwnerScreen     = &SlideShow;
  Icon_next_box.Order           = 2;
  Icon_next_box.Left            = 206;
  Icon_next_box.Top             = 244;
  Icon_next_box.Width           = 30;
  Icon_next_box.Height          = 23;
  Icon_next_box.Pen_Width       = 1;
  Icon_next_box.Pen_Color       = 0x0000;
  Icon_next_box.Visible         = 0;
  Icon_next_box.Active          = 1;
  Icon_next_box.Transparent     = 1;
  Icon_next_box.Gradient        = 0;
  Icon_next_box.Gradient_Orientation = 0;
  Icon_next_box.Gradient_Start_Color = 0xFFFF;
  Icon_next_box.Gradient_End_Color = 0xC618;
  Icon_next_box.Color           = 0xC618;
  Icon_next_box.PressColEnabled = 0;
  Icon_next_box.Press_Color     = 0xE71C;
  Icon_next_box.OnUpPtr         = 0;
  Icon_next_box.OnDownPtr       = 0;
  Icon_next_box.OnClickPtr      = 0;
  Icon_next_box.OnPressPtr      = Icon_next_boxOnPress;

  Label31.OwnerScreen     = &SlideShow;
  Label31.Order           = 3;
  Label31.Left            = 32;
  Label31.Top             = 2;
  Label31.Width           = 105;
  Label31.Height          = 31;
  Label31.Visible         = 1;
  Label31.Active          = 0;
  Label31.Caption         = Label31_Caption;
  Label31.FontName        = Open_Sans_Light19x28_Regular;
  Label31.Font_Color      = 0xFFFF;
  Label31.OnUpPtr         = 0;
  Label31.OnDownPtr       = 0;
  Label31.OnClickPtr      = 0;
  Label31.OnPressPtr      = 0;

  back_slide_show.OwnerScreen     = &SlideShow;
  back_slide_show.Order           = 4;
  back_slide_show.Left            = 5;
  back_slide_show.Top             = 6;
  back_slide_show.Width           = 22;
  back_slide_show.Height          = 22;
  back_slide_show.Picture_Type    = 0;
  back_slide_show.Picture_Ratio   = 1;
  back_slide_show.Picture_Name    = icon_back_slideshow_bmp;
  back_slide_show.Visible         = 1;
  back_slide_show.Active          = 0;
  back_slide_show.OnUpPtr         = 0;
  back_slide_show.OnDownPtr       = 0;
  back_slide_show.OnClickPtr      = 0;
  back_slide_show.OnPressPtr      = 0;

  Label32.OwnerScreen     = &SlideShow;
  Label32.Order           = 5;
  Label32.Left            = 9;
  Label32.Top             = 249;
  Label32.Width           = 106;
  Label32.Height          = 24;
  Label32.Visible         = 1;
  Label32.Active          = 1;
  Label32.Caption         = Label32_Caption;
  Label32.FontName        = Open_Sans_Light14x22_Regular;
  Label32.Font_Color      = 0xFFFF;
  Label32.OnUpPtr         = 0;
  Label32.OnDownPtr       = 0;
  Label32.OnClickPtr      = 0;
  Label32.OnPressPtr      = 0;

  Label33.OwnerScreen     = &SlideShow;
  Label33.Order           = 6;
  Label33.Left            = 432;
  Label33.Top             = 249;
  Label33.Width           = 28;
  Label33.Height          = 24;
  Label33.Visible         = 1;
  Label33.Active          = 1;
  Label33.Caption         = Label33_Caption;
  Label33.FontName        = Open_Sans_Light14x22_Regular;
  Label33.Font_Color      = 0xFFFF;
  Label33.OnUpPtr         = 0;
  Label33.OnDownPtr       = 0;
  Label33.OnClickPtr      = 0;
  Label33.OnPressPtr      = 0;

  icon_previous.OwnerScreen     = &SlideShow;
  icon_previous.Order           = 7;
  icon_previous.Left            = 248;
  icon_previous.Top             = 253;
  icon_previous.Width           = 16;
  icon_previous.Height          = 12;
  icon_previous.Picture_Type    = 0;
  icon_previous.Picture_Ratio   = 1;
  icon_previous.Picture_Name    = icon_prev_slide_bmp;
  icon_previous.Visible         = 1;
  icon_previous.Active          = 0;
  icon_previous.OnUpPtr         = 0;
  icon_previous.OnDownPtr       = 0;
  icon_previous.OnClickPtr      = 0;
  icon_previous.OnPressPtr      = 0;

  Icon_next.OwnerScreen     = &SlideShow;
  Icon_next.Order           = 8;
  Icon_next.Left            = 216;
  Icon_next.Top             = 253;
  Icon_next.Width           = 16;
  Icon_next.Height          = 12;
  Icon_next.Picture_Type    = 0;
  Icon_next.Picture_Ratio   = 1;
  Icon_next.Picture_Name    = icon_next_slide_bmp;
  Icon_next.Visible         = 1;
  Icon_next.Active          = 0;
  Icon_next.OnUpPtr         = 0;
  Icon_next.OnDownPtr       = 0;
  Icon_next.OnClickPtr      = 0;
  Icon_next.OnPressPtr      = 0;

  Label35.OwnerScreen     = &SlideShow;
  Label35.Order           = 9;
  Label35.Left            = 410;
  Label35.Top             = 249;
  Label35.Width           = 0;
  Label35.Height          = 24;
  Label35.Visible         = 1;
  Label35.Active          = 1;
  Label35.Caption         = Label35_Caption;
  Label35.FontName        = Open_Sans_Light14x22_Regular;
  Label35.Font_Color      = 0xFFFF;
  Label35.OnUpPtr         = 0;
  Label35.OnDownPtr       = 0;
  Label35.OnClickPtr      = 0;
  Label35.OnPressPtr      = 0;

  Slide_Active_area.OwnerScreen     = &SlideShow;
  Slide_Active_area.Order           = 10;
  Slide_Active_area.Left            = 0;
  Slide_Active_area.Top             = 38;
  Slide_Active_area.Width           = 480;
  Slide_Active_area.Height          = 209;
  Slide_Active_area.Pen_Width       = 1;
  Slide_Active_area.Pen_Color       = 0x0000;
  Slide_Active_area.Visible         = 0;
  Slide_Active_area.Active          = 1;
  Slide_Active_area.Transparent     = 1;
  Slide_Active_area.Gradient        = 0;
  Slide_Active_area.Gradient_Orientation = 0;
  Slide_Active_area.Gradient_Start_Color = 0xFFFF;
  Slide_Active_area.Gradient_End_Color = 0xC618;
  Slide_Active_area.Color           = 0xC618;
  Slide_Active_area.PressColEnabled = 0;
  Slide_Active_area.Press_Color     = 0xE71C;
  Slide_Active_area.OnUpPtr         = 0;
  Slide_Active_area.OnDownPtr       = 0;
  Slide_Active_area.OnClickPtr      = 0;
  Slide_Active_area.OnPressPtr      = Slide_Active_areaOnPress;

  Box10.OwnerScreen     = &Tic_Tac_Toe;
  Box10.Order           = 0;
  Box10.Left            = 48;
  Box10.Top             = 193;
  Box10.Width           = 97;
  Box10.Height          = 21;
  Box10.Pen_Width       = 1;
  Box10.Pen_Color       = 0x0000;
  Box10.Visible         = 0;
  Box10.Active          = 1;
  Box10.Transparent     = 1;
  Box10.Gradient        = 0;
  Box10.Gradient_Orientation = 0;
  Box10.Gradient_Start_Color = 0xFFFF;
  Box10.Gradient_End_Color = 0xC618;
  Box10.Color           = 0xC618;
  Box10.PressColEnabled = 0;
  Box10.Press_Color     = 0xE71C;
  Box10.OnUpPtr         = 0;
  Box10.OnDownPtr       = 0;
  Box10.OnClickPtr      = Box10OnClick;
  Box10.OnPressPtr      = 0;

  Box11.OwnerScreen     = &Tic_Tac_Toe;
  Box11.Order           = 1;
  Box11.Left            = 27;
  Box11.Top             = 224;
  Box11.Width           = 109;
  Box11.Height          = 26;
  Box11.Pen_Width       = 1;
  Box11.Pen_Color       = 0x0000;
  Box11.Visible         = 0;
  Box11.Active          = 1;
  Box11.Transparent     = 1;
  Box11.Gradient        = 0;
  Box11.Gradient_Orientation = 0;
  Box11.Gradient_Start_Color = 0xFFFF;
  Box11.Gradient_End_Color = 0xC618;
  Box11.Color           = 0xC618;
  Box11.PressColEnabled = 0;
  Box11.Press_Color     = 0xE71C;
  Box11.OnUpPtr         = 0;
  Box11.OnDownPtr       = 0;
  Box11.OnClickPtr      = 0;
  Box11.OnPressPtr      = Box11OnPress;

  Box9.OwnerScreen     = &Tic_Tac_Toe;
  Box9.Order           = 2;
  Box9.Left            = 0;
  Box9.Top             = 0;
  Box9.Width           = 206;
  Box9.Height          = 32;
  Box9.Pen_Width       = 1;
  Box9.Pen_Color       = 0x0000;
  Box9.Visible         = 0;
  Box9.Active          = 1;
  Box9.Transparent     = 1;
  Box9.Gradient        = 0;
  Box9.Gradient_Orientation = 0;
  Box9.Gradient_Start_Color = 0xFFFF;
  Box9.Gradient_End_Color = 0xC618;
  Box9.Color           = 0xC618;
  Box9.PressColEnabled = 0;
  Box9.Press_Color     = 0xE71C;
  Box9.OnUpPtr         = 0;
  Box9.OnDownPtr       = 0;
  Box9.OnClickPtr      = 0;
  Box9.OnPressPtr      = Box9OnPress;

  Button9.OwnerScreen     = &Tic_Tac_Toe;
  Button9.Order           = 3;
  Button9.Left            = 384;
  Button9.Top             = 176;
  Button9.Width           = 66;
  Button9.Height          = 64;
  Button9.Pen_Width       = 1;
  Button9.Pen_Color       = 0x0000;
  Button9.Visible         = 0;
  Button9.Active          = 1;
  Button9.Transparent     = 1;
  Button9.Caption         = Button9_Caption;
  Button9.TextAlign       = _taCenter;
  Button9.FontName        = Furro_Script52x60_Regular;
  Button9.PressColEnabled = 0;
  Button9.Font_Color      = 0x0000;
  Button9.Gradient        = 0;
  Button9.Gradient_Orientation = 0;
  Button9.Gradient_Start_Color = 0xFFFF;
  Button9.Gradient_End_Color = 0xC618;
  Button9.Color           = 0xC618;
  Button9.Press_Color     = 0xE71C;
  Button9.OnUpPtr         = 0;
  Button9.OnDownPtr       = 0;
  Button9.OnClickPtr      = Button9OnClick;
  Button9.OnPressPtr      = 0;

  Button8.OwnerScreen     = &Tic_Tac_Toe;
  Button8.Order           = 4;
  Button8.Left            = 310;
  Button8.Top             = 178;
  Button8.Width           = 66;
  Button8.Height          = 64;
  Button8.Pen_Width       = 1;
  Button8.Pen_Color       = 0x0000;
  Button8.Visible         = 0;
  Button8.Active          = 1;
  Button8.Transparent     = 1;
  Button8.Caption         = Button8_Caption;
  Button8.TextAlign       = _taCenter;
  Button8.FontName        = Furro_Script52x60_Regular;
  Button8.PressColEnabled = 0;
  Button8.Font_Color      = 0x0000;
  Button8.Gradient        = 0;
  Button8.Gradient_Orientation = 0;
  Button8.Gradient_Start_Color = 0xFFFF;
  Button8.Gradient_End_Color = 0xC618;
  Button8.Color           = 0xC618;
  Button8.Press_Color     = 0xE71C;
  Button8.OnUpPtr         = 0;
  Button8.OnDownPtr       = 0;
  Button8.OnClickPtr      = Button8OnClick;
  Button8.OnPressPtr      = 0;

  Button7.OwnerScreen     = &Tic_Tac_Toe;
  Button7.Order           = 5;
  Button7.Left            = 236;
  Button7.Top             = 183;
  Button7.Width           = 66;
  Button7.Height          = 64;
  Button7.Pen_Width       = 1;
  Button7.Pen_Color       = 0x0000;
  Button7.Visible         = 0;
  Button7.Active          = 1;
  Button7.Transparent     = 1;
  Button7.Caption         = Button7_Caption;
  Button7.TextAlign       = _taCenter;
  Button7.FontName        = Furro_Script52x60_Regular;
  Button7.PressColEnabled = 0;
  Button7.Font_Color      = 0x0000;
  Button7.Gradient        = 0;
  Button7.Gradient_Orientation = 0;
  Button7.Gradient_Start_Color = 0xFFFF;
  Button7.Gradient_End_Color = 0xC618;
  Button7.Color           = 0xC618;
  Button7.Press_Color     = 0xE71C;
  Button7.OnUpPtr         = 0;
  Button7.OnDownPtr       = 0;
  Button7.OnClickPtr      = Button7OnClick;
  Button7.OnPressPtr      = 0;

  Button6.OwnerScreen     = &Tic_Tac_Toe;
  Button6.Order           = 6;
  Button6.Left            = 382;
  Button6.Top             = 101;
  Button6.Width           = 66;
  Button6.Height          = 64;
  Button6.Pen_Width       = 1;
  Button6.Pen_Color       = 0x0000;
  Button6.Visible         = 0;
  Button6.Active          = 1;
  Button6.Transparent     = 1;
  Button6.Caption         = Button6_Caption;
  Button6.TextAlign       = _taCenter;
  Button6.FontName        = Furro_Script52x60_Regular;
  Button6.PressColEnabled = 0;
  Button6.Font_Color      = 0x0000;
  Button6.Gradient        = 0;
  Button6.Gradient_Orientation = 0;
  Button6.Gradient_Start_Color = 0xFFFF;
  Button6.Gradient_End_Color = 0xC618;
  Button6.Color           = 0xC618;
  Button6.Press_Color     = 0xE71C;
  Button6.OnUpPtr         = 0;
  Button6.OnDownPtr       = 0;
  Button6.OnClickPtr      = Button6OnClick;
  Button6.OnPressPtr      = 0;

  Button5.OwnerScreen     = &Tic_Tac_Toe;
  Button5.Order           = 7;
  Button5.Left            = 306;
  Button5.Top             = 104;
  Button5.Width           = 66;
  Button5.Height          = 64;
  Button5.Pen_Width       = 1;
  Button5.Pen_Color       = 0x0000;
  Button5.Visible         = 0;
  Button5.Active          = 1;
  Button5.Transparent     = 1;
  Button5.Caption         = Button5_Caption;
  Button5.TextAlign       = _taCenter;
  Button5.FontName        = Furro_Script52x60_Regular;
  Button5.PressColEnabled = 0;
  Button5.Font_Color      = 0x0000;
  Button5.Gradient        = 0;
  Button5.Gradient_Orientation = 0;
  Button5.Gradient_Start_Color = 0xFFFF;
  Button5.Gradient_End_Color = 0xC618;
  Button5.Color           = 0xC618;
  Button5.Press_Color     = 0xE71C;
  Button5.OnUpPtr         = 0;
  Button5.OnDownPtr       = 0;
  Button5.OnClickPtr      = Button5OnClick;
  Button5.OnPressPtr      = 0;

  Button4.OwnerScreen     = &Tic_Tac_Toe;
  Button4.Order           = 8;
  Button4.Left            = 232;
  Button4.Top             = 110;
  Button4.Width           = 66;
  Button4.Height          = 64;
  Button4.Pen_Width       = 1;
  Button4.Pen_Color       = 0x0000;
  Button4.Visible         = 0;
  Button4.Active          = 1;
  Button4.Transparent     = 1;
  Button4.Caption         = Button4_Caption;
  Button4.TextAlign       = _taCenter;
  Button4.FontName        = Furro_Script52x60_Regular;
  Button4.PressColEnabled = 0;
  Button4.Font_Color      = 0x0000;
  Button4.Gradient        = 0;
  Button4.Gradient_Orientation = 0;
  Button4.Gradient_Start_Color = 0xFFFF;
  Button4.Gradient_End_Color = 0xC618;
  Button4.Color           = 0xC618;
  Button4.Press_Color     = 0xE71C;
  Button4.OnUpPtr         = 0;
  Button4.OnDownPtr       = 0;
  Button4.OnClickPtr      = Button4OnClick;
  Button4.OnPressPtr      = 0;

  Button3.OwnerScreen     = &Tic_Tac_Toe;
  Button3.Order           = 9;
  Button3.Left            = 379;
  Button3.Top             = 27;
  Button3.Width           = 66;
  Button3.Height          = 64;
  Button3.Pen_Width       = 1;
  Button3.Pen_Color       = 0x0000;
  Button3.Visible         = 0;
  Button3.Active          = 1;
  Button3.Transparent     = 1;
  Button3.Caption         = Button3_Caption;
  Button3.TextAlign       = _taCenter;
  Button3.FontName        = Furro_Script52x60_Regular;
  Button3.PressColEnabled = 0;
  Button3.Font_Color      = 0x0000;
  Button3.Gradient        = 0;
  Button3.Gradient_Orientation = 0;
  Button3.Gradient_Start_Color = 0xFFFF;
  Button3.Gradient_End_Color = 0xC618;
  Button3.Color           = 0xC618;
  Button3.Press_Color     = 0xE71C;
  Button3.OnUpPtr         = 0;
  Button3.OnDownPtr       = 0;
  Button3.OnClickPtr      = Button3OnClick;
  Button3.OnPressPtr      = 0;

  Button2.OwnerScreen     = &Tic_Tac_Toe;
  Button2.Order           = 10;
  Button2.Left            = 302;
  Button2.Top             = 30;
  Button2.Width           = 66;
  Button2.Height          = 64;
  Button2.Pen_Width       = 1;
  Button2.Pen_Color       = 0x0000;
  Button2.Visible         = 0;
  Button2.Active          = 1;
  Button2.Transparent     = 1;
  Button2.Caption         = Button2_Caption;
  Button2.TextAlign       = _taCenter;
  Button2.FontName        = Furro_Script52x60_Regular;
  Button2.PressColEnabled = 0;
  Button2.Font_Color      = 0x0000;
  Button2.Gradient        = 0;
  Button2.Gradient_Orientation = 0;
  Button2.Gradient_Start_Color = 0xFFFF;
  Button2.Gradient_End_Color = 0xC618;
  Button2.Color           = 0xC618;
  Button2.Press_Color     = 0xE71C;
  Button2.OnUpPtr         = 0;
  Button2.OnDownPtr       = 0;
  Button2.OnClickPtr      = Button2OnClick;
  Button2.OnPressPtr      = 0;

  Button1.OwnerScreen     = &Tic_Tac_Toe;
  Button1.Order           = 11;
  Button1.Left            = 228;
  Button1.Top             = 36;
  Button1.Width           = 66;
  Button1.Height          = 64;
  Button1.Pen_Width       = 1;
  Button1.Pen_Color       = 0x0000;
  Button1.Visible         = 0;
  Button1.Active          = 1;
  Button1.Transparent     = 1;
  Button1.Caption         = Button1_Caption;
  Button1.TextAlign       = _taCenter;
  Button1.FontName        = Furro_Script52x60_Regular;
  Button1.PressColEnabled = 0;
  Button1.Font_Color      = 0x0000;
  Button1.Gradient        = 0;
  Button1.Gradient_Orientation = 0;
  Button1.Gradient_Start_Color = 0xFFFF;
  Button1.Gradient_End_Color = 0xC618;
  Button1.Color           = 0xC618;
  Button1.Press_Color     = 0xE71C;
  Button1.OnUpPtr         = 0;
  Button1.OnDownPtr       = 0;
  Button1.OnClickPtr      = Button1OnClick;
  Button1.OnPressPtr      = 0;

  Box8.OwnerScreen     = &Tic_Tac_Toe;
  Box8.Order           = 12;
  Box8.Left            = 32;
  Box8.Top             = 62;
  Box8.Width           = 130;
  Box8.Height          = 102;
  Box8.Pen_Width       = 0;
  Box8.Pen_Color       = 0x0000;
  Box8.Visible         = 1;
  Box8.Active          = 0;
  Box8.Transparent     = 1;
  Box8.Gradient        = 0;
  Box8.Gradient_Orientation = 0;
  Box8.Gradient_Start_Color = 0xFFFF;
  Box8.Gradient_End_Color = 0xC618;
  Box8.Color           = 0x796C;
  Box8.PressColEnabled = 1;
  Box8.Press_Color     = 0xE71C;
  Box8.OnUpPtr         = 0;
  Box8.OnDownPtr       = 0;
  Box8.OnClickPtr      = 0;
  Box8.OnPressPtr      = 0;

  Label36.OwnerScreen     = &Tic_Tac_Toe;
  Label36.Order           = 13;
  Label36.Left            = 32;
  Label36.Top             = 2;
  Label36.Width           = 173;
  Label36.Height          = 31;
  Label36.Visible         = 1;
  Label36.Active          = 0;
  Label36.Caption         = Label36_Caption;
  Label36.FontName        = Open_Sans_Light19x28_Regular;
  Label36.Font_Color      = 0xFFFF;
  Label36.OnUpPtr         = 0;
  Label36.OnDownPtr       = 0;
  Label36.OnClickPtr      = 0;
  Label36.OnPressPtr      = 0;

  Image20.OwnerScreen     = &Tic_Tac_Toe;
  Image20.Order           = 14;
  Image20.Left            = 5;
  Image20.Top             = 6;
  Image20.Width           = 22;
  Image20.Height          = 22;
  Image20.Picture_Type    = 0;
  Image20.Picture_Ratio   = 1;
  Image20.Picture_Name    = icon_back_tictactow_bmp;
  Image20.Visible         = 1;
  Image20.Active          = 0;
  Image20.OnUpPtr         = 0;
  Image20.OnDownPtr       = 0;
  Image20.OnClickPtr      = 0;
  Image20.OnPressPtr      = 0;

  Label37.OwnerScreen     = &Tic_Tac_Toe;
  Label37.Order           = 15;
  Label37.Left            = 50;
  Label37.Top             = 226;
  Label37.Width           = 81;
  Label37.Height          = 24;
  Label37.Visible         = 1;
  Label37.Active          = 0;
  Label37.Caption         = Label37_Caption;
  Label37.FontName        = Open_Sans_Light14x22_Regular;
  Label37.Font_Color      = 0xFFFF;
  Label37.OnUpPtr         = 0;
  Label37.OnDownPtr       = 0;
  Label37.OnClickPtr      = 0;
  Label37.OnPressPtr      = 0;

  Image21.OwnerScreen     = &Tic_Tac_Toe;
  Image21.Order           = 16;
  Image21.Left            = 30;
  Image21.Top             = 229;
  Image21.Width           = 18;
  Image21.Height          = 18;
  Image21.Picture_Type    = 0;
  Image21.Picture_Ratio   = 1;
  Image21.Picture_Name    = icon_new_game_bmp;
  Image21.Visible         = 1;
  Image21.Active          = 0;
  Image21.OnUpPtr         = 0;
  Image21.OnDownPtr       = 0;
  Image21.OnClickPtr      = 0;
  Image21.OnPressPtr      = 0;

  Label38.OwnerScreen     = &Tic_Tac_Toe;
  Label38.Order           = 17;
  Label38.Left            = 40;
  Label38.Top             = 90;
  Label38.Width           = 9;
  Label38.Height          = 44;
  Label38.Visible         = 1;
  Label38.Active          = 1;
  Label38.Caption         = Label38_Caption;
  Label38.FontName        = Furro_Script38x42_Regular;
  Label38.Font_Color      = 0x25A4;
  Label38.OnUpPtr         = 0;
  Label38.OnDownPtr       = 0;
  Label38.OnClickPtr      = 0;
  Label38.OnPressPtr      = 0;

  Label39.OwnerScreen     = &Tic_Tac_Toe;
  Label39.Order           = 18;
  Label39.Left            = 51;
  Label39.Top             = 141;
  Label39.Width           = 86;
  Label39.Height          = 24;
  Label39.Visible         = 1;
  Label39.Active          = 1;
  Label39.Caption         = Label39_Caption;
  Label39.FontName        = Open_Sans_Light14x22_Regular;
  Label39.Font_Color      = 0xFFFF;
  Label39.OnUpPtr         = 0;
  Label39.OnDownPtr       = 0;
  Label39.OnClickPtr      = 0;
  Label39.OnPressPtr      = 0;

  XO1.OwnerScreen     = &Tic_Tac_Toe;
  XO1.Order           = 19;
  XO1.Left            = 238;
  XO1.Top             = 44;
  XO1.Width           = 13;
  XO1.Height          = 64;
  XO1.Visible         = 1;
  XO1.Active          = 1;
  XO1.Caption         = XO1_Caption;
  XO1.FontName        = Furro_Script52x60_Regular;
  XO1.Font_Color      = 0x25A4;
  XO1.OnUpPtr         = 0;
  XO1.OnDownPtr       = 0;
  XO1.OnClickPtr      = 0;
  XO1.OnPressPtr      = 0;

  XO2.OwnerScreen     = &Tic_Tac_Toe;
  XO2.Order           = 20;
  XO2.Left            = 314;
  XO2.Top             = 38;
  XO2.Width           = 13;
  XO2.Height          = 64;
  XO2.Visible         = 1;
  XO2.Active          = 1;
  XO2.Caption         = XO2_Caption;
  XO2.FontName        = Furro_Script52x60_Regular;
  XO2.Font_Color      = 0x25A4;
  XO2.OnUpPtr         = 0;
  XO2.OnDownPtr       = 0;
  XO2.OnClickPtr      = 0;
  XO2.OnPressPtr      = 0;

  XO3.OwnerScreen     = &Tic_Tac_Toe;
  XO3.Order           = 21;
  XO3.Left            = 386;
  XO3.Top             = 32;
  XO3.Width           = 13;
  XO3.Height          = 64;
  XO3.Visible         = 1;
  XO3.Active          = 1;
  XO3.Caption         = XO3_Caption;
  XO3.FontName        = Furro_Script52x60_Regular;
  XO3.Font_Color      = 0x25A4;
  XO3.OnUpPtr         = 0;
  XO3.OnDownPtr       = 0;
  XO3.OnClickPtr      = 0;
  XO3.OnPressPtr      = 0;

  XO4.OwnerScreen     = &Tic_Tac_Toe;
  XO4.Order           = 22;
  XO4.Left            = 241;
  XO4.Top             = 120;
  XO4.Width           = 13;
  XO4.Height          = 64;
  XO4.Visible         = 1;
  XO4.Active          = 1;
  XO4.Caption         = XO4_Caption;
  XO4.FontName        = Furro_Script52x60_Regular;
  XO4.Font_Color      = 0x25A4;
  XO4.OnUpPtr         = 0;
  XO4.OnDownPtr       = 0;
  XO4.OnClickPtr      = 0;
  XO4.OnPressPtr      = 0;

  XO5.OwnerScreen     = &Tic_Tac_Toe;
  XO5.Order           = 23;
  XO5.Left            = 316;
  XO5.Top             = 116;
  XO5.Width           = 13;
  XO5.Height          = 64;
  XO5.Visible         = 1;
  XO5.Active          = 1;
  XO5.Caption         = XO5_Caption;
  XO5.FontName        = Furro_Script52x60_Regular;
  XO5.Font_Color      = 0x25A4;
  XO5.OnUpPtr         = 0;
  XO5.OnDownPtr       = 0;
  XO5.OnClickPtr      = 0;
  XO5.OnPressPtr      = 0;

  XO6.OwnerScreen     = &Tic_Tac_Toe;
  XO6.Order           = 24;
  XO6.Left            = 392;
  XO6.Top             = 109;
  XO6.Width           = 13;
  XO6.Height          = 64;
  XO6.Visible         = 1;
  XO6.Active          = 1;
  XO6.Caption         = XO6_Caption;
  XO6.FontName        = Furro_Script52x60_Regular;
  XO6.Font_Color      = 0x25A4;
  XO6.OnUpPtr         = 0;
  XO6.OnDownPtr       = 0;
  XO6.OnClickPtr      = 0;
  XO6.OnPressPtr      = 0;

  XO7.OwnerScreen     = &Tic_Tac_Toe;
  XO7.Order           = 25;
  XO7.Left            = 244;
  XO7.Top             = 193;
  XO7.Width           = 13;
  XO7.Height          = 64;
  XO7.Visible         = 1;
  XO7.Active          = 1;
  XO7.Caption         = XO7_Caption;
  XO7.FontName        = Furro_Script52x60_Regular;
  XO7.Font_Color      = 0x25A4;
  XO7.OnUpPtr         = 0;
  XO7.OnDownPtr       = 0;
  XO7.OnClickPtr      = 0;
  XO7.OnPressPtr      = 0;

  XO8.OwnerScreen     = &Tic_Tac_Toe;
  XO8.Order           = 26;
  XO8.Left            = 322;
  XO8.Top             = 190;
  XO8.Width           = 13;
  XO8.Height          = 64;
  XO8.Visible         = 1;
  XO8.Active          = 1;
  XO8.Caption         = XO8_Caption;
  XO8.FontName        = Furro_Script52x60_Regular;
  XO8.Font_Color      = 0x25A4;
  XO8.OnUpPtr         = 0;
  XO8.OnDownPtr       = 0;
  XO8.OnClickPtr      = 0;
  XO8.OnPressPtr      = 0;

  XO9.OwnerScreen     = &Tic_Tac_Toe;
  XO9.Order           = 27;
  XO9.Left            = 396;
  XO9.Top             = 186;
  XO9.Width           = 13;
  XO9.Height          = 64;
  XO9.Visible         = 1;
  XO9.Active          = 1;
  XO9.Caption         = XO9_Caption;
  XO9.FontName        = Furro_Script52x60_Regular;
  XO9.Font_Color      = 0x25A4;
  XO9.OnUpPtr         = 0;
  XO9.OnDownPtr       = 0;
  XO9.OnClickPtr      = 0;
  XO9.OnPressPtr      = 0;

  CheckBox1.OwnerScreen     = &Tic_Tac_Toe;
  CheckBox1.Order           = 28;
  CheckBox1.Left            = 30;
  CheckBox1.Top             = 198;
  CheckBox1.Width           = 17;
  CheckBox1.Height          = 13;
  CheckBox1.Pen_Width       = 1;
  CheckBox1.Pen_Color       = 0xFFFF;
  CheckBox1.Visible         = 1;
  CheckBox1.Active          = 1;
  CheckBox1.Checked         = 0;
  CheckBox1.Transparent     = 1;
  CheckBox1.Caption         = CheckBox1_Caption;
  CheckBox1.TextAlign       = _taLeft;
  CheckBox1.FontName        = Open_Sans_Light12x18_Regular;
  CheckBox1.PressColEnabled = 0;
  CheckBox1.Font_Color      = 0xFFFF;
  CheckBox1.Gradient        = 0;
  CheckBox1.Gradient_Orientation = 0;
  CheckBox1.Gradient_Start_Color = 0xFFFF;
  CheckBox1.Gradient_End_Color = 0xC618;
  CheckBox1.Color           = 0xA1AE;
  CheckBox1.Press_Color     = 0xE71C;
  CheckBox1.Rounded         = 0;
  CheckBox1.Corner_Radius   = 1;
  CheckBox1.OnUpPtr         = 0;
  CheckBox1.OnDownPtr       = 0;
  CheckBox1.OnClickPtr      = CheckBox1OnClick;
  CheckBox1.OnPressPtr      = 0;

  Label41.OwnerScreen     = &Tic_Tac_Toe;
  Label41.Order           = 29;
  Label41.Left            = 50;
  Label41.Top             = 193;
  Label41.Width           = 92;
  Label41.Height          = 24;
  Label41.Visible         = 1;
  Label41.Active          = 0;
  Label41.Caption         = Label41_Caption;
  Label41.FontName        = Open_Sans_Light14x22_Regular;
  Label41.Font_Color      = 0xFFFF;
  Label41.OnUpPtr         = 0;
  Label41.OnDownPtr       = 0;
  Label41.OnClickPtr      = 0;
  Label41.OnPressPtr      = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetButton(index)              CurrentScreen->Buttons[index]
#define GetLabel(index)               CurrentScreen->Labels[index]
#define GetImage(index)               CurrentScreen->Images[index]
#define GetCircle(index)              CurrentScreen->Circles[index]
#define GetBox(index)                 CurrentScreen->Boxes[index]
#define GetCheckBox(index)            CurrentScreen->CheckBoxes[index]


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

void DrawLabel(TLabel *ALabel) {
  if (ALabel->Visible == 1) {
    TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
  }
}

void DrawImage(TImage *AImage) {
  if (AImage->Visible) {
    TFT_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
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

void DrawCheckBox(TCheckBox *ACheckBox) {
  if (ACheckBox->Visible == 1) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(ACheckBox->Transparent, ACheckBox->Press_Color, ACheckBox->Gradient, ACheckBox->Gradient_Orientation, ACheckBox->Gradient_End_Color, ACheckBox->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(ACheckBox->Transparent, ACheckBox->Color, ACheckBox->Gradient, ACheckBox->Gradient_Orientation, ACheckBox->Gradient_Start_Color, ACheckBox->Gradient_End_Color);
    }
    TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Pen_Width);
    TFT_Set_Font(ACheckBox->FontName, ACheckBox->Font_Color, FO_HORIZONTAL);
    if (ACheckBox->TextAlign == _taLeft) {
      if (ACheckBox->Rounded == 1)
        TFT_Rectangle_Round_Edges(ACheckBox->Left, ACheckBox->Top, ACheckBox->Left + ACheckBox->Height, ACheckBox->Top + ACheckBox->Height - 1, ACheckBox->Corner_Radius);
      else
        TFT_Rectangle(ACheckBox->Left, ACheckBox->Top, ACheckBox->Left + ACheckBox->Height, ACheckBox->Top + ACheckBox->Height - 1);
      if (ACheckBox->Checked == 1) {
        TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Height / 8);
        TFT_Line(ACheckBox->Left  + ACheckBox->Height / 5 + 1,
                               ACheckBox->Top   + ACheckBox->Height / 2 + 1,
                               ACheckBox->Left  + ACheckBox->Height / 2 - 1,
                               ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
        TFT_Line(ACheckBox->Left  + ACheckBox->Height / 2 - ACheckBox->Pen_Width + 1,
                               ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
                               ACheckBox->Left  + ACheckBox->Height - ACheckBox->Height / 5 - 1,
                               ACheckBox->Top   + ACheckBox->Height / 5 + 1);
      }
      TFT_Write_Text_Return_Pos(ACheckBox->Caption, ACheckBox->Left + ACheckBox->Width / 4 + 3, ACheckBox->Top);
      TFT_Write_Text(ACheckBox->Caption, ACheckBox->Left + ACheckBox->Height + 3, (ACheckBox->Top + ((ACheckBox->Height - caption_height) / 2)));
    }
    else if (ACheckBox->TextAlign == _taRight) {
      if (ACheckBox->Rounded == 1)
        TFT_Rectangle_Round_Edges(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height  , ACheckBox->Top, ACheckBox->Left + ACheckBox->Width, ACheckBox->Top + ACheckBox->Height - 1, ACheckBox->Corner_Radius);
      else
        TFT_Rectangle(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height  , ACheckBox->Top, ACheckBox->Left + ACheckBox->Width, ACheckBox->Top + ACheckBox->Height - 1);
      if (ACheckBox->Checked == 1) {
        TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Height / 8);
        TFT_Line(ACheckBox->Left  + ACheckBox->Width - ACheckBox->Height + ACheckBox->Height / 5 + 1,
                               ACheckBox->Top +  ACheckBox->Height / 2 + 1,
                               ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 - 1,
                               ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
        TFT_Line(ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 + 1,
                               ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
                               ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height / 5 - 1,
                               ACheckBox->Top   + ACheckBox->Height / 5 + 1);
      }
      TFT_Write_Text_Return_Pos(ACheckBox->Caption, ACheckBox->Left + 3, ACheckBox->Top);
      TFT_Write_Text(ACheckBox->Caption, ACheckBox->Left + 3, ACheckBox->Top + (ACheckBox->Height - caption_height) / 2);
    }
  }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
  unsigned short button_idx;
  TButton *local_button;
  unsigned short label_idx;
  TLabel *local_label;
  unsigned short image_idx;
  TImage *local_image;
  unsigned short circle_idx;
  TCircle *local_circle;
  unsigned short box_idx;
  TBox *local_box;
  unsigned short checkbox_idx;
  TCheckBox *local_checkbox;
  char save_bled, save_bled_direction;

  object_pressed = 0;
  order = 0;
  button_idx = 0;
  label_idx = 0;
  image_idx = 0;
  circle_idx = 0;
  box_idx = 0;
  checkbox_idx = 0;
  CurrentScreen = aScreen;

  if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
    save_bled = TFT_BLED;
    TFT_BLED           = 0;
    TFT_Set_Active(Set_Index, Write_Command, Write_Data);
    TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
    STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Fill_Screen(CurrentScreen->Color);
    TFT_Set_DBC_SSD1963(255);
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

    if (box_idx < CurrentScreen->BoxesCount) {
      local_box = GetBox(box_idx);
      if (order == local_box->Order) {
        box_idx++;
        order++;
        DrawBox(local_box);
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

    if (checkbox_idx < CurrentScreen->CheckBoxesCount) {
      local_checkbox = GetCheckBox(checkbox_idx);
      if (order == local_checkbox->Order) {
        checkbox_idx++;
        order++;
        DrawCheckBox(local_checkbox);
      }
    }

  }
}

void Get_Object(unsigned int X, unsigned int Y) {
  button_order        = -1;
  label_order         = -1;
  image_order         = -1;
  circle_order        = -1;
  box_order           = -1;
  checkbox_order      = -1;
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

  // CheckBoxes
  for ( _object_count = 0 ; _object_count < CurrentScreen->CheckBoxesCount ; _object_count++ ) {
    local_checkbox = GetCheckBox(_object_count);
    if (local_checkbox->Active == 1) {
      if (IsInsideObject(X, Y, local_checkbox->Left, local_checkbox->Top,
                         local_checkbox->Width, local_checkbox->Height) == 1) {
        checkbox_order = local_checkbox->Order;
        exec_checkbox = local_checkbox;
      }
    }
  }

  _object_count = -1;
  if (button_order >  _object_count )
    _object_count = button_order;
  if (label_order >  _object_count )
    _object_count = label_order;
  if (image_order >  _object_count )
    _object_count = image_order;
  if (circle_order >  _object_count )
    _object_count = circle_order;
  if (box_order >  _object_count )
    _object_count = box_order;
  if (checkbox_order >  _object_count )
    _object_count = checkbox_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
  exec_button         = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_circle         = 0;
  exec_box            = 0;
  exec_checkbox       = 0;

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

    if (_object_count == circle_order) {
      if (exec_circle->Active == 1) {
        if (exec_circle->OnPressPtr != 0) {
          exec_circle->OnPressPtr();
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

    if (_object_count == checkbox_order) {
      if (exec_checkbox->Active == 1) {
        if (exec_checkbox->OnPressPtr != 0) {
          exec_checkbox->OnPressPtr();
          return;
        }
      }
    }

  }
}

void Process_TP_Up(unsigned int X, unsigned int Y) {

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
    // Check Box
    case 16: {
      if (PressedObject != 0) {
        exec_checkbox = (TCheckBox*)PressedObject;
        break;
      }
      break;
    }
  }

  exec_label          = 0;
  exec_image          = 0;

  Get_Object(X, Y);


  if (_object_count != -1) {
  // Buttons
    if (_object_count == button_order) {
      if (exec_button->Active == 1) {
        if (exec_button->OnUpPtr != 0)
          exec_button->OnUpPtr();
        if (PressedObject == (void *)exec_button)
          if (exec_button->OnClickPtr != 0)
            exec_button->OnClickPtr();
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
        if (PressedObject == (void *)exec_label)
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
        if (PressedObject == (void *)exec_image)
          if (exec_image->OnClickPtr != 0)
            exec_image->OnClickPtr();
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
        if (PressedObject == (void *)exec_circle)
          if (exec_circle->OnClickPtr != 0)
            exec_circle->OnClickPtr();
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
        if (PressedObject == (void *)exec_box)
          if (exec_box->OnClickPtr != 0)
            exec_box->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // CheckBoxes
    if (_object_count == checkbox_order) {
      if (exec_checkbox->Active == 1) {
        if (exec_checkbox->OnUpPtr != 0)
          exec_checkbox->OnUpPtr();
        if (PressedObject == (void *)exec_checkbox) {
          if (exec_checkbox->Checked == 1)
            exec_checkbox->Checked = 0;
          else
            exec_checkbox->Checked = 1;
          DrawCheckBox(exec_checkbox);
          if (exec_checkbox->OnClickPtr != 0)
            exec_checkbox->OnClickPtr();
        }
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
  exec_button         = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_circle         = 0;
  exec_box            = 0;
  exec_checkbox       = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == button_order) {
      if (exec_button->Active == 1) {
        if (exec_button->PressColEnabled == 1) {
          object_pressed = 1;
          DrawButton(exec_button);
        }
        PressedObject = (void *)exec_button;
        PressedObjectType = 0;
        if (exec_button->OnDownPtr != 0) {
          exec_button->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active == 1) {
        PressedObject = (void *)exec_label;
        PressedObjectType = 2;
        if (exec_label->OnDownPtr != 0) {
          exec_label->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active == 1) {
        PressedObject = (void *)exec_image;
        PressedObjectType = 3;
        if (exec_image->OnDownPtr != 0) {
          exec_image->OnDownPtr();
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
        PressedObject = (void *)exec_circle;
        PressedObjectType = 4;
        if (exec_circle->OnDownPtr != 0) {
          exec_circle->OnDownPtr();
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
        PressedObject = (void *)exec_box;
        PressedObjectType = 6;
        if (exec_box->OnDownPtr != 0) {
          exec_box->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == checkbox_order) {
      if (exec_checkbox->Active == 1) {
        if (exec_checkbox->PressColEnabled == 1) {
          object_pressed = 1;
          DrawCheckBox(exec_checkbox);
        }
        PressedObject = (void *)exec_checkbox;
        PressedObjectType = 16;
        if (exec_checkbox->OnDownPtr != 0) {
          exec_checkbox->OnDownPtr();
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
  STMPE610_SetADC(STMPE610_ADC_CTRL1_SAMPLETIME_44 | STMPE610_ADC_CTRL1_ADC_10BIT | STMPE610_ADC_CTRL1_INT_REFERENCE);
  Delay_10ms(); Delay_10ms();
  STMPE610_SetADCClock(STMPE610_ADC_CTRL2_6500_kHZ);
  STMPE610_AlternateFunction(STMPE610_GPIO_PIN4 | STMPE610_GPIO_PIN5 | STMPE610_GPIO_PIN6 | STMPE610_GPIO_PIN7, STMPE610_DISABLE);
  STMPE610_ConfigureTSC(STMPE610_TSC_CFG_AVE_CTRL_8S, STMPE610_TSC_CFG_TOUCH_DET_DELAY_500uS, STMPE610_TSC_CFG_TOUCH_SETTLING_500uS);
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
TTPConstants TPConstsStruct;
  Init_MCU();

  InitializeTouchPanel();
  if (STMPE610_Config() == STMPE610_OK) {
  } else {
    while(1);
  }


  // You can get calibration constants using touch panel calibration example
  TPConstsStruct.X_Min = 105;
  TPConstsStruct.X_Max = 3925;
  TPConstsStruct.Y_Min = 250;
  TPConstsStruct.Y_Max = 3820;
  TPConstsStruct.Rotate = 0;
  STMPE610_SetCalibrationConsts(&TPConstsStruct);

  InitializeObjects();
  display_width = Home.Width;
  display_height = Home.Height;
  DrawScreen(&Home);
}
