#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
#line 1 "c:/program files (x86)/mikroc pro for arm/include/built_in.h"
#line 1 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/mikromedia_stm32plus_objects.h"
typedef struct Screen TScreen;

typedef struct {
 unsigned int X_Min;
 unsigned int X_Max;
 unsigned int Y_Min;
 unsigned int Y_Max;
 char Rotate;
} TTPConstants;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct Circle {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCircle;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int CirclesCount;
 TCircle * const code *Circles;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
};

extern TScreen Home;
extern TImage Image1;
extern TImage Image3;
extern TLabel Label5;
extern TLabel Label7;
extern TLabel Label8;
extern TImage Image6;
extern TLabel Label14;
extern TImage Image10;
extern TLabel Label19;
extern TImage Image9;
extern TLabel Label20;
extern TImage Image16;
extern TLabel Label25;
extern TImage Image18;
extern TLabel Label34;
extern TImage BatteryStatus;
extern TLabel * const code Screen1_Labels[8];
extern TImage * const code Screen1_Images[8];

extern TScreen Accelerometer;
extern TBox Box23;
extern TBox Box1;
extern TImage Image2;
extern TLabel Label1;
extern TLabel Label2;
extern TLabel Label3;
extern TLabel Label4;
extern TLabel * const code Screen2_Labels[4];
extern TImage * const code Screen2_Images[1];
extern TBox * const code Screen2_Boxes[2];

extern TScreen RGBLight;
extern TBox Box22;
extern TLabel Label9;
extern TImage Image5;
extern TLabel Label10;
extern TCircle Circle1;
extern TLabel Label11;
extern TLabel Label12;
extern TLabel Label13;
extern TBox RGB_Active_area;
extern TLabel * const code Screen3_Labels[5];
extern TImage * const code Screen3_Images[1];
extern TCircle * const code Screen3_Circles[1];
extern TBox * const code Screen3_Boxes[2];

extern TScreen Clock;
extern TBox Box16;
extern TBox Box15;
extern TBox Box13;
extern TBox Box12;
extern TLabel Label15;
extern TBox Box2;
extern TBox Box3;
extern TLabel Label16;
extern TImage ClockBack;
extern TLabel Label17;
extern TLabel Label18;
extern TImage SyncIcon;
extern TImage Image8;
extern TBox Box4;
extern TBox Box5;
extern TImage Image7;
extern TLabel Label42;
extern TImage Image17;
extern TBox Box14;
extern TLabel * const code Screen4_Labels[5];
extern TImage * const code Screen4_Images[5];
extern TBox * const code Screen4_Boxes[9];

extern TScreen Sensors;
extern TBox Box21;
extern TBox Diagram5_Box1;
extern TImage TempIcon;
extern TImage LightIcon;
extern TLabel Diagram5_Label1;
extern TLabel Diagram5_Label2;
extern TLabel Diagram5_Label3;
extern TLabel Diagram5_Label4;
extern TLabel Diagram5_Label5;
extern TImage BackIconSensors;
extern TLabel Diagram5_Label6;
extern TLabel Label21;
extern TLabel * const code Screen5_Labels[7];
extern TImage * const code Screen5_Images[3];
extern TBox * const code Screen5_Boxes[2];

extern TScreen MP3_SD;
extern TBox Box20;
extern TLabel Label22;
extern TLabel Label23;
extern TImage Image11;
extern TImage Image12;
extern TImage Image13;
extern TImage Image14;
extern TImage mp3_back_icon;
extern TLabel * const code Screen6_Labels[2];
extern TImage * const code Screen6_Images[5];
extern TBox * const code Screen6_Boxes[1];

extern TScreen MP3_SongList;
extern TBox Box19;
extern TBox Box6;
extern TLabel Label24;
extern TImage mp3_back_icon2;
extern TLabel Label26;
extern TImage folder_icon;
extern TImage file_icon;
extern TLabel * const code Screen7_Labels[2];
extern TImage * const code Screen7_Images[3];
extern TBox * const code Screen7_Boxes[2];

extern TScreen MP3_Player;
extern TBox Box17;
extern TLabel Label27;
extern TImage Icon_back_mp3;
extern TBox VolmeBar;
extern TImage Image15;
extern TBox ProgressBar;
extern TLabel Label28;
extern TImage previous_icon;
extern TImage pause_icon;
extern TImage Play_icon;
extern TImage stop_icon;
extern TImage next_icon;
extern TImage songlist_icon;
extern TLabel Label6;
extern TLabel * const code Screen8_Labels[3];
extern TImage * const code Screen8_Images[8];
extern TBox * const code Screen8_Boxes[3];

