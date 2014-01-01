#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
#line 1 "c:/program files (x86)/mikroc pro for arm/include/built_in.h"
#line 10 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
void ITG3200_Read(int *data_X, int *data_Y, int *data_Z);
char ITG3200_Init();
void Scroll_Undone(unsigned int first, unsigned int last);
void Scroll(unsigned int scroll);

extern sfr sbit TFT_CS;


const _SCROLL_ACCEL_FIRST_LINE = 41, _SCROLL_ACCEL_LAST_LINE = 246;
int _disp_accel_scroll = _SCROLL_ACCEL_FIRST_LINE;


void TFT_mikromedia_Write_Command(unsigned short cmd);
void TFT_mikromedia_Set_Index(unsigned short index);


char out[16];
int readings[3] = {0, 0, 0};

typedef struct Gyro_values{
 int GyroXvalue;
 int GyroYvalue;
 int GyroZvalue;
} TGyro_values;

char cGyro_test_status;
#line 44 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
static void Gyro_Average() {
 int i, sx, sy, sz, xx, yy, zz;


 sx = sy = sz = 0;


 for (i=0; i<16; i++) {
 ITG3200_Read(&xx, &yy, &zz);
 sx += xx;
 sy += yy;
 sz += zz;
 }

 readings[0] = sx >> 4;
 readings[1] = sy >> 4;
 readings[2] = sz >> 4;
}
#line 70 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
static void Display_Value(TLabel *label, int val) {
char text[7];
char text1[10];
char *ptr;
 ptr = label->Caption;
 TFT_Set_Pen(Accelerometer.Color, 0);
 TFT_Set_Brush(1, Accelerometer.Color, 0, 0, 0, 0);
 IntToStr(val & 0xFE, text);
 strcpy(text1, ptr);
 strcat(text1, text);
 TFT_Rectangle(label->Left, Label->Top, label->Left + 55, Label->Top + 20);
 label->Caption = text1;
 Drawlabel(label);
 label->Caption = ptr;
}

const _Gyro_UP = 1, _Gyro_DOWN = 0;
#line 95 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
static void Scroll_Gyro(char Adir) {
unsigned int _temp;

if (Adir == _Gyro_UP) {
 if (_disp_gyro_scroll != _SCROLL_GYRO_FIRST_LINE)
 _disp_gyro_scroll--;
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
#line 123 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
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
#line 150 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
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
#line 174 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
void Gyro_Stop(){
 Scroll_Undone(_SCROLL_GYRO_FIRST_LINE, _SCROLL_GYRO_LAST_LINE);
}
#line 185 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
void GYRO_Start(char *test) {

 *test = 0;


 I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C2_PF01);
 Delay_ms(100);

 if (ITG3200_Init() == 0) {
 *test = 1;
 Delay_ms(500);
 }
 else {
 *test = 2;
 }
 Scroll_Undone(_SCROLL_GYRO_FIRST_LINE, _SCROLL_GYRO_LAST_LINE);
}
#line 210 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
static void GYRO_Test(TGyro_values *values) {
 Gyro_Average();

 values->GyroXvalue = readings[0];
 values->GyroYvalue = readings[1];
 values->GyroZvalue = readings[2];
}

TGyro_values Gyro_vals, Old_Gyro_vals = {0, 0, 0};
#line 227 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_main.c"
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
