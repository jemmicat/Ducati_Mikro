#include "mikromedia_STM32plus_objects.h"
#include "mikromedia_STM32plus_resources.h"

//--------------------- User code ---------------------//
extern sfr sbit LED_R;
extern sfr sbit LED_G;
extern sfr sbit LED_B;

extern signed short Ext_fhandle;
extern char Ext_res_initialized;

extern char cACCEL_test_status;
extern char PenDown;
extern sfr sbit TFT_BLED;

void doAccel();
void ACCEL_Start(char *test);
void Accel_Stop();

void PickColor();
void RGB_Init();
void RGB_OFF();

void doRTC_Example();
void RTC_Example_init();
char Set_MyRTCC();
void checkRTC();
void MinutesOnes();
void MinutesTens();
void HoursOnes();
void HoursTens();
void Deactivate_All_Rollers();
void AmPmRun();

void Sensors_Init();
void Sensors_Read();
void Stop_sensors();

void ScrollPress();
void ScrollOnClick();
void Stop_Scroll();

extern char MP3_Example_State;
extern signed short current_file;
void Mp3_Init();
void doMP3();
void StopMP3_File();
void GetNext_mp3_File(char Next_Previous);
void MP3_play(char *Song_Name, char File_No);
void MP3_Set_Volume(char left, char right);

void ScrollImageUp(int scroll);
void ScrollImageDown(int scroll);
void Start_Slide_Show();
extern signed short Slide_Index;
void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset);
void Slide_scroll();
void doSlide();

void ButtonClick(TButton *Butt, char No);
extern TButton *ButtonArray[];
void XO_Reset();

void checkPowerM();
extern char Display_Bat_Stat;

void Start_nRF();
void doTicTacToe();

typedef struct t_drawingTool{
  unsigned int pen_size;
  unsigned short EraserSelected;
  TBox *CurrentPen;
  TBox *PreviousPen;

  TBox *CurrentColor;
  TBox *PreviousColor;
};
extern unsigned int Xcoord, Ycoord;
extern struct t_drawingTool drawingTool;

void UpdatePenSelection();
void UpdatePenColor();
void SetDefaults();
void SelectColor(TBox *ColorBox);

char Init_FAT();

extern void Start_Ethernet();

typedef struct Time {
  short ampm;
  short seconds;
  short minutes;
  short hours;
  short day;
  short month;
  int year;
} TTime;
TTime Current_Time;
void Set_RTC(TTime *RTCC_Time);
char RTCC_Read(TTime *RTCC_Time);

char Example_State;

void Run_Example(){
  switch (Example_State) {
    case 0 : {
              checkRTC();            // Home screen
              checkPowerM();
             }; break;
    case 1 : {
              doAccel();             // Accel Screen
             }; break;
    case 2 : {                       // RTCC screen
              if (PenDown == 0)
                doRTC_Example();
             }; break;
    case 3 : break;                  // RGB screen
    case 4 : {
              Sensors_Read();        // Sensors screen
             }; break;
    case 5 : {
              doMp3();               // MP3
             }; break;
    case 6 : break;       
    case 7 : {                       // Slide Show
               doSlide();
             }; break;
    case 8 : {                       // Tic Tac Toe
               doTicTacToe();
             }; break;
  }
}

void BLED_Fade_Out(){
  int i;
  
  for ( i = 255; i > 0 ; i-- ){
    TFT_Set_DBC_SSD1963(i);
    Delay_ms(1);
  }
  TFT_Set_DBC_SSD1963(0);
}

void BLED_Fade_In(){
  int i;

  for (i = 1; i < 255; i++){
    TFT_Set_DBC_SSD1963(i);
    Delay_ms(1);
  }
    TFT_Set_DBC_SSD1963(255);
}

char level = 100, old_level = 0;
void UpdateVolumeBar(char vol, char old_vol){
  unsigned int xcoo;

  xcoo = (vol*3)/4 + VolmeBar.Left;

  if (xcoo < VolmeBar.Left)
    xcoo = VolmeBar.Left;

  if (xcoo > VolmeBar.Left + VolmeBar.Width)
    xcoo = VolmeBar.Left + VolmeBar.Width;

//  if (vol >= old_vol){
    TFT_Set_Brush(1, 0x55FF, 0, 0, 0, 0);
    TFT_Set_Pen(0x55FF, 0);
    TFT_Rectangle(VolmeBar.Left, VolmeBar.Top, xcoo, VolmeBar.Top + VolmeBar.Height);
//  }
//  else{
    TFT_Set_Brush(1, VolmeBar.Color, 0, 0, 0, 0);
    TFT_Set_Pen(VolmeBar.Color, 0);
    TFT_Rectangle(xcoo + 1, VolmeBar.Top, VolmeBar.Left + VolmeBar.Width + 1, VolmeBar.Top + VolmeBar.Height);
//  }
}

