#line 1 "C:/Users/pc1/Desktop/gif animation/program/gif_Code/mikroC PRO for dsPIC/gif_driver.c"
#line 1 "c:/users/pc1/desktop/gif animation/program/gif_code/mikroc pro for dspic/gif_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const far char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned short ObjectsCount;
 unsigned int ImagesCount;
 TImage * const code far *Images;
};

extern TScreen Screen1;
extern TImage Image2;
extern TImage Image1;
extern TImage Image3;
extern TImage Image4;
extern TImage Image5;
extern TImage Image6;
extern TImage Image7;
extern TImage Image8;
extern TImage Image9;
extern TImage Image10;
extern TImage Image11;
extern TImage Image12;
extern TImage Image13;
extern TImage Image14;
extern TImage * const code far Screen1_Images[14];









extern char Image2_Caption[];
extern char Image1_Caption[];
extern char Image3_Caption[];
extern char Image4_Caption[];
extern char Image5_Caption[];
extern char Image6_Caption[];
extern char Image7_Caption[];
extern char Image8_Caption[];
extern char Image9_Caption[];
extern char Image10_Caption[];
extern char Image11_Caption[];
extern char Image12_Caption[];
extern char Image13_Caption[];
extern char Image14_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawImage(TImage *AImage);
void Check_TP();
void Start_TP();
#line 1 "c:/users/pc1/desktop/gif animation/program/gif_code/mikroc pro for dspic/gif_resources.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/built_in.h"
#line 7 "C:/Users/pc1/Desktop/gif animation/program/gif_Code/mikroC PRO for dsPIC/gif_driver.c"
sbit Mmc_Chip_Select at LATG9_bit;
sbit Mmc_Chip_Select_Direction at TRISG9_bit;


unsigned long currentSector = -1, res_file_size;





char TFT_DataPort at LATA;
sbit TFT_RST at LATC1_bit;
sbit TFT_BLED at LATD7_bit;
sbit TFT_RS at LATB15_bit;
sbit TFT_CS at LATC3_bit;
sbit TFT_RD at LATD12_bit;
sbit TFT_WR at LATD13_bit;
char TFT_DataPort_Direction at TRISA;
sbit TFT_RST_Direction at TRISC1_bit;
sbit TFT_BLED_Direction at TRISD7_bit;
sbit TFT_RS_Direction at TRISB15_bit;
sbit TFT_CS_Direction at TRISC3_bit;
sbit TFT_RD_Direction at TRISD12_bit;
sbit TFT_WR_Direction at TRISD13_bit;



sbit DRIVEX_LEFT at LATB13_bit;
sbit DRIVEX_RIGHT at LATB11_bit;
sbit DRIVEY_UP at LATB12_bit;
sbit DRIVEY_DOWN at LATB10_bit;
sbit DRIVEX_LEFT_DIRECTION at TRISB13_bit;
sbit DRIVEX_RIGHT_DIRECTION at TRISB11_bit;
sbit DRIVEY_UP_DIRECTION at TRISB12_bit;
sbit DRIVEY_DOWN_DIRECTION at TRISB10_bit;



unsigned int Xcoord, Ycoord;
const ADC_THRESHOLD = 800;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TImage *local_image;
TImage *exec_image;
int image_order;


void Set_Index(unsigned short index) {
 TFT_RS = 0;
  ((char *)&LATA)[0]  = index;
 TFT_WR = 0;
 TFT_WR = 1;
}


void Write_Command(unsigned short cmd) {
 TFT_RS = 1;
  ((char *)&LATA)[0]  = cmd;
 TFT_WR = 0;
 TFT_WR = 1;
}


void Write_Data(unsigned int _data) {
 TFT_RS = 1;
  ((char *)&LATE)[0]  =  ((char *)&_data)[1] ;
  ((char *)&LATA)[0]  =  ((char *)&_data)[0] ;
 TFT_WR = 0;
 TFT_WR = 1;
}


