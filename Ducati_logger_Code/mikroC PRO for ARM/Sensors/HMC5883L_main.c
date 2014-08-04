/*******************************************************************************
* Accel  - Function Set fo Accel Example
* ------------------------------------------------------------------------------
* Example reads accel values and displays graph on TFT for all three axes
*******************************************************************************/
#include "built_in.h"
#include "ducati_logger_objects.h"

// externals
void HMC5883L_Read(int *data_X, int *data_Y, int *data_Z);
char HMC5883L_Init();
void Scroll_Undone(unsigned int first, unsigned int last);
void Scroll(unsigned int scroll);

extern sfr sbit TFT_CS;

// we use Scroll feature to display graph
const _SCROLL_MAGNET_FIRST_LINE = 41, _SCROLL_MAGNET_LAST_LINE = 246;
int _disp_magnet_scroll = _SCROLL_MAGNET_FIRST_LINE;

// external TFT write commands
void TFT_mikromedia_Write_Command(unsigned short cmd);
void TFT_mikromedia_Set_Index(unsigned short index);

//  globals
char magnetout[16];
int magnetreadings[3] = {0, 0, 0}; // X, Y and Z buffer

typedef struct Magnet_values{
  int Xvalue;
  int Yvalue;
  int Zvalue;
} TMagnet_values;
/******************************************************************************/
char cMAGNET_test_status;

/*******************************************************************************
* Function Magnet_Average()
* ------------------------------------------------------------------------------
* Overview: Function calculate the average values of the X, Y and Z axis reads
* Input: Nothing
* Output: X,Y and Z values are stored in readings[] buffer
*******************************************************************************/
static void Magnet_Average() {
  int i, sx, sy, sz, xx, yy, zz;

  // sum
  sx = sy = sz = 0;

  // average accelerometer reading over last 16 samples
  for (i=0; i<16; i++) {
    HMC5883L_Read(&xx, &yy, &zz);
    sx += xx;
    sy += yy;
    sz += zz;
  }
  // average
  magnetreadings[0] = sx >> 4;
  magnetreadings[1] = sy >> 4;
  magnetreadings[2] = sz >> 4;
}

/*******************************************************************************
* Function Display_Value(TLabel *label, int val)
* ------------------------------------------------------------------------------
* Overview: Function display accel values
* Input: desired pointer to Label, measured value
* Output: Nothing
*******************************************************************************/
static void Display_Value(TLabel *label, int val) {
char text[7];
char text1[10];
char *ptr;
  ptr = label->Caption;
  TFT_Set_Pen(Magnetometer_test.Color,  0);
  TFT_Set_Brush(1, Magnetometer_test.Color, 0, 0, 0, 0);
  IntToStr(val & 0xFE, text);
  strcpy(text1, ptr);
  strcat(text1, text);
  TFT_Rectangle(label->Left, Label->Top, label->Left + 55, Label->Top + 20);
  label->Caption = text1;
  Drawlabel(label);
  label->Caption = ptr;
}

const _MAGNET_UP = 1, _MAGNET_DOWN = 0;

/*******************************************************************************
* Function Scroll_MAGNET(char Adir)
* ------------------------------------------------------------------------------
* Overview: Function scrolls graph
* Input: Scroll direction
* Output: Nothing
*******************************************************************************/
static void Scroll_MAGNET(char Adir) {
unsigned int _temp;

if (Adir == _MAGNET_UP) {
      if (_disp_magnet_scroll != _SCROLL_MAGNET_FIRST_LINE)
        _disp_magnet_scroll--;
      else {
        _disp_magnet_scroll = _SCROLL_MAGNET_LAST_LINE - 1;
      }
  }
  else {
      if (_disp_magnet_scroll != _SCROLL_MAGNET_LAST_LINE - 1)
        _disp_magnet_scroll++;
      else {
        _disp_magnet_scroll = _SCROLL_MAGNET_FIRST_LINE;
      }
  }

  Scroll(_disp_magnet_scroll);
}

