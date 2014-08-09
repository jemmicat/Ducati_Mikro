#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/mikromedia_STM32plus_events_code.c"
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/mikromedia_stm32plus_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct {
 unsigned int X_Min;
 unsigned int X_Max;
 unsigned int Y_Min;
 unsigned int Y_Max;
 char Rotate;
} TTPConstants;

typedef struct Button {
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
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton;

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

typedef struct CheckBox {
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
 char Checked;
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
 char Rounded;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCheckBox;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int ButtonsCount;
 TButton * const code *Buttons;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int CirclesCount;
 TCircle * const code *Circles;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 unsigned int CheckBoxesCount;
 TCheckBox * const code *CheckBoxes;
};

extern TScreen Home;
extern TImage Image1;
extern TImage Image3;
extern TLabel Label5;
extern TLabel Label7;
extern TLabel Label8;
extern TImage Image6;
extern TLabel Label14;
extern TImage Image10;
extern TLabel Label19;
extern TImage Image9;
extern TLabel Label20;
extern TImage Image16;
extern TLabel Label25;
extern TImage Image24;
extern TLabel Label30;
extern TImage Image18;
extern TLabel Label34;
extern TImage TicTacToe;
extern TLabel Label40;
extern TImage BatteryStatus;
extern TLabel * const code Screen1_Labels[10];
extern TImage * const code Screen1_Images[10];

extern TScreen Accelerometer;
extern TBox Box23;
extern TBox Box1;
extern TImage Image2;
extern TLabel Label1;
extern TLabel Label2;
extern TLabel Label3;
extern TLabel Label4;
extern TLabel * const code Screen2_Labels[4];
extern TImage * const code Screen2_Images[1];
extern TBox * const code Screen2_Boxes[2];

extern TScreen RGBLight;
extern TBox Box22;
extern TLabel Label9;
extern TImage Image5;
extern TLabel Label10;
extern TCircle Circle1;
extern TLabel Label11;
extern TLabel Label12;
extern TLabel Label13;
extern TBox RGB_Active_area;
extern TLabel * const code Screen3_Labels[5];
extern TImage * const code Screen3_Images[1];
extern TCircle * const code Screen3_Circles[1];
extern TBox * const code Screen3_Boxes[2];

extern TScreen Clock;
extern TBox Box16;
extern TBox Box15;
extern TBox Box13;
extern TBox Box12;
extern TLabel Label15;
extern TBox Box2;
extern TBox Box3;
extern TLabel Label16;
extern TImage ClockBack;
extern TLabel Label17;
extern TLabel Label18;
extern TImage SyncIcon;
extern TImage Image8;
extern TBox Box4;
extern TBox Box5;
extern TImage Image7;
extern TLabel Label42;
extern TImage Image17;
extern TBox Box14;
extern TLabel * const code Screen4_Labels[5];
extern TImage * const code Screen4_Images[5];
extern TBox * const code Screen4_Boxes[9];

extern TScreen Sensors;
extern TBox Box21;
extern TBox Diagram5_Box1;
extern TImage TempIcon;
extern TImage LightIcon;
extern TLabel Diagram5_Label1;
extern TLabel Diagram5_Label2;
extern TLabel Diagram5_Label3;
extern TLabel Diagram5_Label4;
extern TLabel Diagram5_Label5;
extern TImage BackIconSensors;
extern TLabel Diagram5_Label6;
extern TLabel Label21;
extern TLabel * const code Screen5_Labels[7];
extern TImage * const code Screen5_Images[3];
extern TBox * const code Screen5_Boxes[2];

extern TScreen MP3_SD;
extern TBox Box20;
extern TLabel Label22;
extern TLabel Label23;
extern TImage Image11;
extern TImage Image12;
extern TImage Image13;
extern TImage Image14;
extern TImage mp3_back_icon;
extern TLabel * const code Screen6_Labels[2];
extern TImage * const code Screen6_Images[5];
extern TBox * const code Screen6_Boxes[1];

extern TScreen MP3_SongList;
extern TBox Box19;
extern TBox Box6;
extern TLabel Label24;
extern TImage mp3_back_icon2;
extern TLabel Label26;
extern TImage folder_icon;
extern TImage file_icon;
extern TLabel * const code Screen7_Labels[2];
extern TImage * const code Screen7_Images[3];
extern TBox * const code Screen7_Boxes[2];

extern TScreen MP3_Player;
extern TBox Box17;
extern TLabel Label27;
extern TImage Icon_back_mp3;
extern TBox VolmeBar;
extern TImage Image15;
extern TBox ProgressBar;
extern TLabel Label28;
extern TImage previous_icon;
extern TImage pause_icon;
extern TImage Play_icon;
extern TImage stop_icon;
extern TImage next_icon;
extern TImage songlist_icon;
extern TLabel Label6;
extern TLabel * const code Screen8_Labels[3];
extern TImage * const code Screen8_Images[8];
extern TBox * const code Screen8_Boxes[3];

extern TScreen Paint;
extern TBox Box18;
extern TImage Image4;
extern TImage NewScreen;
extern TImage Image25;
extern TImage Pen;
extern TImage Image27;
extern TImage Eraser;
extern TImage Image29;
extern TBox DrawingArea;
extern TImage icon_paint_back;
extern TLabel Label29;
extern TBox Color01;
extern TBox Color02;
extern TBox Color03;
extern TBox Color04;
extern TBox Color05;
extern TBox Color06;
extern TBox Color07;
extern TBox Color08;
extern TBox Color09;
extern TBox Color10;
extern TBox Color11;
extern TBox Color12;
extern TBox Color13;
extern TBox Color14;
extern TBox Color15;
extern TBox Color16;
extern TBox Color17;
extern TBox Color18;
extern TBox Color19;
extern TBox Color20;
extern TBox Color21;
extern TBox Color22;
extern TBox Color23;
extern TBox Color24;
extern TBox Color25;
extern TBox Color26;
extern TBox Color27;
extern TBox Color28;
extern TBox Color29;
extern TBox Color30;
extern TImage BackGroundColor;
extern TBox Pen1;
extern TBox Pen2;
extern TBox Pen3;
extern TLabel * const code Screen9_Labels[1];
extern TImage * const code Screen9_Images[9];
extern TBox * const code Screen9_Boxes[35];

extern TScreen SlideShow;
extern TBox Box7;
extern TBox icon_previous_box;
extern TBox Icon_next_box;
extern TLabel Label31;
extern TImage back_slide_show;
extern TLabel Label32;
extern TLabel Label33;
extern TImage icon_previous;
extern TImage Icon_next;
extern TLabel Label35;
extern TBox Slide_Active_area;
extern TLabel * const code Screen10_Labels[4];
extern TImage * const code Screen10_Images[3];
extern TBox * const code Screen10_Boxes[4];

extern TScreen Tic_Tac_Toe;
extern TBox Box10;
extern TBox Box11;
extern TBox Box9;
extern TButton Button9;
extern TButton Button8;
extern TButton Button7;
extern TButton Button6;
extern TButton Button5;
extern TButton Button4;
extern TButton Button3;
extern TButton Button2;
extern TButton Button1;
extern TBox Box8;
extern TLabel Label36;
extern TImage Image20;
extern TLabel Label37;
extern TImage Image21;
extern TLabel Label38;
extern TLabel Label39;
extern TLabel XO1;
extern TLabel XO2;
extern TLabel XO3;
extern TLabel XO4;
extern TLabel XO5;
extern TLabel XO6;
extern TLabel XO7;
extern TLabel XO8;
extern TLabel XO9;
extern TCheckBox CheckBox1;
extern TLabel Label41;
extern TButton * const code Screen11_Buttons[9];
extern TLabel * const code Screen11_Labels[14];
extern TImage * const code Screen11_Images[2];
extern TBox * const code Screen11_Boxes[4];
extern TCheckBox * const code Screen11_CheckBoxes[1];




void BackGroundColorOnPress();
void BackIconSensorsOnPress();
void Box10OnClick();
void Box11OnPress();
void Box12OnClick();
void Box12OnPress();
void Box13OnClick();
void Box14OnPress();
void Box2OnPress();
void Box3OnPress();
void Box4OnPress();
void Box5OnPress();
void Box6OnClick();
void Box6OnPress();
void Box7OnDown();
void Box9OnPress();
void Button1OnClick();
void Button2OnClick();
void Button3OnClick();
void Button4OnClick();
void Button5OnClick();
void Button6OnClick();
void Button7OnClick();
void Button8OnClick();
void Button9OnClick();
void CheckBox1OnClick();
void ClockBackOnPress();
void Color01OnPress();
void Color02OnPress();
void Color03OnPress();
void Color04OnPress();
void Color05OnPress();
void Color06OnPress();
void Color07OnPress();
void Color08OnPress();
void Color09OnPress();
void Color10OnPress();
void Color11OnPress();
void Color12OnPress();
void Color13OnPress();
void Color14OnPress();
void Color15OnPress();
void Color16OnPress();
void Color17OnPress();
void Color18OnPress();
void Color19OnPress();
void Color20OnPress();
void Color21OnPress();
void Color22OnPress();
void Color23OnPress();
void Color24OnPress();
void Color25OnPress();
void Color26OnPress();
void Color27OnPress();
void Color28OnPress();
void Color29OnPress();
void Color30OnPress();
void DrawingAreaOnPress();
void EraserOnPress();
void Icon_back_mp3OnClick();
void Icon_next_boxOnPress();
void icon_paint_backOnPress();
void icon_previous_boxOnPress();
void Image15OnPress();
void Image16OnClick();
void Image18OnClick();
void Image1OnPress();
void Image22OnClick();
void Image24OnPress();
void Image2OnPress();
void Image3OnPress();
void Image4OnPress();
void Image5OnPress();
void Image6OnClick();
void Image8OnPress();
void Image9OnPress();
void Label22OnPress();
void Label24OnPress();
void Label27OnPress();
void mp3_back_iconOnPress();
void NewScreenOnPress();
void next_iconOnDown();
void pause_iconOnPress();
void Pen1OnPress();
void Pen2OnPress();
void Pen3OnPress();
void PenOnPress();
void Play_iconOnDown();
void previous_iconOnDown();
void ProgreesBarOnPress();
void RGB_Active_areaOnPress();
void Slide_Active_areaOnPress();
void songlist_iconOnPress();
void stop_iconOnDown();
void VolmeBarOnPress();




extern char Image1_Caption[];
extern char Image3_Caption[];
extern char Label5_Caption[];
extern char Label7_Caption[];
extern char Label8_Caption[];
extern char Image6_Caption[];
extern char Label14_Caption[];
extern char Image10_Caption[];
extern char Label19_Caption[];
extern char Image9_Caption[];
extern char Label20_Caption[];
extern char Image16_Caption[];
extern char Label25_Caption[];
extern char Image24_Caption[];
extern char Label30_Caption[];
extern char Image18_Caption[];
extern char Label34_Caption[];
extern char TicTacToe_Caption[];
extern char Label40_Caption[];
extern char BatteryStatus_Caption[];
extern char Box23_Caption[];
extern char Box1_Caption[];
extern char Image2_Caption[];
extern char Label1_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char Box22_Caption[];
extern char Label9_Caption[];
extern char Image5_Caption[];
extern char Label10_Caption[];
extern char Circle1_Caption[];
extern char Label11_Caption[];
extern char Label12_Caption[];
extern char Label13_Caption[];
extern char RGB_Active_area_Caption[];
extern char Box16_Caption[];
extern char Box15_Caption[];
extern char Box13_Caption[];
extern char Box12_Caption[];
extern char Label15_Caption[];
extern char Box2_Caption[];
extern char Box3_Caption[];
extern char Label16_Caption[];
extern char ClockBack_Caption[];
extern char Label17_Caption[];
extern char Label18_Caption[];
extern char SyncIcon_Caption[];
extern char Image8_Caption[];
extern char Box4_Caption[];
extern char Box5_Caption[];
extern char Image7_Caption[];
extern char Label42_Caption[];
extern char Image17_Caption[];
extern char Box14_Caption[];
extern char Box21_Caption[];
extern char Diagram5_Box1_Caption[];
extern char TempIcon_Caption[];
extern char LightIcon_Caption[];
extern char Diagram5_Label1_Caption[];
extern char Diagram5_Label2_Caption[];
extern char Diagram5_Label3_Caption[];
extern char Diagram5_Label4_Caption[];
extern char Diagram5_Label5_Caption[];
extern char BackIconSensors_Caption[];
extern char Diagram5_Label6_Caption[];
extern char Label21_Caption[];
extern char Box20_Caption[];
extern char Label22_Caption[];
extern char Label23_Caption[];
extern char Image11_Caption[];
extern char Image12_Caption[];
extern char Image13_Caption[];
extern char Image14_Caption[];
extern char mp3_back_icon_Caption[];
extern char Box19_Caption[];
extern char Box6_Caption[];
extern char Label24_Caption[];
extern char mp3_back_icon2_Caption[];
extern char Label26_Caption[];
extern char folder_icon_Caption[];
extern char file_icon_Caption[];
extern char Box17_Caption[];
extern char Label27_Caption[];
extern char Icon_back_mp3_Caption[];
extern char VolmeBar_Caption[];
extern char Image15_Caption[];
extern char ProgressBar_Caption[];
extern char Label28_Caption[];
extern char previous_icon_Caption[];
extern char pause_icon_Caption[];
extern char Play_icon_Caption[];
extern char stop_icon_Caption[];
extern char next_icon_Caption[];
extern char songlist_icon_Caption[];
extern char Label6_Caption[];
extern char Box18_Caption[];
extern char Image4_Caption[];
extern char NewScreen_Caption[];
extern char Image25_Caption[];
extern char Pen_Caption[];
extern char Image27_Caption[];
extern char Eraser_Caption[];
extern char Image29_Caption[];
extern char DrawingArea_Caption[];
extern char icon_paint_back_Caption[];
extern char Label29_Caption[];
extern char Color01_Caption[];
extern char Color02_Caption[];
extern char Color03_Caption[];
extern char Color04_Caption[];
extern char Color05_Caption[];
extern char Color06_Caption[];
extern char Color07_Caption[];
extern char Color08_Caption[];
extern char Color09_Caption[];
extern char Color10_Caption[];
extern char Color11_Caption[];
extern char Color12_Caption[];
extern char Color13_Caption[];
extern char Color14_Caption[];
extern char Color15_Caption[];
extern char Color16_Caption[];
extern char Color17_Caption[];
extern char Color18_Caption[];
extern char Color19_Caption[];
extern char Color20_Caption[];
extern char Color21_Caption[];
extern char Color22_Caption[];
extern char Color23_Caption[];
extern char Color24_Caption[];
extern char Color25_Caption[];
extern char Color26_Caption[];
extern char Color27_Caption[];
extern char Color28_Caption[];
extern char Color29_Caption[];
extern char Color30_Caption[];
extern char BackGroundColor_Caption[];
extern char Pen1_Caption[];
extern char Pen2_Caption[];
extern char Pen3_Caption[];
extern char Box7_Caption[];
extern char icon_previous_box_Caption[];
extern char Icon_next_box_Caption[];
extern char Label31_Caption[];
extern char back_slide_show_Caption[];
extern char Label32_Caption[];
extern char Label33_Caption[];
extern char icon_previous_Caption[];
extern char Icon_next_Caption[];
extern char Label35_Caption[];
extern char Slide_Active_area_Caption[];
extern char Box10_Caption[];
extern char Box11_Caption[];
extern char Box9_Caption[];
extern char Button9_Caption[];
extern char Button8_Caption[];
extern char Button7_Caption[];
extern char Button6_Caption[];
extern char Button5_Caption[];
extern char Button4_Caption[];
extern char Button3_Caption[];
extern char Button2_Caption[];
extern char Button1_Caption[];
extern char Box8_Caption[];
extern char Label36_Caption[];
extern char Image20_Caption[];
extern char Label37_Caption[];
extern char Image21_Caption[];
extern char Label38_Caption[];
extern char Label39_Caption[];
extern char XO1_Caption[];
extern char XO2_Caption[];
extern char XO3_Caption[];
extern char XO4_Caption[];
extern char XO5_Caption[];
extern char XO6_Caption[];
extern char XO7_Caption[];
extern char XO8_Caption[];
extern char XO9_Caption[];
extern char CheckBox1_Caption[];
extern char Label41_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawButton(TButton *aButton);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawCircle(TCircle *ACircle);
void DrawBox(TBox *ABox);
void DrawCheckBox(TCheckBox *ACheckBox);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/mikromedia_stm32plus_resources.h"
const code char Furro_Script38x42_Regular[];
const code char Furro_Script52x60_Regular[];
const code char Open_Sans_Light12x18_Regular[];
const code char Open_Sans_Light14x22_Regular[];
const code char Open_Sans_Light19x28_Regular[];
const code char Open_Sans_Light51x78_Regular[];
const code char Open_Sans42x61_Regular[];
const code char icon_accel_bmp[11558];
const code char icon_rgb_light_bmp[11558];
const code char icon_clock_bmp[11558];
const code char icon_time_bmp[926];
const code char icon_temp_bmp[11558];
const code char icon_mp3_player_bmp[11558];
const code char icon_paint_bmp[11558];
const code char icon_slide_show_bmp[11558];
const code char icon_tic_tac_toe_bmp[11558];
const code char icon_battery_bmp[1766];
const code char icon_back_accel_bmp[974];
const code char icon_back_rgb_bmp[974];
const code char icon_back_bmp[974];
const code char icon_sync_bmp[974];
const code char icon_ok_bmp[974];
const code char stripe_green_bmp[53286];
const code char am_pm_bmp[27186];
const code char icon_temp_sensor_bmp[4506];
const code char icon_light_sensor_BMP[4506];
const code char icon_back_sensors_bmp[974];
const code char icon_microsd_bmp[3066];
const code char icon_anim_01_bmp[558];
const code char icon_anim_02_bmp[558];
const code char icon_anim_03_bmp[558];
const code char icon_back_mp3_bmp[974];
const code char icon_folder_bmp[266];
const code char icon_mp3_file_bmp[206];
const code char icon_back_mp3_bmp_1[974];
const code char icon_volume_BMP[500];
const code char icon_prev_bmp[344];
const code char icon_pause_bmp[344];
const code char icon_play_bmp[344];
const code char icon_stop_bmp[344];
const code char icon_next_bmp[344];
const code char icon_playlist_bmp[728];
const code char icon_new_screen_selected_bmp[2054];
const code char icon_new_screen_bmp[2054];
const code char icon_brush_selected_bmp[2054];
const code char icon_brush_bmp[2054];
const code char icon_eraser_selected_bmp[2054];
const code char icon_eraser_bmp[2054];
const code char icon_fill_back_selected_bmp[2054];
const code char icon_back_paint_bmp[974];
const code char icon_fill_back_bmp[2054];
const code char icon_back_slideshow_bmp[974];
const code char icon_prev_slide_bmp[390];
const code char icon_next_slide_bmp[390];
const code char icon_back_tictactow_bmp[974];
const code char icon_new_game_bmp[654];
#line 5 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/mikromedia_STM32plus_events_code.c"
extern sfr sbit LED_R;
extern sfr sbit LED_G;
extern sfr sbit LED_B;

extern signed short Ext_fhandle;
extern char Ext_res_initialized;

extern char cACCEL_test_status;
extern char PenDown;
extern sfr sbit TFT_BLED;

void doAccel();
void ACCEL_Start(char *test);
void Accel_Stop();

void PickColor();
void RGB_Init();
void RGB_OFF();

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

void Sensors_Init();
void Sensors_Read();
void Stop_sensors();

void ScrollPress();
void ScrollOnClick();
void Stop_Scroll();

extern char MP3_Example_State;
extern signed short current_file;
void Mp3_Init();
void doMP3();
void StopMP3_File();
void GetNext_mp3_File(char Next_Previous);
void MP3_play(char *Song_Name, char File_No);
void MP3_Set_Volume(char left, char right);

void ScrollImageUp(int scroll);
void ScrollImageDown(int scroll);
void Start_Slide_Show();
extern signed short Slide_Index;
void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset);
void Slide_scroll();
void doSlide();