//----------------- End of User code ------------------//

// Event Handlers

void Image2OnPress() {
  Example_State = 0;
  BLED_Fade_Out();
  Accel_Stop();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  BLED_Fade_In();
}

void Image1OnPress() {
  Example_State = 1;
  BLED_Fade_Out();
  DrawScreen(&Accelerometer);
  BLED_Fade_In();
  ACCEL_Start(&cACCEL_test_status);
}

void Image3OnPress() {
  BLED_Fade_Out();
  DrawScreen(&RGBLight);
  RGB_Init();
  Example_State = 3;
  BLED_Fade_In();
  
}

void Image5OnPress() {
  BLED_Fade_Out();
  RGB_OFF();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  BLED_Fade_In();
  Example_state = 0;
}

void Image4OnPress() {
//  PickColor();
}

void Image6OnClick() {
  BLED_Fade_Out();
  DrawScreen(&Clock);
  BLED_Fade_In();
  RTC_Example_init();
  Example_State = 2;
}

void Box2OnPress() {
  HoursTens();
}

void Box3OnPress() {
  HoursOnes();
}

void Box4OnPress() {
  MinutesTens();
}

void Box5OnPress() {
  MinutesOnes();
}

void ClockBackOnPress() {
  BLED_Fade_Out();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  BLED_Fade_In();
  Example_State = 0;
}

void Image8OnPress() {
  if (Set_MyRTCC() == 0)
    return;
  Example_State = 0;
  BLED_Fade_Out();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  BLED_Fade_In();
}

void BackIconSensorsOnPress() {
  Stop_sensors();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  Example_state = 0;
  BLED_Fade_In();
}

void Image9OnPress() {
  Sensors_Init();
  Example_state = 4;
  BLED_Fade_Out();
  DrawScreen(&Sensors);
  Sensors_Read();
  BLED_Fade_In();
}

void Image16OnClick() {
  BLED_Fade_Out();
  DrawScreen(&MP3_SongList);
  Mp3_Init();
  Example_state = 5;
  BLED_Fade_In();
}

void mp3_back_iconOnPress() {
  BLED_Fade_Out();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  Example_state = 0;
  BLED_Fade_In();
}

void Label22OnPress() {

}

void Image15OnPress() {
  BLED_Fade_Out();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  Example_state = 0;
  Stop_Scroll();
  BLED_Fade_In();
}

void Label24OnPress() {

}

void Box6OnPress() {
  ScrollPress();
}

void Box6OnClick() {
  ScrollOnClick();
}

void Icon_back_mp3OnClick() {
  BLED_Fade_Out();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  Example_state = 0;
  BLED_Fade_In();
}

void Label27OnPress() {

}

/* PAINT CODE */
void DrawingAreaOnPress() {
  if ((Xcoord >= DrawingArea.Left+drawingTool.pen_size) && (Ycoord >= DrawingArea.Top+drawingTool.pen_size)){
    if (drawingTool.EraserSelected){
      TFT_Set_Pen(DrawingArea.Color, 0);
      TFT_Set_Brush(1, DrawingArea.Color, 0, 0, 0, 0);
    }
    TFT_Circle(Xcoord, Ycoord, drawingTool.pen_size);
  }
}

void Color01OnPress() {
  SelectColor(&Color01);
}

void Color02OnPress() {
  SelectColor(&Color02);
}

void Color03OnPress() {
  SelectColor(&Color03);
}

void Color04OnPress() {
  SelectColor(&Color04);
}

void Color05OnPress() {
  SelectColor(&Color05);
}

void Color06OnPress() {
  SelectColor(&Color06);
}

void Color07OnPress() {
  SelectColor(&Color07);
}

void Color08OnPress() {
  SelectColor(&Color08);
}

void Color09OnPress() {
  SelectColor(&Color09);
}

void Color10OnPress() {
  SelectColor(&Color10);
}

void Color11OnPress() {
  SelectColor(&Color11);
}

void Color12OnPress() {
  SelectColor(&Color12);
}

void Color13OnPress() {
  SelectColor(&Color13);
}

void Color14OnPress() {
  SelectColor(&Color14);
}

void Color15OnPress() {
  SelectColor(&Color15);
}

void Color16OnPress() {
  SelectColor(&Color16);
}

void Color17OnPress() {
  SelectColor(&Color17);
}

void Color18OnPress() {
  SelectColor(&Color18);
}

void Color19OnPress() {
  SelectColor(&Color19);
}

void Color20OnPress() {
  SelectColor(&Color20);
}

void Color21OnPress() {
  SelectColor(&Color21);
}

void Color22OnPress() {
  SelectColor(&Color22);
}