/*******************************************************************************
* Function WriteGraph(TMagnet_values *old, TMagnet_values *new)
* ------------------------------------------------------------------------------
* Overview: Function writes new graph values on display after scrolling
* Input: accel values
* Output: Nothing
*******************************************************************************/
static void WriteGraph(Tmagnet_values *old, Tmagnet_values *new){
int temp1, temp2;
  if ((_disp_magnet_scroll < _SCROLL_MAGNET_LAST_LINE - 2) && (_disp_magnet_scroll > _SCROLL_MAGNET_FIRST_LINE)){
    TFT_Set_Pen(CL_RED, 2);
    temp1 = (old->Xvalue * 30) / 256 + 90;
    temp2 = (new->Xvalue * 30) / 256 + 90;
    TFT_Line(temp1, _disp_magnet_scroll + 2, temp2, _disp_magnet_scroll + 1);

    TFT_Set_Pen(CL_BLUE, 2);
    temp1 = (old->Yvalue * 30) / 256 + 240;
    temp2 = (new->Yvalue * 30) / 256 + 240;
    TFT_Line(temp1, _disp_magnet_scroll + 2, temp2, _disp_magnet_scroll + 1);

    TFT_Set_Pen(CL_GREEN, 2);
    temp1 = (old->Zvalue * 30) / 256 + 390;
    temp2 = (new->Zvalue * 30) / 256 + 390;
    TFT_Line(temp1, _disp_magnet_scroll + 2, temp2, _disp_magnet_scroll + 1);
  }
}

/*******************************************************************************
* Function Scroll_Add_Line(char ScrollDiection)
* ------------------------------------------------------------------------------
* Overview: Function rewrites one line after scrolling in order to delete overlapped line
* Input: Scroll direction
* Output: Nothing
*******************************************************************************/
static void Scroll_Add_Line(char ScrollDirection){
int i, temp;
  if (ScrollDirection > 0){
      temp = _disp_magnet_scroll + 1;
        if (temp > _SCROLL_MAGNET_LAST_LINE - 1)
      temp = _SCROLL_MAGNET_FIRST_LINE;
      TFT_CS = 0;
      TFT_SSD1963_Set_Address_Ptr(0, temp, 480, temp);
      for (i = 0; i < 480; i++)
        if ((i == 90) | (i == 240) | (i == 390))
          TFT_Write_Data_Ptr(CL_SILVER);
        else
          TFT_Write_Data_Ptr(CL_WHITE);
      TFT_CS = 1;
  }
}

/*******************************************************************************
* Function Magnet_Stop()
* ------------------------------------------------------------------------------
* Overview: Function resets Scroll, should be called when exiting screen
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void MAGNET_Stop(){
  Scroll_Undone(_SCROLL_MAGNET_FIRST_LINE, _SCROLL_MAGNET_LAST_LINE);
}

/*******************************************************************************
* Function ACCEL_Start()
* ------------------------------------------------------------------------------
* Overview: Function Initialize I2C bus and magnet module
* Input: Nothing
* Output: test status: 0 - skiped; 1 - pass; 2 - fail
*******************************************************************************/
void HMC5883L_Start(char *test) {
  // Reset error flag
  *test = 0;

  // Initialize I2C communication
  I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
  Delay_ms(100);
  // Initialize HMC5883L accelerometer
  if (HMC5883L_Init() == 0) {
    *test = 1;
    Delay_ms(500);
  }
  else {
    *test = 2;
  }
  Scroll_Undone(_SCROLL_MAGNET_FIRST_LINE, _SCROLL_MAGNET_LAST_LINE);
}

/*******************************************************************************
* Function HMC5883L_Test()
* ------------------------------------------------------------------------------
* Overview: Function reads accel values
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static void HMC5883L_Test(TMagnet_values *values) {
  Magnet_Average();               // Calculate average X, Y and Z reads

  values->Xvalue = magnetreadings[0];
  values->Yvalue = magnetreadings[1];
  values->Zvalue = magnetreadings[2];
}

TMagnet_values Magnet_vals, Old_Magnet_vals = {0, 0, 0};

/*******************************************************************************
* Function doMagnet()
* ------------------------------------------------------------------------------
* Overview: Function run the accel test, should be calles frequently.
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void doMagnet(){
  HMC5883L_Test(&Magnet_vals);
  Scroll_MAGNET(_MAGNET_UP);
  Scroll_Add_Line(_MAGNET_UP);
  WriteGraph(&Old_Magnet_vals, &Magnet_vals);
  Old_magnet_vals = Magnet_vals;
  
  Display_Value(&LAbel2, Magnet_vals.Xvalue);
  Display_Value(&LAbel3, Magnet_vals.Yvalue);
  Display_Value(&LAbel4, Magnet_vals.Zvalue);
}

/*******************************************************************************
* End of File
*******************************************************************************/