void ButtonClick(TButton *Butt, char No);
extern TButton *ButtonArray[];
void XO_Reset();

void checkPowerM();
extern char Display_Bat_Stat;

void Start_nRF();
void doTicTacToe();

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

char Init_FAT();

extern void Start_Ethernet();

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

char Example_State;

void Run_Example(){
 switch (Example_State) {
 case 0 : {
 checkRTC();
 checkPowerM();
 }; break;
 case 1 : {
 doAccel();
 }; break;
 case 2 : {
 if (PenDown == 0)
 doRTC_Example();
 }; break;
 case 3 : break;
 case 4 : {
 Sensors_Read();
 }; break;
 case 5 : {
 doMp3();
 }; break;
 case 6 : break;
 case 7 : {
 doSlide();
 }; break;
 case 8 : {
 doTicTacToe();
 }; break;
 }
}

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

char level = 100, old_level = 0;
void UpdateVolumeBar(char vol, char old_vol){
 unsigned int xcoo;

 xcoo = (vol*3)/4 + VolmeBar.Left;

 if (xcoo < VolmeBar.Left)
 xcoo = VolmeBar.Left;

 if (xcoo > VolmeBar.Left + VolmeBar.Width)
 xcoo = VolmeBar.Left + VolmeBar.Width;


 TFT_Set_Brush(1, 0x55FF, 0, 0, 0, 0);
 TFT_Set_Pen(0x55FF, 0);
 TFT_Rectangle(VolmeBar.Left, VolmeBar.Top, xcoo, VolmeBar.Top + VolmeBar.Height);


 TFT_Set_Brush(1, VolmeBar.Color, 0, 0, 0, 0);
 TFT_Set_Pen(VolmeBar.Color, 0);
 TFT_Rectangle(xcoo + 1, VolmeBar.Top, VolmeBar.Left + VolmeBar.Width + 1, VolmeBar.Top + VolmeBar.Height);

}





