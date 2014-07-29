/*******************************************************************************
* Gyro  - Function Set fo Gyro Example
* ------------------------------------------------------------------------------
* Example reads Gyro values and displays graph on TFT for all three axes
*******************************************************************************/
#include "built_in.h"
#include "ducati_logger_objects.h"

// externals
void ITG3200_Read(int *data_X, int *data_Y, int *data_Z);
char ITG3200_Init();
void Scroll_Undone(unsigned int first, unsigned int last);
void Scroll(unsigned int scroll);

extern sfr sbit TFT_CS;

// we use Scroll feature to display graph
const _SCROLL_ACCEL_FIRST_LINE = 41, _SCROLL_ACCEL_LAST_LINE = 246;
int _disp_accel_scroll = _SCROLL_ACCEL_FIRST_LINE;

// external TFT write commands
void TFT_mikromedia_Write_Command(unsigned short cmd);
void TFT_mikromedia_Set_Index(unsigned short index);

//  globals
char out[16];
int readings[3] = {0, 0, 0}; // X, Y and Z buffer

typedef struct Gyro_values{
  int GyroXvalue;
  int GyroYvalue;
  int GyroZvalue;
} TGyro_values;
/******************************************************************************/
char cGyro_test_status;

/*******************************************************************************
* Function Gyro_Average()
* ------------------------------------------------------------------------------
* Overview: Function calculate the average values of the X, Y and Z axis reads
* Input: Nothing
* Output: X,Y and Z values are stored in readings[] buffer
*******************************************************************************/
static void Gyro_Average() {
  int i, sx, sy, sz, xx, yy, zz;

  // sum
  sx = sy = sz = 0;

  // average accelerometer reading over last 16 samples
  for (i=0; i<16; i++) {
    ITG3200_Read(&xx, &yy, &zz);
    sx += xx;
    sy += yy;
    sz += zz;
  }
  // average
  readings[0] = sx >> 4;
  readings[1] = sy >> 4;
  readings[2] = sz >> 4;
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
  TFT_Set_Pen(Sensor_test.Color,  0);
  TFT_Set_Brush(1, Sensor_test.Color, 0, 0, 0, 0);
  IntToStr(val & 0xFE, text);
  strcpy(text1, ptr);
  strcat(text1, text);
  TFT_Rectangle(label->Left, Label->Top, label->Left + 55, Label->Top + 20);
  label->Caption = text1;
  Drawlabel(label);
  label->Caption = ptr;
}

const _Gyro_UP = 1, _Gyro_DOWN = 0;

/*******************************************************************************
* Function Scroll_Gyro(char Adir)
* ------------------------------------------------------------------------------
* Overview: Function scrolls graph
* Input: Scroll direction
* Output: Nothing
*******************************************************************************/
static void Scroll_Gyro(char Adir) {
unsigned int _temp;

if (Adir == _Gyro_UP) {
      //if (_disp_gyro_scroll != _SCROLL_GYRO_FIRST_LINE)
      //  _disp_gyro_scroll--;
      else {
        _disp_gyro_scroll = _SCROLL_GYRO_LAST_LINE - 1;
      }
  }
  else {
      if (_disp_gyro_scroll != _SCROLL_GYRO_LAST_LINE - 1)
        _disp_gyro_scroll++;
      else {
        _disp_gyro_scroll = _SCROLL_GYRO_FIRST_LINE;
      }
  }

  Scroll(_disp_gyro_scroll);
}

