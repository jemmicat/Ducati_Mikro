#include "FM_Click_objects.h"
#include "FM_Click_resources.h"

//--------------------- User code ---------------------//

#define _FM_DIR_UP_ 1
#define _FM_DIR_DOWN_ 0

#define BAR_Beg 48
#define BAR_End 400

extern void TunnerRun();

extern char FM_Activate();
extern void FM_Deactivate();
extern void FM_Seek(unsigned short dir);
extern void FM_Tune(unsigned int freq, unsigned short dir);
extern void SetVolume(unsigned short vol);

extern unsigned short powerOn;
unsigned int frekvenc = 0;
extern unsigned int Xcoord, YCoord;
extern int Volume;
int oldVolume = 0;


void UpdateVolBar(){
  // light green - 0xA705  dark green - 0x29E1
  TFT_Set_Brush(1, 0, 1, TOP_TO_BOTTOM,  0xA705, 0x29E1);
  TFT_Rectangle(BAR_Beg, 235, Volume + BAR_Beg, 265);
  // dark grey 0x3186;  light grey 0x632C;
  TFT_Set_Brush(1, 0, 1, TOP_TO_BOTTOM,  0x3186, 0x632C);
  TFT_Rectangle(Volume + BAR_Beg, 235, BAR_End, 265);
}

//----------------- End of User code ------------------//

// Event Handlers

// OnUp and onDonw events are used to create Button behavior of Image components
// ~~~~~~SeekDown
void imgSeekDownOnUp() {
  imgSeekDown.Picture_Name = btn_prev_station_01_bmp;
  DrawImage(&imgSeekDown);
}
void imgSeekDownOnDown() {
  imgSeekDown.Picture_Name = btn_prev_station_02_bmp;
  DrawImage(&imgSeekDown);
}
// ~~~~FineDown
void imgFineDownOnUp() {
  imgFineDown.Picture_Name = btn_prev_01_bmp;
  DrawImage(&imgFineDown);
}
void imgFineDownOnDown() {
  imgFineDown.Picture_Name = btn_prev_02_bmp;
  DrawImage(&imgFineDown);
}
// Stop - depending on powerOn state play or stop Image is changed
void imgStopOnUp() {
  if (powerOn == 1)
    imgStop.Picture_Name = bnt_play_01_bmp;
  else
    imgStop.Picture_Name = btn_stop_01_bmp;
  DrawImage(&imgStop);
}
void imgStopOnDown() {
  if (powerOn == 1)
    imgStop.Picture_Name = btn_stop_02_bmp;
  else
    imgStop.Picture_Name = btn_play_02_bmp;
  DrawImage(&imgStop);
}
//  FineUp
void imgFineUpOnUp() {
  imgFineUp.Picture_Name = btn_next_01_bmp;
  DrawImage(&imgFineUp);
}
void imgFineUpOnDown() {
  imgFineUp.Picture_Name = btn_next_02_bmp;
  DrawImage(&imgFineUp);
}
//  SeekUp
void imgSeekUpOnUp() {
  imgSeekUp.Picture_Name = btn_next_station_01_bmp;
  DrawImage(&imgSeekUp);
}
void imgSeekUpOnDown() {
  imgSeekUp.Picture_Name = btn_next_station_02_bmp;
  DrawImage(&imgSeekUp);
}

// OnClick Events
void imgSeekDownOnClick() {
  FM_Seek(_FM_DIR_DOWN_);
}
void imgFineDownOnClick() {
  FM_Tune(0, _FM_DIR_DOWN_);
}
void imgStopOnClick() {
  if (powerOn == 1){
    FM_Deactivate();
  }
  else{
    FM_Activate();
  }
}
void imgFineUpOnClick() {
  FM_Tune(0, _FM_DIR_UP_);
}
void imgSeekUpOnClick() {
  FM_Seek(_FM_DIR_UP_);
}
void Image2OnClick() {
  TFT_Set_Brush(1, 0x3186, 0, 0, 0, 0);
  TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
}
void imgVolOnClick() {
static click_cnt = 0;
  if ( (click_cnt++) % 2) {   // Disable Volume bar on every odd/second click on volume button
    barVol.Active = 0;
    imgVol.Picture_Name = btn_volume_01_bmp;
    DrawImage(&imgVol);       // Redraw controll buttons
    Drawimage(&imgSeekDown);  //
    Drawimage(&imgFineDown);  //
    Drawimage(&imgStop);      //
    Drawimage(&imgFineUp);    //
    Drawimage(&imgSeekUp);    //
    imgSeekDown.Active = 1;   // Activare control buttons
    imgFineDown.Active = 1;   //
    imgStop.Active     = 1;   //
    imgFineUp.Active   = 1;   //
    imgSeekUp.Active   = 1;   //
  }
}
void imgVolOnDown() {
  if (barVol.Active == 0) {
    imgSeekDown.Active = 0;   // Disale control buttons
    imgFineDown.Active = 0;   //
    imgStop.Active     = 0;   //
    imgFineUp.Active   = 0;   //
    imgSeekUp.Active   = 0;   //
    imgVol.Picture_Name = volume_region_bmp;
    DrawImage(&imgVol);       // Draw Volume bar
    barVol.Active = 1;
    UpdateVolBar();
  }
}
void barVolOnPress() {
  Volume = Xcoord - 48;       // 48- min x value for Volume bar
  if ( Volume < 8 ) {         // Volume is sensitive from 40th pixel
    Volume = 0;
  }
  if ( Volume > 352 ) {
    Volume = 352;
  }
  if ( abs( Volume - oldVolume) > 3) {
    oldVolume = Volume;       // Check for change in Volume
    UpdateVolBar();           // Update bar acording to press position
    SetVolume( Volume / 23 ); // Volume attenuatior have 16 levels. ( 23 * 16 = 368px )
  }
}
void SliderOnPress() {
  TunnerRun();
}