void Image2OnPress() {
 Example_State = 0;
 BLED_Fade_Out();
 Accel_Stop();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 BLED_Fade_In();
}

void Image1OnPress() {
 Example_State = 1;
 BLED_Fade_Out();
 DrawScreen(&Accelerometer);
 BLED_Fade_In();
 ACCEL_Start(&cACCEL_test_status);
}

void Image3OnPress() {
 BLED_Fade_Out();
 DrawScreen(&RGBLight);
 RGB_Init();
 Example_State = 3;
 BLED_Fade_In();

}

void Image5OnPress() {
 BLED_Fade_Out();
 RGB_OFF();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 BLED_Fade_In();
 Example_state = 0;
}

void Image4OnPress() {

}

void Image6OnClick() {
 BLED_Fade_Out();
 DrawScreen(&Clock);
 BLED_Fade_In();
 RTC_Example_init();
 Example_State = 2;
}

void Box2OnPress() {
 HoursTens();
}

void Box3OnPress() {
 HoursOnes();
}

void Box4OnPress() {
 MinutesTens();
}

void Box5OnPress() {
 MinutesOnes();
}

void ClockBackOnPress() {
 BLED_Fade_Out();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 BLED_Fade_In();
 Example_State = 0;
}

void Image8OnPress() {
 if (Set_MyRTCC() == 0)
 return;
 Example_State = 0;
 BLED_Fade_Out();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 BLED_Fade_In();
}

