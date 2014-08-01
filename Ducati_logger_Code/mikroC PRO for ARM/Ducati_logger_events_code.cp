#line 1 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Ducati_logger_events_code.c"
#line 1 "c:/users/jjmcdo1/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/ducati_logger_objects.h"
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
#line 1 "c:/users/jjmcdo1/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/ducati_logger_resources.h"
#line 5 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Ducati_logger_events_code.c"
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
 checkRTC();
 checkPowerM();
 Sensors_Read();
 }; break;
 case 1 : {
 checkRTC();
 checkPowerM();
 Sensors_Read();
 }; break;

 case 2 : {
 checkRTC();
 checkPowerM();
 }; break;
 case 3 : {
 if (PenDown == 0)
 doRTC_Example();
 }; break;
 case 4 : {
 doAccel();
 }; break;
 case 5 : {

 }; break;
 case 6 : break;
 case 7 : {

 }; break;
 case 8 : {

 }; break;
 }
}
#line 149 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Ducati_logger_events_code.c"
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

void doAccelerometerTest() {
 BLED_Fade_Out();
 DrawScreen(&Accelerometer_test);
 BLED_Fade_In();
 Logger_State = 4;

}

void doGPSTest() {
 BLED_Fade_Out();
 DrawScreen(&GPS_test);
 BLED_Fade_In();
 Logger_State = 5;
}

void doGyroTest() {
 BLED_Fade_Out();
 DrawScreen(&Gyro_test);
 BLED_Fade_In();
 Logger_State = 6;
}


void doPressureTest() {
 BLED_Fade_Out();
 DrawScreen(&Pressure_test);
 BLED_Fade_In();
 Logger_State = 6;

}

void doMagnetTest() {
 BLED_Fade_Out();
 DrawScreen(&Magnetometer_test);
 BLED_Fade_In();
 Logger_State = 6;
}
