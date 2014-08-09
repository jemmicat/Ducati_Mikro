#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
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
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__lib_fat32.h"
#line 29 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__lib_fat32.h"
typedef unsigned short uint8;
typedef signed short int8;
typedef unsigned int uint16;
typedef signed int int16;
typedef unsigned long uint32;
typedef signed long int32;
typedef unsigned long long uint64;
typedef signed long long int64;

static const uint16 SECTOR_SIZE = 512;









static const uint8
 FILE_READ = 0x01,
 FILE_WRITE = 0x02,
 FILE_APPEND = 0x04;






static const uint8
 ATTR_NONE = 0x00,
 ATTR_READ_ONLY = 0x01,
 ATTR_HIDDEN = 0x02,
 ATTR_SYSTEM = 0x04,
 ATTR_VOLUME_ID = 0x08,
 ATTR_DIRECTORY = 0x10,
 ATTR_ARCHIVE = 0x20,
 ATTR_DEVICE = 0x40,

 ATTR_RESERVED = 0x80;

static const uint8
 ATTR_LONG_NAME = ATTR_READ_ONLY |
 ATTR_HIDDEN |
 ATTR_SYSTEM |
 ATTR_VOLUME_ID;

static const uint8
 ATTR_FILE_MASK = ATTR_READ_ONLY |
 ATTR_HIDDEN |
 ATTR_SYSTEM |
 ATTR_ARCHIVE,

 ATTR_LONG_NAME_MASK = ATTR_READ_ONLY |
 ATTR_HIDDEN |
 ATTR_SYSTEM |
 ATTR_VOLUME_ID |
 ATTR_DIRECTORY |
 ATTR_ARCHIVE;






static const int8



 OK = 0,
 ERROR = -1,
 FOUND = 1,



 E_READ = -1,
 E_WRITE = -2,
 E_INIT_CARD = -3,
 E_BOOT_SIGN = -4,
 E_BOOT_REC = -5,
 E_FILE_SYS_INFO = -6,
 E_DEVICE_SIZE = -7,
 E_FAT_TYPE = -8,



 E_LAST_ENTRY = -10,
 E_FREE_ENTRY = -11,
 E_CLUST_NUM = -12,
 E_NO_SWAP_SPACE = -13,
 E_NO_SPACE = -14,



 E_DIR_NAME = -20,
 E_ISNT_DIR = -21,
 E_DIR_EXISTS = -22,
 E_DIR_NOTFOUND = -23,
 E_DIR_NOTEMPTY = -24,



 E_FILE_NAME = -30,
 E_ISNT_FILE = -31,
 E_FILE_EXISTS = -32,
 E_FILE_NOTFOUND = -33,
 E_FILE_NOTEMPTY = -34,
 E_MAX_FILES = -35,
 E_FILE_NOTOPENED = -36,
 E_FILE_EOF = -37,
 E_FILE_READ = -38,
 E_FILE_WRITE = -39,
 E_FILE_HANDLE = -40,
 E_FILE_READ_ONLY = -41,
 E_FILE_OPENED = -42,



 E_TIME_YEAR = -50,
 E_TIME_MONTH = -51,
 E_TIME_DAY = -52,
 E_TIME_HOUR = -53,
 E_TIME_MINUTE = -54,
 E_TIME_SECOND = -55;



typedef struct
{
 uint8 State[1];
 uint8 __1[3];
 uint8 Type[1];
 uint8 __2[3];
 uint8 Boot[4];
 uint8 Size[4];
}
FAT32_PART;



typedef struct
{
 uint8 __1[446];
 FAT32_PART Part[4];
 uint8 BootSign[2];
}
FAT32_MBR;



typedef struct
{
 uint8 JmpCode[3];
 uint8 __1[8];
 uint8 BytesPSect[2];
 uint8 SectsPClust[1];
 uint8 Reserved[2];
 uint8 FATCopies[1];
 uint8 __2[4];
 uint8 MediaDesc[1];
 uint8 __3[10];
 uint8 Sects[4];
 uint8 SectsPFAT[4];
 uint8 Flags[2];
 uint8 __4[2];
 uint8 RootClust[4];
 uint8 FSISect[2];
 uint8 BootBackup[2];
 uint8 __5[14];
 uint8 ExtSign[1];
 uint8 __6[4];
 uint8 VolName[11];
 uint8 FATName[8];
 uint8 __7[420];
 uint8 BootSign[2];
}
FAT32_BR;



