/*******************************************************************************
* Scroll  - Function Set used for text scrolling
* ------------------------------------------------------------------------------
*
*******************************************************************************/

#include "mikromedia_STM32plus_objects.h"
#include "mikromedia_STM32plus_resources.h"
#include "built_in.h"
#include "__Lib_FAT32.h"

__DIR MyDir;
short MyError;

// scrolling constants
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
const char *MP3_Font = Open_Sans_Light14x22_Regular;

// externs
extern sbit sfr TFT_CS;
extern unsigned int Xcoord, Ycoord;
extern const unsigned long mp3_player_note_bmp;

void Scroll_Undone(unsigned int first, unsigned int last);
void Start_MP3_Player(char *Song_Name, char File_No);
void Scroll(unsigned int scroll);
void BLED_Fade_In();
void BLED_Fade_Out();
char* MyTFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num);

// locals
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

// Dummy write functions used to retreive TFT_Write_text coordinates
void Dummy_Set_address(unsigned int x1, unsigned int y1, unsigned int x2, unsigned int y2){
  if (current_text_column == y1)
    pix_array[x1] = 1;
}

void Dummy_Write_data(unsigned int ddata){

}

/*******************************************************************************
* Function Scroll_Get_One_Text_Line(char line, char *text)
* ------------------------------------------------------------------------------
* Overview: Function Gets desired Pixel Line of text and fills it in a array
* Input: desired line number, pointer to text
* Output: Nothing
*******************************************************************************/
void Scroll_Get_One_Text_Line(char line, char *text){
  memset(pix_array, 0, 165);
  current_text_column = line;
  TFT_Write_Data_Ptr =  Dummy_Write_data;
  TFT_SSD1963_Set_Address_Ptr = Dummy_Set_address;
  TFT_Set_Font(MP3_Font, _MP3_FONT_COLOR, FO_HORIZONTAL);
  TFT_Write_Text(text, _MP3_TEXT_VLINE, 0);
  TFT_SSD1963_Set_Address_Ptr = TFT_Set_Address_SSD1963II;
  TFT_Write_Data_Ptr = TFT_Write_to_16bitPort;
}

/*******************************************************************************
* Function Scroll_New_Tex_From_List(char text_number, char *Text)
* ------------------------------------------------------------------------------
* Overview:  Function copies one entry from list into desired string
* Input: desired entry, pointer to text
* Output: Nothing
*******************************************************************************/
char Scroll_New_Tex_From_List(char text_number, char *Text){
char *ptr, *dptr;
  dptr = Text;
  ptr = File_List[text_number].FIleName;

  while (*dptr++ = *ptr++)
    ;
    
  return File_List[text_number].FIleType;
}

/*******************************************************************************
* Function Get_Next_File_Name(signed short number, char *Text)
* ------------------------------------------------------------------------------
* Overview:  Returns type of desired file
* Input: desired entry, pointer to text
* Output: 2 No more files
*         1 audio file (mp3 or wav)
*         0 directory
*******************************************************************************/
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

/*******************************************************************************
* Function Scrool_Get_new_text(char Text_no)
* ------------------------------------------------------------------------------
* Overview:  Function gets new text line for displaying
* Input: desired entry
* Output: File type
*******************************************************************************/
char current_loaded_text = 0;
char Scrool_Get_new_text(char Text_no){
  if (current_loaded_text != Text_no){
    current_loaded_text = Text_no;
    Scroll_New_Tex_From_List(Text_no, Scroll_Text);
  }
  return File_List[Text_no].FileType;
}

/*******************************************************************************
* Function Scroll_Write_One_Line(unsigned int HO_Line, TImage *Img)
* ------------------------------------------------------------------------------
* Overview:  Function writes one horizontal line on the display
* Input: desired line, pointer to appropriate picture (folder or file)
* Output: Nothing
*******************************************************************************/
void Scroll_Write_One_Line(unsigned int HO_Line, TImage *Img){
  const code char *ptr;
  unsigned int i, color;
  
  // Set pointer on proper position in the picture
  ptr = Img->Picture_Name + 6;
  ptr += (long)(Img->Width) * (current_text_column) * 2;
  
  TFT_CS = 0;
  // Set address on the display
  TFT_SSD1963_Set_Address_Ptr(0, HO_Line, 479, HO_Line);
  for (i = 0; i < 479; i++)
    if ((i > _MP3_IMAGE_VLINE - 1) && (i < _MP3_IMAGE_VLINE + Img->Width)){
      //write image
      if (current_text_column < Img->Height){
        color = (*ptr++);
        color += (*ptr++) << 8;
        TFT_Write_Data_Ptr(color);
      }
      else
        TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
    }
    // write text
    else if (pix_array[i])
      TFT_Write_Data_Ptr(_MP3_FONT_COLOR);
    else
      TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
  TFT_CS = 1;

}

