#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
#line 1 "c:/program files (x86)/mikroc pro for arm/include/built_in.h"
#line 10 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
void ADXL345_Read(int *data_X, int *data_Y, int *data_Z);
char ADXL345_Init();
void Scroll_Undone(unsigned int first, unsigned int last);
void Scroll(unsigned int scroll);

extern sfr sbit TFT_CS;


const _SCROLL_ACCEL_FIRST_LINE = 41, _SCROLL_ACCEL_LAST_LINE = 246;
int _disp_accel_scroll = _SCROLL_ACCEL_FIRST_LINE;


void TFT_mikromedia_Write_Command(unsigned short cmd);
void TFT_mikromedia_Set_Index(unsigned short index);


char out[16];
int readings[3] = {0, 0, 0};

typedef struct Accel_values{
 int Xvalue;
 int Yvalue;
 int Zvalue;
} TAccel_values;

char cACCEL_test_status;
#line 44 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
static void Accel_Average() {
 int i, sx, sy, sz, xx, yy, zz;


 sx = sy = sz = 0;


 for (i=0; i<16; i++) {
 ADXL345_Read(&xx, &yy, &zz);
 sx += xx;
 sy += yy;
 sz += zz;
 }

 readings[0] = sx >> 4;
 readings[1] = sy >> 4;
 readings[2] = sz >> 4;
}
#line 70 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
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

const _ACCEL_UP = 1, _ACCEL_DOWN = 0;
#line 95 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
static void Scroll_ACCEL(char Adir) {
unsigned int _temp;

if (Adir == _ACCEL_UP) {
 if (_disp_accel_scroll != _SCROLL_ACCEL_FIRST_LINE)
 _disp_accel_scroll--;
 else {
 _disp_accel_scroll = _SCROLL_ACCEL_LAST_LINE - 1;
 }
 }
 else {
 if (_disp_accel_scroll != _SCROLL_ACCEL_LAST_LINE - 1)
 _disp_accel_scroll++;
 else {
 _disp_accel_scroll = _SCROLL_ACCEL_FIRST_LINE;
 }
 }

 Scroll(_disp_accel_scroll);
}
#line 123 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
static void WriteGraph(TAccel_values *old, TAccel_values *new){
int temp1, temp2;
 if ((_disp_accel_scroll < _SCROLL_ACCEL_LAST_LINE - 2) && (_disp_accel_scroll > _SCROLL_ACCEL_FIRST_LINE)){
 TFT_Set_Pen(CL_RED, 2);
 temp1 = (old->Xvalue * 30) / 256 + 90;
 temp2 = (new->Xvalue * 30) / 256 + 90;
 TFT_Line(temp1, _disp_accel_scroll + 2, temp2, _disp_accel_scroll + 1);

 TFT_Set_Pen(CL_BLUE, 2);
 temp1 = (old->Yvalue * 30) / 256 + 240;
 temp2 = (new->Yvalue * 30) / 256 + 240;
 TFT_Line(temp1, _disp_accel_scroll + 2, temp2, _disp_accel_scroll + 1);

 TFT_Set_Pen(CL_GREEN, 2);
 temp1 = (old->Zvalue * 30) / 256 + 390;
 temp2 = (new->Zvalue * 30) / 256 + 390;
 TFT_Line(temp1, _disp_accel_scroll + 2, temp2, _disp_accel_scroll + 1);
 }
}
#line 150 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
static void Scroll_Add_Line(char ScrollDiection){
int i, temp;
 if (ScrollDiection > 0){
 temp = _disp_accel_scroll + 1;
 if (temp > _SCROLL_ACCEL_LAST_LINE - 1)
 temp = _SCROLL_ACCEL_FIRST_LINE;
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
#line 174 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
void Accel_Stop(){
 Scroll_Undone(_SCROLL_ACCEL_FIRST_LINE, _SCROLL_ACCEL_LAST_LINE);
}
#line 185 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
void ACCEL_Start(char *test) {

 *test = 0;


 I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
 Delay_ms(100);

 if (ADXL345_Init() == 0) {
 *test = 1;
 Delay_ms(500);
 }
 else {
 *test = 2;
 }
 Scroll_Undone(_SCROLL_ACCEL_FIRST_LINE, _SCROLL_ACCEL_LAST_LINE);
}
#line 210 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
static void ACCEL_Test(TAccel_values *values) {
 Accel_Average();

 values->Xvalue = readings[0];
 values->Yvalue = readings[1];
 values->Zvalue = readings[2];
}

TAccel_values Accel_vals, Old_Accel_vals = {0, 0, 0};
#line 227 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_main.c"
void doAccel(){
 ACCEL_Test(&Accel_vals);
 Scroll_ACCEL(_ACCEL_UP);
 Scroll_Add_Line(_ACCEL_UP);
 WriteGraph(&Old_Accel_vals, &Accel_vals);
 Old_accel_vals = Accel_vals;

 Display_Value(&LAbel2, Accel_vals.Xvalue);
 Display_Value(&LAbel3, Accel_vals.Yvalue);
 Display_Value(&LAbel4, Accel_vals.Zvalue);
}
