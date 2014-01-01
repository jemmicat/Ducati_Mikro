#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
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
#line 1 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__lib_fat32.h"
#line 29 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__lib_fat32.h"
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
#line 332 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__lib_fat32.h"
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
#line 12 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
__DIR MyDir;
short MyError;


const _MP3_IMAGE_VLINE = 80;
const _MP3_TEXT_VLINE = 100;
const _MP3_BIGIMAGE_VLINE = 300;
const _MP3_BACKGOUND_COLOR = 0x2B31;
const _MP3_FONT_COLOR = CL_WHITE;
const _SCROLL_HEIGHT = 190;
const _SCROLL_FIRST_LINE = 48;
const _SCROLL_LAST_LINE = 238;
const _FONT_HEIGHT = 19;
const _FONT_VERTICAL_SPACING = 15;
const char *MP3_Font = Open_Sans_Light21x24_Regular;


extern sbit sfr TFT_CS;
extern unsigned int Xcoord, Ycoord;
extern const unsigned long mp3_player_note_bmp;

void Scroll_Undone(unsigned int first, unsigned int last);
void Start_MP3_Player(char *Song_Name, char File_No);
void Scroll(unsigned int scroll);
void BLED_Fade_In();
void BLED_Fade_Out();
char* MyTFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num);


static const _UP = 1;
static const _DOWN = 0;
static int _disp_scroll = 48;
static int imageLine;
static int _disp_scroll_rollover = 0;

typedef struct Scroll_List {
 char FileName[13];
 char FileType;
} TScroll_List;

char Total_Entries;
TScroll_List File_List[100];

char Scroll_text[15];
char pix_array[480];
char current_text_column;
signed int first_window_column = 0;
signed int last_window_column = 190;
unsigned int Scroll_total_columns = 350;

void TFT_Write_to_16bitPort(unsigned int _data);
void TFT_mikromedia_Write_Command(unsigned short cmd);
void TFT_mikromedia_Set_Index(unsigned short index);


void Dummy_Set_address(unsigned int x1, unsigned int y1, unsigned int x2, unsigned int y2){
 if (current_text_column == y1)
 pix_array[x1] = 1;
}

