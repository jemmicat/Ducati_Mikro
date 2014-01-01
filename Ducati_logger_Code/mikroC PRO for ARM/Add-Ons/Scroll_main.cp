#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
#line 1 "c:/users/jemmi/desktop/ducati_mikro/ducati_logger_code/mikroc pro for arm/ducati_logger_objects.h"
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
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 unsigned int CBoxesCount;
 TCBox * const code *CBoxes;
};

extern TScreen Boot;
extern TCImage Image1;
extern TCImage Image2;
extern TCImage Image3;
extern TImage Image4;
extern TCImage Image5;
extern TCImage Image6;
extern TCImage Image7;
extern TCImage Image8;
extern TCImage Image9;
extern TCImage Image10;
extern TCImage Image11;
extern TCImage Image12;
extern TImage * const code Screen1_Images[1];
extern TCImage * const code Screen1_CImages[11];

extern TScreen Speedometer_graphics;
extern TCImage Image13;
extern TCImage * const code Screen2_CImages[1];

extern TScreen Tachometer_graphics;
extern TCImage Image14;
extern TCImage * const code Screen3_CImages[1];

extern TScreen Settings;
extern TCBox Box1;
extern TButton_Round ButtonRound1;
extern TButton_Round ButtonRound2;
extern TButton_Round ButtonRound3;
extern TButton_Round ButtonRound4;
extern TButton_Round ButtonRound5;
extern TButton_Round ButtonRound6;
extern TButton_Round ButtonRound7;
extern TButton_Round * const code Screen4_Buttons_Round[7];
extern TCBox * const code Screen4_CBoxes[1];

extern TScreen Set_clock;
extern TCBox Box2;
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
extern TCBox * const code Screen5_CBoxes[1];

extern TScreen Sensor_test;
extern TBox Box6;
extern TLabel Label1;
extern TLabel Label3;
extern TLabel Label4;
extern TLabel Label7;
extern TLabel Label8;
extern TLabel Label9;
extern TLabel * const code Screen6_Labels[6];
extern TBox * const code Screen6_Boxes[1];

extern TScreen GPS_Test;
extern TBox Box9;
extern TBox * const code Screen7_Boxes[1];

extern TScreen View_Log;
extern TBox Box12;
extern TBox * const code Screen8_Boxes[1];

extern TScreen Oxygen_Sensor_Readings;
extern TBox Box13;
extern TBox * const code Screen9_Boxes[1];

extern TScreen Shift_Light_Adjust;
extern TBox Box14;
extern TBox * const code Screen10_Boxes[1];




void Box10OnPress();
void Box11OnPress();
void Box3OnPress();
void Box4OnPress();
void ClockBackOnPress();
void doCalibration();
void doSetClock();




extern const char Image1_Caption[];
extern const char Image2_Caption[];
extern const char Image3_Caption[];
extern char Image4_Caption[];
extern const char Image5_Caption[];
extern const char Image6_Caption[];
extern const char Image7_Caption[];
extern const char Image8_Caption[];
extern const char Image9_Caption[];
extern const char Image10_Caption[];
extern const char Image11_Caption[];
extern const char Image12_Caption[];
extern const char Image13_Caption[];
extern const char Image14_Caption[];
extern const char Box1_Caption[];
extern char ButtonRound1_Caption[];
extern char ButtonRound2_Caption[];
extern char ButtonRound3_Caption[];
extern char ButtonRound4_Caption[];
extern char ButtonRound5_Caption[];
extern char ButtonRound6_Caption[];
extern char ButtonRound7_Caption[];
extern const char Box2_Caption[];
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
extern char Box6_Caption[];
extern char Label1_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char Label7_Caption[];
extern char Label8_Caption[];
extern char Label9_Caption[];
extern char Box9_Caption[];
extern char Box12_Caption[];
extern char Box13_Caption[];
extern char Box14_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawCImage(TCImage *ACimage);
void DrawBox(TBox *ABox);
void DrawCBox(TCBox *ACbox);
void Check_TP();
void Start_TP();
#line 1 "c:/users/jemmi/desktop/ducati_mikro/ducati_logger_code/mikroc pro for arm/ducati_logger_resources.h"
const code char Impact13x20_Regular[];
const code char Open_Sans_Light13x16_Regular[];
const code char Open_Sans_Light16x18_Regular[];
const code char Open_Sans_Light58x65_Regular[];
const code char Tahoma11x13_Regular[];
const code char img0_jpg[11233];
const code char img6_jpg[11601];
const code char img12_jpg[10927];
const code char img18_jpg[10211];
const code char img24_jpg[9199];
const code char img30_jpg[7878];
const code char img36_jpg[8015];
const code char img42_jpg[10162];
const code char img48_jpg[11818];
const code char img54_jpg[12917];
const code char img60_jpg[13360];
const code char img63_jpg[13482];
const code char speedometer_background_bmp[261126];
const code char tachometer_background_bmp[261126];
const code char icon_ok_bmp[974];
const code char stripe_black_bmp[53286];
const code char am_pm_bmp[27186];
#line 1 "c:/program files (x86)/mikroc pro for arm/include/built_in.h"
#line 1 "c:/users/jemmi/desktop/ducati_mikro/ducati_logger_code/mikroc pro for arm/add-ons/__lib_fat32.h"
#line 29 "c:/users/jemmi/desktop/ducati_mikro/ducati_logger_code/mikroc pro for arm/add-ons/__lib_fat32.h"
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
#line 332 "c:/users/jemmi/desktop/ducati_mikro/ducati_logger_code/mikroc pro for arm/add-ons/__lib_fat32.h"
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
#line 12 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 83 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 101 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
char Scroll_New_Tex_From_List(char text_number, char *Text){
char *ptr, *dptr;
 dptr = Text;
 ptr = File_List[text_number].FIleName;

 while (*dptr++ = *ptr++)
 ;

 return File_List[text_number].FIleType;
}
#line 121 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 139 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
char current_loaded_text = 0;
char Scrool_Get_new_text(char Text_no){
 if (current_loaded_text != Text_no){
 current_loaded_text = Text_no;
 Scroll_New_Tex_From_List(Text_no, Scroll_Text);
 }
 return File_List[Text_no].FileType;
}
#line 155 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 193 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 224 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 285 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 347 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 376 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 401 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 426 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
void Scroll_Disp(unsigned int Apos, char Adir) {
 if (Adir == _Up) {
 ScrollUP(Apos);
 }
 else {
 ScrollDown(Apos);
 }
}
#line 442 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 488 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
void Process_file(char File_No){
 BLED_Fade_Out();
 Stop_Scroll();
 Start_MP3_Player(File_List[File_No].FileName, File_no);
 BLED_Fade_In();
}
#line 502 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
void Process_folder(char File_No){
 FAT32_ChangeDir(File_List[File_No].FileName);
 DrawBox(&Box6);
 Initialize_Scroll();
}
#line 515 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 535 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
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
#line 570 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
void Stop_Scroll(){
 _disp_scroll = _SCROLL_FIRST_LINE;
 _disp_scroll_rollover = 0;
 first_window_column = 0;
 last_window_column = _SCROLL_HEIGHT;
 Scroll_Undone(_SCROLL_FIRST_LINE, _SCROLL_LAST_LINE);
}
#line 585 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll_main.c"
void Initialize_Scroll(){
 Stop_Scroll();
 FAT32_FindFirst(&MyDir);
 Total_Entries = Fill_List(File_List);
 Scroll_Fill_Area();
 imageLine = 188;
}