void Color23OnPress() {
  SelectColor(&Color23);
}

void Color24OnPress() {
  SelectColor(&Color24);
}

void Color25OnPress() {
  SelectColor(&Color25);
}

void Color26OnPress() {
  SelectColor(&Color26);
}

void Color27OnPress() {
  SelectColor(&Color27);
}

void Color28OnPress() {
  SelectColor(&Color28);
}

void Color29OnPress() {
  SelectColor(&Color29);
}

void Color30OnPress() {
  SelectColor(&Color30);
}

void Pen1OnPress() {
  if (drawingTool.CurrentPen != &Pen1){
    drawingTool.pen_size = 2;
    drawingTool.PreviousPen = drawingTool.CurrentPen;
    drawingTool.CurrentPen = &Pen1;
    UpdatePenSelection();
  }
}

void Pen2OnPress() {
  if (drawingTool.CurrentPen != &Pen2){
    drawingTool.pen_size = 3;
    drawingTool.PreviousPen = drawingTool.CurrentPen;
    drawingTool.CurrentPen = &Pen2;
    UpdatePenSelection();
  }
}

void Pen3OnPress() {
  if (drawingTool.CurrentPen != &Pen3){
    drawingTool.pen_size = 5;
    drawingTool.PreviousPen = drawingTool.CurrentPen;
    drawingTool.CurrentPen = &Pen3;
    UpdatePenSelection();
  }
}

void NewScreenOnPress() {
  DrawBox(&DrawingArea);
  UpdatePenColor();
}

void BackGroundColorOnPress() {
  DrawingArea.Color = drawingTool.CurrentColor->Color;
  DrawBox(&DrawingArea);
}

void EraserOnPress() {
  if (drawingTool.EraserSelected != 1){
    Pen.Picture_Name = icon_brush_bmp;
    DrawImage(&Pen);
    Eraser.Picture_Name = icon_eraser_selected_bmp;
    DrawImage(&Eraser);
    drawingTool.EraserSelected = 1;
    UpdatePenColor();
  }
}

void PenOnPress() {
  if (drawingTool.EraserSelected != 0){
    drawingTool.EraserSelected = 0;
    Eraser.Picture_Name = icon_eraser_bmp;
    DrawImage(&Eraser);
    Pen.Picture_Name = icon_brush_selected_bmp;
    DrawImage(&Pen);
    UpdatePenColor();
  }
}

void Image24OnPress() {
  BLED_Fade_Out();
  SetDefaults();
  DrawScreen(&Paint);
  Example_state = 6;
  BLED_Fade_In();  
}

void icon_paint_backOnPress() {
  BLED_Fade_Out();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  Example_state = 0;
  BLED_Fade_In();
}