char* TFT_Get_Data(unsigned long offset, unsigned int count, unsigned int *num) {
unsigned long start_sector;
unsigned int pos;

 start_sector = Mmc_Get_File_Write_Sector() + offset/512;
 pos = (unsigned long)offset%512;

 if(start_sector == currentSector+1) {
 Mmc_Multi_Read_Sector(f16_sector.fSect);
 currentSector = start_sector;
 } else if (start_sector != currentSector) {
 if(currentSector != -1)
 Mmc_Multi_Read_Stop();
 Mmc_Multi_Read_Start(start_sector);
 Mmc_Multi_Read_Sector(f16_sector.fSect);
 currentSector = start_sector;
 }

 if(count>512-pos)
 *num = 512-pos;
 else
 *num = count;

 return f16_sector.fSect+pos;
}
static void InitializeTouchPanel() {
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init(240, 320);
 TFT_Set_Ext_Buffer(TFT_Get_Data);

}



 TScreen* CurrentScreen;

 TScreen Screen1;
 TImage Image2;
 TImage Image1;
 TImage Image3;
 TImage Image4;
 TImage Image5;
 TImage Image6;
 TImage Image7;
 TImage Image8;
 TImage Image9;
 TImage Image10;
 TImage Image11;
 TImage Image12;
 TImage Image13;
 TImage Image14;
 TImage * const code far Screen1_Images[14]=
 {
 &Image2,
 &Image1,
 &Image3,
 &Image4,
 &Image5,
 &Image6,
 &Image7,
 &Image8,
 &Image9,
 &Image10,
 &Image11,
 &Image12,
 &Image13,
 &Image14
 };