void BackIconSensorsOnPress() {
 Stop_sensors();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 Example_state = 0;
 BLED_Fade_In();
}

void Image9OnPress() {
 Sensors_Init();
 Example_state = 4;
 BLED_Fade_Out();
 DrawScreen(&Sensors);
 Sensors_Read();
 BLED_Fade_In();
}

void Image16OnClick() {
 BLED_Fade_Out();
 DrawScreen(&MP3_SongList);
 Mp3_Init();
 Example_state = 5;
 BLED_Fade_In();
}

void mp3_back_iconOnPress() {
 BLED_Fade_Out();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 Example_state = 0;
 BLED_Fade_In();
}

void Label22OnPress() {

}

void Image15OnPress() {
 BLED_Fade_Out();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 Example_state = 0;
 Stop_Scroll();
 BLED_Fade_In();
}

void Label24OnPress() {

}

void Box6OnPress() {
 ScrollPress();
}

void Box6OnClick() {
 ScrollOnClick();
}

void Icon_back_mp3OnClick() {
 BLED_Fade_Out();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 Example_state = 0;
 BLED_Fade_In();
}

void Label27OnPress() {

}


void DrawingAreaOnPress() {
 if ((Xcoord >= DrawingArea.Left+drawingTool.pen_size) && (Ycoord >= DrawingArea.Top+drawingTool.pen_size)){
 if (drawingTool.EraserSelected){
 TFT_Set_Pen(DrawingArea.Color, 0);
 TFT_Set_Brush(1, DrawingArea.Color, 0, 0, 0, 0);
 }
 TFT_Circle(Xcoord, Ycoord, drawingTool.pen_size);
 }
}