void pause_iconOnPress() {
  TFT_Set_Pen(ProgressBar.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(pause_icon.Left - 2, 220, pause_icon.Left + pause_icon.Width + 2, 243);
  MP3_Example_State = 3;
  pause_icon.Active = 0;
  Play_icon.Active = 1;
  DrawImage(&play_icon);
  TFT_Set_Pen(MP3_Player.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(pause_icon.Left - 2, 220, pause_icon.Left + pause_icon.Width + 2, 243);
}

void songlist_iconOnPress() {
  TFT_Set_Pen(ProgressBar.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(songlist_icon.Left - 2, 220, songlist_icon.Left + songlist_icon.Width + 2, 243);
  StopMP3_File();
//  Mp3_Init();
  Example_state = 5;
  MP3_Example_State = 0;
  TFT_Set_Pen(MP3_Player.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(songlist_icon.Left - 2, 220, songlist_icon.Left + songlist_icon.Width + 2, 243);
}
  
void stop_iconOnDown() {
  TFT_Set_Pen(ProgressBar.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(stop_icon.Left - 2, 220, stop_icon.Left + stop_icon.Width + 2, 243);
  StopMP3_File();
  MP3_Example_State = 1;
  pause_icon.Active = 0;
  Play_icon.Active = 1;
  DrawImage(&stop_icon);
  DrawImage(&play_icon);
  TFT_Set_Pen(MP3_Player.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(stop_icon.Left - 2, 220, stop_icon.Left + stop_icon.Width + 2, 243);
}

void next_iconOnDown() {
  TFT_Set_Pen(ProgressBar.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(next_icon.Left - 2, 220, next_icon.Left + next_icon.Width + 2, 243);
  GetNext_mp3_File(1);
  DrawImage(&next_icon);
  pause_icon.Active = 1;
  Play_icon.Active = 0;
  DrawImage(&pause_icon);
  TFT_Set_Pen(MP3_Player.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(next_icon.Left - 2, 220, next_icon.Left + next_icon.Width + 2, 243);
}

void previous_iconOnDown() {
  TFT_Set_Pen(ProgressBar.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(previous_icon.Left - 2, 220, previous_icon.Left + previous_icon.Width + 2, 243);
  GetNext_mp3_File(0);
  DrawImage(&previous_icon);
  pause_icon.Active = 1;
  Play_icon.Active = 0;
  DrawImage(&pause_icon);
  TFT_Set_Pen(MP3_Player.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(previous_icon.Left - 2, 220, previous_icon.Left + previous_icon.Width + 2, 243);
}
  
void VolmeBarOnPress() {
  unsigned int temp;

  temp = Xcoord - VolmeBar.Left;
  temp = temp * 100;
  level = temp / VolmeBar.Width;
  MP3_Set_Volume(100 - level, 100 - level);

  UpdateVolumeBar(level, old_level);
  old_level = level;
}

void ProgreesBarOnPress() {

}

void Play_iconOnDown() {
  TFT_Set_Pen(ProgressBar.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(Play_icon.Left - 2, 220, Play_icon.Left + Play_icon.Width + 2, 243);
  pause_icon.Active = 1;
  Play_icon.Active = 0;
  if (MP3_Example_State == 1)
    MP3_play(Label28_Caption, current_file);
  MP3_Example_State = 2;
  DrawImage(&pause_icon);
  TFT_Set_Pen(MP3_Player.Color, 1);
  TFT_Set_Brush(0, 0, 0, 0, 0, 0);
  TFT_Rectangle(Play_icon.Left - 2, 220, Play_icon.Left + Play_icon.Width + 2, 243);
}

void Icon_next_boxOnPress() {
  char i;

//  ByteToStr(Slide_Index + 1, Label35_caption);
//  RedrawLabel(SlideShow.Color, &Label35, 25, 30);
    
  for (i = 0; i < 209; i ++)
    ScrollImageDown(1);
}

void icon_previous_boxOnPress() {
  char i;

//  ByteToStr(Slide_Index + 1, Label35_caption);
//  RedrawLabel(SlideShow.Color, &Label35, 25, 30);
    
  for (i = 0; i < 209; i ++)
    ScrollImageUp(1);
}

void Image18OnClick() {
  BLED_Fade_Out();
  DrawScreen(&SlideShow);
  Start_Slide_Show();
  Example_state = 7;
  ByteToStr(Slide_Index + 1, Label35_caption);
  RedrawLabel(SlideShow.Color, &Label35, 20, 30);
  BLED_Fade_In();
}

void Box7OnDown() {
  BLED_Fade_Out();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  Example_state = 0;
  Stop_Scroll();
  BLED_Fade_In();
}

void RGB_Active_areaOnPress() {
  PickColor();
}

void Box9OnPress() {
  BLED_Fade_Out();
  DrawScreen(&Home);
  Display_Bat_Stat = 1;
  checkPowerM();
  Example_state = 0;
  NVIC_IntDisable(IVT_INT_TIM5);
  BLED_Fade_In();
  LED_R = 0;
  LED_B = 0;
  LED_G = 0;
}

void Box11OnPress() {
  XO_Reset();
}

void Button1OnClick() {
  ButtonClick(ButtonArray[0], 0);
}

void Button2OnClick() {
  ButtonClick(ButtonArray[1], 1);
}

void Button3OnClick() {
  ButtonClick(ButtonArray[2], 2);
}

void Button4OnClick() {
  ButtonClick(ButtonArray[3], 3);
}

void Button5OnClick() {
  ButtonClick(ButtonArray[4], 4);
}

void Button6OnClick() {
  ButtonClick(ButtonArray[5], 5);
}

void Button7OnClick() {
  ButtonClick(ButtonArray[6], 6);
}

void Button8OnClick() {
  ButtonClick(ButtonArray[7], 7);
}

void Button9OnClick() {
  ButtonClick(ButtonArray[8], 8);
}

void Image22OnClick() {
  BLED_Fade_Out();
  DrawScreen(&Tic_Tac_Toe);
  Example_state = 8;
  // init RGB
  GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
  Init_FAT();
  XO_Reset();
  BLED_Fade_In();
}

void Box12OnPress() {

}

void Slide_Active_areaOnPress() {
  Slide_scroll();
}

void CheckBox1OnClick() {
  Start_nRF();
}

void Box10OnClick() {
  if (CheckBox1.Checked == 0)
    CheckBox1.Checked = 1;
  else
    CheckBox1.Checked = 0;
  DrawCheckBox(&CheckBox1);
  Start_nRF();
}


void Box12OnClick() {
  Deactivate_All_Rollers();
  Start_Ethernet();
}

void Box13OnClick() {
  Deactivate_All_Rollers();
}

void Box14OnPress() {
  AmPmRun();
}