void Dummy_Write_data(unsigned int ddata){

}
#line 83 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Scroll_Get_One_Text_Line(char line, char *text){
 memset(pix_array, 0, 165);
 current_text_column = line;
 TFT_Write_Data_Ptr = Dummy_Write_data;
 TFT_SSD1963_Set_Address_Ptr = Dummy_Set_address;
 TFT_Set_Font(MP3_Font, _MP3_FONT_COLOR, FO_HORIZONTAL);
 TFT_Write_Text(text, _MP3_TEXT_VLINE, 0);
 TFT_SSD1963_Set_Address_Ptr = TFT_Set_Address_SSD1963II;
 TFT_Write_Data_Ptr = TFT_Write_to_16bitPort;
}
#line 101 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
char Scroll_New_Tex_From_List(char text_number, char *Text){
char *ptr, *dptr;
 dptr = Text;
 ptr = File_List[text_number].FIleName;

 while (*dptr++ = *ptr++)
 ;

 return File_List[text_number].FIleType;
}
#line 121 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
char Get_Next_File_Name(signed short number, char *Text){
char temp;
 if ((number > Total_Entries) || (number < 0))
 return 2;
 temp = Scroll_New_Tex_From_List(number, Text);
 if (temp == 1)
 return 1;
 else if (temp == 2)
 return 0;
}
#line 139 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
char current_loaded_text = 0;
char Scrool_Get_new_text(char Text_no){
 if (current_loaded_text != Text_no){
 current_loaded_text = Text_no;
 Scroll_New_Tex_From_List(Text_no, Scroll_Text);
 }
 return File_List[Text_no].FileType;
}
#line 155 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Scroll_Write_One_Line(unsigned int HO_Line, TImage *Img){
 const code char *ptr;
 unsigned int i, color;


 ptr = Img->Picture_Name + 6;
 ptr += (long)(Img->Width) * (current_text_column) * 2;

 TFT_CS = 0;

 TFT_SSD1963_Set_Address_Ptr(0, HO_Line, 479, HO_Line);
 for (i = 0; i < 479; i++)
 if ((i > _MP3_IMAGE_VLINE - 1) && (i < _MP3_IMAGE_VLINE + Img->Width)){

 if (current_text_column < Img->Height){
 color = (*ptr++);
 color += (*ptr++) << 8;
 TFT_Write_Data_Ptr(color);
 }
 else
 TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
 }

 else if (pix_array[i])
 TFT_Write_Data_Ptr(_MP3_FONT_COLOR);
 else
 TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
 TFT_CS = 1;

}
#line 193 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Add_Image_Line(const unsigned long image, int line, int disp_scroll){
 unsigned long offset, readed;
 unsigned int i, color, count;
 char *ptr;

 TFT_CS = 0;
 offset = image + 6 + (unsigned long)line*238;
 count = 238;
 TFT_SSD1963_Set_Address_Ptr(_MP3_BIGIMAGE_VLINE, disp_scroll, _MP3_BIGIMAGE_VLINE + 118, disp_scroll);
 while(count>0){
 ptr = MyTFT_Get_Data(offset,count,&readed);
 count -= readed;
 offset += readed;
 readed /= 2;
 for (i = 0;i<readed;i++){
 color = *ptr++;
 color += (*ptr++) << 8;
 TFT_Write_Data_Ptr(color);
 }
 }

 TFT_CS = 1;
}
#line 224 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Scroll_Fill_Area(){
char *ptr, *dptr, i;
unsigned int temp, temp1;
 dptr = Scroll_text;
 i = 0;
 ptr = File_List[i].FileName;


 while (*ptr != 0xFF){
 while(*dptr++ = *ptr++)
 ;
 temp = i * (_FONT_HEIGHT + _FONT_VERTICAL_SPACING);
 ptr = File_List[i+1].FileName;
 if (temp < _SCROLL_LAST_LINE - _SCROLL_FIRST_LINE - _FONT_HEIGHT){
 if (File_List[i].FileType == 1)
 TFT_Image(_MP3_IMAGE_VLINE, _SCROLL_FIRST_LINE + temp, file_icon.Picture_Name, 1);
 if (File_List[i].FileType == 2)
 TFT_Image(_MP3_IMAGE_VLINE, _SCROLL_FIRST_LINE + temp, folder_icon.Picture_Name, 1);
 TFT_Set_Font(MP3_Font, _MP3_FONT_COLOR, FO_HORIZONTAL);
 TFT_Write_Text(Scroll_text, _MP3_TEXT_VLINE, _SCROLL_FIRST_LINE + temp);
 i ++;
 dptr = Scroll_text;
 temp1 = _SCROLL_FIRST_LINE + temp;
 }
 else{
 i ++;
 dptr = Scroll_text;
 }
 }
 Scroll_total_columns = temp + (_FONT_HEIGHT + _FONT_VERTICAL_SPACING);


 temp1 = temp1 + _FONT_HEIGHT + _FONT_VERTICAL_SPACING - 1;
 if (temp1 < _SCROLL_LAST_LINE)
 current_text_column = 1;
 if (temp1 <= temp){
 while (temp1 < _SCROLL_LAST_LINE){
 memset(pix_array, 0, 479);
 i = Scrool_Get_new_text(last_window_column / (_FONT_HEIGHT + _FONT_VERTICAL_SPACING));
 Scroll_Get_One_Text_Line(current_text_column, Scroll_text);

 if (File_List[i].FileType == 1)
 Scroll_Write_One_Line(temp1, &file_icon);
 if (File_List[i].FileType == 2)
 Scroll_Write_One_Line(temp1, &folder_icon);

 current_text_column ++;
 temp1 ++;
 }
 }

 TFT_Ext_Image(_MP3_BIGIMAGE_VLINE, _SCROLL_FIRST_LINE, mp3_player_note_bmp, 1);
}
#line 285 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Scroll_Add_newTextLine(char ScrollDiection){
unsigned int i, temp;
char temp_file_type;

 memset(pix_array, 0, 479);
 if (ScrollDiection == 0){
 current_text_column = last_window_column % (_FONT_HEIGHT + _FONT_VERTICAL_SPACING);
 if (current_text_column < _FONT_HEIGHT + 1){
 temp_file_type = Scrool_Get_new_text(last_window_column / (_FONT_HEIGHT + _FONT_VERTICAL_SPACING));
 Scroll_Get_One_Text_Line(current_text_column, Scroll_text);

 temp = _disp_scroll - 1;
 if (temp < _SCROLL_FIRST_LINE)
 temp = _SCROLL_LAST_LINE - 1;

 if (temp_file_type == 1)
 Scroll_Write_One_Line(temp, &file_icon);
 if (temp_file_type == 2)
 Scroll_Write_One_Line(temp, &folder_icon);
 }
 else {
 temp = _disp_scroll - 1;
 if (temp < _SCROLL_FIRST_LINE)
 temp = _SCROLL_LAST_LINE - 1;

 TFT_CS = 0;
 TFT_SSD1963_Set_Address_Ptr(0, temp, 479, temp);
 for (i = 0; i < 479; i++)
 TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
 TFT_CS = 1;
 }
 Add_Image_LIne(mp3_player_note_bmp, imageLine, temp);
 }
 else{
 current_text_column = first_window_column % (_FONT_HEIGHT + _FONT_VERTICAL_SPACING);
 if (current_text_column < _FONT_HEIGHT + 1){
 temp_file_type = Scrool_Get_new_text(first_window_column / (_FONT_HEIGHT + _FONT_VERTICAL_SPACING));
 Scroll_Get_One_Text_Line(current_text_column, Scroll_text);

 if (temp_file_type == 1)
 Scroll_Write_One_Line(_disp_scroll, &file_icon);
 if (temp_file_type == 2)
 Scroll_Write_One_Line(_disp_scroll, &folder_icon);
 }
 else{
 TFT_CS = 0;
 TFT_SSD1963_Set_Address_Ptr(0, _disp_scroll, 479, _disp_scroll);
 for (i = 0; i < 479; i++)
 TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
 TFT_CS = 1;
 }
 Add_Image_LIne(mp3_player_note_bmp, imageLine, _disp_scroll);
 }
}
#line 347 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Scroll_Menu(char Adir) {

 if (Adir == _Up) {
 if (_disp_scroll != _SCROLL_FIRST_LINE)
 _disp_scroll--;
 else {
 _disp_scroll = _SCROLL_LAST_LINE - 1;
 _disp_scroll_rollover --;
 }
 }
 else {
 if (_disp_scroll != _SCROLL_LAST_LINE - 1)
 _disp_scroll++;
 else {
 _disp_scroll = _SCROLL_FIRST_LINE;
 _disp_scroll_rollover ++;
 }
 }

 Scroll(_disp_scroll);
}
#line 376 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void ScrollUp(int scroll){
 while(scroll--){
 last_window_column --;
 first_window_column --;
 if (first_window_column >= 0){
 imageLine--;
 if (imageline < 0)
 imageline = 188;
 Scroll_Menu(_Up);
 Scroll_Add_newTextLine(_Up);
 }
 else {
 last_window_column ++;
 first_window_column ++;
 }
 }
}
#line 401 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void ScrollDown(int scroll){
 while(scroll--){
 last_window_column ++;
 first_window_column ++;
 if (last_window_column < Scroll_total_columns){
 imageLine++;
 if (imageline > 188)
 imageline = 0;
 Scroll_Menu(_Down);
 Scroll_Add_newTextLine(_Down);
 }
 else{
 last_window_column --;
 first_window_column --;
 }
 }
}
#line 426 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Scroll_Disp(unsigned int Apos, char Adir) {
 if (Adir == _Up) {
 ScrollUP(Apos);
 }
 else {
 ScrollDown(Apos);
 }
}
#line 442 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
unsigned int ScrollOldYcoo;
char Scroll_Flag = 0;
void ScrollPress(){
 char Scrollcnt;
 int delta;
 char dir;

 if (Xcoord > 240){
 if (Scroll_Flag == 0){
 Scroll_Flag = 1;
 ScrollOldYcoo = Ycoord;
 return;
 }
 delta = Ycoord - ScrollOldYcoo;
 if (delta > 0){
 dir = 0;
 }
 if (delta < 0){
 dir = 1;
 delta = - delta;
 }
 if (delta < 4)
 return;
 if (delta > 7)
 delta = 7;
 for (Scrollcnt = 0; Scrollcnt < delta; Scrollcnt ++){
 if (dir == 1)
 Scroll_Disp(1, _DOWN);
 else
 Scroll_Disp(1, _UP);
 }
 ScrollOldYcoo = Ycoord;
 }
}