void Color01OnPress() {
 SelectColor(&Color01);
}

void Color02OnPress() {
 SelectColor(&Color02);
}

void Color03OnPress() {
 SelectColor(&Color03);
}

void Color04OnPress() {
 SelectColor(&Color04);
}

void Color05OnPress() {
 SelectColor(&Color05);
}

void Color06OnPress() {
 SelectColor(&Color06);
}

void Color07OnPress() {
 SelectColor(&Color07);
}

void Color08OnPress() {
 SelectColor(&Color08);
}

void Color09OnPress() {
 SelectColor(&Color09);
}

void Color10OnPress() {
 SelectColor(&Color10);
}

void Color11OnPress() {
 SelectColor(&Color11);
}

void Color12OnPress() {
 SelectColor(&Color12);
}

void Color13OnPress() {
 SelectColor(&Color13);
}

void Color14OnPress() {
 SelectColor(&Color14);
}

void Color15OnPress() {
 SelectColor(&Color15);
}

void Color16OnPress() {
 SelectColor(&Color16);
}

void Color17OnPress() {
 SelectColor(&Color17);
}

void Color18OnPress() {
 SelectColor(&Color18);
}

void Color19OnPress() {
 SelectColor(&Color19);
}

void Color20OnPress() {
 SelectColor(&Color20);
}

