/*******************************************************************************
* Slide Show  - Function Set used for Slide Show
* ------------------------------------------------------------------------------
* Pictures from SD cards are scrolled vertically as slide show
*******************************************************************************/
#include "mikromedia_STM32plus_objects.h"

// extern TFT functions
extern sbit sfr TFT_CS;
void TFT_Write_to_16bitPort(unsigned int _data);
void TFT_mikromedia_Write_Command(unsigned short cmd);
void TFT_mikromedia_Set_Index(unsigned short index);

const _SLIDES_SCROLL_FIRST_LINE = 38;
const _SLIDES_SCROLL_LAST_LINE  = 247;

// extern functions
char* MyTFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num);
void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset);
void Scroll_Undone(unsigned int first, unsigned int last);
void Scroll(unsigned int scroll);
char Init_FAT();

// extern variables
extern sfr sbit MMC_Card_Detect;
extern char Fat_Initialized_Flag;
extern signed short Ext_fhandle;
extern char Ext_res_initialized;
extern unsigned int Xcoord, Ycoord;

// external pictures on SD card
extern const unsigned long arm_compilers_04_bmp;
extern const unsigned long click_02_bmp;
extern const unsigned long easymx_pro_stm32_05_bmp;
extern const unsigned long mikromedia_stm32_07_bmp;
extern const unsigned long mikromedia_stm32_09_bmp;
extern const unsigned long mikroprog_stm32_10_bmp;
extern const unsigned long mini_boards_12_bmp;
extern const unsigned long visual_tft_03_bmp;

// array of pictures
unsigned long Slides[8] = {
  click_02_bmp,
  visual_tft_03_bmp,
  arm_compilers_04_bmp,
  easymx_pro_stm32_05_bmp,
  mikromedia_stm32_07_bmp,
  mikromedia_stm32_09_bmp,
  mikroprog_stm32_10_bmp,
  mini_boards_12_bmp
};
signed short Slide_Index = 0;

// variables
static unsigned int OldYcoo, OldDelta;
static int Slides_disp_scroll = 38;
static int Slides_imageLine = 0;
static char Slide_Flag = 0;
static char Slide_Dir;
static char Slide_Dir_Old = 0;
static char Slide_Index_Old = 0xFF;

static unsigned long left_image;
static unsigned long right_image;

