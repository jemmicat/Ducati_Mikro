#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/mikromedia_STM32plus_driver.c"
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
#line 1 "c:/program files (x86)/mikroc pro for arm/include/built_in.h"
#line 7 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/mikromedia_STM32plus_driver.c"
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RST at GPIOF_ODR.B14;
sbit TFT_RS at GPIOF_ODR.B15;
sbit TFT_CS at GPIOF_ODR.B13;
sbit TFT_RD at GPIOF_ODR.B12;
sbit TFT_WR at GPIOF_ODR.B11;
sbit TFT_BLED at GPIOF_ODR.B10;


unsigned int Xcoord, Ycoord;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
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
 Write_to_Data_Lines( ((char *)&_data)[1] ,  ((char *)&_data)[0] );
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



 TScreen* CurrentScreen;

 TScreen Home;
 TImage Image1;
 TImage Image3;
 TLabel Label5;
char Label5_Caption[16] = "mikromedia PLUS";

 TLabel Label7;
char Label7_Caption[14] = "Accelerometer";

 TLabel Label8;
char Label8_Caption[10] = "RGB Light";

 TImage Image6;
 TLabel Label14;
char Label14_Caption[6] = "Clock";

 TImage Image10;
 TLabel Label19;
char Label19_Caption[9] = "12:56 AM";

 TImage Image9;
 TLabel Label20;
char Label20_Caption[8] = "Sensors";

 TImage Image16;
 TLabel Label25;
char Label25_Caption[11] = "MP3 Player";

 TImage Image18;
 TLabel Label34;
char Label34_Caption[11] = "Slide Show";

 TImage BatteryStatus;
 TLabel * const code Screen1_Labels[8]=
 {
 &Label5,
 &Label7,
 &Label8,
 &Label14,
 &Label19,
 &Label20,
 &Label25,
 &Label34
 };
 TImage * const code Screen1_Images[8]=
 {
 &Image1,
 &Image3,
 &Image6,
 &Image10,
 &Image9,
 &Image16,
 &Image18,
 &BatteryStatus
 };

 TScreen Accelerometer;
 TBox Box23;
 TBox Box1;
 TImage Image2;
 TLabel Label1;
char Label1_Caption[20] = "Accelerometer Graph";

 TLabel Label2;
char Label2_Caption[4] = "X: ";

 TLabel Label3;
char Label3_Caption[4] = "Y: ";

 TLabel Label4;
char Label4_Caption[4] = "Z: ";

 TLabel * const code Screen2_Labels[4]=
 {
 &Label1,
 &Label2,
 &Label3,
 &Label4
 };
 TImage * const code Screen2_Images[1]=
 {
 &Image2
 };
 TBox * const code Screen2_Boxes[2]=
 {
 &Box23,
 &Box1
 };

 TScreen RGBLight;
 TBox Box22;
 TLabel Label9;
char Label9_Caption[10] = "RGB Light";

 TImage Image5;
 TLabel Label10;
char Label10_Caption[13] = "Pick a Color";

 TCircle Circle1;
 TLabel Label11;
char Label11_Caption[4] = "R: ";

 TLabel Label12;
char Label12_Caption[4] = "G: ";

 TLabel Label13;
char Label13_Caption[4] = "B: ";

 TBox RGB_Active_area;
 TLabel * const code Screen3_Labels[5]=
 {
 &Label9,
 &Label10,
 &Label11,
 &Label12,
 &Label13
 };
 TImage * const code Screen3_Images[1]=
 {
 &Image5
 };
 TCircle * const code Screen3_Circles[1]=
 {
 &Circle1
 };
 TBox * const code Screen3_Boxes[2]=
 {
 &Box22,
 &RGB_Active_area
 };

 TScreen Clock;
 TBox Box16;
 TBox Box15;
 TBox Box13;
 TBox Box12;
 TLabel Label15;
char Label15_Caption[2] = ":";

 TBox Box2;
 TBox Box3;
 TLabel Label16;
char Label16_Caption[6] = "Clock";

 TImage ClockBack;
 TLabel Label17;
char Label17_Caption[5] = "Sync";

 TLabel Label18;
char Label18_Caption[5] = "Done";

 TImage SyncIcon;
 TImage Image8;
 TBox Box4;
 TBox Box5;
 TImage Image7;
 TLabel Label42;
char Label42_Caption[51] = " ";

 TImage Image17;
 TBox Box14;
 TLabel * const code Screen4_Labels[5]=
 {
 &Label15,
 &Label16,
 &Label17,
 &Label18,
 &Label42
 };
 TImage * const code Screen4_Images[5]=
 {
 &ClockBack,
 &SyncIcon,
 &Image8,
 &Image7,
 &Image17
 };
 TBox * const code Screen4_Boxes[9]=
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

 TScreen Sensors;
 TBox Box21;
 TBox Diagram5_Box1;
 TImage TempIcon;
 TImage LightIcon;
 TLabel Diagram5_Label1;
char Diagram5_Label1_Caption[12] = "Temperature";

 TLabel Diagram5_Label2;
char Diagram5_Label2_Caption[12] = "26.5�C";

 TLabel Diagram5_Label3;
char Diagram5_Label3_Caption[15] = "Light Intesity";

 TLabel Diagram5_Label4;
char Diagram5_Label4_Caption[9] = "96.5%";

 TLabel Diagram5_Label5;
char Diagram5_Label5_Caption[12] = "78.5�F";

 TImage BackIconSensors;
 TLabel Diagram5_Label6;
char Diagram5_Label6_Caption[8] = "Sensors";

 TLabel Label21;
char Label21_Caption[2] = "/";

 TLabel * const code Screen5_Labels[7]=
 {
 &Diagram5_Label1,
 &Diagram5_Label2,
 &Diagram5_Label3,
 &Diagram5_Label4,
 &Diagram5_Label5,
 &Diagram5_Label6,
 &Label21
 };
 TImage * const code Screen5_Images[3]=
 {
 &TempIcon,
 &LightIcon,
 &BackIconSensors
 };
 TBox * const code Screen5_Boxes[2]=
 {
 &Box21,
 &Diagram5_Box1
 };

 TScreen MP3_SD;
 TBox Box20;
 TLabel Label22;
char Label22_Caption[11] = "MP3 Player";

 TLabel Label23;
char Label23_Caption[20] = "Insert microSD card";

 TImage Image11;
 TImage Image12;
 TImage Image13;
 TImage Image14;
 TImage mp3_back_icon;
 TLabel * const code Screen6_Labels[2]=
 {
 &Label22,
 &Label23
 };
 TImage * const code Screen6_Images[5]=
 {
 &Image11,
 &Image12,
 &Image13,
 &Image14,
 &mp3_back_icon
 };
 TBox * const code Screen6_Boxes[1]=
 {
 &Box20
 };

 TScreen MP3_SongList;
 TBox Box19;
 TBox Box6;
 TLabel Label24;
char Label24_Caption[11] = "MP3 Player";

 TImage mp3_back_icon2;
 TLabel Label26;
char Label26_Caption[22] = "Choose a song to play";

 TImage folder_icon;
 TImage file_icon;
 TLabel * const code Screen7_Labels[2]=
 {
 &Label24,
 &Label26
 };
 TImage * const code Screen7_Images[3]=
 {
 &mp3_back_icon2,
 &folder_icon,
 &file_icon
 };
 TBox * const code Screen7_Boxes[2]=
 {
 &Box19,
 &Box6
 };

 TScreen MP3_Player;
 TBox Box17;
 TLabel Label27;
char Label27_Caption[11] = "MP3 Player";

 TImage Icon_back_mp3;
 TBox VolmeBar;
 TImage Image15;
 TBox ProgressBar;
 TLabel Label28;
char Label28_Caption[15] = "Song01";

 TImage previous_icon;
 TImage pause_icon;
 TImage Play_icon;
 TImage stop_icon;
 TImage next_icon;
 TImage songlist_icon;
 TLabel Label6;
char Label6_Caption[6] = "00:00";

 TLabel * const code Screen8_Labels[3]=
 {
 &Label27,
 &Label28,
 &Label6
 };
 TImage * const code Screen8_Images[8]=
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
 TBox * const code Screen8_Boxes[3]=
 {
 &Box17,
 &VolmeBar,
 &ProgressBar
 };

 TScreen SlideShow;
 TBox Box7;
 TBox icon_previous_box;
 TBox Icon_next_box;
 TLabel Label31;
char Label31_Caption[11] = "Slide Show";

 TImage back_slide_show;
 TLabel Label32;
char Label32_Caption[14] = "Slide up/down";

 TLabel Label33;
char Label33_Caption[5] = "of 8";

 TImage icon_previous;
 TImage Icon_next;
 TLabel Label35;
