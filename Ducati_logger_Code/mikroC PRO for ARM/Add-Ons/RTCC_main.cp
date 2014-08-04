#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/ducati_logger_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct {
 unsigned int X_Min;
 unsigned int X_Max;
 unsigned int Y_Min;
 unsigned int Y_Max;
 char Rotate;
} TTPConstants;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef const struct CImage {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCImage;

typedef struct Circle {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCircle;

typedef struct CircleButton {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCircleButton;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

typedef const struct CBox {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCBox;

typedef struct Line {
 TScreen* OwnerScreen;
 char Order;
 unsigned int First_Point_X;
 unsigned int First_Point_Y;
 unsigned int Second_Point_X;
 unsigned int Second_Point_Y;
 char Pen_Width;
 char Visible;
 unsigned int Color;
} TLine;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int CImagesCount;
 TCImage * const code *CImages;
 unsigned int CirclesCount;
 TCircle * const code *Circles;
 unsigned int CircleButtonsCount;
 TCircleButton * const code *CircleButtons;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 unsigned int CBoxesCount;
 TCBox * const code *CBoxes;
 unsigned int LinesCount;
 TLine * const code *Lines;
};

extern TScreen Boot;
extern TImage Image1;
extern TImage Image2;
extern TImage Image10;
extern TImage Image11;
extern TImage Image12;
extern TImage Image16;
extern TImage Image17;
extern TImage Image21;
extern TImage Image22;
extern TImage Image23;
extern TImage Image24;
extern TImage Image25;
extern TImage Image26;
extern TImage Image27;
extern TImage Image28;
extern TImage Image29;
extern TImage Image30;
extern TImage Image31;
extern TImage Image32;
extern TImage Image33;
extern TImage Image34;
extern TImage Image35;
extern TImage Image36;
extern TImage Image37;
extern TImage Image38;
extern TImage Image39;
extern TImage * const code Screen1_Images[26];

extern TScreen Speedometer_graphics;
extern TCImage Image13;
extern TLabel Label19;
extern TImage Image15;
extern TImage Image3;
extern TImage Image4;
extern TImage Image5;
extern TImage Image6;
extern TImage Image7;
extern TImage Image8;
extern TImage Image9;
extern TLabel Label10;
extern TLabel Label11;
extern TCircleButton CircleButton1;
extern TLabel Label12;
extern TLabel Label13;
extern TBox Box2;
extern TLabel Label14;
extern TLabel Label15;
extern TLabel Label16;
extern TLabel Label17;
extern TLine Line1;
extern TLabel Label18;
extern TButton_Round ButtonRound8;
extern TButton_Round * const code Screen2_Buttons_Round[1];
extern TLabel * const code Screen2_Labels[10];
extern TImage * const code Screen2_Images[8];
extern TCImage * const code Screen2_CImages[1];
extern TCircleButton * const code Screen2_CircleButtons[1];
extern TBox * const code Screen2_Boxes[1];
extern TLine * const code Screen2_Lines[1];

extern TScreen Tachometer_graphics;
extern TCImage Image14;
extern TImage Image40;
extern TImage Image41;
extern TImage Image42;
extern TImage Image43;
extern TImage Image44;
extern TImage Image45;
extern TLabel Label20;
extern TLabel Label21;
extern TLabel Label22;
extern TBox Box12;
extern TLabel Label23;
extern TImage Image46;
extern TButton_Round ButtonRound9;
extern TLabel Label24;
extern TLabel Label25;
extern TImage Image47;
extern TLabel Label26;
extern TLabel Label27;
extern TLabel Label28;
extern TCircleButton CircleButton2;
extern TLine Line2;
extern TLabel Label29;
extern TCircle Circle1;
extern TButton_Round * const code Screen3_Buttons_Round[1];
extern TLabel * const code Screen3_Labels[10];
extern TImage * const code Screen3_Images[8];
extern TCImage * const code Screen3_CImages[1];
extern TCircle * const code Screen3_Circles[1];
extern TCircleButton * const code Screen3_CircleButtons[1];
extern TBox * const code Screen3_Boxes[1];
extern TLine * const code Screen3_Lines[1];

extern TScreen Settings;
extern TCBox Box1;
extern TButton_Round ButtonRound1;
extern TButton_Round ButtonRound2;
extern TButton_Round ButtonRound3;
extern TButton_Round ButtonRound4;
extern TButton_Round ButtonRound5;
extern TButton_Round ButtonRound6;
extern TButton_Round ButtonRound7;
extern TImage Image48;
extern TLabel Label30;
extern TBox Box17;
extern TImage Image51;
extern TLabel Label73;
extern TButton_Round * const code Screen4_Buttons_Round[7];
extern TLabel * const code Screen4_Labels[2];
extern TImage * const code Screen4_Images[2];
extern TBox * const code Screen4_Boxes[1];
extern TCBox * const code Screen4_CBoxes[1];

extern TScreen Set_clock;
extern TBox Box7;
extern TBox Box8;
extern TLabel Label2;
extern TBox Box10;
extern TBox Box11;
extern TLabel Label5;
extern TImage Image18;
extern TBox Box3;
extern TBox Box4;
extern TImage Image19;
extern TLabel Label6;
extern TImage Image20;
extern TBox Box5;
extern TLabel * const code Screen5_Labels[3];
extern TImage * const code Screen5_Images[3];
extern TBox * const code Screen5_Boxes[7];

extern TScreen Accelerometer_test;
extern TBox Box23;
extern TBox Box6;
extern TImage Image49;
extern TLabel Label1;
extern TLabel Label3;
extern TLabel Label4;
extern TLabel Label7;
extern TLabel * const code Screen6_Labels[4];
extern TImage * const code Screen6_Images[1];
extern TBox * const code Screen6_Boxes[2];

extern TScreen GPS_Test;
extern TBox Box9;
extern TBox Box16;
extern TImage Image50;
extern TLabel Label32;
extern TLabel Label53;
extern TLabel Label54;
extern TLabel Label55;
extern TLabel Label56;
extern TLabel Label57;
extern TLabel Label58;
extern TLabel Label59;
extern TLabel Label60;
extern TLabel Label61;
extern TLabel Label62;
extern TLabel Label63;
extern TLabel Label64;
extern TLabel Label65;
extern TLabel Label66;
extern TLabel Label67;
extern TLabel Label68;
extern TLabel Label69;
extern TLabel Label70;
extern TLabel Label71;
extern TLabel Label72;
extern TLabel * const code Screen7_Labels[21];
extern TImage * const code Screen7_Images[1];
extern TBox * const code Screen7_Boxes[2];

extern TScreen Gyro_test;
extern TBox Box13;
extern TBox Box14;
extern TImage Image52;
extern TLabel Label8;
extern TLabel Label9;
extern TLabel Label31;
extern TLabel Label33;
extern TLabel * const code Screen8_Labels[4];
extern TImage * const code Screen8_Images[1];
extern TBox * const code Screen8_Boxes[2];

extern TScreen Magnetometer_test;
extern TBox Box15;
extern TBox Box18;
extern TImage Image53;
extern TLabel Label34;
extern TLabel Label35;
extern TLabel Label36;
extern TLabel Label37;
extern TLabel * const code Screen9_Labels[4];
extern TImage * const code Screen9_Images[1];
extern TBox * const code Screen9_Boxes[2];

extern TScreen Pressure_test;
extern TBox Box19;
extern TBox Box20;
extern TImage Image54;
extern TLabel Label38;
extern TLabel Label39;
extern TLabel Label40;
extern TLabel Label41;
extern TLabel * const code Screen10_Labels[4];
extern TImage * const code Screen10_Images[1];
extern TBox * const code Screen10_Boxes[2];




void Box10OnPress();
void Box11OnPress();
void Box3OnPress();
void Box4OnPress();
void Box5OnPress();
void Box8OnClick();
void doAccelerometerTest();
void doCalibration();
void doGPSTest();
void doGyroTest();
void doLog();
void doMagnetTest();
void doNextScreen();
void doPressureTest();
void doPrevScreen();
void doSetClock();
void doSettings();
void Image18OnPress();




extern char Image1_Caption[];
extern char Image2_Caption[];
extern char Image10_Caption[];
extern char Image11_Caption[];
extern char Image12_Caption[];
extern char Image16_Caption[];
extern char Image17_Caption[];
extern char Image21_Caption[];
extern char Image22_Caption[];
extern char Image23_Caption[];
extern char Image24_Caption[];
extern char Image25_Caption[];
extern char Image26_Caption[];
extern char Image27_Caption[];
extern char Image28_Caption[];
extern char Image29_Caption[];
extern char Image30_Caption[];
extern char Image31_Caption[];
extern char Image32_Caption[];
extern char Image33_Caption[];
extern char Image34_Caption[];
extern char Image35_Caption[];
extern char Image36_Caption[];
extern char Image37_Caption[];
extern char Image38_Caption[];
extern char Image39_Caption[];
extern const char Image13_Caption[];
extern char Label19_Caption[];
extern char Image15_Caption[];
extern char Image3_Caption[];
extern char Image4_Caption[];
extern char Image5_Caption[];
extern char Image6_Caption[];
extern char Image7_Caption[];
extern char Image8_Caption[];
extern char Image9_Caption[];
extern char Label10_Caption[];
extern char Label11_Caption[];
extern char CircleButton1_Caption[];
extern char Label12_Caption[];
extern char Label13_Caption[];
extern char Box2_Caption[];
extern char Label14_Caption[];
extern char Label15_Caption[];
extern char Label16_Caption[];
extern char Label17_Caption[];
extern char Line1_Caption[];
extern char Label18_Caption[];
extern char ButtonRound8_Caption[];
extern const char Image14_Caption[];
extern char Image40_Caption[];
extern char Image41_Caption[];
extern char Image42_Caption[];
extern char Image43_Caption[];
extern char Image44_Caption[];
extern char Image45_Caption[];
extern char Label20_Caption[];
extern char Label21_Caption[];
extern char Label22_Caption[];
extern char Box12_Caption[];
extern char Label23_Caption[];
extern char Image46_Caption[];
extern char ButtonRound9_Caption[];
extern char Label24_Caption[];
extern char Label25_Caption[];
extern char Image47_Caption[];
extern char Label26_Caption[];
extern char Label27_Caption[];
extern char Label28_Caption[];
extern char CircleButton2_Caption[];
extern char Line2_Caption[];
extern char Label29_Caption[];
extern char Circle1_Caption[];
extern const char Box1_Caption[];
extern char ButtonRound1_Caption[];
extern char ButtonRound2_Caption[];
extern char ButtonRound3_Caption[];
extern char ButtonRound4_Caption[];
extern char ButtonRound5_Caption[];
extern char ButtonRound6_Caption[];
extern char ButtonRound7_Caption[];
extern char Image48_Caption[];
extern char Label30_Caption[];
extern char Box17_Caption[];
extern char Image51_Caption[];
extern char Label73_Caption[];
extern char Box7_Caption[];
extern char Box8_Caption[];
extern char Label2_Caption[];
extern char Box10_Caption[];
extern char Box11_Caption[];
extern char Label5_Caption[];
extern char Image18_Caption[];
extern char Box3_Caption[];
extern char Box4_Caption[];
extern char Image19_Caption[];
extern char Label6_Caption[];
extern char Image20_Caption[];
extern char Box5_Caption[];
extern char Box23_Caption[];
extern char Box6_Caption[];
extern char Image49_Caption[];
extern char Label1_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char Label7_Caption[];
extern char Box9_Caption[];
extern char Box16_Caption[];
extern char Image50_Caption[];
extern char Label32_Caption[];
extern char Label53_Caption[];
extern char Label54_Caption[];
extern char Label55_Caption[];
extern char Label56_Caption[];
extern char Label57_Caption[];
extern char Label58_Caption[];
extern char Label59_Caption[];
extern char Label60_Caption[];
extern char Label61_Caption[];
extern char Label62_Caption[];
extern char Label63_Caption[];
extern char Label64_Caption[];
extern char Label65_Caption[];
extern char Label66_Caption[];
extern char Label67_Caption[];
extern char Label68_Caption[];
extern char Label69_Caption[];
extern char Label70_Caption[];
extern char Label71_Caption[];
extern char Label72_Caption[];
extern char Box13_Caption[];
extern char Box14_Caption[];
extern char Image52_Caption[];
extern char Label8_Caption[];
extern char Label9_Caption[];
extern char Label31_Caption[];
extern char Label33_Caption[];
extern char Box15_Caption[];
extern char Box18_Caption[];
extern char Image53_Caption[];
extern char Label34_Caption[];
extern char Label35_Caption[];
extern char Label36_Caption[];
extern char Label37_Caption[];
extern char Box19_Caption[];
extern char Box20_Caption[];
extern char Image54_Caption[];
extern char Label38_Caption[];
extern char Label39_Caption[];
extern char Label40_Caption[];
extern char Label41_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawCImage(TCImage *ACimage);
void DrawCircle(TCircle *ACircle);
void DrawCircleButton(TCircleButton *ACircle_button);
void DrawBox(TBox *ABox);
void DrawCBox(TCBox *ACbox);
void DrawLine(TLine *Aline);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/ducati_logger_resources.h"
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/__time.h"
#line 27 "c:/users/jemmi/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/__time.h"
typedef struct
 {
 unsigned char ss ;
 unsigned char mn ;
 unsigned char hh ;
 unsigned char md ;
 unsigned char wd ;
 unsigned char mo ;
 unsigned int yy ;
 } TimeStruct ;
#line 41 "c:/users/jemmi/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/__time.h"
extern long Time_jd1970 ;
#line 46 "c:/users/jemmi/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/__time.h"
long Time_dateToEpoch(TimeStruct *ts) ;
long Time_dateDiff(TimeStruct *t1, TimeStruct *t2);
void Time_epochToDate(long e, TimeStruct *ts) ;
#line 13 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
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

typedef struct RollingWheel {
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 unsigned int ImageHeight;
 const code char *Picture_Name;
 unsigned int currentlevel;
 int active;
 int position;
 char levels;
} TRoller;

TRoller Hour1Roll, Hour2Roll, Minute1Roll, Minute2Roll, AmPm;

void Roll_Roller(TRoller *Roller, char dir, char step);
void Draw_Picture(TRoller *Image, int line, int xcoo, int ycoo);
void Roll_Get_Level(TRoller *Roller);

char Roll_flag;
unsigned int OldYcoo, OldDelta;
extern unsigned int Xcoord, Ycoord;
#line 58 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
void MyBoxOnPress(TRoller *Roller){
int delta;
char dir, step;

 if (Roll_Flag == 0){
 Roll_Flag = 1;
 OldYcoo = Ycoord;
 OldDelta = 0;
 return;
 }

 delta = Ycoord - OldYcoo;
 if (delta > 0){
 dir = 0;
 }
 if (delta < 0){
 dir = 1;
 delta = - delta;
 }

 if (delta < 4){
 OldDelta = delta;
 return;
 }

 step = 2;

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

 while (delta > 0){
 Roll_Roller(Roller, dir, step);
 delta = delta - step;
 }

 OldYcoo = Ycoord;
 OldDelta = 0;
}


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
#line 129 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
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
#line 154 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
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
#line 190 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
char Roll_Get_Level(TRoller *Roller){
 Roller->currentlevel = Roller->position / (Roller->ImageHeight / Roller->levels);
 return Roller->currentlevel;
}
#line 202 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
void Roll_Set_Level(TRoller *Roller, char level){
 Roller->currentlevel = level;
 Roller->position = Roller->ImageHeight * level / Roller->levels;
}
#line 214 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
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
#line 236 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
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
#line 261 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
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
#line 286 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
void Roller_Init(){
 Hour1Roll.Left = 108;
 Hour1Roll.Top = 42;
 Hour1Roll.Width = 36;
 Hour1Roll.Height = 194;
 Hour1Roll.ImageHeight = 148;
 Hour1Roll.active = 0;
 Hour1Roll.Picture_Name =  0x003D8E4A ;
 Hour1Roll.position = 148 / 2 / 2;
 Hour1Roll.levels = 2;

 Hour2Roll.Left = 146;
 Hour2Roll.Top = 42;
 Hour2Roll.Width = 36;
 Hour2Roll.Height = 194;
 Hour2Roll.ImageHeight = 740;
 Hour2Roll.active = 0;
 Hour2Roll.Picture_Name =  0x003D8E4A ;
 Hour2Roll.position = 740 / 10 / 2;
 Hour2Roll.levels = 10;

 Minute1Roll.Left = 212;
 Minute1Roll.Top = 42;
 Minute1Roll.Width = 36;
 Minute1Roll.Height = 194;
 Minute1Roll.ImageHeight = 444;
 Minute1Roll.active = 0;
 Minute1Roll.Picture_Name =  0x003D8E4A ;
 Minute1Roll.position = 444 / 6 / 2;
 Minute1Roll.levels = 6;

 Minute2Roll.Left = 250;
 Minute2Roll.Top = 42;
 Minute2Roll.Width = 36;
 Minute2Roll.Height = 194;
 Minute2Roll.ImageHeight = 740;
 Minute2Roll.active = 0;
 Minute2Roll.Picture_Name =  0x003D8E4A ;
 Minute2Roll.position = 740 / 10 / 2;
 Minute2Roll.levels = 10;

 AmPm.Left = 305;
 AmPm.Top = 42;
 AmPm.Width = 90;
 AmPm.Height = 194;
 AmPm.ImageHeight = 151;
 AmPm.Picture_Name =  0x003E5E70 ;
 AmPm.currentlevel = 0;
 AmPm.active = 0;
 AmPm.position = 151 / 2 / 2;
 AmPm.levels = 2;
}
#line 346 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
void HoursTens(){

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

 Draw_Picture(&Hour1Roll, Hour1Roll.position - 96, Hour1Roll.Left, Hour1Roll.Top);
 }

 MyBoxOnPress(&Hour1Roll);
 Hour1Roll.active = 1;
}
#line 380 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
void HoursOnes(){

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

 Draw_Picture(&Hour2Roll, Hour2Roll.position - 96, Hour2Roll.Left, Hour2Roll.Top);
 }

 MyBoxOnPress(&Hour2Roll);
 Hour2Roll.active = 1;
}
#line 414 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
void MinutesTens(){

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

 Draw_Picture(&Minute1Roll, Minute1Roll.position - 95, Minute1Roll.Left, Minute1Roll.Top);
 }

 MyBoxOnPress(&Minute1Roll);
 Minute1Roll.active = 1;
}
#line 448 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
void MinutesOnes(){

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

 Draw_Picture(&Minute2Roll, Minute2Roll.position - 95, Minute2Roll.Left, Minute2Roll.Top);
 }

 MyBoxOnPress(&Minute2Roll);
 Minute2Roll.active = 1;
}
#line 482 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
void AmPmRun(){

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

 Draw_Picture(&AmPm, AmPm.position - 75, AmPm.Left, AmPm.Top);
 }

 MyBoxOnPress(&AmPm);
 AmPm.active = 1;
}
#line 516 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
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
#line 546 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
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
#line 568 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
void doRTC_Example(){

 Roll_Flag = 0;

 if (Hour1Roll.active){
 Roll_Get_Level(&Hour1Roll);
 Set_Roller(&Hour1Roll, Hour1Roll.currentlevel, 1);
 }

 if (Hour2Roll.active){
 Roll_Get_Level(&Hour2Roll);
 Set_Roller(&Hour2Roll, Hour2Roll.currentlevel, 1);
 }

 if (Minute1Roll.active){
 Roll_Get_Level(&Minute1Roll);
 Set_Roller(&Minute1Roll, Minute1Roll.currentlevel, 1);
 }

 if (Minute2Roll.active){
 Roll_Get_Level(&Minute2Roll);
 Set_Roller(&Minute2Roll, Minute2Roll.currentlevel, 1);
 }

 if (AmPm.active){
 Roll_Get_Level(&AmPm);
 Set_Roller(&AmPm, AmPm.currentlevel, 1);
 }
}
#line 605 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
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
#line 625 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
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
#line 655 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_main.c"
void checkRTC(){
 if (RTCC_Read(&MyTime)){
 if ((MyTime.minutes != OldMyTime.minutes) || (MyTime.hours != OldMyTime.hours) || (MyTime.ampm != OldMyTime.ampm)){
 UpdateTime(&MyTime);
 OldMyTime = MyTime;
 }
 }
}

extern TimeStruct my_time;