void Initialize_Scroll();

void Stop_Scroll();
#line 488 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Process_file(char File_No){
 BLED_Fade_Out();
 Stop_Scroll();
 Start_MP3_Player(File_List[File_No].FileName, File_no);
 BLED_Fade_In();
}
#line 502 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Process_folder(char File_No){
 FAT32_ChangeDir(File_List[File_No].FileName);
 DrawBox(&Box6);
 Initialize_Scroll();
}
#line 515 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void ScrollOnClick(){
char temp, file_type;
 if (Xcoord < 241){
 temp = (Ycoord - _SCROLL_FIRST_LINE + _disp_scroll - _SCROLL_FIRST_LINE + _disp_scroll_rollover * (_SCROLL_LAST_LINE - _SCROLL_FIRST_LINE)) / (_FONT_HEIGHT + _FONT_VERTICAL_SPACING);
 file_type = Scrool_Get_new_text(temp);

 if (file_type == 1)
 Process_file(temp);
 if (file_type == 2)
 Process_folder(temp);
 }
}
#line 535 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
char Fill_List(TScroll_List *List){
char txt[2];
char MyError = 1;
char File_List_cnt = 0;
 memset((char *)List, 0, 100 * (13 + 1));
 while ((MyError != 0) && (MyError != 0xFF)){
 MyError = FAT32_FindNext(&MyDir);
 if ((MyDir.NameExt[0] != 0) && MyError != 0){
 if (MyDir.Attrib & ATTR_FILE_MASK){
 if ((strstr(MyDir.NameExt, ".MP3") != 0) || (strstr(MyDir.NameExt, ".WAV") != 0)){
 strcat(List->FileName, MyDir.NameExt);
 List->FileType = 1;
 File_List_cnt ++;
 List ++;
 }
 }
 else if (MyDir.Attrib == ATTR_DIRECTORY){
 strcat(List->FileName, MyDir.NameExt);
 List->FileType = 2;
 File_List_cnt ++;
 List ++;
 }
 }
 }
 List->FileName[0] = 0xFF;
 return File_List_cnt;
}
#line 570 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Stop_Scroll(){
 _disp_scroll = _SCROLL_FIRST_LINE;
 _disp_scroll_rollover = 0;
 first_window_column = 0;
 last_window_column = _SCROLL_HEIGHT;
 Scroll_Undone(_SCROLL_FIRST_LINE, _SCROLL_LAST_LINE);
}
#line 585 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Scroll_main.c"
void Initialize_Scroll(){
 Stop_Scroll();
 FAT32_FindFirst(&MyDir);
 Total_Entries = Fill_List(File_List);
 Scroll_Fill_Area();
 imageLine = 188;
}