extern TScreen SlideShow;
extern TBox Box7;
extern TBox icon_previous_box;
extern TBox Icon_next_box;
extern TLabel Label31;
extern TImage back_slide_show;
extern TLabel Label32;
extern TLabel Label33;
extern TImage icon_previous;
extern TImage Icon_next;
extern TLabel Label35;
extern TBox Slide_Active_area;
extern TLabel * const code Screen9_Labels[4];
extern TImage * const code Screen9_Images[3];
extern TBox * const code Screen9_Boxes[4];

extern TScreen Boot;
extern TImage Image4;
extern TImage Image19;
extern TImage Image20;
extern TImage Image21;
extern TImage Image22;
extern TImage Image23;
extern TImage Image24;
extern TImage Image25;
extern TImage Image26;
extern TImage Image27;
extern TImage Image28;
extern TImage Image29;
extern TImage Image30;
extern TImage Image31;
extern TImage Image32;
extern TImage Image33;
extern TImage Image34;
extern TImage Image35;
extern TImage Image36;
extern TImage Image37;
extern TImage Image38;
extern TImage Image39;
extern TImage * const code Screen10_Images[22];




void BackGroundColorOnPress();
void BackIconSensorsOnPress();
void Box10OnClick();
void Box11OnPress();
void Box12OnClick();
void Box12OnPress();
void Box13OnClick();
void Box14OnPress();
void Box2OnPress();
void Box3OnPress();
void Box4OnPress();
void Box5OnPress();
void Box6OnClick();
void Box6OnPress();
void Box7OnDown();
void Box9OnPress();
void Button1OnClick();
void Button2OnClick();
void Button3OnClick();
void Button4OnClick();
void Button5OnClick();
void Button6OnClick();
void Button7OnClick();
void Button8OnClick();
void Button9OnClick();
void CheckBox1OnClick();
void ClockBackOnPress();
void Color01OnPress();
void Color02OnPress();
void Color03OnPress();
void Color04OnPress();
void Color05OnPress();
void Color06OnPress();
void Color07OnPress();
void Color08OnPress();
void Color09OnPress();
void Color10OnPress();
void Color11OnPress();
void Color12OnPress();
void Color13OnPress();
void Color14OnPress();
void Color15OnPress();
void Color16OnPress();
void Color17OnPress();
void Color18OnPress();
void Color19OnPress();
void Color20OnPress();
void Color21OnPress();
void Color22OnPress();
void Color23OnPress();
void Color24OnPress();
void Color25OnPress();
void Color26OnPress();
void Color27OnPress();
void Color28OnPress();
void Color29OnPress();
void Color30OnPress();
void DrawingAreaOnPress();
void EraserOnPress();
void Icon_back_mp3OnClick();
void Icon_next_boxOnPress();
void icon_paint_backOnPress();
void icon_previous_boxOnPress();
void Image15OnPress();
void Image16OnClick();
void Image18OnClick();
void Image1OnPress();
void Image22OnClick();
void Image24OnPress();
void Image2OnPress();
void Image3OnPress();
void Image4OnPress();
void Image5OnPress();
void Image6OnClick();
void Image8OnPress();
void Image9OnPress();
void Label22OnPress();
void Label24OnPress();
void Label27OnPress();
void mp3_back_iconOnPress();
void NewScreenOnPress();
void next_iconOnDown();
void pause_iconOnPress();
void Pen1OnPress();
void Pen2OnPress();
void Pen3OnPress();
void PenOnPress();
void Play_iconOnDown();
void previous_iconOnDown();
void ProgreesBarOnPress();
void RGB_Active_areaOnPress();
void Slide_Active_areaOnPress();
void songlist_iconOnPress();
void stop_iconOnDown();
void VolmeBarOnPress();