/*******************************************************************************
* Function Add_Image_LIne()
* ------------------------------------------------------------------------------
* Overview:  Function Add new line with desired picture from external resources
* Input: Nothing
* Output: Nothing
*******************************************************************************/
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

/*******************************************************************************
* Function Scroll_Fill_Area()
* ------------------------------------------------------------------------------
* Overview:  Function fills Scroll area with text from File_List
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Scroll_Fill_Area(){
char *ptr, *dptr, i;
unsigned int temp, temp1;
  dptr = Scroll_text;
  i = 0;
  ptr = File_List[i].FileName;

  // write Text
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

  // if there is uncomplete text, write it too
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

/*******************************************************************************
* Function Scroll_Add_newTextLine(char ScrollDiection)
* ------------------------------------------------------------------------------
* Overview:  Function adds new line of text after scrolling
* Input: Scroll direction
* Output: Nothing
*******************************************************************************/
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

/*******************************************************************************
* Function Scroll_Menu(char Adir)
* ------------------------------------------------------------------------------
* Overview:  Function scrolls display in desired directon
* Input: Scroll direction
* Output: Nothing
*******************************************************************************/
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

/*******************************************************************************
* Function ScrollUp(int scroll)
* ------------------------------------------------------------------------------
* Overview:  Function should be called to perform Scroll up
* Input: number of lines to scroll
* Output: Nothing
*******************************************************************************/
void ScrollUp(int scroll){
  while(scroll--){
    last_window_column --;
    first_window_column --;
    if (first_window_column >= 0){
      imageLine--;
      if (imageline < 0)
        imageline = 188;
      Scroll_Menu(_Up);              // Scroll image
      Scroll_Add_newTextLine(_Up);
    }
    else {
      last_window_column ++;
      first_window_column ++;
    }
  }
}

/*******************************************************************************
* Function ScrollDown(int scroll)
* ------------------------------------------------------------------------------
* Overview:  Function should be called to perform Scroll down
* Input: number of lines to scroll
* Output: Nothing
*******************************************************************************/
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

/*******************************************************************************
* Function ScrollDown(unsigned int Apos, char Adir)
* ------------------------------------------------------------------------------
* Overview:  Function should be called to perform Scroll in desired direction
* Input: Scroll direction, number of lines to scroll
* Output: Nothing
*******************************************************************************/
void Scroll_Disp(unsigned int Apos, char Adir) {
  if (Adir == _Up) {
    ScrollUP(Apos);
  }
  else {
    ScrollDown(Apos);
  }
}

/*******************************************************************************
* Function ScrollPress()
* ------------------------------------------------------------------------------
* Overview:  Function polls touch panel values. Should be called frequently
* Input: Nothing
* Output: Nothing
*******************************************************************************/
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

/*******************************************************************************
* Function Process_file()
* ------------------------------------------------------------------------------
* Overview:  Function process selected file
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Process_file(char File_No){
  BLED_Fade_Out();
  Stop_Scroll();
  Start_MP3_Player(File_List[File_No].FileName, File_no);
  BLED_Fade_In();
}

/*******************************************************************************
* Function Process_folder()
* ------------------------------------------------------------------------------
* Overview:  Function process selected folder
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Process_folder(char File_No){
  FAT32_ChangeDir(File_List[File_No].FileName);
  DrawBox(&Box6);
  Initialize_Scroll();
}

/*******************************************************************************
* Function ScrollOnClick()
* ------------------------------------------------------------------------------
* Overview:  Function determines whish entry was pressed
* Input: Nothing
* Output: Nothing
*******************************************************************************/
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

/*******************************************************************************
* Function Fill_List(TScroll_List *List)
* ------------------------------------------------------------------------------
* Overview:  Function fills File_List with entries from SD card (FAT32)
* Input: Pointer to File_List
* Output: Total Entries
*******************************************************************************/
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

/*******************************************************************************
* Function Stop_Scroll()
* ------------------------------------------------------------------------------
* Overview:  Function stops scroller and resets variables
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Stop_Scroll(){
  _disp_scroll = _SCROLL_FIRST_LINE;
  _disp_scroll_rollover = 0;
  first_window_column = 0;
  last_window_column = _SCROLL_HEIGHT;
  Scroll_Undone(_SCROLL_FIRST_LINE, _SCROLL_LAST_LINE);
}

/*******************************************************************************
* Function Initialize_Scroll()
* ------------------------------------------------------------------------------
* Overview:  Function initializes scroller and resets variables
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Initialize_Scroll(){
  Stop_Scroll();
  FAT32_FindFirst(&MyDir);
  Total_Entries = Fill_List(File_List);
  Scroll_Fill_Area();
  imageLine = 188;
}