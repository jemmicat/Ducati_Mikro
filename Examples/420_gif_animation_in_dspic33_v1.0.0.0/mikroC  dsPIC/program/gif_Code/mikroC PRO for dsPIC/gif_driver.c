#include "gif_objects.h"
#include "gif_resources.h"
#include "built_in.h"

// Extern memory interface
// MMC/SD Connections
sbit Mmc_Chip_Select at LATG9_bit;
sbit Mmc_Chip_Select_Direction at TRISG9_bit;
// end of MMC/SD
// TFT Get Data globals
unsigned long currentSector = -1, res_file_size;
// end of TFT Get Data
// End of extern memory interface


// TFT module connections
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
// End TFT module connections

// Touch Panel module connections
sbit DRIVEX_LEFT at LATB13_bit;
sbit DRIVEX_RIGHT at LATB11_bit;
sbit DRIVEY_UP at LATB12_bit;
sbit DRIVEY_DOWN at LATB10_bit;
sbit DRIVEX_LEFT_DIRECTION at TRISB13_bit;
sbit DRIVEX_RIGHT_DIRECTION at TRISB11_bit;
sbit DRIVEY_UP_DIRECTION at TRISB12_bit;
sbit DRIVEY_DOWN_DIRECTION at TRISB10_bit;
// End Touch Panel module connections

// Global variables
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

// set index
void Set_Index(unsigned short index) {
  TFT_RS = 0;
  Lo(LATA) = index;
  TFT_WR = 0;
  TFT_WR = 1;
}

// write command
void Write_Command(unsigned short cmd) {
  TFT_RS = 1;
  Lo(LATA) = cmd;
  TFT_WR = 0;
  TFT_WR = 1;
}

