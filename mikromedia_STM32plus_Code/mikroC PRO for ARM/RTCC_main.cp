#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
#line 1 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/mikromedia_stm32plus_objects.h"
typedef struct Screen TScreen;

typedef struct {
 unsigned int X_Min;
 unsigned int X_Max;
 unsigned int Y_Min;
 unsigned int Y_Max;
 char Rotate;
} TTPConstants;

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

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int CirclesCount;
 TCircle * const code *Circles;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
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
extern TImage Image18;
extern TLabel Label34;
extern TImage BatteryStatus;
extern TLabel * const code Screen1_Labels[8];
extern TImage * const code Screen1_Images[8];

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
extern TLabel * const code Screen9_Labels[4];
extern TImage * const code Screen9_Images[3];
extern TBox * const code Screen9_Boxes[4];

extern TScreen Boot;
extern TImage Image4;
extern TImage Image19;
extern TImage Image20;
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
extern TImage * const code Screen10_Images[22];




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
extern char Image18_Caption[];
extern char Label34_Caption[];
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
extern char Image4_Caption[];
extern char Image19_Caption[];
extern char Image20_Caption[];
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


void DrawScreen(TScreen *aScreen);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawCircle(TCircle *ACircle);
void DrawBox(TBox *ABox);
void Check_TP();
void Start_TP();
#line 1 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/mikromedia_stm32plus_resources.h"
const code char Open_Sans_Light13x16_Regular[];
const code char Open_Sans_Light16x18_Regular[];
const code char Open_Sans_Light21x24_Regular[];
const code char Open_Sans_Light58x65_Regular[];
const code char Open_Sans46x50_Regular[];
const code char icon_accel_bmp[11558];
const code char icon_rgb_light_bmp[11558];
const code char icon_clock_bmp[11558];
const code char icon_time_bmp[926];
const code char icon_temp_bmp[11558];
const code char icon_mp3_player_bmp[11558];
const code char icon_slide_show_bmp[11558];
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
const code char icon_back_slideshow_bmp[974];
const code char icon_prev_slide_bmp[390];
const code char icon_next_slide_bmp[390];
const code char img0_jpg[11233];
const code char img3_jpg[11274];
const code char img6_jpg[11601];
const code char img9_jpg[11238];
const code char img12_jpg[10927];
const code char img15_jpg[10583];
const code char img18_jpg[10211];
const code char img21_jpg[9782];
const code char img24_jpg[9199];
const code char img27_jpg[8614];
const code char img30_jpg[7878];
const code char img33_jpg[7628];
const code char img36_jpg[8015];
const code char img39_jpg[9281];
const code char img42_jpg[10162];
const code char img45_jpg[11054];
const code char img48_jpg[11818];
const code char img51_jpg[12419];
const code char img54_jpg[12917];
const code char img57_jpg[13432];
const code char img60_jpg[13360];
const code char img63_jpg[13482];
#line 1 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__time.h"
#line 27 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__time.h"
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
#line 41 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__time.h"
extern long Time_jd1970 ;
#line 46 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__time.h"
long Time_dateToEpoch(TimeStruct *ts) ;
long Time_dateDiff(TimeStruct *t1, TimeStruct *t2);
void Time_epochToDate(long e, TimeStruct *ts) ;
#line 13 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 58 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 129 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 154 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 190 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
char Roll_Get_Level(TRoller *Roller){
 Roller->currentlevel = Roller->position / (Roller->ImageHeight / Roller->levels);
 return Roller->currentlevel;
}
#line 202 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
void Roll_Set_Level(TRoller *Roller, char level){
 Roller->currentlevel = level;
 Roller->position = Roller->ImageHeight * level / Roller->levels;
}
#line 214 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 236 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 261 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
void Roller_Deactivate(TRoller *Roller, unsigned int xpos, unsigned int ypos){
char text[2];
 TFT_Set_Pen(Clock.Color, 0);
 TFT_Set_Brush(1, Clock.Color, 0, 0, 0, 0);
 TFT_Rectangle(Roller->Left, Roller->Top, Roller->Left + Roller->Width, Roller->Top + Roller->Height);
 text[0] = Roller->currentlevel + 48;
 text[1] = 0;
 TFT_Set_Font(Label15.FontName, CL_WHITE, FO_HORIZONTAL);
 if (Roller == &AmPm){
 if (Roller->currentlevel == 0)
 TFT_Write_Text("AM", xpos, ypos);
 else if (Roller->currentlevel == 1)
 TFT_Write_Text("PM", xpos, ypos);
 }
 else
 TFT_Write_Text(text, xpos, ypos);
}
#line 286 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
void Roller_Init(){
 Hour1Roll.Left = 108;
 Hour1Roll.Top = 42;
 Hour1Roll.Width = 36;
 Hour1Roll.Height = 194;
 Hour1Roll.ImageHeight = 148;
 Hour1Roll.active = 0;
 Hour1Roll.Picture_Name = stripe_green_bmp;
 Hour1Roll.position = 148 / 2 / 2;
 Hour1Roll.levels = 2;

 Hour2Roll.Left = 146;
 Hour2Roll.Top = 42;
 Hour2Roll.Width = 36;
 Hour2Roll.Height = 194;
 Hour2Roll.ImageHeight = 740;
 Hour2Roll.active = 0;
 Hour2Roll.Picture_Name = stripe_green_bmp;
 Hour2Roll.position = 740 / 10 / 2;
 Hour2Roll.levels = 10;

 Minute1Roll.Left = 212;
 Minute1Roll.Top = 42;
 Minute1Roll.Width = 36;
 Minute1Roll.Height = 194;
 Minute1Roll.ImageHeight = 444;
 Minute1Roll.active = 0;
 Minute1Roll.Picture_Name = stripe_green_bmp;
 Minute1Roll.position = 444 / 6 / 2;
 Minute1Roll.levels = 6;

 Minute2Roll.Left = 250;
 Minute2Roll.Top = 42;
 Minute2Roll.Width = 36;
 Minute2Roll.Height = 194;
 Minute2Roll.ImageHeight = 740;
 Minute2Roll.active = 0;
 Minute2Roll.Picture_Name = stripe_green_bmp;
 Minute2Roll.position = 740 / 10 / 2;
 Minute2Roll.levels = 10;

 AmPm.Left = 305;
 AmPm.Top = 42;
 AmPm.Width = 90;
 AmPm.Height = 194;
 AmPm.ImageHeight = 151;
 AmPm.Picture_Name = am_pm_bmp;
 AmPm.currentlevel = 0;
 AmPm.active = 0;
 AmPm.position = 151 / 2 / 2;
 AmPm.levels = 2;
}
#line 346 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 380 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 414 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 448 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 482 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 516 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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

void check_time_server();
#line 547 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 569 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 606 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
#line 626 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
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
 TFT_Set_Brush(1, Home.Color, 0, 0, 0, 0);
 TFT_Set_Pen(Home.Color, 0);
 TFT_Rectangle(Label19.Left, Label19.Top, Label19.Left + 60, Label19.Top + 20);
 DrawLabel(&Label19);
}

TTime OldMyTime = {0, 0, 0, 0, 0, 0};
#line 656 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/RTCC_main.c"
void checkRTC(){
 if (RTCC_Read(&MyTime)){
 if ((MyTime.minutes != OldMyTime.minutes) || (MyTime.hours != OldMyTime.hours) || (MyTime.ampm != OldMyTime.ampm)){
 UpdateTime(&MyTime);
 OldMyTime = MyTime;
 }
 }
}

extern char Time_Obtained;
extern TimeStruct my_time;