extern char Image1_Caption[];
extern char Image3_Caption[];
extern char Label5_Caption[];
extern char Label7_Caption[];
extern char Label8_Caption[];
extern char Image6_Caption[];
extern char Label14_Caption[];
extern char Image10_Caption[];
extern char Label19_Caption[];
extern char Image9_Caption[];
extern char Label20_Caption[];
extern char Image16_Caption[];
extern char Label25_Caption[];
extern char Image18_Caption[];
extern char Label34_Caption[];
extern char BatteryStatus_Caption[];
extern char Box23_Caption[];
extern char Box1_Caption[];
extern char Image2_Caption[];
extern char Label1_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char Box22_Caption[];
extern char Label9_Caption[];
extern char Image5_Caption[];
extern char Label10_Caption[];
extern char Circle1_Caption[];
extern char Label11_Caption[];
extern char Label12_Caption[];
extern char Label13_Caption[];
extern char RGB_Active_area_Caption[];
extern char Box16_Caption[];
extern char Box15_Caption[];
extern char Box13_Caption[];
extern char Box12_Caption[];
extern char Label15_Caption[];
extern char Box2_Caption[];
extern char Box3_Caption[];
extern char Label16_Caption[];
extern char ClockBack_Caption[];
extern char Label17_Caption[];
extern char Label18_Caption[];
extern char SyncIcon_Caption[];
extern char Image8_Caption[];
extern char Box4_Caption[];
extern char Box5_Caption[];
extern char Image7_Caption[];
extern char Label42_Caption[];
extern char Image17_Caption[];
extern char Box14_Caption[];
extern char Box21_Caption[];
extern char Diagram5_Box1_Caption[];
extern char TempIcon_Caption[];
extern char LightIcon_Caption[];
extern char Diagram5_Label1_Caption[];
extern char Diagram5_Label2_Caption[];
extern char Diagram5_Label3_Caption[];
extern char Diagram5_Label4_Caption[];
extern char Diagram5_Label5_Caption[];
extern char BackIconSensors_Caption[];
extern char Diagram5_Label6_Caption[];
extern char Label21_Caption[];
extern char Box20_Caption[];
extern char Label22_Caption[];
extern char Label23_Caption[];
extern char Image11_Caption[];
extern char Image12_Caption[];
extern char Image13_Caption[];
extern char Image14_Caption[];
extern char mp3_back_icon_Caption[];
extern char Box19_Caption[];
extern char Box6_Caption[];
extern char Label24_Caption[];
extern char mp3_back_icon2_Caption[];
extern char Label26_Caption[];
extern char folder_icon_Caption[];
extern char file_icon_Caption[];
extern char Box17_Caption[];
extern char Label27_Caption[];
extern char Icon_back_mp3_Caption[];
extern char VolmeBar_Caption[];
extern char Image15_Caption[];
extern char ProgressBar_Caption[];
extern char Label28_Caption[];
extern char previous_icon_Caption[];
extern char pause_icon_Caption[];
extern char Play_icon_Caption[];
extern char stop_icon_Caption[];
extern char next_icon_Caption[];
extern char songlist_icon_Caption[];
extern char Label6_Caption[];
extern char Box7_Caption[];
extern char icon_previous_box_Caption[];
extern char Icon_next_box_Caption[];
extern char Label31_Caption[];
extern char back_slide_show_Caption[];
extern char Label32_Caption[];
extern char Label33_Caption[];
extern char icon_previous_Caption[];
extern char Icon_next_Caption[];
extern char Label35_Caption[];
extern char Slide_Active_area_Caption[];
extern char Image4_Caption[];
extern char Image19_Caption[];
extern char Image20_Caption[];
extern char Image21_Caption[];
extern char Image22_Caption[];
extern char Image23_Caption[];
extern char Image24_Caption[];
extern char Image25_Caption[];
extern char Image26_Caption[];
extern char Image27_Caption[];
extern char Image28_Caption[];
extern char Image29_Caption[];
extern char Image30_Caption[];
extern char Image31_Caption[];
extern char Image32_Caption[];
extern char Image33_Caption[];
extern char Image34_Caption[];
extern char Image35_Caption[];
extern char Image36_Caption[];
extern char Image37_Caption[];
extern char Image38_Caption[];
extern char Image39_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawCircle(TCircle *ACircle);
void DrawBox(TBox *ABox);
void Check_TP();
void Start_TP();
#line 10 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
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
#line 44 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
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
#line 70 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
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
#line 95 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
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
#line 123 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
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
#line 150 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
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
#line 174 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
void Accel_Stop(){
 Scroll_Undone(_SCROLL_ACCEL_FIRST_LINE, _SCROLL_ACCEL_LAST_LINE);
}
#line 185 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
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
#line 210 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
static void ACCEL_Test(TAccel_values *values) {
 Accel_Average();

 values->Xvalue = readings[0];
 values->Yvalue = readings[1];
 values->Zvalue = readings[2];
}

TAccel_values Accel_vals, Old_Accel_vals = {0, 0, 0};
#line 227 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/ADXL345_main.c"
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