static void InitializeObjects() {
 Screen1.Color = 0xC618;
 Screen1.Width = 240;
 Screen1.Height = 320;
 Screen1.ImagesCount = 14;
 Screen1.Images = Screen1_Images;
 Screen1.ObjectsCount = 14;


 Image2.OwnerScreen = &Screen1;
 Image2.Order = 0;
 Image2.Left = 0;
 Image2.Top = 0;
 Image2.Width = 240;
 Image2.Height = 320;
 Image2.Picture_Type = 1;
 Image2.Picture_Ratio = 1;
 Image2.Picture_Name =  0x00000120 ;
 Image2.Visible = 1;
 Image2.Active = 1;
 Image2.OnUpPtr = 0;
 Image2.OnDownPtr = 0;
 Image2.OnClickPtr = 0;
 Image2.OnPressPtr = 0;

 Image1.OwnerScreen = &Screen1;
 Image1.Order = 1;
 Image1.Left = 0;
 Image1.Top = 0;
 Image1.Width = 240;
 Image1.Height = 320;
 Image1.Picture_Type = 1;
 Image1.Picture_Ratio = 1;
 Image1.Picture_Name =  0x00025926 ;
 Image1.Visible = 1;
 Image1.Active = 1;
 Image1.OnUpPtr = 0;
 Image1.OnDownPtr = 0;
 Image1.OnClickPtr = 0;
 Image1.OnPressPtr = 0;

 Image3.OwnerScreen = &Screen1;
 Image3.Order = 2;
 Image3.Left = 0;
 Image3.Top = 0;
 Image3.Width = 240;
 Image3.Height = 320;
 Image3.Picture_Type = 1;
 Image3.Picture_Ratio = 1;
 Image3.Picture_Name =  0x0004B12C ;
 Image3.Visible = 1;
 Image3.Active = 1;
 Image3.OnUpPtr = 0;
 Image3.OnDownPtr = 0;
 Image3.OnClickPtr = 0;
 Image3.OnPressPtr = 0;

 Image4.OwnerScreen = &Screen1;
 Image4.Order = 3;
 Image4.Left = 0;
 Image4.Top = 0;
 Image4.Width = 240;
 Image4.Height = 320;
 Image4.Picture_Type = 1;
 Image4.Picture_Ratio = 1;
 Image4.Picture_Name =  0x00070932 ;
 Image4.Visible = 1;
 Image4.Active = 1;
 Image4.OnUpPtr = 0;
 Image4.OnDownPtr = 0;
 Image4.OnClickPtr = 0;
 Image4.OnPressPtr = 0;

 Image5.OwnerScreen = &Screen1;
 Image5.Order = 4;
 Image5.Left = 0;
 Image5.Top = 0;
 Image5.Width = 240;
 Image5.Height = 320;
 Image5.Picture_Type = 1;
 Image5.Picture_Ratio = 1;
 Image5.Picture_Name =  0x00096138 ;
 Image5.Visible = 1;
 Image5.Active = 1;
 Image5.OnUpPtr = 0;
 Image5.OnDownPtr = 0;
 Image5.OnClickPtr = 0;
 Image5.OnPressPtr = 0;

 Image6.OwnerScreen = &Screen1;
 Image6.Order = 5;
 Image6.Left = 0;
 Image6.Top = 0;
 Image6.Width = 240;
 Image6.Height = 320;
 Image6.Picture_Type = 1;
 Image6.Picture_Ratio = 1;
 Image6.Picture_Name =  0x000BB93E ;
 Image6.Visible = 1;
 Image6.Active = 1;
 Image6.OnUpPtr = 0;
 Image6.OnDownPtr = 0;
 Image6.OnClickPtr = 0;
 Image6.OnPressPtr = 0;

 Image7.OwnerScreen = &Screen1;
 Image7.Order = 6;
 Image7.Left = 0;
 Image7.Top = 0;
 Image7.Width = 240;
 Image7.Height = 320;
 Image7.Picture_Type = 1;
 Image7.Picture_Ratio = 1;
 Image7.Picture_Name =  0x000E1144 ;
 Image7.Visible = 1;
 Image7.Active = 1;
 Image7.OnUpPtr = 0;
 Image7.OnDownPtr = 0;
 Image7.OnClickPtr = 0;
 Image7.OnPressPtr = 0;

 Image8.OwnerScreen = &Screen1;
 Image8.Order = 7;
 Image8.Left = 0;
 Image8.Top = 0;
 Image8.Width = 240;
 Image8.Height = 320;
 Image8.Picture_Type = 1;
 Image8.Picture_Ratio = 1;
 Image8.Picture_Name =  0x0010694A ;
 Image8.Visible = 1;
 Image8.Active = 1;
 Image8.OnUpPtr = 0;
 Image8.OnDownPtr = 0;
 Image8.OnClickPtr = 0;
 Image8.OnPressPtr = 0;

 Image9.OwnerScreen = &Screen1;
 Image9.Order = 8;
 Image9.Left = 0;
 Image9.Top = 0;
 Image9.Width = 240;
 Image9.Height = 320;
 Image9.Picture_Type = 1;
 Image9.Picture_Ratio = 1;
 Image9.Picture_Name =  0x0012C150 ;
 Image9.Visible = 1;
 Image9.Active = 1;
 Image9.OnUpPtr = 0;
 Image9.OnDownPtr = 0;
 Image9.OnClickPtr = 0;
 Image9.OnPressPtr = 0;

 Image10.OwnerScreen = &Screen1;
 Image10.Order = 9;
 Image10.Left = 0;
 Image10.Top = 0;
 Image10.Width = 240;
 Image10.Height = 320;
 Image10.Picture_Type = 1;
 Image10.Picture_Ratio = 1;
 Image10.Picture_Name =  0x00151956 ;
 Image10.Visible = 1;
 Image10.Active = 1;
 Image10.OnUpPtr = 0;
 Image10.OnDownPtr = 0;
 Image10.OnClickPtr = 0;
 Image10.OnPressPtr = 0;

 Image11.OwnerScreen = &Screen1;
 Image11.Order = 10;
 Image11.Left = 0;
 Image11.Top = 0;
 Image11.Width = 240;
 Image11.Height = 320;
 Image11.Picture_Type = 1;
 Image11.Picture_Ratio = 1;
 Image11.Picture_Name =  0x0017715C ;
 Image11.Visible = 1;
 Image11.Active = 1;
 Image11.OnUpPtr = 0;
 Image11.OnDownPtr = 0;
 Image11.OnClickPtr = 0;
 Image11.OnPressPtr = 0;

 Image12.OwnerScreen = &Screen1;
 Image12.Order = 11;
 Image12.Left = 0;
 Image12.Top = 0;
 Image12.Width = 240;
 Image12.Height = 320;
 Image12.Picture_Type = 1;
 Image12.Picture_Ratio = 1;
 Image12.Picture_Name =  0x0019C962 ;
 Image12.Visible = 1;
 Image12.Active = 1;
 Image12.OnUpPtr = 0;
 Image12.OnDownPtr = 0;
 Image12.OnClickPtr = 0;
 Image12.OnPressPtr = 0;

 Image13.OwnerScreen = &Screen1;
 Image13.Order = 12;
 Image13.Left = 0;
 Image13.Top = 0;
 Image13.Width = 240;
 Image13.Height = 320;
 Image13.Picture_Type = 1;
 Image13.Picture_Ratio = 1;
 Image13.Picture_Name =  0x001C2168 ;
 Image13.Visible = 1;
 Image13.Active = 1;
 Image13.OnUpPtr = 0;
 Image13.OnDownPtr = 0;
 Image13.OnClickPtr = 0;
 Image13.OnPressPtr = 0;

 Image14.OwnerScreen = &Screen1;
 Image14.Order = 13;
 Image14.Left = 0;
 Image14.Top = 0;
 Image14.Width = 240;
 Image14.Height = 320;
 Image14.Picture_Type = 1;
 Image14.Picture_Ratio = 1;
 Image14.Picture_Name =  0x001E796E ;
 Image14.Visible = 1;
 Image14.Active = 1;
 Image14.OnUpPtr = 0;
 Image14.OnDownPtr = 0;
 Image14.OnClickPtr = 0;
 Image14.OnPressPtr = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}




 void DeleteTrailingSpaces(char* str){
 char i;
 i = 0;
 while(1) {
 if(str[0] == ' ') {
 for(i = 0; i < strlen(str); i++) {
 str[i] = str[i+1];
 }
 }
 else
 break;
 }
 }