typedef struct
{
 uint8 LeadSig[4];
 uint8 __1[480];
 uint8 StrucSig[4];
 uint8 FreeCount[4];
 uint8 NextFree[4];
 uint8 __2[14];
 uint8 TrailSig[2];
}
FAT32_FSI;


typedef struct
{
 uint8 Entry[4];
}
FAT32_FATENT;



typedef struct
{
 uint8 NameExt[11];
 uint8 Attrib[1];
 uint8 __1[2];
 uint8 CTime[2];
 uint8 CDate[2];
 uint8 ATime[2];
 uint8 HiClust[2];
 uint8 MTime[2];
 uint8 MDate[2];
 uint8 LoClust[2];
 uint8 Size[4];
}
FAT32_DIRENT;



typedef uint32 __CLUSTER;
typedef uint32 __SECTOR;
typedef uint32 __ENTRY;

typedef int8 __HANDLE;



typedef struct
{
 uint16 Year;
 uint8 Month;
 uint8 Day;
 uint8 Hour;
 uint8 Minute;
 uint8 Second;
}
__TIME;



typedef struct
{
 uint8 State;
 uint8 Type;
 __SECTOR Boot;
 uint32 Size;
}
__PART;



typedef struct
{
 __PART Part[1];
 uint16 BytesPSect;
 uint8 SectsPClust;
 uint16 Reserved;
 uint8 FATCopies;
 uint32 SectsPFAT;
 uint16 Flags;
 __SECTOR FAT;
 __CLUSTER Root;
 __SECTOR Data;
 __SECTOR FSI;
 uint32 ClFreeCount;
 __CLUSTER ClNextFree;
}
__INFO;


typedef struct
{
 char NameExt[13];
 uint8 Attrib;

 uint32 Size;
 __CLUSTER _1stClust;

 __CLUSTER EntryClust;
 __ENTRY Entry;
}
__DIR;


typedef struct
{
 __CLUSTER _1stClust;
 __CLUSTER CurrClust;

 __CLUSTER EntryClust;
 __ENTRY Entry;

 uint32 Cursor;
 uint32 Length;

 uint8 Mode;
 uint8 Attr;
}
__FILE;
#line 332 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__lib_fat32.h"
typedef struct
{
 __SECTOR fSectNum;
 char fSect[SECTOR_SIZE];
}
__RAW_SECTOR;


extern const char CRLF_F32[];
extern const uint8 FAT32_MAX_FILES;
extern const uint8 f32_fsi_template[SECTOR_SIZE];
extern const uint8 f32_br_template[SECTOR_SIZE];
extern __FILE fat32_fdesc[];
extern __RAW_SECTOR f32_sector;


extern int8 FAT32_Dev_Init (void);
extern int8 FAT32_Dev_Read_Sector (__SECTOR sc, char* buf);
extern int8 FAT32_Dev_Write_Sector (__SECTOR sc, char* buf);
extern int8 FAT32_Dev_Multi_Read_Stop();
extern int8 FAT32_Dev_Multi_Read_Sector(char* buf);
extern int8 FAT32_Dev_Multi_Read_Start(__SECTOR sc);
extern int8 FAT32_Put_Char (char ch);


int8 FAT32_Init (void);
int8 FAT32_Format (char *devLabel);
int8 FAT32_ScanDisk (uint32 *totClust, uint32 *freeClust, uint32 *badClust);
int8 FAT32_GetFreeSpace(uint32 *freeClusts, uint16 *bytesPerClust);

int8 FAT32_ChangeDir (char *dname);
int8 FAT32_MakeDir (char *dname);
int8 FAT32_Dir (void);
int8 FAT32_FindFirst (__DIR *pDE);
int8 FAT32_FindNext (__DIR *pDE);
int8 FAT32_Delete (char *fn);
int8 FAT32_DeleteRec (char *fn);
int8 FAT32_Exists (char *name);
int8 FAT32_Rename (char *oldName, char *newName);
int8 FAT32_Open (char *fn, uint8 mode);
int8 FAT32_Eof (__HANDLE fHandle);
int8 FAT32_Read (__HANDLE fHandle, char* rdBuf, uint16 len);
int8 FAT32_Write (__HANDLE fHandle, char* wrBuf, uint16 len);
int8 FAT32_Seek (__HANDLE fHandle, uint32 pos);
int8 FAT32_Tell (__HANDLE fHandle, uint32 *pPos);
int8 FAT32_Close (__HANDLE fHandle);
int8 FAT32_Size (char *fname, uint32 *pSize);
int8 FAT32_GetFileHandle(char *fname, __HANDLE *handle);

