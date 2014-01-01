/*******************************************************************************
* MP3_main  - Function Set used for MP3 player
* ------------------------------------------------------------------------------
*
*******************************************************************************/

#include "mikromedia_STM32plus_objects.h"
#include "mikromedia_STM32plus_resources.h"
#include "__Lib_FAT32.h"

// external funsctions from MP# driver
void MP3_SCI_Read(char start_address, char words_count, unsigned int *data_buffer);
void MP3_SCI_Write(char address, unsigned int data_in);
void MP3_SDI_Write_32(char *data_);
void MP3_SDI_Write(char data_);
void MP3_Set_default_Mode();
void MP3_Set_Volume(char left, char right);
void MP3_Reset_Time();
void MP3_Get_Decode_Time(unsigned long *time);

// extern connection declarations
extern sfr sbit Mmc_Chip_Select;
extern sfr sbit MMC_Card_Detect;

extern sfr sbit MP3_CS;
extern sfr sbit MP3_RST;
extern sfr sbit BSYNC;
extern sfr sbit DREQ;

// external variables
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

// extern functions
void BLED_Fade_In();
void BLED_Fade_Out();
char Init_FAT();
void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset);
char Get_Next_File_Name(signed short number, char *Text);
void UpdateVolumeBar(char vol, char old_vol);
void Initialize_Scroll();

// variables
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

/*******************************************************************************
* Function MP3_play(char *Song_Name, char File_No)
* ------------------------------------------------------------------------------
* Overview: Function starts to play new mp3 file
* Input: File name, number of file in the list
* Output: Nothing
*******************************************************************************/
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

/*******************************************************************************
* Function Start_MP3_Player(char *Song_Name, char File_No)
* ------------------------------------------------------------------------------
* Overview: Function starts to play new mp3 file
* Input: File name, number of file in the list
* Output: Nothing
*******************************************************************************/
void Start_MP3_Player(char *Song_Name, char File_No){
  strcpy(Label28_Caption, Song_Name);
  DrawScreen(&MP3_Player);
  TFT_Ext_Image(204, 57, mp3_note_bmp, 1);
  pause_icon.Active = 1;
  Play_icon.Active = 0;
  DrawImage(&pause_icon);
  MP3_play(Song_Name, File_No);
}

/*******************************************************************************
* Function StopMP3_File()
* ------------------------------------------------------------------------------
* Overview: Function stops playing and closes mp3 file
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void StopMP3_File(){
  FAT32_Close(current_fhandle);
  MP3_Example_State = 3;
}

/*******************************************************************************
* Function GetNext_mp3_File(char Next_Previous)
* ------------------------------------------------------------------------------
* Overview: Function gets next audio file for playing
* Input: flag if we should get next or previous file from list
* Output: Nothing
*******************************************************************************/
void GetNext_mp3_File(char Next_Previous){      // 0 for previous, 1 for next
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
/*******************************************************************************
* Function MP3_Check_Time()
* ------------------------------------------------------------------------------
* Overview: Function updates progress bar on Player screen
* Input: Nothing
* Output: Nothing
*******************************************************************************/
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
/*******************************************************************************
* Function UpdateProgressBar()
* ------------------------------------------------------------------------------
* Overview: Function updates progress bar on Player screen
* Input: Nothing
* Output: Nothing
*******************************************************************************/
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

/*******************************************************************************
* Function doMP3()
* ------------------------------------------------------------------------------
* Overview: Function runs mp3 example. Should be called frequently
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void doMP3(){
 unsigned long i;
  switch (MP3_Example_State){
    case 0 : { // mp3 example started
               if (MMC_Card_Detect == 0){        // if SD card detected
                 DrawScreen(&MP3_SongList);
                 Delay_ms(100);
                 Mp3_Init();
                 MP3_Example_State = 1;
               }
               else{                             // if there is no SD card
                 DrawImage(Images[MP3_Example_cnt / 200]);
                 MP3_Example_cnt++;
                 if (MP3_Example_cnt > 599)
                   MP3_Example_cnt = 0;
               }
             }; break;
    case 1 : { // stop playing
             }; break;                           // if mp3 is stopped, do nothing
    case 2 : { // play song
               if (file_size > BUFFER_SIZE){     // while there is still data, send it to mp3 codec chip
                 Fat32_Read(current_fhandle, mp3_buffer, BUFFER_SIZE);
                 for (i=0; i<BUFFER_SIZE/BYTES_2_WRITE; i++) {
                   MP3_SDI_Write_32(mp3_buffer + i*BYTES_2_WRITE);
                 }
                 file_size -= BUFFER_SIZE;
                 Buffer_count ++;
               }
               UpdateProgressBar();              // update progress bar
               MP3_Check_Time();                 // update elapsed time
               if (file_size < BUFFER_SIZE){     // finish playing file
                 Fat32_Read(current_fhandle, mp3_buffer, file_size);
                 for (i=0; i<file_size; i++){
                   MP3_SDI_Write(mp3_buffer[i]);
                 }
                 MP3_Example_State = 1;
                 Buffer_count ++;
                 UpdateProgressBar();
               }
    
             }; break;
    case 3 : { // pause playing
             }; break;
  
  }
}

/*******************************************************************************
* Function Mp3_Init()
* ------------------------------------------------------------------------------
* Overview: Function Starts MP3 example (draws appropriate Screen and sets state)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
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

/*******************************************************************************
* Function MP3_Start()
* ------------------------------------------------------------------------------
* Overview: Function Initialize SPI and MP3 codec chip for operation
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void MP3_Start() {

  // MP3_CS, MP3_RST and BSYNC are outputs
  GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_8 | _GPIO_PINMASK_10 | _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_OUTPUT);
  // DREQ is input
  GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT);
  
  MP3_CS            = 1;               // Deselect MP3_CS
  MP3_RST           = 1;               // Set MP3_RST pin
  BSYNC             = 0;               // Clear BSYNC
  BSYNC             = 1;               // Clear BSYNC

  // Initialize SPI2 module
  SPI2_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI2_PB13_14_15);

  MP3_Set_default_Mode();

  // Initialize SPI2 module at higher speed
  SPI2_Init_Advanced(_SPI_FPCLK_DIV4, _SPI_MASTER | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI2_PB13_14_15);
                     
  MP3_Set_Volume(100 - level, 100 - level);
  MP3_Reset_Time();
}