void DrawImage(TImage *AImage) {
 if (AImage->Visible) {
 TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
 }
}

void DrawScreen(TScreen *aScreen) {
 int order;
 unsigned short image_idx;
 TImage *local_image;
 char save_bled, save_bled_direction;

 object_pressed = 0;
 order = 0;
 image_idx = 0;
 CurrentScreen = aScreen;

 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 save_bled = TFT_BLED;
 save_bled_direction = TFT_BLED_Direction;
 TFT_BLED_Direction = 0;
 TFT_BLED = 0;
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
 TFT_Set_Ext_Buffer(TFT_Get_Data);
 TFT_Fill_Screen(CurrentScreen->Color);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 TFT_BLED = save_bled;
 TFT_BLED_Direction = save_bled_direction;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
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

void Init_MCU() {
 TRISE = 0;
 TFT_DataPort_Direction = 0;
 CLKDIVbits.PLLPRE = 0;

 PLLFBD = 38;

 CLKDIVbits.PLLPOST = 0;

 Delay_ms(150);

 TFT_Set_Active(Set_Index,Write_Command,Write_Data);
}

void Init_Ext_Mem() {

 SPI2_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, _SPI_PRESCALE_SEC_1, _SPI_PRESCALE_PRI_64,
 _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);
 Delay_ms(10);


 if (!Mmc_Fat_Init()) {

 SPI2_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, _SPI_PRESCALE_SEC_1, _SPI_PRESCALE_PRI_4,
 _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);


 Mmc_Fat_Assign("gif_reso.RES", 0);
 Mmc_Fat_Reset(&res_file_size);
 }
}

void Start_TP() {
 Init_MCU();

 Init_Ext_Mem();

 InitializeTouchPanel();

 InitializeObjects();
 display_width = Screen1.Width;
 display_height = Screen1.Height;
 DrawScreen(&Screen1);
}