int8 FAT32_SetTime (__TIME *pTM);
int8 FAT32_IncTime (uint32 Sec);

int8 FAT32_GetCTime (char *fname, __TIME *pTM);
int8 FAT32_GetMTime (char *fname, __TIME *pTM);

int8 FAT32_SetAttr (char *fname, uint8 attr);
int8 FAT32_GetAttr (char *fname, uint8* attr);

int8 FAT32_GetError (void);

int8 FAT32_MakeSwap (char *name, __SECTOR nSc, __CLUSTER *pCl);

int8 FAT32_Dev_SectorCount(uint32 *scCnt);
#line 12 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
void MP3_SCI_Read(char start_address, char words_count, unsigned int *data_buffer);
void MP3_SCI_Write(char address, unsigned int data_in);
void MP3_SDI_Write_32(char *data_);
void MP3_SDI_Write(char data_);
void MP3_Set_default_Mode();
void MP3_Set_Volume(char left, char right);
void MP3_Reset_Time();
void MP3_Get_Decode_Time(unsigned long *time);


extern sfr sbit Mmc_Chip_Select;
extern sfr sbit MMC_Card_Detect;

extern sfr sbit MP3_CS;
extern sfr sbit MP3_RST;
extern sfr sbit BSYNC;
extern sfr sbit DREQ;


extern char MP3_Example_State = 0;
extern char Fat_Initialized_Flag;
extern const unsigned long mp3_note_bmp;
extern const unsigned long mp3_player_note_bmp;
extern char level, old_level;
extern signed short Ext_fhandle;
extern char Ext_res_initialized;

typedef struct Scroll_List {
 char FileName[13];
 char FileType;
} TScroll_List;
extern TScroll_List File_List[];
extern char Total_Entries;


void BLED_Fade_In();
void BLED_Fade_Out();
char Init_FAT();
void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset);
char Get_Next_File_Name(signed short number, char *Text);
void UpdateVolumeBar(char vol, char old_vol);
void Initialize_Scroll();


const BYTES_2_WRITE = 32;
const BUFFER_SIZE = 256;

TImage *Images[3] = {&Image12, &Image13, &Image14};
unsigned long Buffer_count, Total_Buffers;
char MP3_song[13];
char current_fhandle;
signed short current_file;
int MP3_Example_cnt = 0;
unsigned long file_size;
char mp3_buffer[BUFFER_SIZE];
char volume_left, volume_right;

void Mp3_Init();
void MP3_Start();
void MP3_Check_Time();
void MP3_Reset_Time();
#line 81 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
void MP3_play(char *Song_Name, char File_No){
 current_file = File_No;
 Buffer_count = 0;
 current_fhandle = FAT32_Open(Song_Name, FILE_READ);
 FAT32_Size(Song_Name, &file_size);
 Buffer_count = 0;
 Total_Buffers = File_size / BUFFER_SIZE;
 MP3_Reset_Time();
 MP3_Check_Time();
 MP3_Set_Volume(100 - level, 100 - level);
 UpdateVolumeBar( level, 0);
 MP3_Example_State = 2;
}
#line 102 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
void Start_MP3_Player(char *Song_Name, char File_No){
 strcpy(Label28_Caption, Song_Name);
 DrawScreen(&MP3_Player);
 TFT_Ext_Image(204, 57, mp3_note_bmp, 1);
 pause_icon.Active = 1;
 Play_icon.Active = 0;
 DrawImage(&pause_icon);
 MP3_play(Song_Name, File_No);
}
#line 119 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
void StopMP3_File(){
 FAT32_Close(current_fhandle);
 MP3_Example_State = 3;
}
#line 131 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
void GetNext_mp3_File(char Next_Previous){
char temp = 0, temp1;
 StopMP3_File();
 temp1 = current_file;
 if (Next_Previous)
 while (temp == 0 && temp != 2)
 temp = Get_Next_File_Name( ++current_file, MP3_song);
 else
 while (temp == 0 && temp != 2)
 temp = Get_Next_File_Name( --current_file, MP3_song);
 if (temp == 1){
 MP3_play(MP3_song, current_file);
 strcpy(Label28_Caption, MP3_song);
 RedrawLabel(MP3_Player.Color, &Label28, 200, 40);
 }
 else{
 if (Next_Previous)
 current_file = 0xFF;
 else
 current_file = Total_Entries + 1;
 MP3_Song[0] = 0;
 strcpy(Label28_Caption, MP3_song);
 RedrawLabel(MP3_Player.Color, &Label28, 200, 40);
 }
}