char Label35_Caption[6] = "  ";

 TBox Slide_Active_area;
 TLabel * const code Screen9_Labels[4]=
 {
 &Label31,
 &Label32,
 &Label33,
 &Label35
 };
 TImage * const code Screen9_Images[3]=
 {
 &back_slide_show,
 &icon_previous,
 &Icon_next
 };
 TBox * const code Screen9_Boxes[4]=
 {
 &Box7,
 &icon_previous_box,
 &Icon_next_box,
 &Slide_Active_area
 };

 TScreen Boot;
 TImage Image4;
 TImage Image19;
 TImage Image20;
 TImage Image21;
 TImage Image22;
 TImage Image23;
 TImage Image24;
 TImage Image25;
 TImage Image26;
 TImage Image27;
 TImage Image28;
 TImage Image29;
 TImage Image30;
 TImage Image31;
 TImage Image32;
 TImage Image33;
 TImage Image34;
 TImage Image35;
 TImage Image36;
 TImage Image37;
 TImage Image38;
 TImage Image39;
 TImage * const code Screen10_Images[22]=
 {
 &Image4,
 &Image19,
 &Image20,
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



static void InitializeObjects() {
 Home.Color = 0x2D33;
 Home.Width = 480;
 Home.Height = 272;
 Home.LabelsCount = 8;
 Home.Labels = Screen1_Labels;
 Home.ImagesCount = 8;
 Home.Images = Screen1_Images;
 Home.CirclesCount = 0;
 Home.BoxesCount = 0;
 Home.ObjectsCount = 16;

 Accelerometer.Color = 0x4229;
 Accelerometer.Width = 480;
 Accelerometer.Height = 272;
 Accelerometer.LabelsCount = 4;
 Accelerometer.Labels = Screen2_Labels;
 Accelerometer.ImagesCount = 1;
 Accelerometer.Images = Screen2_Images;
 Accelerometer.CirclesCount = 0;
 Accelerometer.BoxesCount = 2;
 Accelerometer.Boxes = Screen2_Boxes;
 Accelerometer.ObjectsCount = 7;

 RGBLight.Color = 0x4229;
 RGBLight.Width = 480;
 RGBLight.Height = 272;
 RGBLight.LabelsCount = 5;
 RGBLight.Labels = Screen3_Labels;
 RGBLight.ImagesCount = 1;
 RGBLight.Images = Screen3_Images;
 RGBLight.CirclesCount = 1;
 RGBLight.Circles = Screen3_Circles;
 RGBLight.BoxesCount = 2;
 RGBLight.Boxes = Screen3_Boxes;
 RGBLight.ObjectsCount = 9;

 Clock.Color = 0x54C3;
 Clock.Width = 480;
 Clock.Height = 272;
 Clock.LabelsCount = 5;
 Clock.Labels = Screen4_Labels;
 Clock.ImagesCount = 5;
 Clock.Images = Screen4_Images;
 Clock.CirclesCount = 0;
 Clock.BoxesCount = 9;
 Clock.Boxes = Screen4_Boxes;
 Clock.ObjectsCount = 19;

 Sensors.Color = 0xA948;
 Sensors.Width = 480;
 Sensors.Height = 272;
 Sensors.LabelsCount = 7;
 Sensors.Labels = Screen5_Labels;
 Sensors.ImagesCount = 3;
 Sensors.Images = Screen5_Images;
 Sensors.CirclesCount = 0;
 Sensors.BoxesCount = 2;
 Sensors.Boxes = Screen5_Boxes;
 Sensors.ObjectsCount = 12;

 MP3_SD.Color = 0x4457;
 MP3_SD.Width = 480;
 MP3_SD.Height = 272;
 MP3_SD.LabelsCount = 2;
 MP3_SD.Labels = Screen6_Labels;
 MP3_SD.ImagesCount = 5;
 MP3_SD.Images = Screen6_Images;
 MP3_SD.CirclesCount = 0;
 MP3_SD.BoxesCount = 1;
 MP3_SD.Boxes = Screen6_Boxes;
 MP3_SD.ObjectsCount = 8;

 MP3_SongList.Color = 0x4457;
 MP3_SongList.Width = 480;
 MP3_SongList.Height = 272;
 MP3_SongList.LabelsCount = 2;
 MP3_SongList.Labels = Screen7_Labels;
 MP3_SongList.ImagesCount = 3;
 MP3_SongList.Images = Screen7_Images;
 MP3_SongList.CirclesCount = 0;
 MP3_SongList.BoxesCount = 2;
 MP3_SongList.Boxes = Screen7_Boxes;
 MP3_SongList.ObjectsCount = 7;

 MP3_Player.Color = 0x4457;
 MP3_Player.Width = 480;
 MP3_Player.Height = 272;
 MP3_Player.LabelsCount = 3;
 MP3_Player.Labels = Screen8_Labels;
 MP3_Player.ImagesCount = 8;
 MP3_Player.Images = Screen8_Images;
 MP3_Player.CirclesCount = 0;
 MP3_Player.BoxesCount = 3;
 MP3_Player.Boxes = Screen8_Boxes;
 MP3_Player.ObjectsCount = 14;

 SlideShow.Color = 0x4229;
 SlideShow.Width = 480;
 SlideShow.Height = 272;
 SlideShow.LabelsCount = 4;
 SlideShow.Labels = Screen9_Labels;
 SlideShow.ImagesCount = 3;
 SlideShow.Images = Screen9_Images;
 SlideShow.CirclesCount = 0;
 SlideShow.BoxesCount = 4;
 SlideShow.Boxes = Screen9_Boxes;
 SlideShow.ObjectsCount = 11;

 Boot.Color = 0x5AEB;
 Boot.Width = 480;
 Boot.Height = 272;
 Boot.LabelsCount = 0;
 Boot.ImagesCount = 22;
 Boot.Images = Screen10_Images;
 Boot.CirclesCount = 0;
 Boot.BoxesCount = 0;
 Boot.ObjectsCount = 22;


 Image1.OwnerScreen = &Home;
 Image1.Order = 0;
 Image1.Left = 46;
 Image1.Top = 46;
 Image1.Width = 76;
 Image1.Height = 76;
 Image1.Picture_Type = 0;
 Image1.Picture_Ratio = 1;
 Image1.Picture_Name = icon_accel_bmp;
 Image1.Visible = 1;
 Image1.Active = 1;
 Image1.OnUpPtr = 0;
 Image1.OnDownPtr = 0;
 Image1.OnClickPtr = 0;
 Image1.OnPressPtr = Image1OnPress;

 Image3.OwnerScreen = &Home;
 Image3.Order = 1;
 Image3.Left = 360;
 Image3.Top = 160;
 Image3.Width = 76;
 Image3.Height = 76;
 Image3.Picture_Type = 0;
 Image3.Picture_Ratio = 1;
 Image3.Picture_Name = icon_rgb_light_bmp;
 Image3.Visible = 1;
 Image3.Active = 1;
 Image3.OnUpPtr = 0;
 Image3.OnDownPtr = 0;
 Image3.OnClickPtr = 0;
 Image3.OnPressPtr = Image3OnPress;

 Label5.OwnerScreen = &Home;
 Label5.Order = 2;
 Label5.Left = 146;
 Label5.Top = 7;
 Label5.Width = 174;
 Label5.Height = 26;
 Label5.Visible = 1;
 Label5.Active = 1;
 Label5.Caption = Label5_Caption;
 Label5.FontName = Open_Sans_Light21x24_Regular;
 Label5.Font_Color = 0xFFFF;
 Label5.OnUpPtr = 0;
 Label5.OnDownPtr = 0;
 Label5.OnClickPtr = 0;
 Label5.OnPressPtr = 0;

 Label7.OwnerScreen = &Home;
 Label7.Order = 3;
 Label7.Left = 37;
 Label7.Top = 120;
 Label7.Width = 106;
 Label7.Height = 20;
 Label7.Visible = 1;
 Label7.Active = 1;
 Label7.Caption = Label7_Caption;
 Label7.FontName = Open_Sans_Light16x18_Regular;
 Label7.Font_Color = 0xFFFF;
 Label7.OnUpPtr = 0;
 Label7.OnDownPtr = 0;
 Label7.OnClickPtr = 0;
 Label7.OnPressPtr = 0;

 Label8.OwnerScreen = &Home;
 Label8.Order = 4;
 Label8.Left = 368;
 Label8.Top = 230;
 Label8.Width = 76;
 Label8.Height = 20;
 Label8.Visible = 1;
 Label8.Active = 1;
 Label8.Caption = Label8_Caption;
 Label8.FontName = Open_Sans_Light16x18_Regular;
 Label8.Font_Color = 0xFFFF;
 Label8.OnUpPtr = 0;
 Label8.OnDownPtr = 0;
 Label8.OnClickPtr = 0;
 Label8.OnPressPtr = 0;

 Image6.OwnerScreen = &Home;
 Image6.Order = 5;
 Image6.Left = 150;
 Image6.Top = 160;
 Image6.Width = 76;
 Image6.Height = 76;
 Image6.Picture_Type = 0;
 Image6.Picture_Ratio = 1;
 Image6.Picture_Name = icon_clock_bmp;
 Image6.Visible = 1;
 Image6.Active = 1;
 Image6.OnUpPtr = 0;
 Image6.OnDownPtr = 0;
 Image6.OnClickPtr = Image6OnClick;
 Image6.OnPressPtr = 0;

 Label14.OwnerScreen = &Home;
 Label14.Order = 6;
 Label14.Left = 168;
 Label14.Top = 230;
 Label14.Width = 41;
 Label14.Height = 20;
 Label14.Visible = 1;
 Label14.Active = 1;
 Label14.Caption = Label14_Caption;
 Label14.FontName = Open_Sans_Light16x18_Regular;
 Label14.Font_Color = 0xFFFF;
 Label14.OnUpPtr = 0;
 Label14.OnDownPtr = 0;
 Label14.OnClickPtr = 0;
 Label14.OnPressPtr = 0;

 Image10.OwnerScreen = &Home;
 Image10.Order = 7;
 Image10.Left = 392;
 Image10.Top = 9;
 Image10.Width = 23;
 Image10.Height = 20;
 Image10.Picture_Type = 0;
 Image10.Picture_Ratio = 1;
 Image10.Picture_Name = icon_time_bmp;
 Image10.Visible = 1;
 Image10.Active = 1;
 Image10.OnUpPtr = 0;
 Image10.OnDownPtr = 0;
 Image10.OnClickPtr = 0;
 Image10.OnPressPtr = 0;

 Label19.OwnerScreen = &Home;
 Label19.Order = 8;
 Label19.Left = 416;
 Label19.Top = 10;
 Label19.Width = 57;
 Label19.Height = 16;
 Label19.Visible = 1;
 Label19.Active = 1;
 Label19.Caption = Label19_Caption;
 Label19.FontName = Open_Sans_Light13x16_Regular;
 Label19.Font_Color = 0xFFFF;
 Label19.OnUpPtr = 0;
 Label19.OnDownPtr = 0;
 Label19.OnClickPtr = 0;
 Label19.OnPressPtr = 0;

 Image9.OwnerScreen = &Home;
 Image9.Order = 9;
 Image9.Left = 46;
 Image9.Top = 160;
 Image9.Width = 76;
 Image9.Height = 76;
 Image9.Picture_Type = 0;
 Image9.Picture_Ratio = 1;
 Image9.Picture_Name = icon_temp_bmp;
 Image9.Visible = 1;
 Image9.Active = 1;
 Image9.OnUpPtr = 0;
 Image9.OnDownPtr = 0;
 Image9.OnClickPtr = 0;
 Image9.OnPressPtr = Image9OnPress;

 Label20.OwnerScreen = &Home;
 Label20.Order = 10;
 Label20.Left = 55;
 Label20.Top = 230;
 Label20.Width = 60;
 Label20.Height = 20;
 Label20.Visible = 1;
 Label20.Active = 1;
 Label20.Caption = Label20_Caption;
 Label20.FontName = Open_Sans_Light16x18_Regular;
 Label20.Font_Color = 0xFFFF;
 Label20.OnUpPtr = 0;
 Label20.OnDownPtr = 0;
 Label20.OnClickPtr = 0;
 Label20.OnPressPtr = 0;

 Image16.OwnerScreen = &Home;
 Image16.Order = 11;
 Image16.Left = 360;
 Image16.Top = 46;
 Image16.Width = 76;
 Image16.Height = 76;
 Image16.Picture_Type = 0;
 Image16.Picture_Ratio = 1;
 Image16.Picture_Name = icon_mp3_player_bmp;
 Image16.Visible = 1;
 Image16.Active = 1;
 Image16.OnUpPtr = 0;
 Image16.OnDownPtr = 0;
 Image16.OnClickPtr = Image16OnClick;
 Image16.OnPressPtr = 0;

 Label25.OwnerScreen = &Home;
 Label25.Order = 12;
 Label25.Left = 360;
 Label25.Top = 120;
 Label25.Width = 85;
 Label25.Height = 20;
 Label25.Visible = 1;
 Label25.Active = 1;
 Label25.Caption = Label25_Caption;
 Label25.FontName = Open_Sans_Light16x18_Regular;
 Label25.Font_Color = 0xFFFF;
 Label25.OnUpPtr = 0;
 Label25.OnDownPtr = 0;
 Label25.OnClickPtr = 0;
 Label25.OnPressPtr = 0;

 Image18.OwnerScreen = &Home;
 Image18.Order = 13;
 Image18.Left = 255;
 Image18.Top = 160;
 Image18.Width = 76;
 Image18.Height = 76;
 Image18.Picture_Type = 0;
 Image18.Picture_Ratio = 1;
 Image18.Picture_Name = icon_slide_show_bmp;
 Image18.Visible = 1;
 Image18.Active = 1;
 Image18.OnUpPtr = 0;
 Image18.OnDownPtr = 0;
 Image18.OnClickPtr = Image18OnClick;
 Image18.OnPressPtr = 0;

 Label34.OwnerScreen = &Home;
 Label34.Order = 14;
 Label34.Left = 254;
 Label34.Top = 230;
 Label34.Width = 82;
 Label34.Height = 20;
 Label34.Visible = 1;
 Label34.Active = 1;
 Label34.Caption = Label34_Caption;
 Label34.FontName = Open_Sans_Light16x18_Regular;
 Label34.Font_Color = 0xFFFF;
 Label34.OnUpPtr = 0;
 Label34.OnDownPtr = 0;
 Label34.OnClickPtr = 0;
 Label34.OnPressPtr = 0;

 BatteryStatus.OwnerScreen = &Home;
 BatteryStatus.Order = 15;
 BatteryStatus.Left = 10;
 BatteryStatus.Top = 6;
 BatteryStatus.Width = 44;
 BatteryStatus.Height = 20;
 BatteryStatus.Picture_Type = 0;
 BatteryStatus.Picture_Ratio = 1;
 BatteryStatus.Picture_Name = icon_battery_bmp;
 BatteryStatus.Visible = 1;
 BatteryStatus.Active = 0;
 BatteryStatus.OnUpPtr = 0;
 BatteryStatus.OnDownPtr = 0;
 BatteryStatus.OnClickPtr = 0;
 BatteryStatus.OnPressPtr = 0;

 Box23.OwnerScreen = &Accelerometer;
 Box23.Order = 0;
 Box23.Left = 4;
 Box23.Top = 5;
 Box23.Width = 236;
 Box23.Height = 25;
 Box23.Pen_Width = 1;
 Box23.Pen_Color = 0x0000;
 Box23.Visible = 0;
 Box23.Active = 1;
 Box23.Transparent = 1;
 Box23.Gradient = 0;
 Box23.Gradient_Orientation = 0;
 Box23.Gradient_Start_Color = 0xFFFF;
 Box23.Gradient_End_Color = 0xC618;
 Box23.Color = 0xC618;
 Box23.PressColEnabled = 0;
 Box23.Press_Color = 0xE71C;
 Box23.OnUpPtr = 0;
 Box23.OnDownPtr = 0;
 Box23.OnClickPtr = Image2OnPress;
 Box23.OnPressPtr = 0;

 Box1.OwnerScreen = &Accelerometer;
 Box1.Order = 1;
 Box1.Left = 0;
 Box1.Top = 40;
 Box1.Width = 480;
 Box1.Height = 207;
 Box1.Pen_Width = 1;
 Box1.Pen_Color = 0xFFFF;
 Box1.Visible = 1;
 Box1.Active = 1;
 Box1.Transparent = 1;
 Box1.Gradient = 0;
 Box1.Gradient_Orientation = 0;
 Box1.Gradient_Start_Color = 0xFFFF;
 Box1.Gradient_End_Color = 0xFFFF;
 Box1.Color = 0xFFFF;
 Box1.PressColEnabled = 0;
 Box1.Press_Color = 0xFFFF;
 Box1.OnUpPtr = 0;
 Box1.OnDownPtr = 0;
 Box1.OnClickPtr = 0;
 Box1.OnPressPtr = 0;

 Image2.OwnerScreen = &Accelerometer;
 Image2.Order = 2;
 Image2.Left = 5;
 Image2.Top = 6;
 Image2.Width = 22;
 Image2.Height = 22;
 Image2.Picture_Type = 0;
 Image2.Picture_Ratio = 1;
 Image2.Picture_Name = icon_back_accel_bmp;
 Image2.Visible = 1;
 Image2.Active = 0;
 Image2.OnUpPtr = 0;
 Image2.OnDownPtr = 0;
 Image2.OnClickPtr = 0;
 Image2.OnPressPtr = Image2OnPress;

 Label1.OwnerScreen = &Accelerometer;
 Label1.Order = 3;
 Label1.Left = 32;
 Label1.Top = 2;
 Label1.Width = 209;
 Label1.Height = 31;
 Label1.Visible = 1;
 Label1.Active = 0;
 Label1.Caption = Label1_Caption;
 Label1.FontName = Open_Sans_Light21x24_Regular;
 Label1.Font_Color = 0xFFFF;
 Label1.OnUpPtr = 0;
 Label1.OnDownPtr = 0;
 Label1.OnClickPtr = 0;
 Label1.OnPressPtr = 0;

 Label2.OwnerScreen = &Accelerometer;
 Label2.Order = 4;
 Label2.Left = 75;
 Label2.Top = 250;
 Label2.Width = 13;
 Label2.Height = 24;
 Label2.Visible = 1;
 Label2.Active = 1;
 Label2.Caption = Label2_Caption;
 Label2.FontName = Open_Sans_Light16x18_Regular;
 Label2.Font_Color = 0xF800;
 Label2.OnUpPtr = 0;
 Label2.OnDownPtr = 0;
 Label2.OnClickPtr = 0;
 Label2.OnPressPtr = 0;

 Label3.OwnerScreen = &Accelerometer;
 Label3.Order = 5;
 Label3.Left = 225;
 Label3.Top = 250;
 Label3.Width = 13;
 Label3.Height = 24;
 Label3.Visible = 1;
 Label3.Active = 1;
 Label3.Caption = Label3_Caption;
 Label3.FontName = Open_Sans_Light16x18_Regular;
 Label3.Font_Color = 0x001F;
 Label3.OnUpPtr = 0;
 Label3.OnDownPtr = 0;
 Label3.OnClickPtr = 0;
 Label3.OnPressPtr = 0;

 Label4.OwnerScreen = &Accelerometer;
 Label4.Order = 6;
 Label4.Left = 375;
 Label4.Top = 250;
 Label4.Width = 13;
 Label4.Height = 24;
 Label4.Visible = 1;
 Label4.Active = 1;
 Label4.Caption = Label4_Caption;
 Label4.FontName = Open_Sans_Light16x18_Regular;
 Label4.Font_Color = 0x0400;
 Label4.OnUpPtr = 0;
 Label4.OnDownPtr = 0;
 Label4.OnClickPtr = 0;
 Label4.OnPressPtr = 0;

 Box22.OwnerScreen = &RGBLight;
 Box22.Order = 0;
 Box22.Left = 5;
 Box22.Top = 4;
 Box22.Width = 126;
 Box22.Height = 25;
 Box22.Pen_Width = 1;
 Box22.Pen_Color = 0x0000;
 Box22.Visible = 0;
 Box22.Active = 1;
 Box22.Transparent = 1;
 Box22.Gradient = 0;
 Box22.Gradient_Orientation = 0;
 Box22.Gradient_Start_Color = 0xFFFF;
 Box22.Gradient_End_Color = 0xC618;
 Box22.Color = 0xC618;
 Box22.PressColEnabled = 0;
 Box22.Press_Color = 0xE71C;
 Box22.OnUpPtr = 0;
 Box22.OnDownPtr = 0;
 Box22.OnClickPtr = Image5OnPress;
 Box22.OnPressPtr = 0;

 Label9.OwnerScreen = &RGBLight;
 Label9.Order = 1;
 Label9.Left = 32;
 Label9.Top = 2;
 Label9.Width = 95;
 Label9.Height = 31;
 Label9.Visible = 1;
 Label9.Active = 0;
 Label9.Caption = Label9_Caption;
 Label9.FontName = Open_Sans_Light21x24_Regular;
 Label9.Font_Color = 0xFFFF;
 Label9.OnUpPtr = 0;
 Label9.OnDownPtr = 0;
 Label9.OnClickPtr = 0;
 Label9.OnPressPtr = 0;

 Image5.OwnerScreen = &RGBLight;
 Image5.Order = 2;
 Image5.Left = 5;
 Image5.Top = 6;
 Image5.Width = 22;
 Image5.Height = 22;
 Image5.Picture_Type = 0;
 Image5.Picture_Ratio = 1;
 Image5.Picture_Name = icon_back_rgb_bmp;
 Image5.Visible = 1;
 Image5.Active = 0;
 Image5.OnUpPtr = 0;
 Image5.OnDownPtr = 0;
 Image5.OnClickPtr = 0;
 Image5.OnPressPtr = Image5OnPress;

 Label10.OwnerScreen = &RGBLight;
 Label10.Order = 3;
 Label10.Left = 25;
 Label10.Top = 250;
 Label10.Width = 86;
 Label10.Height = 24;
 Label10.Visible = 1;
 Label10.Active = 1;
 Label10.Caption = Label10_Caption;
 Label10.FontName = Open_Sans_Light16x18_Regular;
 Label10.Font_Color = 0xFFFF;
 Label10.OnUpPtr = 0;
 Label10.OnDownPtr = 0;
 Label10.OnClickPtr = 0;
 Label10.OnPressPtr = 0;

 Circle1.OwnerScreen = &RGBLight;
 Circle1.Order = 4;
 Circle1.Left = 294;
 Circle1.Top = 252;
 Circle1.Radius = 8;
 Circle1.Pen_Width = 0;
 Circle1.Pen_Color = 0x0000;
 Circle1.Visible = 1;
 Circle1.Active = 1;
 Circle1.Transparent = 1;
 Circle1.Gradient = 0;
 Circle1.Gradient_Orientation = 0;
 Circle1.Gradient_Start_Color = 0xFFFF;
 Circle1.Gradient_End_Color = 0xC618;
 Circle1.Color = 0x0023;
 Circle1.PressColEnabled = 1;
 Circle1.Press_Color = 0x19E0;
 Circle1.OnUpPtr = 0;
 Circle1.OnDownPtr = 0;
 Circle1.OnClickPtr = 0;
 Circle1.OnPressPtr = 0;

 Label11.OwnerScreen = &RGBLight;
 Label11.Order = 5;
 Label11.Left = 325;
 Label11.Top = 250;
 Label11.Width = 14;
 Label11.Height = 24;
 Label11.Visible = 1;
 Label11.Active = 1;
 Label11.Caption = Label11_Caption;
 Label11.FontName = Open_Sans_Light16x18_Regular;
 Label11.Font_Color = 0xFFFF;
 Label11.OnUpPtr = 0;
 Label11.OnDownPtr = 0;
 Label11.OnClickPtr = 0;
 Label11.OnPressPtr = 0;

 Label12.OwnerScreen = &RGBLight;
 Label12.Order = 6;
 Label12.Left = 375;
 Label12.Top = 250;
 Label12.Width = 16;
 Label12.Height = 24;
 Label12.Visible = 1;
 Label12.Active = 1;
 Label12.Caption = Label12_Caption;
 Label12.FontName = Open_Sans_Light16x18_Regular;
 Label12.Font_Color = 0xFFFF;
 Label12.OnUpPtr = 0;
 Label12.OnDownPtr = 0;
 Label12.OnClickPtr = 0;
 Label12.OnPressPtr = 0;

 Label13.OwnerScreen = &RGBLight;
 Label13.Order = 7;
 Label13.Left = 425;
 Label13.Top = 250;
 Label13.Width = 14;
 Label13.Height = 24;
 Label13.Visible = 1;
 Label13.Active = 1;
 Label13.Caption = Label13_Caption;
 Label13.FontName = Open_Sans_Light16x18_Regular;
 Label13.Font_Color = 0xFFFF;
 Label13.OnUpPtr = 0;
 Label13.OnDownPtr = 0;
 Label13.OnClickPtr = 0;
 Label13.OnPressPtr = 0;

 RGB_Active_area.OwnerScreen = &RGBLight;
 RGB_Active_area.Order = 8;
 RGB_Active_area.Left = 0;
 RGB_Active_area.Top = 38;
 RGB_Active_area.Width = 480;
 RGB_Active_area.Height = 209;
 RGB_Active_area.Pen_Width = 1;
 RGB_Active_area.Pen_Color = 0x0000;
 RGB_Active_area.Visible = 0;
 RGB_Active_area.Active = 1;
 RGB_Active_area.Transparent = 1;
 RGB_Active_area.Gradient = 0;
 RGB_Active_area.Gradient_Orientation = 0;
 RGB_Active_area.Gradient_Start_Color = 0xFFFF;
 RGB_Active_area.Gradient_End_Color = 0xC618;
 RGB_Active_area.Color = 0xC618;
 RGB_Active_area.PressColEnabled = 0;
 RGB_Active_area.Press_Color = 0xE71C;
 RGB_Active_area.OnUpPtr = 0;
 RGB_Active_area.OnDownPtr = 0;
 RGB_Active_area.OnClickPtr = 0;
 RGB_Active_area.OnPressPtr = RGB_Active_areaOnPress;

 Box16.OwnerScreen = &Clock;
 Box16.Order = 0;
 Box16.Left = 5;
 Box16.Top = 5;
 Box16.Width = 84;
 Box16.Height = 25;
 Box16.Pen_Width = 1;
 Box16.Pen_Color = 0x0000;
 Box16.Visible = 0;
 Box16.Active = 1;
 Box16.Transparent = 1;
 Box16.Gradient = 0;
 Box16.Gradient_Orientation = 0;
 Box16.Gradient_Start_Color = 0xFFFF;
 Box16.Gradient_End_Color = 0xC618;
 Box16.Color = 0xC618;
 Box16.PressColEnabled = 0;
 Box16.Press_Color = 0xE71C;
 Box16.OnUpPtr = 0;
 Box16.OnDownPtr = 0;
 Box16.OnClickPtr = ClockBackOnPress;
 Box16.OnPressPtr = 0;

 Box15.OwnerScreen = &Clock;
 Box15.Order = 1;
 Box15.Left = 376;
 Box15.Top = 234;
 Box15.Width = 78;
 Box15.Height = 26;
 Box15.Pen_Width = 1;
 Box15.Pen_Color = 0x0000;
 Box15.Visible = 0;
 Box15.Active = 1;
 Box15.Transparent = 1;
 Box15.Gradient = 0;
 Box15.Gradient_Orientation = 0;
 Box15.Gradient_Start_Color = 0xFFFF;
 Box15.Gradient_End_Color = 0xC618;
 Box15.Color = 0xC618;
 Box15.PressColEnabled = 0;
 Box15.Press_Color = 0xE71C;
 Box15.OnUpPtr = 0;
 Box15.OnDownPtr = 0;
 Box15.OnClickPtr = Image8OnPress;
 Box15.OnPressPtr = 0;

 Box13.OwnerScreen = &Clock;
 Box13.Order = 2;
 Box13.Left = 0;
 Box13.Top = 38;
 Box13.Width = 480;
 Box13.Height = 193;
 Box13.Pen_Width = 0;
 Box13.Pen_Color = 0x0000;
 Box13.Visible = 0;
 Box13.Active = 1;
 Box13.Transparent = 1;
 Box13.Gradient = 0;
 Box13.Gradient_Orientation = 0;
 Box13.Gradient_Start_Color = 0xFFFF;
 Box13.Gradient_End_Color = 0xC618;
 Box13.Color = 0x54C3;
 Box13.PressColEnabled = 0;
 Box13.Press_Color = 0xE71C;
 Box13.OnUpPtr = 0;
 Box13.OnDownPtr = 0;
 Box13.OnClickPtr = Box13OnClick;
 Box13.OnPressPtr = 0;

 Box12.OwnerScreen = &Clock;
 Box12.Order = 3;
 Box12.Left = 280;
 Box12.Top = 235;
 Box12.Width = 68;
 Box12.Height = 25;
 Box12.Pen_Width = 1;
 Box12.Pen_Color = 0x0000;
 Box12.Visible = 0;
 Box12.Active = 1;
 Box12.Transparent = 1;
 Box12.Gradient = 0;
 Box12.Gradient_Orientation = 0;
 Box12.Gradient_Start_Color = 0xFFFF;
 Box12.Gradient_End_Color = 0xC618;
 Box12.Color = 0xC618;
 Box12.PressColEnabled = 0;
 Box12.Press_Color = 0xE71C;
 Box12.OnUpPtr = 0;
 Box12.OnDownPtr = 0;
 Box12.OnClickPtr = Box12OnClick;
 Box12.OnPressPtr = 0;

 Label15.OwnerScreen = &Clock;
 Label15.Order = 4;
 Label15.Left = 191;
 Label15.Top = 94;
 Label15.Width = 14;
 Label15.Height = 85;
 Label15.Visible = 1;
 Label15.Active = 1;
 Label15.Caption = Label15_Caption;
 Label15.FontName = Open_Sans_Light58x65_Regular;
 Label15.Font_Color = 0xFFFF;
 Label15.OnUpPtr = 0;
 Label15.OnDownPtr = 0;
 Label15.OnClickPtr = 0;
 Label15.OnPressPtr = 0;

 Box2.OwnerScreen = &Clock;
 Box2.Order = 5;
 Box2.Left = 108;
 Box2.Top = 42;
 Box2.Width = 37;
 Box2.Height = 194;
 Box2.Pen_Width = 0;
 Box2.Pen_Color = 0x0000;
 Box2.Visible = 0;
 Box2.Active = 1;
 Box2.Transparent = 0;
 Box2.Gradient = 0;
 Box2.Gradient_Orientation = 0;
 Box2.Gradient_Start_Color = 0xFFFF;
 Box2.Gradient_End_Color = 0xC618;
 Box2.Color = 0xC618;
 Box2.PressColEnabled = 1;
 Box2.Press_Color = 0xE71C;
 Box2.OnUpPtr = 0;
 Box2.OnDownPtr = 0;
 Box2.OnClickPtr = 0;
 Box2.OnPressPtr = Box2OnPress;

 Box3.OwnerScreen = &Clock;
 Box3.Order = 6;
 Box3.Left = 146;
 Box3.Top = 42;
 Box3.Width = 37;
 Box3.Height = 194;
 Box3.Pen_Width = 0;
 Box3.Pen_Color = 0x0000;
 Box3.Visible = 0;
 Box3.Active = 1;
 Box3.Transparent = 0;
 Box3.Gradient = 0;
 Box3.Gradient_Orientation = 0;
 Box3.Gradient_Start_Color = 0xFFFF;
 Box3.Gradient_End_Color = 0xC618;
 Box3.Color = 0xC618;
 Box3.PressColEnabled = 1;
 Box3.Press_Color = 0xE71C;
 Box3.OnUpPtr = 0;
 Box3.OnDownPtr = 0;
 Box3.OnClickPtr = 0;
 Box3.OnPressPtr = Box3OnPress;

 Label16.OwnerScreen = &Clock;
 Label16.Order = 7;
 Label16.Left = 32;
 Label16.Top = 2;
 Label16.Width = 52;
 Label16.Height = 31;
 Label16.Visible = 1;
 Label16.Active = 0;
 Label16.Caption = Label16_Caption;
 Label16.FontName = Open_Sans_Light21x24_Regular;
 Label16.Font_Color = 0xFFFF;
 Label16.OnUpPtr = 0;
 Label16.OnDownPtr = 0;
 Label16.OnClickPtr = 0;
 Label16.OnPressPtr = 0;

 ClockBack.OwnerScreen = &Clock;
 ClockBack.Order = 8;
 ClockBack.Left = 5;
 ClockBack.Top = 6;
 ClockBack.Width = 22;
 ClockBack.Height = 22;
 ClockBack.Picture_Type = 0;
 ClockBack.Picture_Ratio = 1;
 ClockBack.Picture_Name = icon_back_bmp;
 ClockBack.Visible = 1;
 ClockBack.Active = 0;
 ClockBack.OnUpPtr = 0;
 ClockBack.OnDownPtr = 0;
 ClockBack.OnClickPtr = 0;
 ClockBack.OnPressPtr = ClockBackOnPress;

 Label17.OwnerScreen = &Clock;
 Label17.Order = 9;
 Label17.Left = 310;
 Label17.Top = 235;
 Label17.Width = 34;
 Label17.Height = 24;
 Label17.Visible = 1;
 Label17.Active = 0;
 Label17.Caption = Label17_Caption;
 Label17.FontName = Open_Sans_Light16x18_Regular;
 Label17.Font_Color = 0xFFFF;
 Label17.OnUpPtr = 0;
 Label17.OnDownPtr = 0;
 Label17.OnClickPtr = 0;
 Label17.OnPressPtr = 0;

 Label18.OwnerScreen = &Clock;
 Label18.Order = 10;
 Label18.Left = 408;
 Label18.Top = 236;
 Label18.Width = 40;
 Label18.Height = 24;
 Label18.Visible = 1;
 Label18.Active = 0;
 Label18.Caption = Label18_Caption;
 Label18.FontName = Open_Sans_Light16x18_Regular;
 Label18.Font_Color = 0xFFFF;
 Label18.OnUpPtr = 0;
 Label18.OnDownPtr = 0;
 Label18.OnClickPtr = 0;
 Label18.OnPressPtr = 0;

 SyncIcon.OwnerScreen = &Clock;
 SyncIcon.Order = 11;
 SyncIcon.Left = 285;
 SyncIcon.Top = 236;
 SyncIcon.Width = 22;
 SyncIcon.Height = 22;
 SyncIcon.Picture_Type = 0;
 SyncIcon.Picture_Ratio = 1;
 SyncIcon.Picture_Name = icon_sync_bmp;
 SyncIcon.Visible = 1;
 SyncIcon.Active = 0;
 SyncIcon.OnUpPtr = 0;
 SyncIcon.OnDownPtr = 0;
 SyncIcon.OnClickPtr = 0;
 SyncIcon.OnPressPtr = 0;

 Image8.OwnerScreen = &Clock;
 Image8.Order = 12;
 Image8.Left = 380;
 Image8.Top = 236;
 Image8.Width = 22;
 Image8.Height = 22;
 Image8.Picture_Type = 0;
 Image8.Picture_Ratio = 1;
 Image8.Picture_Name = icon_ok_bmp;
 Image8.Visible = 1;
 Image8.Active = 0;
 Image8.OnUpPtr = 0;
 Image8.OnDownPtr = 0;
 Image8.OnClickPtr = 0;
 Image8.OnPressPtr = Image8OnPress;

 Box4.OwnerScreen = &Clock;
 Box4.Order = 13;
 Box4.Left = 212;
 Box4.Top = 42;
 Box4.Width = 37;
 Box4.Height = 194;
 Box4.Pen_Width = 0;
 Box4.Pen_Color = 0x0000;
 Box4.Visible = 0;
 Box4.Active = 1;
 Box4.Transparent = 0;
 Box4.Gradient = 0;
 Box4.Gradient_Orientation = 0;
 Box4.Gradient_Start_Color = 0xFFFF;
 Box4.Gradient_End_Color = 0xC618;
 Box4.Color = 0xC618;
 Box4.PressColEnabled = 1;
 Box4.Press_Color = 0xE71C;
 Box4.OnUpPtr = 0;
 Box4.OnDownPtr = 0;
 Box4.OnClickPtr = 0;
 Box4.OnPressPtr = Box4OnPress;

 Box5.OwnerScreen = &Clock;
 Box5.Order = 14;
 Box5.Left = 250;
 Box5.Top = 42;
 Box5.Width = 37;
 Box5.Height = 194;
 Box5.Pen_Width = 0;
 Box5.Pen_Color = 0x0000;
 Box5.Visible = 0;
 Box5.Active = 1;
 Box5.Transparent = 0;
 Box5.Gradient = 0;
 Box5.Gradient_Orientation = 0;
 Box5.Gradient_Start_Color = 0xFFFF;
 Box5.Gradient_End_Color = 0xC618;
 Box5.Color = 0xC618;
 Box5.PressColEnabled = 1;
 Box5.Press_Color = 0xE71C;
 Box5.OnUpPtr = 0;
 Box5.OnDownPtr = 0;
 Box5.OnClickPtr = 0;
 Box5.OnPressPtr = Box5OnPress;

 Image7.OwnerScreen = &Clock;
 Image7.Order = 15;
 Image7.Left = 475;
 Image7.Top = 248;
 Image7.Width = 36;
 Image7.Height = 740;
 Image7.Picture_Type = 0;
 Image7.Picture_Ratio = 1;
 Image7.Picture_Name = stripe_green_bmp;
 Image7.Visible = 0;
 Image7.Active = 0;
 Image7.OnUpPtr = 0;
 Image7.OnDownPtr = 0;
 Image7.OnClickPtr = 0;
 Image7.OnPressPtr = 0;

 Label42.OwnerScreen = &Clock;
 Label42.Order = 16;
 Label42.Left = 15;
 Label42.Top = 235;
 Label42.Width = 50;
 Label42.Height = 19;
 Label42.Visible = 1;
 Label42.Active = 0;
 Label42.Caption = Label42_Caption;
 Label42.FontName = Open_Sans_Light13x16_Regular;
 Label42.Font_Color = 0xFFFF;
 Label42.OnUpPtr = 0;
 Label42.OnDownPtr = 0;
 Label42.OnClickPtr = 0;
 Label42.OnPressPtr = 0;

 Image17.OwnerScreen = &Clock;
 Image17.Order = 17;
 Image17.Left = 474;
 Image17.Top = 17;
 Image17.Width = 90;
 Image17.Height = 151;
 Image17.Picture_Type = 0;
 Image17.Picture_Ratio = 1;
 Image17.Picture_Name = am_pm_bmp;
 Image17.Visible = 0;
 Image17.Active = 0;
 Image17.OnUpPtr = 0;
 Image17.OnDownPtr = 0;
 Image17.OnClickPtr = 0;
 Image17.OnPressPtr = 0;

 Box14.OwnerScreen = &Clock;
 Box14.Order = 18;
 Box14.Left = 305;
 Box14.Top = 42;
 Box14.Width = 90;
 Box14.Height = 194;
 Box14.Pen_Width = 0;
 Box14.Pen_Color = 0x0000;
 Box14.Visible = 0;
 Box14.Active = 1;
 Box14.Transparent = 0;
 Box14.Gradient = 0;
 Box14.Gradient_Orientation = 0;
 Box14.Gradient_Start_Color = 0xFFFF;
 Box14.Gradient_End_Color = 0xC618;
 Box14.Color = 0xC618;
 Box14.PressColEnabled = 1;
 Box14.Press_Color = 0xE71C;
 Box14.OnUpPtr = 0;
 Box14.OnDownPtr = 0;
 Box14.OnClickPtr = 0;
 Box14.OnPressPtr = Box14OnPress;

 Box21.OwnerScreen = &Sensors;
 Box21.Order = 0;
 Box21.Left = 4;
 Box21.Top = 3;
 Box21.Width = 108;
 Box21.Height = 28;
 Box21.Pen_Width = 1;
 Box21.Pen_Color = 0x0000;
 Box21.Visible = 0;
 Box21.Active = 1;
 Box21.Transparent = 1;
 Box21.Gradient = 0;
 Box21.Gradient_Orientation = 0;
 Box21.Gradient_Start_Color = 0xFFFF;
 Box21.Gradient_End_Color = 0xC618;
 Box21.Color = 0xC618;
 Box21.PressColEnabled = 0;
 Box21.Press_Color = 0xE71C;
 Box21.OnUpPtr = 0;
 Box21.OnDownPtr = 0;
 Box21.OnClickPtr = BackIconSensorsOnPress;
 Box21.OnPressPtr = 0;

 Diagram5_Box1.OwnerScreen = &Sensors;
 Diagram5_Box1.Order = 1;
 Diagram5_Box1.Left = 320;
 Diagram5_Box1.Top = 0;
 Diagram5_Box1.Width = 161;
 Diagram5_Box1.Height = 273;
 Diagram5_Box1.Pen_Width = 0;
 Diagram5_Box1.Pen_Color = 0x0000;
 Diagram5_Box1.Visible = 1;
 Diagram5_Box1.Active = 0;
 Diagram5_Box1.Transparent = 1;
 Diagram5_Box1.Gradient = 0;
 Diagram5_Box1.Gradient_Orientation = 0;
 Diagram5_Box1.Gradient_Start_Color = 0xFFFF;
 Diagram5_Box1.Gradient_End_Color = 0xC618;
 Diagram5_Box1.Color = 0x7907;
 Diagram5_Box1.PressColEnabled = 1;
 Diagram5_Box1.Press_Color = 0xE71C;
 Diagram5_Box1.OnUpPtr = 0;
 Diagram5_Box1.OnDownPtr = 0;
 Diagram5_Box1.OnClickPtr = 0;
 Diagram5_Box1.OnPressPtr = 0;

 TempIcon.OwnerScreen = &Sensors;
 TempIcon.Order = 2;
 TempIcon.Left = 138;
 TempIcon.Top = 62;
 TempIcon.Width = 45;
 TempIcon.Height = 50;
 TempIcon.Picture_Type = 0;
 TempIcon.Picture_Ratio = 1;
 TempIcon.Picture_Name = icon_temp_sensor_bmp;
 TempIcon.Visible = 1;
 TempIcon.Active = 1;
 TempIcon.OnUpPtr = 0;
 TempIcon.OnDownPtr = 0;
 TempIcon.OnClickPtr = 0;
 TempIcon.OnPressPtr = 0;

 LightIcon.OwnerScreen = &Sensors;
 LightIcon.Order = 3;
 LightIcon.Left = 377;
 LightIcon.Top = 62;
 LightIcon.Width = 45;
 LightIcon.Height = 50;
 LightIcon.Picture_Type = 0;
 LightIcon.Picture_Ratio = 1;
 LightIcon.Picture_Name = icon_light_sensor_BMP;
 LightIcon.Visible = 1;
 LightIcon.Active = 1;
 LightIcon.OnUpPtr = 0;
 LightIcon.OnDownPtr = 0;
 LightIcon.OnClickPtr = 0;
 LightIcon.OnPressPtr = 0;

 Diagram5_Label1.OwnerScreen = &Sensors;
 Diagram5_Label1.Order = 4;
 Diagram5_Label1.Left = 120;
 Diagram5_Label1.Top = 111;
 Diagram5_Label1.Width = 97;
 Diagram5_Label1.Height = 24;
 Diagram5_Label1.Visible = 1;
 Diagram5_Label1.Active = 1;
 Diagram5_Label1.Caption = Diagram5_Label1_Caption;
 Diagram5_Label1.FontName = Open_Sans_Light16x18_Regular;
 Diagram5_Label1.Font_Color = 0xFFFF;
 Diagram5_Label1.OnUpPtr = 0;
 Diagram5_Label1.OnDownPtr = 0;
 Diagram5_Label1.OnClickPtr = 0;
 Diagram5_Label1.OnPressPtr = 0;

 Diagram5_Label2.OwnerScreen = &Sensors;
 Diagram5_Label2.Order = 5;
 Diagram5_Label2.Left = 49;
 Diagram5_Label2.Top = 158;
 Diagram5_Label2.Width = 141;
 Diagram5_Label2.Height = 67;
 Diagram5_Label2.Visible = 1;
 Diagram5_Label2.Active = 1;
 Diagram5_Label2.Caption = Diagram5_Label2_Caption;
 Diagram5_Label2.FontName = Open_Sans46x50_Regular;
 Diagram5_Label2.Font_Color = 0xFFFF;
 Diagram5_Label2.OnUpPtr = 0;
 Diagram5_Label2.OnDownPtr = 0;
 Diagram5_Label2.OnClickPtr = 0;
 Diagram5_Label2.OnPressPtr = 0;

 Diagram5_Label3.OwnerScreen = &Sensors;
 Diagram5_Label3.Order = 6;
 Diagram5_Label3.Left = 358;
 Diagram5_Label3.Top = 114;
 Diagram5_Label3.Width = 93;
 Diagram5_Label3.Height = 24;
 Diagram5_Label3.Visible = 1;
 Diagram5_Label3.Active = 1;
 Diagram5_Label3.Caption = Diagram5_Label3_Caption;
 Diagram5_Label3.FontName = Open_Sans_Light16x18_Regular;
 Diagram5_Label3.Font_Color = 0xFFFF;
 Diagram5_Label3.OnUpPtr = 0;
 Diagram5_Label3.OnDownPtr = 0;
 Diagram5_Label3.OnClickPtr = 0;
 Diagram5_Label3.OnPressPtr = 0;

 Diagram5_Label4.OwnerScreen = &Sensors;
 Diagram5_Label4.Order = 7;
 Diagram5_Label4.Left = 339;
 Diagram5_Label4.Top = 158;
 Diagram5_Label4.Width = 130;
 Diagram5_Label4.Height = 67;
 Diagram5_Label4.Visible = 1;
 Diagram5_Label4.Active = 1;
 Diagram5_Label4.Caption = Diagram5_Label4_Caption;
 Diagram5_Label4.FontName = Open_Sans46x50_Regular;
 Diagram5_Label4.Font_Color = 0xFFFF;
 Diagram5_Label4.OnUpPtr = 0;
 Diagram5_Label4.OnDownPtr = 0;
 Diagram5_Label4.OnClickPtr = 0;
 Diagram5_Label4.OnPressPtr = 0;

 Diagram5_Label5.OwnerScreen = &Sensors;
 Diagram5_Label5.Order = 8;
 Diagram5_Label5.Left = 204;
 Diagram5_Label5.Top = 162;
 Diagram5_Label5.Width = 62;
 Diagram5_Label5.Height = 31;
 Diagram5_Label5.Visible = 1;
 Diagram5_Label5.Active = 1;
 Diagram5_Label5.Caption = Diagram5_Label5_Caption;
 Diagram5_Label5.FontName = Open_Sans_Light21x24_Regular;
 Diagram5_Label5.Font_Color = 0xFFFF;
 Diagram5_Label5.OnUpPtr = 0;
 Diagram5_Label5.OnDownPtr = 0;
 Diagram5_Label5.OnClickPtr = 0;
 Diagram5_Label5.OnPressPtr = 0;

 BackIconSensors.OwnerScreen = &Sensors;
 BackIconSensors.Order = 9;
 BackIconSensors.Left = 5;
 BackIconSensors.Top = 6;
 BackIconSensors.Width = 22;
 BackIconSensors.Height = 22;
 BackIconSensors.Picture_Type = 0;
 BackIconSensors.Picture_Ratio = 1;
 BackIconSensors.Picture_Name = icon_back_sensors_bmp;
 BackIconSensors.Visible = 1;
 BackIconSensors.Active = 0;
 BackIconSensors.OnUpPtr = 0;
 BackIconSensors.OnDownPtr = 0;
 BackIconSensors.OnClickPtr = 0;
 BackIconSensors.OnPressPtr = BackIconSensorsOnPress;

 Diagram5_Label6.OwnerScreen = &Sensors;
 Diagram5_Label6.Order = 10;
 Diagram5_Label6.Left = 32;
 Diagram5_Label6.Top = 2;
 Diagram5_Label6.Width = 78;
 Diagram5_Label6.Height = 31;
 Diagram5_Label6.Visible = 1;
 Diagram5_Label6.Active = 0;
 Diagram5_Label6.Caption = Diagram5_Label6_Caption;
 Diagram5_Label6.FontName = Open_Sans_Light21x24_Regular;
 Diagram5_Label6.Font_Color = 0xFFFF;
 Diagram5_Label6.OnUpPtr = 0;
 Diagram5_Label6.OnDownPtr = 0;
 Diagram5_Label6.OnClickPtr = 0;
 Diagram5_Label6.OnPressPtr = BackIconSensorsOnPress;

 Label21.OwnerScreen = &Sensors;
 Label21.Order = 11;
 Label21.Left = 192;
 Label21.Top = 161;
 Label21.Width = 7;
 Label21.Height = 31;
 Label21.Visible = 1;
 Label21.Active = 1;
 Label21.Caption = Label21_Caption;
 Label21.FontName = Open_Sans_Light21x24_Regular;
 Label21.Font_Color = 0xFFFF;
 Label21.OnUpPtr = 0;
 Label21.OnDownPtr = 0;
 Label21.OnClickPtr = 0;
 Label21.OnPressPtr = 0;

 Box20.OwnerScreen = &MP3_SD;
 Box20.Order = 0;
 Box20.Left = 5;
 Box20.Top = 4;
 Box20.Width = 138;
 Box20.Height = 27;
 Box20.Pen_Width = 1;
 Box20.Pen_Color = 0x0000;
 Box20.Visible = 0;
 Box20.Active = 1;
 Box20.Transparent = 1;
 Box20.Gradient = 0;
 Box20.Gradient_Orientation = 0;
 Box20.Gradient_Start_Color = 0xFFFF;
 Box20.Gradient_End_Color = 0xC618;
 Box20.Color = 0xC618;
 Box20.PressColEnabled = 0;
 Box20.Press_Color = 0xE71C;
 Box20.OnUpPtr = 0;
 Box20.OnDownPtr = 0;
 Box20.OnClickPtr = mp3_back_iconOnPress;
 Box20.OnPressPtr = 0;

 Label22.OwnerScreen = &MP3_SD;
 Label22.Order = 1;
 Label22.Left = 32;
 Label22.Top = 2;
 Label22.Width = 112;
 Label22.Height = 26;
 Label22.Visible = 1;
 Label22.Active = 0;
 Label22.Caption = Label22_Caption;
 Label22.FontName = Open_Sans_Light21x24_Regular;
 Label22.Font_Color = 0xFFFF;
 Label22.OnUpPtr = 0;
 Label22.OnDownPtr = 0;
 Label22.OnClickPtr = 0;
 Label22.OnPressPtr = Label22OnPress;

 Label23.OwnerScreen = &MP3_SD;
 Label23.Order = 2;
 Label23.Left = 160;
 Label23.Top = 128;
 Label23.Width = 145;
 Label23.Height = 20;
 Label23.Visible = 1;
 Label23.Active = 1;
 Label23.Caption = Label23_Caption;
 Label23.FontName = Open_Sans_Light16x18_Regular;
 Label23.Font_Color = 0xFFFF;
 Label23.OnUpPtr = 0;
 Label23.OnDownPtr = 0;
 Label23.OnClickPtr = 0;
 Label23.OnPressPtr = 0;

 Image11.OwnerScreen = &MP3_SD;
 Image11.Order = 3;
 Image11.Left = 427;
 Image11.Top = 18;
 Image11.Width = 45;
 Image11.Height = 34;
 Image11.Picture_Type = 0;
 Image11.Picture_Ratio = 1;
 Image11.Picture_Name = icon_microsd_bmp;
 Image11.Visible = 1;
 Image11.Active = 1;
 Image11.OnUpPtr = 0;
 Image11.OnDownPtr = 0;
 Image11.OnClickPtr = 0;
 Image11.OnPressPtr = 0;

 Image12.OwnerScreen = &MP3_SD;
 Image12.Order = 4;
 Image12.Left = 400;
 Image12.Top = 28;
 Image12.Width = 23;
 Image12.Height = 12;
 Image12.Picture_Type = 0;
 Image12.Picture_Ratio = 1;
 Image12.Picture_Name = icon_anim_01_bmp;
 Image12.Visible = 1;
 Image12.Active = 1;
 Image12.OnUpPtr = 0;
 Image12.OnDownPtr = 0;
 Image12.OnClickPtr = 0;
 Image12.OnPressPtr = 0;

 Image13.OwnerScreen = &MP3_SD;
 Image13.Order = 5;
 Image13.Left = 400;
 Image13.Top = 28;
 Image13.Width = 23;
 Image13.Height = 12;
 Image13.Picture_Type = 0;
 Image13.Picture_Ratio = 1;
 Image13.Picture_Name = icon_anim_02_bmp;
 Image13.Visible = 1;
 Image13.Active = 1;
 Image13.OnUpPtr = 0;
 Image13.OnDownPtr = 0;
 Image13.OnClickPtr = 0;
 Image13.OnPressPtr = 0;

 Image14.OwnerScreen = &MP3_SD;
 Image14.Order = 6;
 Image14.Left = 400;
 Image14.Top = 28;
 Image14.Width = 23;
 Image14.Height = 12;
 Image14.Picture_Type = 0;
 Image14.Picture_Ratio = 1;
 Image14.Picture_Name = icon_anim_03_bmp;
 Image14.Visible = 1;
 Image14.Active = 1;
 Image14.OnUpPtr = 0;
 Image14.OnDownPtr = 0;
 Image14.OnClickPtr = 0;
 Image14.OnPressPtr = 0;

 mp3_back_icon.OwnerScreen = &MP3_SD;
 mp3_back_icon.Order = 7;
 mp3_back_icon.Left = 5;
 mp3_back_icon.Top = 6;
 mp3_back_icon.Width = 22;
 mp3_back_icon.Height = 22;
 mp3_back_icon.Picture_Type = 0;
 mp3_back_icon.Picture_Ratio = 1;
 mp3_back_icon.Picture_Name = icon_back_mp3_bmp;
 mp3_back_icon.Visible = 1;
 mp3_back_icon.Active = 0;
 mp3_back_icon.OnUpPtr = 0;
 mp3_back_icon.OnDownPtr = 0;
 mp3_back_icon.OnClickPtr = 0;
 mp3_back_icon.OnPressPtr = mp3_back_iconOnPress;

 Box19.OwnerScreen = &MP3_SongList;
 Box19.Order = 0;
 Box19.Left = 4;
 Box19.Top = 3;
 Box19.Width = 139;
 Box19.Height = 28;
 Box19.Pen_Width = 1;
 Box19.Pen_Color = 0x0000;
 Box19.Visible = 0;
 Box19.Active = 1;
 Box19.Transparent = 1;
 Box19.Gradient = 0;
 Box19.Gradient_Orientation = 0;
 Box19.Gradient_Start_Color = 0xFFFF;
 Box19.Gradient_End_Color = 0xC618;
 Box19.Color = 0xC618;
 Box19.PressColEnabled = 0;
 Box19.Press_Color = 0xE71C;
 Box19.OnUpPtr = 0;
 Box19.OnDownPtr = 0;
 Box19.OnClickPtr = Image15OnPress;
 Box19.OnPressPtr = 0;

 Box6.OwnerScreen = &MP3_SongList;
 Box6.Order = 1;
 Box6.Left = 0;
 Box6.Top = 38;
 Box6.Width = 480;
 Box6.Height = 210;
 Box6.Pen_Width = 0;
 Box6.Pen_Color = 0x0000;
 Box6.Visible = 1;
 Box6.Active = 1;
 Box6.Transparent = 1;
 Box6.Gradient = 0;
 Box6.Gradient_Orientation = 0;
 Box6.Gradient_Start_Color = 0xFFFF;
 Box6.Gradient_End_Color = 0xC618;
 Box6.Color = 0x2B31;
 Box6.PressColEnabled = 0;
 Box6.Press_Color = 0xE71C;
 Box6.OnUpPtr = 0;
 Box6.OnDownPtr = 0;
 Box6.OnClickPtr = Box6OnClick;
 Box6.OnPressPtr = Box6OnPress;

 Label24.OwnerScreen = &MP3_SongList;
 Label24.Order = 2;
 Label24.Left = 32;
 Label24.Top = 2;
 Label24.Width = 109;
 Label24.Height = 31;
 Label24.Visible = 1;
 Label24.Active = 0;
 Label24.Caption = Label24_Caption;
 Label24.FontName = Open_Sans_Light21x24_Regular;
 Label24.Font_Color = 0xFFFF;
 Label24.OnUpPtr = 0;
 Label24.OnDownPtr = 0;
 Label24.OnClickPtr = 0;
 Label24.OnPressPtr = Label24OnPress;

 mp3_back_icon2.OwnerScreen = &MP3_SongList;
 mp3_back_icon2.Order = 3;
 mp3_back_icon2.Left = 5;
 mp3_back_icon2.Top = 6;
 mp3_back_icon2.Width = 22;
 mp3_back_icon2.Height = 22;
 mp3_back_icon2.Picture_Type = 0;
 mp3_back_icon2.Picture_Ratio = 1;
 mp3_back_icon2.Picture_Name = icon_back_mp3_bmp;
 mp3_back_icon2.Visible = 1;
 mp3_back_icon2.Active = 0;
 mp3_back_icon2.OnUpPtr = 0;
 mp3_back_icon2.OnDownPtr = 0;
 mp3_back_icon2.OnClickPtr = 0;
 mp3_back_icon2.OnPressPtr = Image15OnPress;

 Label26.OwnerScreen = &MP3_SongList;
 Label26.Order = 4;
 Label26.Left = 168;
 Label26.Top = 248;
 Label26.Width = 163;
 Label26.Height = 24;
 Label26.Visible = 1;
 Label26.Active = 1;
 Label26.Caption = Label26_Caption;
 Label26.FontName = Open_Sans_Light16x18_Regular;
 Label26.Font_Color = 0xFFFF;
 Label26.OnUpPtr = 0;
 Label26.OnDownPtr = 0;
 Label26.OnClickPtr = 0;
 Label26.OnPressPtr = 0;

 folder_icon.OwnerScreen = &MP3_SongList;
 folder_icon.Order = 5;
 folder_icon.Left = 434;
 folder_icon.Top = 22;
 folder_icon.Width = 13;
 folder_icon.Height = 10;
 folder_icon.Picture_Type = 0;
 folder_icon.Picture_Ratio = 1;
 folder_icon.Picture_Name = icon_folder_bmp;
 folder_icon.Visible = 0;
 folder_icon.Active = 0;
 folder_icon.OnUpPtr = 0;
 folder_icon.OnDownPtr = 0;
 folder_icon.OnClickPtr = 0;
 folder_icon.OnPressPtr = 0;

 file_icon.OwnerScreen = &MP3_SongList;
 file_icon.Order = 6;
 file_icon.Left = 434;
 file_icon.Top = 10;
 file_icon.Width = 10;
 file_icon.Height = 10;
 file_icon.Picture_Type = 0;
 file_icon.Picture_Ratio = 1;
 file_icon.Picture_Name = icon_mp3_file_bmp;
 file_icon.Visible = 0;
 file_icon.Active = 0;
 file_icon.OnUpPtr = 0;
 file_icon.OnDownPtr = 0;
 file_icon.OnClickPtr = 0;
 file_icon.OnPressPtr = 0;

 Box17.OwnerScreen = &MP3_Player;
 Box17.Order = 0;
 Box17.Left = 2;
 Box17.Top = 3;
 Box17.Width = 142;
 Box17.Height = 28;
 Box17.Pen_Width = 1;
 Box17.Pen_Color = 0x0000;
 Box17.Visible = 0;
 Box17.Active = 1;
 Box17.Transparent = 1;
 Box17.Gradient = 0;
 Box17.Gradient_Orientation = 0;
 Box17.Gradient_Start_Color = 0xFFFF;
 Box17.Gradient_End_Color = 0xC618;
 Box17.Color = 0xC618;
 Box17.PressColEnabled = 0;
 Box17.Press_Color = 0xE71C;
 Box17.OnUpPtr = 0;
 Box17.OnDownPtr = 0;
 Box17.OnClickPtr = Icon_back_mp3OnClick;
 Box17.OnPressPtr = 0;

 Label27.OwnerScreen = &MP3_Player;
 Label27.Order = 1;
 Label27.Left = 32;
 Label27.Top = 2;
 Label27.Width = 109;
 Label27.Height = 31;
 Label27.Visible = 1;
 Label27.Active = 0;
 Label27.Caption = Label27_Caption;
 Label27.FontName = Open_Sans_Light21x24_Regular;
 Label27.Font_Color = 0xFFFF;
 Label27.OnUpPtr = 0;
 Label27.OnDownPtr = 0;
 Label27.OnClickPtr = 0;
 Label27.OnPressPtr = Icon_back_mp3OnClick;

 Icon_back_mp3.OwnerScreen = &MP3_Player;
 Icon_back_mp3.Order = 2;
 Icon_back_mp3.Left = 5;
 Icon_back_mp3.Top = 6;
 Icon_back_mp3.Width = 22;
 Icon_back_mp3.Height = 22;
 Icon_back_mp3.Picture_Type = 0;
 Icon_back_mp3.Picture_Ratio = 1;
 Icon_back_mp3.Picture_Name = icon_back_mp3_bmp_1;
 Icon_back_mp3.Visible = 1;
 Icon_back_mp3.Active = 0;
 Icon_back_mp3.OnUpPtr = 0;
 Icon_back_mp3.OnDownPtr = 0;
 Icon_back_mp3.OnClickPtr = Icon_back_mp3OnClick;
 Icon_back_mp3.OnPressPtr = Icon_back_mp3OnClick;

 VolmeBar.OwnerScreen = &MP3_Player;
 VolmeBar.Order = 3;
 VolmeBar.Left = 399;
 VolmeBar.Top = 10;
 VolmeBar.Width = 75;
 VolmeBar.Height = 12;
 VolmeBar.Pen_Width = 0;
 VolmeBar.Pen_Color = 0x0000;
 VolmeBar.Visible = 1;
 VolmeBar.Active = 1;
 VolmeBar.Transparent = 1;
 VolmeBar.Gradient = 0;
 VolmeBar.Gradient_Orientation = 0;
 VolmeBar.Gradient_Start_Color = 0xFFFF;
 VolmeBar.Gradient_End_Color = 0xC618;
 VolmeBar.Color = 0x2B31;
 VolmeBar.PressColEnabled = 0;
 VolmeBar.Press_Color = 0xE71C;
 VolmeBar.OnUpPtr = 0;
 VolmeBar.OnDownPtr = 0;
 VolmeBar.OnClickPtr = 0;
 VolmeBar.OnPressPtr = VolmeBarOnPress;

 Image15.OwnerScreen = &MP3_Player;
 Image15.Order = 4;
 Image15.Left = 374;
 Image15.Top = 10;
 Image15.Width = 19;
 Image15.Height = 13;
 Image15.Picture_Type = 0;
 Image15.Picture_Ratio = 1;
 Image15.Picture_Name = icon_volume_BMP;
 Image15.Visible = 1;
 Image15.Active = 1;
 Image15.OnUpPtr = 0;
 Image15.OnDownPtr = 0;
 Image15.OnClickPtr = 0;
 Image15.OnPressPtr = 0;

 ProgressBar.OwnerScreen = &MP3_Player;
 ProgressBar.Order = 5;
 ProgressBar.Left = 180;
 ProgressBar.Top = 225;
 ProgressBar.Width = 250;
 ProgressBar.Height = 12;
 ProgressBar.Pen_Width = 0;
 ProgressBar.Pen_Color = 0x0000;
 ProgressBar.Visible = 1;
 ProgressBar.Active = 1;
 ProgressBar.Transparent = 1;
 ProgressBar.Gradient = 0;
 ProgressBar.Gradient_Orientation = 0;
 ProgressBar.Gradient_Start_Color = 0xFFFF;
 ProgressBar.Gradient_End_Color = 0xC618;
 ProgressBar.Color = 0x2B31;
 ProgressBar.PressColEnabled = 0;
 ProgressBar.Press_Color = 0xE71C;
 ProgressBar.OnUpPtr = 0;
 ProgressBar.OnDownPtr = 0;
 ProgressBar.OnClickPtr = 0;
 ProgressBar.OnPressPtr = ProgreesBarOnPress;

 Label28.OwnerScreen = &MP3_Player;
 Label28.Order = 6;
 Label28.Left = 209;
 Label28.Top = 171;
 Label28.Width = 73;
 Label28.Height = 31;
 Label28.Visible = 1;
 Label28.Active = 1;
 Label28.Caption = Label28_Caption;
 Label28.FontName = Open_Sans_Light21x24_Regular;
 Label28.Font_Color = 0xFFFF;
 Label28.OnUpPtr = 0;
 Label28.OnDownPtr = 0;
 Label28.OnClickPtr = 0;
 Label28.OnPressPtr = 0;

 previous_icon.OwnerScreen = &MP3_Player;
 previous_icon.Order = 7;
 previous_icon.Left = 75;
 previous_icon.Top = 224;
 previous_icon.Width = 13;
 previous_icon.Height = 13;
 previous_icon.Picture_Type = 0;
 previous_icon.Picture_Ratio = 1;
 previous_icon.Picture_Name = icon_prev_bmp;
 previous_icon.Visible = 1;
 previous_icon.Active = 1;
 previous_icon.OnUpPtr = 0;
 previous_icon.OnDownPtr = previous_iconOnDown;
 previous_icon.OnClickPtr = 0;
 previous_icon.OnPressPtr = 0;

 pause_icon.OwnerScreen = &MP3_Player;
 pause_icon.Order = 8;
 pause_icon.Left = 103;
 pause_icon.Top = 225;
 pause_icon.Width = 13;
 pause_icon.Height = 13;
 pause_icon.Picture_Type = 0;
 pause_icon.Picture_Ratio = 1;
 pause_icon.Picture_Name = icon_pause_bmp;
 pause_icon.Visible = 1;
 pause_icon.Active = 1;
 pause_icon.OnUpPtr = 0;
 pause_icon.OnDownPtr = pause_iconOnPress;
 pause_icon.OnClickPtr = pause_iconOnPress;
 pause_icon.OnPressPtr = 0;

 Play_icon.OwnerScreen = &MP3_Player;
 Play_icon.Order = 9;
 Play_icon.Left = 102;
 Play_icon.Top = 225;
 Play_icon.Width = 13;
 Play_icon.Height = 13;
 Play_icon.Picture_Type = 0;
 Play_icon.Picture_Ratio = 1;
 Play_icon.Picture_Name = icon_play_bmp;
 Play_icon.Visible = 1;
 Play_icon.Active = 0;
 Play_icon.OnUpPtr = 0;
 Play_icon.OnDownPtr = Play_iconOnDown;
 Play_icon.OnClickPtr = 0;
 Play_icon.OnPressPtr = 0;

 stop_icon.OwnerScreen = &MP3_Player;
 stop_icon.Order = 10;
 stop_icon.Left = 131;
 stop_icon.Top = 225;
 stop_icon.Width = 13;
 stop_icon.Height = 13;
 stop_icon.Picture_Type = 0;
 stop_icon.Picture_Ratio = 1;
 stop_icon.Picture_Name = icon_stop_bmp;
 stop_icon.Visible = 1;
 stop_icon.Active = 1;
 stop_icon.OnUpPtr = 0;
 stop_icon.OnDownPtr = stop_iconOnDown;
 stop_icon.OnClickPtr = 0;
 stop_icon.OnPressPtr = 0;

 next_icon.OwnerScreen = &MP3_Player;
 next_icon.Order = 11;
 next_icon.Left = 158;
 next_icon.Top = 225;
 next_icon.Width = 13;
 next_icon.Height = 13;
 next_icon.Picture_Type = 0;
 next_icon.Picture_Ratio = 1;
 next_icon.Picture_Name = icon_next_bmp;
 next_icon.Visible = 1;
 next_icon.Active = 1;
 next_icon.OnUpPtr = 0;
 next_icon.OnDownPtr = next_iconOnDown;
 next_icon.OnClickPtr = 0;
 next_icon.OnPressPtr = 0;

 songlist_icon.OwnerScreen = &MP3_Player;
 songlist_icon.Order = 12;
 songlist_icon.Left = 39;
 songlist_icon.Top = 221;
 songlist_icon.Width = 19;
 songlist_icon.Height = 19;
 songlist_icon.Picture_Type = 0;
 songlist_icon.Picture_Ratio = 1;
 songlist_icon.Picture_Name = icon_playlist_bmp;
 songlist_icon.Visible = 1;
 songlist_icon.Active = 1;
 songlist_icon.OnUpPtr = 0;
 songlist_icon.OnDownPtr = songlist_iconOnPress;
 songlist_icon.OnClickPtr = songlist_iconOnPress;
 songlist_icon.OnPressPtr = 0;

 Label6.OwnerScreen = &MP3_Player;
 Label6.Order = 13;
 Label6.Left = 432;
 Label6.Top = 221;
 Label6.Width = 34;
 Label6.Height = 19;
 Label6.Visible = 1;
 Label6.Active = 1;
 Label6.Caption = Label6_Caption;
 Label6.FontName = Open_Sans_Light13x16_Regular;
 Label6.Font_Color = 0xFFFF;
 Label6.OnUpPtr = 0;
 Label6.OnDownPtr = 0;
 Label6.OnClickPtr = 0;
 Label6.OnPressPtr = 0;

 Box7.OwnerScreen = &SlideShow;
 Box7.Order = 0;
 Box7.Left = 0;
 Box7.Top = 0;
 Box7.Width = 140;
 Box7.Height = 30;
 Box7.Pen_Width = 1;
 Box7.Pen_Color = 0x0000;
 Box7.Visible = 0;
 Box7.Active = 1;
 Box7.Transparent = 1;
 Box7.Gradient = 0;
 Box7.Gradient_Orientation = 0;
 Box7.Gradient_Start_Color = 0xFFFF;
 Box7.Gradient_End_Color = 0xC618;
 Box7.Color = 0xC618;
 Box7.PressColEnabled = 0;
 Box7.Press_Color = 0xE71C;
 Box7.OnUpPtr = 0;
 Box7.OnDownPtr = Box7OnDown;
 Box7.OnClickPtr = 0;
 Box7.OnPressPtr = 0;

 icon_previous_box.OwnerScreen = &SlideShow;
 icon_previous_box.Order = 1;
 icon_previous_box.Left = 244;
 icon_previous_box.Top = 244;
 icon_previous_box.Width = 30;
 icon_previous_box.Height = 23;
 icon_previous_box.Pen_Width = 1;
 icon_previous_box.Pen_Color = 0x0000;
 icon_previous_box.Visible = 0;
 icon_previous_box.Active = 1;
 icon_previous_box.Transparent = 1;
 icon_previous_box.Gradient = 0;
 icon_previous_box.Gradient_Orientation = 0;
 icon_previous_box.Gradient_Start_Color = 0xFFFF;
 icon_previous_box.Gradient_End_Color = 0xC618;
 icon_previous_box.Color = 0xC618;
 icon_previous_box.PressColEnabled = 0;
 icon_previous_box.Press_Color = 0xE71C;
 icon_previous_box.OnUpPtr = 0;
 icon_previous_box.OnDownPtr = 0;
 icon_previous_box.OnClickPtr = 0;
 icon_previous_box.OnPressPtr = icon_previous_boxOnPress;

 Icon_next_box.OwnerScreen = &SlideShow;
 Icon_next_box.Order = 2;
 Icon_next_box.Left = 206;
 Icon_next_box.Top = 244;
 Icon_next_box.Width = 30;
 Icon_next_box.Height = 23;
 Icon_next_box.Pen_Width = 1;
 Icon_next_box.Pen_Color = 0x0000;
 Icon_next_box.Visible = 0;
 Icon_next_box.Active = 1;
 Icon_next_box.Transparent = 1;
 Icon_next_box.Gradient = 0;
 Icon_next_box.Gradient_Orientation = 0;
 Icon_next_box.Gradient_Start_Color = 0xFFFF;
 Icon_next_box.Gradient_End_Color = 0xC618;
 Icon_next_box.Color = 0xC618;
 Icon_next_box.PressColEnabled = 0;
 Icon_next_box.Press_Color = 0xE71C;
 Icon_next_box.OnUpPtr = 0;
 Icon_next_box.OnDownPtr = 0;
 Icon_next_box.OnClickPtr = 0;
 Icon_next_box.OnPressPtr = Icon_next_boxOnPress;

 Label31.OwnerScreen = &SlideShow;
 Label31.Order = 3;
 Label31.Left = 32;
 Label31.Top = 2;
 Label31.Width = 108;
 Label31.Height = 26;
 Label31.Visible = 1;
 Label31.Active = 0;
 Label31.Caption = Label31_Caption;
 Label31.FontName = Open_Sans_Light21x24_Regular;
 Label31.Font_Color = 0xFFFF;
 Label31.OnUpPtr = 0;
 Label31.OnDownPtr = 0;
 Label31.OnClickPtr = 0;
 Label31.OnPressPtr = 0;

 back_slide_show.OwnerScreen = &SlideShow;
 back_slide_show.Order = 4;
 back_slide_show.Left = 5;
 back_slide_show.Top = 6;
 back_slide_show.Width = 22;
 back_slide_show.Height = 22;
 back_slide_show.Picture_Type = 0;
 back_slide_show.Picture_Ratio = 1;
 back_slide_show.Picture_Name = icon_back_slideshow_bmp;
 back_slide_show.Visible = 1;
 back_slide_show.Active = 0;
 back_slide_show.OnUpPtr = 0;
 back_slide_show.OnDownPtr = 0;
 back_slide_show.OnClickPtr = 0;
 back_slide_show.OnPressPtr = 0;

 Label32.OwnerScreen = &SlideShow;
 Label32.Order = 5;
 Label32.Left = 9;
 Label32.Top = 249;
 Label32.Width = 104;
 Label32.Height = 20;
 Label32.Visible = 1;
 Label32.Active = 1;
 Label32.Caption = Label32_Caption;
 Label32.FontName = Open_Sans_Light16x18_Regular;
 Label32.Font_Color = 0xFFFF;
 Label32.OnUpPtr = 0;
 Label32.OnDownPtr = 0;
 Label32.OnClickPtr = 0;
 Label32.OnPressPtr = 0;

 Label33.OwnerScreen = &SlideShow;
 Label33.Order = 6;
 Label33.Left = 432;
 Label33.Top = 249;
 Label33.Width = 28;
 Label33.Height = 24;
 Label33.Visible = 1;
 Label33.Active = 1;
 Label33.Caption = Label33_Caption;
 Label33.FontName = Open_Sans_Light16x18_Regular;
 Label33.Font_Color = 0xFFFF;
 Label33.OnUpPtr = 0;
 Label33.OnDownPtr = 0;
 Label33.OnClickPtr = 0;
 Label33.OnPressPtr = 0;

 icon_previous.OwnerScreen = &SlideShow;
 icon_previous.Order = 7;
 icon_previous.Left = 248;
 icon_previous.Top = 253;
 icon_previous.Width = 16;
 icon_previous.Height = 12;
 icon_previous.Picture_Type = 0;
 icon_previous.Picture_Ratio = 1;
 icon_previous.Picture_Name = icon_prev_slide_bmp;
 icon_previous.Visible = 1;
 icon_previous.Active = 0;
 icon_previous.OnUpPtr = 0;
 icon_previous.OnDownPtr = 0;
 icon_previous.OnClickPtr = 0;
 icon_previous.OnPressPtr = 0;

 Icon_next.OwnerScreen = &SlideShow;
 Icon_next.Order = 8;
 Icon_next.Left = 216;
 Icon_next.Top = 253;
 Icon_next.Width = 16;
 Icon_next.Height = 12;
 Icon_next.Picture_Type = 0;
 Icon_next.Picture_Ratio = 1;
 Icon_next.Picture_Name = icon_next_slide_bmp;
 Icon_next.Visible = 1;
 Icon_next.Active = 0;
 Icon_next.OnUpPtr = 0;
 Icon_next.OnDownPtr = 0;
 Icon_next.OnClickPtr = 0;
 Icon_next.OnPressPtr = 0;

 Label35.OwnerScreen = &SlideShow;
 Label35.Order = 9;
 Label35.Left = 410;
 Label35.Top = 249;
 Label35.Width = 0;
 Label35.Height = 24;
 Label35.Visible = 1;
 Label35.Active = 1;
 Label35.Caption = Label35_Caption;
 Label35.FontName = Open_Sans_Light16x18_Regular;
 Label35.Font_Color = 0xFFFF;
 Label35.OnUpPtr = 0;
 Label35.OnDownPtr = 0;
 Label35.OnClickPtr = 0;
 Label35.OnPressPtr = 0;

 Slide_Active_area.OwnerScreen = &SlideShow;
 Slide_Active_area.Order = 10;
 Slide_Active_area.Left = 0;
 Slide_Active_area.Top = 38;
 Slide_Active_area.Width = 480;
 Slide_Active_area.Height = 209;
 Slide_Active_area.Pen_Width = 1;
 Slide_Active_area.Pen_Color = 0x0000;
 Slide_Active_area.Visible = 0;
 Slide_Active_area.Active = 1;
 Slide_Active_area.Transparent = 1;
 Slide_Active_area.Gradient = 0;
 Slide_Active_area.Gradient_Orientation = 0;
 Slide_Active_area.Gradient_Start_Color = 0xFFFF;
 Slide_Active_area.Gradient_End_Color = 0xC618;
 Slide_Active_area.Color = 0xC618;
 Slide_Active_area.PressColEnabled = 0;
 Slide_Active_area.Press_Color = 0xE71C;
 Slide_Active_area.OnUpPtr = 0;
 Slide_Active_area.OnDownPtr = 0;
 Slide_Active_area.OnClickPtr = 0;
 Slide_Active_area.OnPressPtr = Slide_Active_areaOnPress;

 Image4.OwnerScreen = &Boot;
 Image4.Order = 0;
 Image4.Left = 0;
 Image4.Top = 0;
 Image4.Width = 480;
 Image4.Height = 272;
 Image4.Picture_Type = 1;
 Image4.Picture_Ratio = 1;
 Image4.Picture_Name = img0_jpg;
 Image4.Visible = 1;
 Image4.Active = 1;
 Image4.OnUpPtr = 0;
 Image4.OnDownPtr = 0;
 Image4.OnClickPtr = 0;
 Image4.OnPressPtr = 0;

 Image19.OwnerScreen = &Boot;
 Image19.Order = 1;
 Image19.Left = 0;
 Image19.Top = 0;
 Image19.Width = 480;
 Image19.Height = 272;
 Image19.Picture_Type = 1;
 Image19.Picture_Ratio = 1;
 Image19.Picture_Name = img3_jpg;
 Image19.Visible = 1;
 Image19.Active = 1;
 Image19.OnUpPtr = 0;
 Image19.OnDownPtr = 0;
 Image19.OnClickPtr = 0;
 Image19.OnPressPtr = 0;

 Image20.OwnerScreen = &Boot;
 Image20.Order = 2;
 Image20.Left = 0;
 Image20.Top = 0;
 Image20.Width = 480;
 Image20.Height = 272;
 Image20.Picture_Type = 1;
 Image20.Picture_Ratio = 1;
 Image20.Picture_Name = img6_jpg;
 Image20.Visible = 1;
 Image20.Active = 1;
 Image20.OnUpPtr = 0;
 Image20.OnDownPtr = 0;
 Image20.OnClickPtr = 0;
 Image20.OnPressPtr = 0;

 Image21.OwnerScreen = &Boot;
 Image21.Order = 3;
 Image21.Left = 0;
 Image21.Top = 0;
 Image21.Width = 480;
 Image21.Height = 272;
 Image21.Picture_Type = 1;
 Image21.Picture_Ratio = 1;
 Image21.Picture_Name = img9_jpg;
 Image21.Visible = 1;
 Image21.Active = 1;
 Image21.OnUpPtr = 0;
 Image21.OnDownPtr = 0;
 Image21.OnClickPtr = 0;
 Image21.OnPressPtr = 0;

 Image22.OwnerScreen = &Boot;
 Image22.Order = 4;
 Image22.Left = 0;
 Image22.Top = 0;
 Image22.Width = 480;
 Image22.Height = 272;
 Image22.Picture_Type = 1;
 Image22.Picture_Ratio = 1;
 Image22.Picture_Name = img12_jpg;
 Image22.Visible = 1;
 Image22.Active = 1;
 Image22.OnUpPtr = 0;
 Image22.OnDownPtr = 0;
 Image22.OnClickPtr = 0;
 Image22.OnPressPtr = 0;

 Image23.OwnerScreen = &Boot;
 Image23.Order = 5;
 Image23.Left = 0;
 Image23.Top = 0;
 Image23.Width = 480;
 Image23.Height = 272;
 Image23.Picture_Type = 1;
 Image23.Picture_Ratio = 1;
 Image23.Picture_Name = img15_jpg;
 Image23.Visible = 1;
 Image23.Active = 1;
 Image23.OnUpPtr = 0;
 Image23.OnDownPtr = 0;
 Image23.OnClickPtr = 0;
 Image23.OnPressPtr = 0;

 Image24.OwnerScreen = &Boot;
 Image24.Order = 6;
 Image24.Left = 0;
 Image24.Top = 0;
 Image24.Width = 480;
 Image24.Height = 272;
 Image24.Picture_Type = 1;
 Image24.Picture_Ratio = 1;
 Image24.Picture_Name = img18_jpg;
 Image24.Visible = 1;
 Image24.Active = 1;
 Image24.OnUpPtr = 0;
 Image24.OnDownPtr = 0;
 Image24.OnClickPtr = 0;
 Image24.OnPressPtr = 0;

 Image25.OwnerScreen = &Boot;
 Image25.Order = 7;
 Image25.Left = 0;
 Image25.Top = 0;
 Image25.Width = 480;
 Image25.Height = 272;
 Image25.Picture_Type = 1;
 Image25.Picture_Ratio = 1;
 Image25.Picture_Name = img21_jpg;
 Image25.Visible = 1;
 Image25.Active = 1;
 Image25.OnUpPtr = 0;
 Image25.OnDownPtr = 0;
 Image25.OnClickPtr = 0;
 Image25.OnPressPtr = 0;

 Image26.OwnerScreen = &Boot;
 Image26.Order = 8;
 Image26.Left = 0;
 Image26.Top = 0;
 Image26.Width = 480;
 Image26.Height = 272;
 Image26.Picture_Type = 1;
 Image26.Picture_Ratio = 1;
 Image26.Picture_Name = img24_jpg;
 Image26.Visible = 1;
 Image26.Active = 1;
 Image26.OnUpPtr = 0;
 Image26.OnDownPtr = 0;
 Image26.OnClickPtr = 0;
 Image26.OnPressPtr = 0;

 Image27.OwnerScreen = &Boot;
 Image27.Order = 9;
 Image27.Left = 0;
 Image27.Top = 0;
 Image27.Width = 480;
 Image27.Height = 272;
 Image27.Picture_Type = 1;
 Image27.Picture_Ratio = 1;
 Image27.Picture_Name = img27_jpg;
 Image27.Visible = 1;
 Image27.Active = 1;
 Image27.OnUpPtr = 0;
 Image27.OnDownPtr = 0;
 Image27.OnClickPtr = 0;
 Image27.OnPressPtr = 0;

 Image28.OwnerScreen = &Boot;
 Image28.Order = 10;
 Image28.Left = 0;
 Image28.Top = 0;
 Image28.Width = 480;
 Image28.Height = 272;
 Image28.Picture_Type = 1;
 Image28.Picture_Ratio = 1;
 Image28.Picture_Name = img30_jpg;
 Image28.Visible = 1;
 Image28.Active = 1;
 Image28.OnUpPtr = 0;
 Image28.OnDownPtr = 0;
 Image28.OnClickPtr = 0;
 Image28.OnPressPtr = 0;

 Image29.OwnerScreen = &Boot;
 Image29.Order = 11;
 Image29.Left = 0;
 Image29.Top = 0;
 Image29.Width = 480;
 Image29.Height = 272;
 Image29.Picture_Type = 1;
 Image29.Picture_Ratio = 1;
 Image29.Picture_Name = img33_jpg;
 Image29.Visible = 1;
 Image29.Active = 1;
 Image29.OnUpPtr = 0;
 Image29.OnDownPtr = 0;
 Image29.OnClickPtr = 0;
 Image29.OnPressPtr = 0;

 Image30.OwnerScreen = &Boot;
 Image30.Order = 12;
 Image30.Left = 0;
 Image30.Top = 0;
 Image30.Width = 480;
 Image30.Height = 272;
 Image30.Picture_Type = 1;
 Image30.Picture_Ratio = 1;
 Image30.Picture_Name = img36_jpg;
 Image30.Visible = 1;
 Image30.Active = 1;
 Image30.OnUpPtr = 0;
 Image30.OnDownPtr = 0;
 Image30.OnClickPtr = 0;
 Image30.OnPressPtr = 0;

 Image31.OwnerScreen = &Boot;
 Image31.Order = 13;
 Image31.Left = 0;
 Image31.Top = 0;
 Image31.Width = 480;
 Image31.Height = 272;
 Image31.Picture_Type = 1;
 Image31.Picture_Ratio = 1;
 Image31.Picture_Name = img39_jpg;
 Image31.Visible = 1;
 Image31.Active = 1;
 Image31.OnUpPtr = 0;
 Image31.OnDownPtr = 0;
 Image31.OnClickPtr = 0;
 Image31.OnPressPtr = 0;

 Image32.OwnerScreen = &Boot;
 Image32.Order = 14;
 Image32.Left = 0;
 Image32.Top = 0;
 Image32.Width = 480;
 Image32.Height = 272;
 Image32.Picture_Type = 1;
 Image32.Picture_Ratio = 1;
 Image32.Picture_Name = img42_jpg;
 Image32.Visible = 1;
 Image32.Active = 1;
 Image32.OnUpPtr = 0;
 Image32.OnDownPtr = 0;
 Image32.OnClickPtr = 0;
 Image32.OnPressPtr = 0;

 Image33.OwnerScreen = &Boot;
 Image33.Order = 15;
 Image33.Left = 0;
 Image33.Top = 0;
 Image33.Width = 480;
 Image33.Height = 272;
 Image33.Picture_Type = 1;
 Image33.Picture_Ratio = 1;
 Image33.Picture_Name = img45_jpg;
 Image33.Visible = 1;
 Image33.Active = 1;
 Image33.OnUpPtr = 0;
 Image33.OnDownPtr = 0;
 Image33.OnClickPtr = 0;
 Image33.OnPressPtr = 0;

 Image34.OwnerScreen = &Boot;
 Image34.Order = 16;
 Image34.Left = 0;
 Image34.Top = 0;
 Image34.Width = 480;
 Image34.Height = 272;
 Image34.Picture_Type = 1;
 Image34.Picture_Ratio = 1;
 Image34.Picture_Name = img48_jpg;
 Image34.Visible = 1;
 Image34.Active = 1;
 Image34.OnUpPtr = 0;
 Image34.OnDownPtr = 0;
 Image34.OnClickPtr = 0;
 Image34.OnPressPtr = 0;

 Image35.OwnerScreen = &Boot;
 Image35.Order = 17;
 Image35.Left = 0;
 Image35.Top = 0;
 Image35.Width = 480;
 Image35.Height = 272;
 Image35.Picture_Type = 1;
 Image35.Picture_Ratio = 1;
 Image35.Picture_Name = img51_jpg;
 Image35.Visible = 1;
 Image35.Active = 1;
 Image35.OnUpPtr = 0;
 Image35.OnDownPtr = 0;
 Image35.OnClickPtr = 0;
 Image35.OnPressPtr = 0;

 Image36.OwnerScreen = &Boot;
 Image36.Order = 18;
 Image36.Left = 0;
 Image36.Top = 0;
 Image36.Width = 480;
 Image36.Height = 272;
 Image36.Picture_Type = 1;
 Image36.Picture_Ratio = 1;
 Image36.Picture_Name = img54_jpg;
 Image36.Visible = 1;
 Image36.Active = 1;
 Image36.OnUpPtr = 0;
 Image36.OnDownPtr = 0;
 Image36.OnClickPtr = 0;
 Image36.OnPressPtr = 0;

 Image37.OwnerScreen = &Boot;
 Image37.Order = 19;
 Image37.Left = 0;
 Image37.Top = 0;
 Image37.Width = 480;
 Image37.Height = 272;
 Image37.Picture_Type = 1;
 Image37.Picture_Ratio = 1;
 Image37.Picture_Name = img57_jpg;
 Image37.Visible = 1;
 Image37.Active = 1;
 Image37.OnUpPtr = 0;
 Image37.OnDownPtr = 0;
 Image37.OnClickPtr = 0;
 Image37.OnPressPtr = 0;

 Image38.OwnerScreen = &Boot;
 Image38.Order = 20;
 Image38.Left = 0;
 Image38.Top = 0;
 Image38.Width = 480;
 Image38.Height = 272;
 Image38.Picture_Type = 1;
 Image38.Picture_Ratio = 1;
 Image38.Picture_Name = img60_jpg;
 Image38.Visible = 1;
 Image38.Active = 1;
 Image38.OnUpPtr = 0;
 Image38.OnDownPtr = 0;
 Image38.OnClickPtr = 0;
 Image38.OnPressPtr = 0;

 Image39.OwnerScreen = &Boot;
 Image39.Order = 21;
 Image39.Left = 0;
 Image39.Top = 0;
 Image39.Width = 480;
 Image39.Height = 272;
 Image39.Picture_Type = 1;
 Image39.Picture_Ratio = 1;
 Image39.Picture_Name = img63_jpg;
 Image39.Visible = 1;
 Image39.Active = 1;
 Image39.OnUpPtr = 0;
 Image39.OnDownPtr = 0;
 Image39.OnClickPtr = 0;
 Image39.OnPressPtr = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}








void DrawLabel(TLabel *ALabel) {
 if (ALabel->Visible == 1) {
 TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawImage(TImage *AImage) {
 if (AImage->Visible) {
 if (AImage->Picture_Type == 0)
 TFT_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
 if (AImage->Picture_Type == 1)
 TFT_Image_Jpeg(AImage->Left, AImage->Top, AImage->Picture_Name);
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

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
 unsigned short label_idx;
 TLabel *local_label;
 unsigned short image_idx;
 TImage *local_image;
 unsigned short circle_idx;
 TCircle *local_circle;
 unsigned short box_idx;
 TBox *local_box;
 char save_bled, save_bled_direction;

 object_pressed = 0;
 order = 0;
 label_idx = 0;
 image_idx = 0;
 circle_idx = 0;
 box_idx = 0;
 CurrentScreen = aScreen;

 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 save_bled = TFT_BLED;
 TFT_BLED = 0;
 TFT_Set_Active(&TFT_mikromedia_Set_Index, &TFT_mikromedia_Write_Command, &TFT_Write_to_16bitPort);
 TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
 TFT_Set_DBC_SSD1963(255);
 STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
 TFT_Fill_Screen(CurrentScreen->Color);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 TFT_BLED = save_bled;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
 if (label_idx < CurrentScreen->LabelsCount) {
 local_label =  CurrentScreen->Labels[label_idx] ;
 if (order == local_label->Order) {
 label_idx++;
 order++;
 DrawLabel(local_label);
 }
 }

 if (circle_idx < CurrentScreen->CirclesCount) {
 local_circle =  CurrentScreen->Circles[circle_idx] ;
 if (order == local_circle->Order) {
 circle_idx++;
 order++;
 DrawCircle(local_circle);
 }
 }

 if (box_idx < CurrentScreen->BoxesCount) {
 local_box =  CurrentScreen->Boxes[box_idx] ;
 if (order == local_box->Order) {
 box_idx++;
 order++;
 DrawBox(local_box);
 }
 }

 if (image_idx < CurrentScreen->ImagesCount) {
 local_image =  CurrentScreen->Images[image_idx] ;
 if (order == local_image->Order) {
 image_idx++;
 order++;
 DrawImage(local_image);
 }
 }

 }
}

void Get_Object(unsigned int X, unsigned int Y) {
 label_order = -1;
 image_order = -1;
 circle_order = -1;
 box_order = -1;

 for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
 local_label =  CurrentScreen->Labels[_object_count] ;
 if (local_label->Active == 1) {
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 label_order = local_label->Order;
 exec_label = local_label;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
 local_image =  CurrentScreen->Images[_object_count] ;
 if (local_image->Active == 1) {
 if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
 local_image->Width, local_image->Height) == 1) {
 image_order = local_image->Order;
 exec_image = local_image;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
 local_circle =  CurrentScreen->Circles[_object_count] ;
 if (local_circle->Active == 1) {
 if (IsInsideObject(X, Y, local_circle->Left, local_circle->Top,
 (local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
 circle_order = local_circle->Order;
 exec_circle = local_circle;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
 local_box =  CurrentScreen->Boxes[_object_count] ;
 if (local_box->Active == 1) {
 if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
 local_box->Width, local_box->Height) == 1) {
 box_order = local_box->Order;
 exec_box = local_box;
 }
 }
 }

 _object_count = -1;
 if (label_order > _object_count )
 _object_count = label_order;
 if (image_order > _object_count )
 _object_count = image_order;
 if (circle_order > _object_count )
 _object_count = circle_order;
 if (box_order > _object_count )
 _object_count = box_order;
}


static void Process_TP_Press(unsigned int X, unsigned int Y) {
 exec_label = 0;
 exec_image = 0;
 exec_circle = 0;
 exec_box = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
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

 }
}

static void Process_TP_Up(unsigned int X, unsigned int Y) {

 switch (PressedObjectType) {

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
 }

 exec_label = 0;
 exec_image = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {

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

 }
 PressedObject = 0;
 PressedObjectType = -1;
}

static void Process_TP_Down(unsigned int X, unsigned int Y) {

 object_pressed = 0;
 exec_label = 0;
 exec_image = 0;
 exec_circle = 0;
 exec_box = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
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

 }
}

void Check_TP() {
 if (STMPE610_PressDetect()) {

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
char _cnt;
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
 for (_cnt = 0; _cnt < 20; _cnt++) {
 GPIOB_ODR.B6 = 0;
 Delay_ms(1);
 GPIOB_ODR.B6 = 1;
 Delay_ms(1);
 }

 GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_1);
 for (_cnt = 0; _cnt < 20; _cnt++) {
 GPIOB_ODR.B1 = 0;
 Delay_ms(1);
 GPIOB_ODR.B1 = 1;
 Delay_ms(1);
 }

 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_I2C2_PF01);


 I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
 I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C2_PF01);
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
 STMPE610_SetGPIOPin(STMPE610_GPIO_PIN1, 0);
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
 STMPE610_SetTouchPressureThreshold(45);
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



 TPConstsStruct.X_Min = 105;
 TPConstsStruct.X_Max = 3925;
 TPConstsStruct.Y_Min = 250;
 TPConstsStruct.Y_Max = 3820;
 TPConstsStruct.Rotate = 0;
 STMPE610_SetCalibrationConsts(&TPConstsStruct);

 InitializeObjects();
 display_width = Boot.Width;
 display_height = Boot.Height;
 DrawScreen(&Boot);
}