void Color21OnPress() {
 SelectColor(&Color21);
}

void Color22OnPress() {
 SelectColor(&Color22);
}

void Color23OnPress() {
 SelectColor(&Color23);
}

void Color24OnPress() {
 SelectColor(&Color24);
}

void Color25OnPress() {
 SelectColor(&Color25);
}

void Color26OnPress() {
 SelectColor(&Color26);
}

void Color27OnPress() {
 SelectColor(&Color27);
}

void Color28OnPress() {
 SelectColor(&Color28);
}

void Color29OnPress() {
 SelectColor(&Color29);
}

void Color30OnPress() {
 SelectColor(&Color30);
}

void Pen1OnPress() {
 if (drawingTool.CurrentPen != &Pen1){
 drawingTool.pen_size = 2;
 drawingTool.PreviousPen = drawingTool.CurrentPen;
 drawingTool.CurrentPen = &Pen1;
 UpdatePenSelection();
 }
}

void Pen2OnPress() {
 if (drawingTool.CurrentPen != &Pen2){
 drawingTool.pen_size = 3;
 drawingTool.PreviousPen = drawingTool.CurrentPen;
 drawingTool.CurrentPen = &Pen2;
 UpdatePenSelection();
 }
}

void Pen3OnPress() {
 if (drawingTool.CurrentPen != &Pen3){
 drawingTool.pen_size = 5;
 drawingTool.PreviousPen = drawingTool.CurrentPen;
 drawingTool.CurrentPen = &Pen3;
 UpdatePenSelection();
 }
}