// write data
void Write_Data(unsigned int _data) {
  TFT_RS = 1;
  Lo(LATE) = Hi(_data);
  Lo(LATA) = Lo(_data);
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


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                Screen1;
  TImage               Image2;
  TImage               Image1;
  TImage               Image3;
  TImage               Image4;
  TImage               Image5;
  TImage               Image6;
  TImage               Image7;
  TImage               Image8;
  TImage               Image9;
  TImage               Image10;
  TImage               Image11;
  TImage               Image12;
  TImage               Image13;
  TImage               Image14;
  TImage                 * const code far Screen1_Images[14]=
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
  Screen1.Color                     = 0xC618;
  Screen1.Width                     = 240;
  Screen1.Height                    = 320;
  Screen1.ImagesCount               = 14;
  Screen1.Images                    = Screen1_Images;
  Screen1.ObjectsCount              = 14;


  Image2.OwnerScreen     = &Screen1;
  Image2.Order          = 0;
  Image2.Left           = 0;
  Image2.Top            = 0;
  Image2.Width          = 240;
  Image2.Height         = 320;
  Image2.Picture_Type        = 1;
  Image2.Picture_Ratio  = 1;
  Image2.Picture_Name   = a_jpg;
  Image2.Visible        = 1;
  Image2.Active         = 1;
  Image2.OnUpPtr         = 0;
  Image2.OnDownPtr       = 0;
  Image2.OnClickPtr      = 0;
  Image2.OnPressPtr      = 0;

  Image1.OwnerScreen     = &Screen1;
  Image1.Order          = 1;
  Image1.Left           = 0;
  Image1.Top            = 0;
  Image1.Width          = 240;
  Image1.Height         = 320;
  Image1.Picture_Type        = 1;
  Image1.Picture_Ratio  = 1;
  Image1.Picture_Name   = b_jpg;
  Image1.Visible        = 1;
  Image1.Active         = 1;
  Image1.OnUpPtr         = 0;
  Image1.OnDownPtr       = 0;
  Image1.OnClickPtr      = 0;
  Image1.OnPressPtr      = 0;

  Image3.OwnerScreen     = &Screen1;
  Image3.Order          = 2;
  Image3.Left           = 0;
  Image3.Top            = 0;
  Image3.Width          = 240;
  Image3.Height         = 320;
  Image3.Picture_Type        = 1;
  Image3.Picture_Ratio  = 1;
  Image3.Picture_Name   = c_jpg;
  Image3.Visible        = 1;
  Image3.Active         = 1;
  Image3.OnUpPtr         = 0;
  Image3.OnDownPtr       = 0;
  Image3.OnClickPtr      = 0;
  Image3.OnPressPtr      = 0;

  Image4.OwnerScreen     = &Screen1;
  Image4.Order          = 3;
  Image4.Left           = 0;
  Image4.Top            = 0;
  Image4.Width          = 240;
  Image4.Height         = 320;
  Image4.Picture_Type        = 1;
  Image4.Picture_Ratio  = 1;
  Image4.Picture_Name   = d_jpg;
  Image4.Visible        = 1;
  Image4.Active         = 1;
  Image4.OnUpPtr         = 0;
  Image4.OnDownPtr       = 0;
  Image4.OnClickPtr      = 0;
  Image4.OnPressPtr      = 0;

  Image5.OwnerScreen     = &Screen1;
  Image5.Order          = 4;
  Image5.Left           = 0;
  Image5.Top            = 0;
  Image5.Width          = 240;
  Image5.Height         = 320;
  Image5.Picture_Type        = 1;
  Image5.Picture_Ratio  = 1;
  Image5.Picture_Name   = e_jpg;
  Image5.Visible        = 1;
  Image5.Active         = 1;
  Image5.OnUpPtr         = 0;
  Image5.OnDownPtr       = 0;
  Image5.OnClickPtr      = 0;
  Image5.OnPressPtr      = 0;

  Image6.OwnerScreen     = &Screen1;
  Image6.Order          = 5;
  Image6.Left           = 0;
  Image6.Top            = 0;
  Image6.Width          = 240;
  Image6.Height         = 320;
  Image6.Picture_Type        = 1;
  Image6.Picture_Ratio  = 1;
  Image6.Picture_Name   = f_jpg;
  Image6.Visible        = 1;
  Image6.Active         = 1;
  Image6.OnUpPtr         = 0;
  Image6.OnDownPtr       = 0;
  Image6.OnClickPtr      = 0;
  Image6.OnPressPtr      = 0;

  Image7.OwnerScreen     = &Screen1;
  Image7.Order          = 6;
  Image7.Left           = 0;
  Image7.Top            = 0;
  Image7.Width          = 240;
  Image7.Height         = 320;
  Image7.Picture_Type        = 1;
  Image7.Picture_Ratio  = 1;
  Image7.Picture_Name   = g_jpg;
  Image7.Visible        = 1;
  Image7.Active         = 1;
  Image7.OnUpPtr         = 0;
  Image7.OnDownPtr       = 0;
  Image7.OnClickPtr      = 0;
  Image7.OnPressPtr      = 0;

  Image8.OwnerScreen     = &Screen1;
  Image8.Order          = 7;
  Image8.Left           = 0;
  Image8.Top            = 0;
  Image8.Width          = 240;
  Image8.Height         = 320;
  Image8.Picture_Type        = 1;
  Image8.Picture_Ratio  = 1;
  Image8.Picture_Name   = h_jpg;
  Image8.Visible        = 1;
  Image8.Active         = 1;
  Image8.OnUpPtr         = 0;
  Image8.OnDownPtr       = 0;
  Image8.OnClickPtr      = 0;
  Image8.OnPressPtr      = 0;

  Image9.OwnerScreen     = &Screen1;
  Image9.Order          = 8;
  Image9.Left           = 0;
  Image9.Top            = 0;
  Image9.Width          = 240;
  Image9.Height         = 320;
  Image9.Picture_Type        = 1;
  Image9.Picture_Ratio  = 1;
  Image9.Picture_Name   = i_jpg;
  Image9.Visible        = 1;
  Image9.Active         = 1;
  Image9.OnUpPtr         = 0;
  Image9.OnDownPtr       = 0;
  Image9.OnClickPtr      = 0;
  Image9.OnPressPtr      = 0;

  Image10.OwnerScreen     = &Screen1;
  Image10.Order          = 9;
  Image10.Left           = 0;
  Image10.Top            = 0;
  Image10.Width          = 240;
  Image10.Height         = 320;
  Image10.Picture_Type        = 1;
  Image10.Picture_Ratio  = 1;
  Image10.Picture_Name   = j_jpg;
  Image10.Visible        = 1;
  Image10.Active         = 1;
  Image10.OnUpPtr         = 0;
  Image10.OnDownPtr       = 0;
  Image10.OnClickPtr      = 0;
  Image10.OnPressPtr      = 0;

  Image11.OwnerScreen     = &Screen1;
  Image11.Order          = 10;
  Image11.Left           = 0;
  Image11.Top            = 0;
  Image11.Width          = 240;
  Image11.Height         = 320;
  Image11.Picture_Type        = 1;
  Image11.Picture_Ratio  = 1;
  Image11.Picture_Name   = k_jpg;
  Image11.Visible        = 1;
  Image11.Active         = 1;
  Image11.OnUpPtr         = 0;
  Image11.OnDownPtr       = 0;
  Image11.OnClickPtr      = 0;
  Image11.OnPressPtr      = 0;

  Image12.OwnerScreen     = &Screen1;
  Image12.Order          = 11;
  Image12.Left           = 0;
  Image12.Top            = 0;
  Image12.Width          = 240;
  Image12.Height         = 320;
  Image12.Picture_Type        = 1;
  Image12.Picture_Ratio  = 1;
  Image12.Picture_Name   = l_jpg;
  Image12.Visible        = 1;
  Image12.Active         = 1;
  Image12.OnUpPtr         = 0;
  Image12.OnDownPtr       = 0;
  Image12.OnClickPtr      = 0;
  Image12.OnPressPtr      = 0;

  Image13.OwnerScreen     = &Screen1;
  Image13.Order          = 12;
  Image13.Left           = 0;
  Image13.Top            = 0;
  Image13.Width          = 240;
  Image13.Height         = 320;
  Image13.Picture_Type        = 1;
  Image13.Picture_Ratio  = 1;
  Image13.Picture_Name   = m_jpg;
  Image13.Visible        = 1;
  Image13.Active         = 1;
  Image13.OnUpPtr         = 0;
  Image13.OnDownPtr       = 0;
  Image13.OnClickPtr      = 0;
  Image13.OnPressPtr      = 0;

  Image14.OwnerScreen     = &Screen1;
  Image14.Order          = 13;
  Image14.Left           = 0;
  Image14.Top            = 0;
  Image14.Width          = 240;
  Image14.Height         = 320;
  Image14.Picture_Type        = 1;
  Image14.Picture_Ratio  = 1;
  Image14.Picture_Name   = n_jpg;
  Image14.Visible        = 1;
  Image14.Active         = 1;
  Image14.OnUpPtr         = 0;
  Image14.OnDownPtr       = 0;
  Image14.OnClickPtr      = 0;
  Image14.OnPressPtr      = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetImage(index)               CurrentScreen->Images[index]

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
    TFT_BLED           = 0;
    TFT_Set_Active(Set_Index, Write_Command, Write_Data);
    TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Set_Ext_Buffer(TFT_Get_Data);
    TFT_Fill_Screen(CurrentScreen->Color);
    display_width = CurrentScreen->Width;
    display_height = CurrentScreen->Height;
    TFT_BLED           = save_bled;
    TFT_BLED_Direction = save_bled_direction;
  }
  else
    TFT_Fill_Screen(CurrentScreen->Color);


  while (order < CurrentScreen->ObjectsCount) {
    if (image_idx  < CurrentScreen->ImagesCount) {
      local_image = GetImage(image_idx);
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
  CLKDIVbits.PLLPRE = 0;      // PLLPRE<4:0> = 0  ->  N1 = 2    8MHz / 2 = 4MHz
                              // (must be within 0.8 MHz to 8 MHz range)
  PLLFBD =   38;              // PLLDIV<8:0> = 38 ->  M = 40    4MHz * 40 = 160MHz
                              // (must be within 100 MHz to 200 MHz range)
  CLKDIVbits.PLLPOST = 0;     // PLLPOST<1:0> = 0 ->  N2 = 2    160MHz / 2 = 80MHz
                              // (must be within 12.5 MHz to 80 MHz range)
  Delay_ms(150);

  TFT_Set_Active(Set_Index,Write_Command,Write_Data);
}

void Init_Ext_Mem() {
  // Initialize SPI
  SPI2_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, _SPI_PRESCALE_SEC_1, _SPI_PRESCALE_PRI_64,
                    _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);
  Delay_ms(10);

  // Initialize MMC
  if (!Mmc_Fat_Init()) {
    // Reinitialize SPI at higher speed
    SPI2_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, _SPI_PRESCALE_SEC_1, _SPI_PRESCALE_PRI_4,
                      _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);

    // Open resource file for read
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