char mp3_mins, mp3_secs, mp3_old_mins, mp3_old_secs;
#line 165 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
void MP3_Check_Time(){
 unsigned int time;

 MP3_Get_Decode_Time(&time);
 mp3_mins = time / 60;
 mp3_secs = time % 60;
 if (mp3_secs != mp3_old_secs){
 Label6_Caption[0] = mp3_mins / 10 + 48;
 Label6_Caption[1] = mp3_mins % 10 + 48;
 Label6_Caption[3] = mp3_secs / 10 + 48;
 Label6_Caption[4] = mp3_secs % 10 + 48;
 RedrawLabel(MP3_player.Color, &Label6, 35, 25);
 mp3_old_mins = mp3_mins;
 mp3_old_secs = mp3_secs;
 }
}

char old_Progress = 0;
#line 190 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
void UpdateProgressBar(){
char progress;
 progress = (Buffer_count * 250) / Total_Buffers;
 if (progress != old_Progress){
 if ((progress > 0) && (progress < 250)){
 TFT_Set_Brush(1, 0x55FF, 0, 0, 0, 0);
 TFT_Set_Pen(0x55FF, 0);
 TFT_Rectangle(ProgressBar.Left, ProgressBar.Top, ProgressBar.Left + progress, ProgressBar.Top + ProgressBar.Height);

 TFT_Set_Brush(1, ProgressBar.Color, 0, 0, 0, 0);
 TFT_Set_Pen(ProgressBar.Color, 0);
 TFT_Rectangle(ProgressBar.Left + progress + 1, ProgressBar.Top, ProgressBar.Left + ProgressBar.Width, ProgressBar.Top + ProgressBar.Height);

 old_progress = progress;
 }
 }
}
#line 215 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
void doMP3(){
 unsigned long i;
 switch (MP3_Example_State){
 case 0 : {
 if (MMC_Card_Detect == 0){
 DrawScreen(&MP3_SongList);
 Delay_ms(100);
 Mp3_Init();
 MP3_Example_State = 1;
 }
 else{
 DrawImage(Images[MP3_Example_cnt / 200]);
 MP3_Example_cnt++;
 if (MP3_Example_cnt > 599)
 MP3_Example_cnt = 0;
 }
 }; break;
 case 1 : {
 }; break;
 case 2 : {
 if (file_size > BUFFER_SIZE){
 Fat32_Read(current_fhandle, mp3_buffer, BUFFER_SIZE);
 for (i=0; i<BUFFER_SIZE/BYTES_2_WRITE; i++) {
 MP3_SDI_Write_32(mp3_buffer + i*BYTES_2_WRITE);
 }
 file_size -= BUFFER_SIZE;
 Buffer_count ++;
 }
 UpdateProgressBar();
 MP3_Check_Time();
 if (file_size < BUFFER_SIZE){
 Fat32_Read(current_fhandle, mp3_buffer, file_size);
 for (i=0; i<file_size; i++){
 MP3_SDI_Write(mp3_buffer[i]);
 }
 MP3_Example_State = 1;
 Buffer_count ++;
 UpdateProgressBar();
 }

 }; break;
 case 3 : {
 }; break;

 }
}
#line 269 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
void Mp3_Init(){

 Init_FAT();
 if (MMC_Card_Detect == 1){
 DrawScreen(&MP3_SD);
 MP3_Example_State = 0;
 return;
 }
 MP3_Example_State = 1;
 Initialize_Scroll();
 MP3_Start();
}
#line 289 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_main.c"
void MP3_Start() {


 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_8 | _GPIO_PINMASK_10 | _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_OUTPUT);

 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT);

 MP3_CS = 1;
 MP3_RST = 1;
 BSYNC = 0;
 BSYNC = 1;


 SPI2_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
 _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
 &_GPIO_MODULE_SPI2_PB13_14_15);

 MP3_Set_default_Mode();


 SPI2_Init_Advanced(_SPI_FPCLK_DIV4, _SPI_MASTER | _SPI_8_BIT |
 _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
 &_GPIO_MODULE_SPI2_PB13_14_15);

 MP3_Set_Volume(100 - level, 100 - level);
 MP3_Reset_Time();
}