void NewScreenOnPress() {
 DrawBox(&DrawingArea);
 UpdatePenColor();
}

void BackGroundColorOnPress() {
 DrawingArea.Color = drawingTool.CurrentColor->Color;
 DrawBox(&DrawingArea);
}

void EraserOnPress() {
 if (drawingTool.EraserSelected != 1){
 Pen.Picture_Name = icon_brush_bmp;
 DrawImage(&Pen);
 Eraser.Picture_Name = icon_eraser_selected_bmp;
 DrawImage(&Eraser);
 drawingTool.EraserSelected = 1;
 UpdatePenColor();
 }
}

void PenOnPress() {
 if (drawingTool.EraserSelected != 0){
 drawingTool.EraserSelected = 0;
 Eraser.Picture_Name = icon_eraser_bmp;
 DrawImage(&Eraser);
 Pen.Picture_Name = icon_brush_selected_bmp;
 DrawImage(&Pen);
 UpdatePenColor();
 }
}

void Image24OnPress() {
 BLED_Fade_Out();
 SetDefaults();
 DrawScreen(&Paint);
 Example_state = 6;
 BLED_Fade_In();
}

void icon_paint_backOnPress() {
 BLED_Fade_Out();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 Example_state = 0;
 BLED_Fade_In();
}

void pause_iconOnPress() {
 TFT_Set_Pen(ProgressBar.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(pause_icon.Left - 2, 220, pause_icon.Left + pause_icon.Width + 2, 243);
 MP3_Example_State = 3;
 pause_icon.Active = 0;
 Play_icon.Active = 1;
 DrawImage(&play_icon);
 TFT_Set_Pen(MP3_Player.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(pause_icon.Left - 2, 220, pause_icon.Left + pause_icon.Width + 2, 243);
}

void songlist_iconOnPress() {
 TFT_Set_Pen(ProgressBar.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(songlist_icon.Left - 2, 220, songlist_icon.Left + songlist_icon.Width + 2, 243);
 StopMP3_File();

 Example_state = 5;
 MP3_Example_State = 0;
 TFT_Set_Pen(MP3_Player.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(songlist_icon.Left - 2, 220, songlist_icon.Left + songlist_icon.Width + 2, 243);
}

void stop_iconOnDown() {
 TFT_Set_Pen(ProgressBar.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(stop_icon.Left - 2, 220, stop_icon.Left + stop_icon.Width + 2, 243);
 StopMP3_File();
 MP3_Example_State = 1;
 pause_icon.Active = 0;
 Play_icon.Active = 1;
 DrawImage(&stop_icon);
 DrawImage(&play_icon);
 TFT_Set_Pen(MP3_Player.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(stop_icon.Left - 2, 220, stop_icon.Left + stop_icon.Width + 2, 243);
}

void next_iconOnDown() {
 TFT_Set_Pen(ProgressBar.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(next_icon.Left - 2, 220, next_icon.Left + next_icon.Width + 2, 243);
 GetNext_mp3_File(1);
 DrawImage(&next_icon);
 pause_icon.Active = 1;
 Play_icon.Active = 0;
 DrawImage(&pause_icon);
 TFT_Set_Pen(MP3_Player.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(next_icon.Left - 2, 220, next_icon.Left + next_icon.Width + 2, 243);
}

void previous_iconOnDown() {
 TFT_Set_Pen(ProgressBar.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(previous_icon.Left - 2, 220, previous_icon.Left + previous_icon.Width + 2, 243);
 GetNext_mp3_File(0);
 DrawImage(&previous_icon);
 pause_icon.Active = 1;
 Play_icon.Active = 0;
 DrawImage(&pause_icon);
 TFT_Set_Pen(MP3_Player.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(previous_icon.Left - 2, 220, previous_icon.Left + previous_icon.Width + 2, 243);
}

void VolmeBarOnPress() {
 unsigned int temp;

 temp = Xcoord - VolmeBar.Left;
 temp = temp * 100;
 level = temp / VolmeBar.Width;
 MP3_Set_Volume(100 - level, 100 - level);

 UpdateVolumeBar(level, old_level);
 old_level = level;
}

void ProgreesBarOnPress() {

}

void Play_iconOnDown() {
 TFT_Set_Pen(ProgressBar.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(Play_icon.Left - 2, 220, Play_icon.Left + Play_icon.Width + 2, 243);
 pause_icon.Active = 1;
 Play_icon.Active = 0;
 if (MP3_Example_State == 1)
 MP3_play(Label28_Caption, current_file);
 MP3_Example_State = 2;
 DrawImage(&pause_icon);
 TFT_Set_Pen(MP3_Player.Color, 1);
 TFT_Set_Brush(0, 0, 0, 0, 0, 0);
 TFT_Rectangle(Play_icon.Left - 2, 220, Play_icon.Left + Play_icon.Width + 2, 243);
}

void Icon_next_boxOnPress() {
 char i;




 for (i = 0; i < 209; i ++)
 ScrollImageDown(1);
}

void icon_previous_boxOnPress() {
 char i;




 for (i = 0; i < 209; i ++)
 ScrollImageUp(1);
}

void Image18OnClick() {
 BLED_Fade_Out();
 DrawScreen(&SlideShow);
 Start_Slide_Show();
 Example_state = 7;
 ByteToStr(Slide_Index + 1, Label35_caption);
 RedrawLabel(SlideShow.Color, &Label35, 20, 30);
 BLED_Fade_In();
}

void Box7OnDown() {
 BLED_Fade_Out();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 Example_state = 0;
 Stop_Scroll();
 BLED_Fade_In();
}

void RGB_Active_areaOnPress() {
 PickColor();
}

void Box9OnPress() {
 BLED_Fade_Out();
 DrawScreen(&Home);
 Display_Bat_Stat = 1;
 checkPowerM();
 Example_state = 0;
 NVIC_IntDisable(IVT_INT_TIM5);
 BLED_Fade_In();
 LED_R = 0;
 LED_B = 0;
 LED_G = 0;
}

void Box11OnPress() {
 XO_Reset();
}

void Button1OnClick() {
 ButtonClick(ButtonArray[0], 0);
}

void Button2OnClick() {
 ButtonClick(ButtonArray[1], 1);
}

void Button3OnClick() {
 ButtonClick(ButtonArray[2], 2);
}

void Button4OnClick() {
 ButtonClick(ButtonArray[3], 3);
}

void Button5OnClick() {
 ButtonClick(ButtonArray[4], 4);
}

void Button6OnClick() {
 ButtonClick(ButtonArray[5], 5);
}

void Button7OnClick() {
 ButtonClick(ButtonArray[6], 6);
}

void Button8OnClick() {
 ButtonClick(ButtonArray[7], 7);
}

void Button9OnClick() {
 ButtonClick(ButtonArray[8], 8);
}

void Image22OnClick() {
 BLED_Fade_Out();
 DrawScreen(&Tic_Tac_Toe);
 Example_state = 8;

 GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
 Init_FAT();
 XO_Reset();
 BLED_Fade_In();
}

void Box12OnPress() {

}

void Slide_Active_areaOnPress() {
 Slide_scroll();
}

void CheckBox1OnClick() {
 Start_nRF();
}

void Box10OnClick() {
 if (CheckBox1.Checked == 0)
 CheckBox1.Checked = 1;
 else
 CheckBox1.Checked = 0;
 DrawCheckBox(&CheckBox1);
 Start_nRF();
}


void Box12OnClick() {
 Deactivate_All_Rollers();
 Start_Ethernet();
}

void Box13OnClick() {
 Deactivate_All_Rollers();
}

void Box14OnPress() {
 AmPmRun();
}