/*******************************************************************************
* Function WriteGraph(TGyro_values *old, TGyro_values *new)
* ------------------------------------------------------------------------------
* Overview: Function writes new graph values on display after scrolling
* Input: gyro values
* Output: Nothing
*******************************************************************************/
static void WriteGraph(TGyro_values *old, TGyro_values *new){
int temp1, temp2;
  if ((_disp_gyro_scroll < _SCROLL_GYRO_LAST_LINE - 2) && (_disp_gyro_scroll > _SCROLL_GYRO_FIRST_LINE)){
    TFT_Set_Pen(CL_RED, 2);
    temp1 = (old->GyroXvalue * 30) / 256 + 90;
    temp2 = (new->GyroXvalue * 30) / 256 + 90;
    TFT_Line(temp1, _disp_gyro_scroll + 2, temp2, _disp_gyro_scroll + 1);

    TFT_Set_Pen(CL_BLUE, 2);
    temp1 = (old->GyroYvalue * 30) / 256 + 240;
    temp2 = (new->GyroYvalue * 30) / 256 + 240;
    TFT_Line(temp1, _disp_gyro_scroll + 2, temp2, _disp_gyro_scroll + 1);

    TFT_Set_Pen(CL_GREEN, 2);
    temp1 = (old->GyroZvalue * 30) / 256 + 390;
    temp2 = (new->GyroZvalue * 30) / 256 + 390;
    TFT_Line(temp1, _disp_gyro_scroll + 2, temp2, _disp_gyro_scroll + 1);
  }
}

/*******************************************************************************
* Function Scroll_Add_Line(char ScrollDiection)
* ------------------------------------------------------------------------------
* Overview: Function rewrites one line after scrolling in order to delete overlapped line
* Input: Scroll direction
* Output: Nothing
*******************************************************************************/
static void Scroll_Add_Line(char ScrollDiection){
int i, temp;
  if (ScrollDiection > 0){
      temp = _disp_gyro_scroll + 1;
        if (temp > _SCROLL_GYRO_LAST_LINE - 1)
      temp = _SCROLL_GYRO_FIRST_LINE;
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
* Function Gyro_Stop()
* ------------------------------------------------------------------------------
* Overview: Function resets Scroll, should be called when exiting screen
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Gyro_Stop(){
  Scroll_Undone(_SCROLL_GYRO_FIRST_LINE, _SCROLL_GYRO_LAST_LINE);
}

/*******************************************************************************
* Function GYRO_Start()
* ------------------------------------------------------------------------------
* Overview: Function Initialize I2C bus and gyro module
* Input: Nothing
* Output: test status: 0 - skiped; 1 - pass; 2 - fail
*******************************************************************************/
void GYRO_Start(char *test) {
  // Reset error flag
  *test = 0;

  // Initialize I2C communication
  I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C2_PF01);
  Delay_ms(100);
  // Initialize ITG3200 Gyro
  if (ITG3200_Init() == 0) {
    *test = 1;
    Delay_ms(500);
  }
  else {
    *test = 2;
  }
  Scroll_Undone(_SCROLL_GYRO_FIRST_LINE, _SCROLL_GYRO_LAST_LINE);
}

/*******************************************************************************
* Function GYRO_Test()
* ------------------------------------------------------------------------------
* Overview: Function reads gyro values
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static void GYRO_Test(TGyro_values *values) {
  Gyro_Average();               // Calculate average X, Y and Z reads

  values->GyroXvalue = readings[0];
  values->GyroYvalue = readings[1];
  values->GyroZvalue = readings[2];
}

TGyro_values Gyro_vals, Old_Gyro_vals = {0, 0, 0};

/*******************************************************************************
* Function doGyro()
* ------------------------------------------------------------------------------
* Overview: Function run the gyro test, should be calles frequently.
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void doGyro(){
  GYRO_Test(&Gyro_vals);
  Scroll_GYRO(_GYRO_UP);
  Scroll_Add_Line(_GYRO_UP);
  WriteGraph(&Old_Gyro_vals, &Gyro_vals);
  Old_gyro_vals = Gyro_vals;
  
  Display_Value(&LAbel2, Gyro_vals.GyroXvalue);
  Display_Value(&LAbel3, Gyro_vals.GyroYvalue);
  Display_Value(&LAbel4, Gyro_vals.GyroZvalue);
}

/*******************************************************************************
* End of File
*******************************************************************************/