/*******************************************************************************
* Function DrawImageLine(unsigned long image, int line)
* ------------------------------------------------------------------------------
* Overview:  Function writes one horizontal line on the display
* Input: pointer to appropriate picture, desired line
* Output: Nothing
*******************************************************************************/
static void DrawImageLine(unsigned long image, int line){
  unsigned long offset, readed;
  unsigned int i, color, count;
  char *ptr;

  TFT_CS = 0;
  offset = image + 6 + (unsigned long)line*960;
  count = 960;
  TFT_SSD1963_Set_Address_Ptr(0, Slides_disp_scroll, 479, Slides_disp_scroll);
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

/*******************************************************************************
* Function Slides_Scroll(char Adir)
* ------------------------------------------------------------------------------
* Overview:  Function scrolls picture for one line in desired direction
* Input: direction
* Output: Nothing
*******************************************************************************/
static void Slides_Scroll(char Adir) {
unsigned int _temp;

  if (Adir == 1) {
      if (Slides_disp_scroll != _SLIDES_SCROLL_LAST_LINE - 1)
        Slides_disp_scroll++;
      else {
        Slides_disp_scroll = _SLIDES_SCROLL_FIRST_LINE;
      }
  }
  else {
      if (Slides_disp_scroll != _SLIDES_SCROLL_FIRST_LINE)
        Slides_disp_scroll--;
      else {
        Slides_disp_scroll = _SLIDES_SCROLL_LAST_LINE - 1;
      }
  }

  Scroll(Slides_disp_scroll);
}

/*******************************************************************************
* Function GetNextImage()
* ------------------------------------------------------------------------------
* Overview:  Function gets next Image rom array
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static void GetNextImage(){
  left_image = right_image;
  right_image = Slides[Slide_Index];

  Slides_imageLine = 0;
}

/*******************************************************************************
* Function GetPreviousImage()
* ------------------------------------------------------------------------------
* Overview:  Function gets previous Image rom array
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static void GetPreviousImage(){
  right_image = left_image;
  left_image = Slides[Slide_Index];

  Slides_imageLine = 209;
}

/*******************************************************************************
* Function Slides_ScrollUp(int scroll)
* ------------------------------------------------------------------------------
* Overview:  Function scrolls up desired number of lines and add new line
* Input: Number of lines to scroll
* Output: Nothing
*******************************************************************************/
static void Slides_ScrollUp(int scroll){
  while(scroll--){
    Slides_Scroll(1);              // Scroll image
    DrawImageLine(right_image,Slides_imageLine); //  and draw next image line
    Slides_imageLine++;
  }
}

/*******************************************************************************
* Function Slides_ScrollDown(int scroll)
* ------------------------------------------------------------------------------
* Overview:  Function scrolls down desired number of lines and add new line
* Input: Number of lines to scroll
* Output: Nothing
*******************************************************************************/
static void Slides_ScrollDown(int scroll){
  while(scroll--){
    Slides_imageLine--;
    DrawImageLine(left_image,Slides_imageLine);
    Slides_Scroll(0);
  }
}

/*******************************************************************************
* Function ScrollImageUp(int scroll)
* ------------------------------------------------------------------------------
* Overview:  Function scrolls up desired number of lines and gets new picture if needed
* Input: Number of lines to scroll
* Output: Nothing
*******************************************************************************/
void ScrollImageUp(int scroll){
  if (Slides_imageLine == 0){
    if (Slide_Dir == 1)
      GetPreviousImage();
  }
  Slide_Dir = 2;

  if((Slides_imageLine+scroll > 210)){
    Slide_Index ++;
    if (Slide_Index > 7)
      Slide_Index = 0;
      
    GetNextImage();
    Slides_ScrollUp(scroll);
  }
  else{
    Slides_ScrollUp(scroll);
  }
}

/*******************************************************************************
* Function ScrollImageDown(int scroll)
* ------------------------------------------------------------------------------
* Overview:  Function scrolls down desired number of lines and gets new picture if needed
* Input: Number of lines to scroll
* Output: Nothing
*******************************************************************************/
void ScrollImageDown(int scroll){
  if (Slides_imageLine == 209){
    if (Slide_Dir == 2)
      GetNextImage();
  }
  Slide_Dir = 1;
  
  if((Slides_imageLine-scroll < 0)){// || (Slides_imageLine == 209)){
    Slide_Index--;
    if (Slide_Index < 0)
      Slide_Index = 7;
      
    GetPreviousImage();
    Slides_ScrollDown(scroll);
  }
  else {
    Slides_ScrollDown(scroll);
  }
}

/*******************************************************************************
* Function Start_Slide_Show()
* ------------------------------------------------------------------------------
* Overview:  Function initializes Scroll
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Start_Slide_Show(){
  
  Scroll_Undone(_SLIDES_SCROLL_FIRST_LINE, _SLIDES_SCROLL_LAST_LINE);
  Slide_Dir = 0;
  left_image = Slides[0];
  right_image = Slides[7];
  Slide_Index = 0;
  Slide_Dir_Old = 0;
    
  if(Init_FAT()){
    TFT_Ext_Image(0, 38, Slides[0], 1);
  }
}

/*******************************************************************************
* Function Slide_scroll()
* ------------------------------------------------------------------------------
* Overview:  Function polls touch for vertical Scroll (should be called when touch is detected on Scroll area)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Slide_scroll(){
int delta;
char dir, step;

  if (Slide_Flag == 0){
    Slide_Flag = 1;
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

  while (delta > 0){
    if (dir == 1)
      ScrollImageUp(1);
    else
      ScrollImageDown(1);
    delta = delta - 1;
  }
  
  OldYcoo = Ycoord;
}

/*******************************************************************************
* Function doSlide()
* ------------------------------------------------------------------------------
* Overview:  Function Slides pictures (should be called frequently)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void doSlide(){
  if (STMPE610_PressDetect() == 0){
    Slide_Flag = 0;
    if ((Slides_imageLine > 0) && (Slides_imageLine < 209)){
      if ((Slides_imageLine > 20) && (Slide_Dir == 2))
        ScrollImageUp(209 - Slides_imageLine);
      if ((Slides_imageLine < 21) && (Slide_Dir == 2))
        ScrollImageDown(Slide_Index);
      if ((Slides_imageLine < 189) &&  (Slide_Dir == 1))
        ScrollImageDown(Slides_imageLine);
      if ((Slides_imageLine > 188) &&  (Slide_Dir == 1))
        ScrollImageUp(209 - Slides_imageLine);
    }
  }
  if (Slide_Index_Old != Slide_Index){
    ByteToStr(Slide_Index + 1, Label35_caption);
    RedrawLabel(SlideShow.Color, &Label35, 20, 30);
    Slide_Index_Old = Slide_Index;
  }
}