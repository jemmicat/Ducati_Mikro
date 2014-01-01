#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
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
#line 1 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/mikromedia_stm32plus_resources.h"
const code char Open_Sans_Light13x16_Regular[];
const code char Open_Sans_Light16x18_Regular[];
const code char Open_Sans_Light21x24_Regular[];
const code char Open_Sans_Light58x65_Regular[];
const code char Open_Sans46x50_Regular[];
const code char icon_accel_bmp[11558];
const code char icon_rgb_light_bmp[11558];
const code char icon_clock_bmp[11558];
const code char icon_time_bmp[926];
const code char icon_temp_bmp[11558];
const code char icon_mp3_player_bmp[11558];
const code char icon_slide_show_bmp[11558];
const code char icon_battery_bmp[1766];
const code char icon_back_accel_bmp[974];
const code char icon_back_rgb_bmp[974];
const code char icon_back_bmp[974];
const code char icon_sync_bmp[974];
const code char icon_ok_bmp[974];
const code char stripe_green_bmp[53286];
const code char am_pm_bmp[27186];
const code char icon_temp_sensor_bmp[4506];
const code char icon_light_sensor_BMP[4506];
const code char icon_back_sensors_bmp[974];
const code char icon_microsd_bmp[3066];
const code char icon_anim_01_bmp[558];
const code char icon_anim_02_bmp[558];
const code char icon_anim_03_bmp[558];
const code char icon_back_mp3_bmp[974];
const code char icon_folder_bmp[266];
const code char icon_mp3_file_bmp[206];
const code char icon_back_mp3_bmp_1[974];
const code char icon_volume_BMP[500];
const code char icon_prev_bmp[344];
const code char icon_pause_bmp[344];
const code char icon_play_bmp[344];
const code char icon_stop_bmp[344];
const code char icon_next_bmp[344];
const code char icon_playlist_bmp[728];
const code char icon_back_slideshow_bmp[974];
const code char icon_prev_slide_bmp[390];
const code char icon_next_slide_bmp[390];
const code char img0_jpg[11233];
const code char img3_jpg[11274];
const code char img6_jpg[11601];
const code char img9_jpg[11238];
const code char img12_jpg[10927];
const code char img15_jpg[10583];
const code char img18_jpg[10211];
const code char img21_jpg[9782];
const code char img24_jpg[9199];
const code char img27_jpg[8614];
const code char img30_jpg[7878];
const code char img33_jpg[7628];
const code char img36_jpg[8015];
const code char img39_jpg[9281];
const code char img42_jpg[10162];
const code char img45_jpg[11054];
const code char img48_jpg[11818];
const code char img51_jpg[12419];
const code char img54_jpg[12917];
const code char img57_jpg[13432];
const code char img60_jpg[13360];
const code char img63_jpg[13482];
#line 1 "c:/program files (x86)/mikroc pro for arm/include/built_in.h"
#line 1 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__lib_nrf24l01.h"



typedef struct {
 unsigned char _status;
 unsigned int _pipe;
 unsigned char _plos_cnt;
 unsigned char _arc_cnt;
 unsigned char *_pBuff;
} TnRF_Status;

typedef struct RF_Config {
 unsigned char autoTransmitDelay;
 unsigned char autoTransmitCount;
 unsigned char channel;
 unsigned char outputPower;
 unsigned char dataRate;
} TRF_Config;

extern unsigned char TX_pload[];
extern unsigned char RX_pload[];

unsigned char nRF_SPI_RW(unsigned char byte);
unsigned char nRF_SPI_Read(unsigned char reg);
unsigned char nRF_SPI_RW_Reg(unsigned char reg, unsigned char value);
unsigned char nRF_SPI_RW_Reg_IRQ(unsigned char reg, unsigned char value);
unsigned char nRF_SPI_Write_Buf(unsigned char reg, unsigned char *pBuf, unsigned char bytes);
unsigned char nRF_SPI_Read_Buf(unsigned char reg, unsigned char *pBuf, unsigned char bytes);
void nRF_CE_Pin(unsigned char action) ;
void nRF24L01_IRQ(void);
void TIMER2_IRQ(void);
unsigned char nRF_Clear_IRQ(unsigned char irq_flag);
void nRF_Flush_TX(void);
void nRF_Flush_RX(void);
unsigned char nRF_RD_RX_PW_n(unsigned char pipe);
unsigned char nRF_Get_Status(void);
unsigned char nRF_Get_Current_Pipenum(void);
unsigned char nRF_Get_FIFO(void);
unsigned int nRF_Read_RX_Pload(unsigned char *pBuf);
void nRF_Init();
void nRF_TX_Mode_Init_Advanced(unsigned char dataRate, unsigned char autoRetransmitDelay, unsigned char autoRetransmitCount,
 unsigned char outputPower, unsigned char channel);
void nRF_TX_Mode_Init(unsigned char channel);
void nRF_RX_Mode_Init_Advanced(unsigned char dataRate, unsigned char outputPower, unsigned char channel);
void nRF_RX_Mode_Init(unsigned char channel);
void nRF_Process(TnRF_Status *nRFstatus);
void nRF_Write_TX_Pload(unsigned char *pBuf, unsigned char plWidth);
unsigned char nRF_Send_Packet();
unsigned char nRF_Receive_Packet();


int GetOutputPower(unsigned char op);
#line 1 "c:/users/jemmi/desktop/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/nrf24l01_defs.h"
#line 16 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
extern sfr sbit nRF_CS;
extern sfr sbit nRF_CE;
extern sfr sbit nRF_IRQ;


TnRF_Status nRFStatus;
TRF_Config rfConfig;
unsigned char rfState;


void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset);
char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num);

extern const unsigned long game_table_bmp;
extern char TTT_flag;


char RF_used;
#line 42 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void InitTimer5(){
 RCC_APB1ENR.TIM5EN = 1;
 TIM5_CR1.CEN = 0;
 TIM5_PSC = 1199;
 TIM5_ARR = 62500;

 TIM5_DIER.UIE = 1;
 TIM5_CR1.CEN = 1;
}
#line 59 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void InitTimer2(){

 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 0;
 TIM2_ARR = 1200;
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM2_DIER.UIE = 1;

 TIM2_CR1.CEN = 0;
}
#line 77 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void InitExt(){
 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR3 = 0x00000600;
 EXTI_RTSR = 0x00000000;
 EXTI_FTSR = 0x00000400;
 EXTI_IMR |= 0x00000400;

 NVIC_IntEnable(IVT_INT_EXTI15_10);
}
#line 94 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void InitRF(){

 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
 GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);

 nRF_CE = 0;
 nRF_CS = 1;

 InitTimer2();
 InitExt();


 SPI2_Init_Advanced(_SPI_FPCLK_DIV16, _SPI_MASTER | _SPI_8_BIT |
 _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
 &_GPIO_MODULE_SPI2_PB13_14_15);
}
#line 119 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void Start_nRF(){

 rfConfig.autoTransmitDelay =  0xF0 ;
 rfConfig.autoTransmitCount =  0x05 ;
 rfConfig.channel = 64;
 rfConfig.outputPower =  0x06 ;
 rfConfig.dataRate =  0x00 ;


 nRF_Init();
 InitRF();
 Delay_ms(100);

 rfState =  0x01 ;

 nRF_RX_Mode_Init_Advanced(rfConfig.dataRate, rfConfig.outputPower, rfConfig.channel);


 InitTimer5();
 NVIC_IntDisable(IVT_INT_TIM5);

 if (RF_used == 1)
 RF_used = 0;
 else
 RF_used = 1;
}


extern sfr sbit LED_R;
extern sfr sbit LED_G;
extern sfr sbit LED_B;
extern sfr sbit TFT_CS;


unsigned int O_color = 0xDB27;
unsigned int X_color = 0x35E8;
char victory = 0;
char Myturn = 0;


static char OsTurn_cap[] = "O's turn";
static char XsTurn_cap[] = "X's turn";
static char Draw_cap[] = "Draw";
static char XWin_cap[] = "X wins!";
static char OWin_cap[] = "O wins!";
static char YouWin_cap[] = "Winner!";
static char YouLose_cap[] = "Looser!";
static char XO_X_caption[] = "X";
static char XO_O_caption[] = "O";

int RF_cnt = 0;
char RF_Send_Failed = 0;

unsigned int TicTacToe_seconds_cnt;


static char XO_matrix[3][3] = {{0, 0, 0},
 {0, 0, 0},
 {0, 0, 0}};
static char XO_Turn = 1;


static char XO_ID = 2, XO_First_Move = 1;
static char XO_ID2 = 2;
TLabel *LabelArray[9] = {&XO1, &XO2, &XO3, &XO4, &XO5, &XO6, &XO7, &XO8, &XO9};
TButton *ButtonArray[9] = {&Button1, &Button2, &Button3, &Button4, &Button5, &Button6, &Button7, &Button8, &Button9};


struct Tpacket {
 char ID;
 char first_move;
 char Mat[3][3];
 char turn;
} packet;

char XO_Set_New_State(char MatNo);
void UpdateLabel(TLabel * Label, char xo);
void UpdateStatus(char xo);
char XO_Check_For_Victory();
void XO_Victory(char victory_flag);
void LED_Victory_Blink();
void LED_Move();
void Test_Victory();
void XO_Reset();
#line 211 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void ToneA() {
 Sound_Play( 880, 50);
}
void ToneC() {
 Sound_Play(1046, 50);
}
void ToneE() {
 Sound_Play(1318, 50);
}

void LED_Move(){
 Sound_Play(1318, 50);
 Sound_Play(1567, 50);
}

void LED_Victory_Blink(){
char i;
 for (i = 0; i < 5; i ++){
 LED_R = 1;
 ToneA();
 Delay_ms(20);
 LED_R = 0;
 LED_G = 1;
 ToneC();
 Delay_ms(20);
 LED_G = 0;
 LED_B = 1;
 ToneE();
 Delay_ms(20);
 }
 LED_B = 0;
}
#line 251 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void doTicTacToeISR(){
 Label39_Caption[6] = (TicTacToe_seconds_cnt / 60) / 10 + 48;
 Label39_Caption[7] = (TicTacToe_seconds_cnt / 60) % 10 + 48;
 Label39_Caption[9] = (TicTacToe_seconds_cnt % 60) / 10 + 48;
 Label39_Caption[10] = (TicTacToe_seconds_cnt % 60) % 10 + 48;
 RedrawLabel(Box8.Color, &Label39, 100, 22);
}
#line 266 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void UpdateLabel38(char *text, unsigned int color){
 Label38.Font_Color = color;
 Label38.Caption = text;
 RedrawLabel(Box8.Color, &Label38, 120, 50);
}

void XO_Process_Packet(char *receved_packet);
char RF_Send_Move();
#line 281 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void doTicTacToe(){

 if (TTT_flag){
 doTicTacToeISR();
 TTT_flag = 0;
 }

 if (RF_used == 1){

 if (nRF_Receive_Packet()){
 LED_B = 1;
 nRF_Process(&nRFStatus);
 LED_B = 1;
 if(nRFStatus._status ==  0x40 ){
 XO_Process_Packet(RX_pload);
 }
 LED_B = 0;
 }

 if (RF_Send_Failed == 1){
 if (RF_cnt > 1250){
 LED_B = ~LED_B;
 if (RF_Send_Move() == 0)
 RF_Send_Failed = 1;
 else{
 RF_Send_Failed = 0;
 LED_B = 0;
 }
 Delay_ms(10);
 nRF_RX_Mode_Init(64);
 RF_cnt = 0;
 }
 else
 RF_cnt ++;
 }
 }
}
#line 326 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
char RF_Send_Move(){
char i;
char *pMat;
char attempts = 0;

 LED_B = 1;

 nRF_TX_Mode_Init(64);
 pMat = (char*)XO_matrix;
 TX_pload[0] = XO_ID;
 TX_pload[1] = XO_First_Move;
 for (i = 0; i < 9; i ++)
 TX_pload[i + 2] = *pMat ++;
 TX_pload[11] = XO_Turn;

 while (attempts < 2){
 nRF_Send_Packet();
 Delay_ms(50);

 nRF_Process(&nRFStatus);
 Delay_ms(20);
 if (nRFStatus._status ==  0x20 ){
 attempts = 7;
 LED_B = 0;
 return 1;
 }
 else
 attempts ++;
 Delay_ms(10);
 LED_B = ~LED_B;
 }

 LED_B = 0;
 return 0;
}
#line 369 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void XO_Process(char No){
char temp_i, temp_j;

 temp_i = No / 3;
 temp_j = No % 3;

 if (victory == 0){
 if (XO_matrix[temp_i][temp_j] == 2){
 UpdateLabel(LabelArray[No], 1);
 UpdateStatus(1);
 }
 else if (XO_matrix[temp_i][temp_j] == 1){
 UpdateLabel(LabelArray[No], 0);
 UpdateStatus(0);
 }
 }
}

char Check_For_Draw();
#line 395 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void TestDraw(){
 if (victory == 0)
 if (Check_For_Draw() == 1){
 NVIC_IntDisable(IVT_INT_TIM5);
 UpdateLabel38(Draw_cap, CL_WHITE);
 LED_G = 0;
 LED_B = 0;
 LED_R = 0;
 }
}
#line 413 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void XO_Process_Packet(char *receved_packet){
char *ptr1;
char *ptr2;
char i;

 ptr1 = (char*)&packet;

 for (i = 0; i < 12; i ++)
 *ptr1 ++ = *receved_packet ++;

 if (packet.ID != 0){
 ptr1 = (char*)&packet;
 ptr1 += 2;
 ptr2 = (char*)XO_matrix;

 if (packet.ID == XO_ID2){
 if (packet.turn == 0xFF){
 XO_Reset();
 return;
 }
 XO_Turn = packet.turn;
 if (Myturn == 0){
 MyTurn = XO_Turn;
 NVIC_IntEnable(IVT_INT_TIM5);
 }

 for (i = 0; i < 9; i ++){
 if (*ptr1 != *ptr2){
 *ptr2 = *ptr1;
 XO_Process(i);
 LED_G = 1;
 LED_R = 0;
 }
 ptr1 ++;
 ptr2 ++;
 }
 Test_Victory();
 TestDraw();
 }
 }
}
#line 464 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
char XO_Set_New_State(char MatNo){
char temp_i, temp_j;

 temp_i = MatNo / 3;
 temp_j = MatNo % 3;
 if (XO_matrix[temp_i][temp_j] == 0){
 if (XO_Turn == 1){
 XO_matrix[temp_i][temp_j] = 1;
 XO_Turn = 2;
 return 1;
 }
 else if (XO_Turn == 2){
 XO_matrix[temp_i][temp_j] = 2;
 XO_Turn = 1;
 return 2;
 }
 }
 else {
 return 0;
 }
}
#line 493 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void XO_Victory(char victory_flag){
 switch (victory_flag){
 case 1 : {
 TFT_Set_Pen(CL_WHITE, 2);
 TFT_Line(249, 68, 422, 59);
 }; break;
 case 2 : {
 TFT_Set_Pen(CL_WHITE, 2);
 TFT_Line(251, 141, 423, 132);
 }; break;
 case 3 : {
 TFT_Set_Pen(CL_WHITE, 2);
 TFT_Line(256, 211, 428, 202);
 }; break;
 case 4 : {
 TFT_Set_Pen(CL_WHITE, 2);
 TFT_Line(259, 46, 269, 231);
 }; break;
 case 5 : {
 TFT_Set_Pen(CL_WHITE, 2);
 TFT_Line(331, 39, 343, 229);
 }; break;
 case 6 : {
 TFT_Set_Pen(CL_WHITE, 2);
 TFT_Line(406, 36, 418, 226);
 }; break;
 case 7 : {
 TFT_Set_Pen(CL_WHITE, 2);
 TFT_Line(245, 50, 425, 219);
 }; break;
 case 8 : {
 TFT_Set_Pen(CL_WHITE, 2);
 TFT_Line(419, 43, 258, 225);
 }; break;
 }
}
#line 538 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
char Check_For_Draw(){
 char i, j;
 for (i = 0; i < 3; i ++){
 for (j = 0; j < 3; j ++){
 if (XO_matrix[i][j] == 0)
 return 0;
 }
 }
 return 1;
}
#line 556 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
char XO_Check_For_Victory(){
char temp_i, temp_j;

 for (temp_i = 0; temp_i < 3; temp_i ++){
 if (XO_matrix[temp_i][0] != 0)
 if (XO_matrix[temp_i][0] == XO_matrix[temp_i][1])
 if (XO_matrix[temp_i][1] == XO_matrix[temp_i][2])
 return (temp_i + 1);
 }
 for (temp_j = 0; temp_j < 3; temp_j ++){
 if (XO_matrix[0][temp_j] != 0)
 if (XO_matrix[0][temp_j] == XO_matrix[1][temp_j])
 if (XO_matrix[1][temp_j] == XO_matrix[2][temp_j])
 return (temp_j + 4);
 }
 if (XO_matrix[0][0] != 0)
 if (XO_matrix[0][0] == XO_matrix[1][1])
 if (XO_matrix[1][1] == XO_matrix[2][2]){
 return 7;
 }
 if (XO_matrix[0][2] != 0)
 if (XO_matrix[0][2] == XO_matrix[1][1])
 if (XO_matrix[1][1] == XO_matrix[2][0]){
 return 8;
 }
 return 0;
}
#line 591 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void DrawImageLine_TTT(TImage *image, int line, int xcoo1, int xcoo2){
 long count;
 volatile unsigned int color;
 const code char *ptr;
 unsigned long readed;
 unsigned int offset;

 offset = 6 + (unsigned long)(line - Image->Top) * Image->Width + (xcoo1 - Image->Left) * 2;
 TFT_CS = 0;
 ptr = Image->Picture_Name + offset;
 count = (xcoo2 - xcoo1) * 2 - 1;
 TFT_SSD1963_Set_Address_Ptr(xcoo1, line, xcoo2, line);
 color = *ptr++;
 color += (*ptr++) << 8;
 TFT_Write_Data_Ptr(color);
 count -= 2;
 TFT_CS = 1;
}
#line 617 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void ReDrawBackground(TImage *Image, int x1, int x2, int y1, int y2){
int i;

 for (i = 0; i < y2 - y1; i ++){
 DrawImageLine_TTT(Image, y1 + i, x1, x2);
 }
}
#line 632 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void UpdateLabel(TLabel * Label, char xo){
 if (xo){
 Label->Caption = XO_O_caption;
 Label->Font_Color = O_color;
 DrawLabel(Label);
 }
 else{
 Label->Caption = XO_X_caption;
 Label->Font_Color = X_color;
 DrawLabel(Label);
 }
}
#line 652 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void UpdateStatus (char xo){
 if (xo){
 UpdateLabel38(XsTurn_cap, X_color);
 }
 else {
 UpdateLabel38(OsTurn_cap, O_color);
 }
}
#line 668 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void Test_Victory(){
 victory = XO_Check_For_Victory();
 if (victory){
 NVIC_IntDisable(IVT_INT_TIM5);
 XO_Victory(victory);
 if (RF_used){
 if (XO_turn == MyTurn)
 UpdateLabel38(YouLose_cap, CL_BLUE);
 else
 UpdateLabel38(YouWin_cap, CL_RED);
 }
 else{
 if (XO_turn == 2)
 UpdateLabel38(XWin_cap, X_color);
 else if (Xo_turn == 1)
 UpdateLabel38(Owin_cap, O_color);
 }
 LED_Victory_Blink();
 }
 else
 LED_Move();
}
#line 698 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void XO_Reset(){

 memset(XO_matrix, 0, 9);
 victory = 0;
 XO_Turn = 0xFF;


 InitTimer5();
 NVIC_IntDisable(IVT_INT_TIM5);
 TicTacToe_seconds_cnt = 0;
 doTicTacToeISR();

 if (RF_used){
 RF_Send_Move();
 nRF_RX_Mode_Init(64);
 }
 XO_Turn = 1;
 XO_First_Move = 1;
 MyTurn = 0;
 LED_B = 0;
 LED_R = 0;
 LED_G = 0;


 TFT_Ext_Image(220, 16, game_table_bmp, 1);
 Label38.Caption = Label38_Caption;
 ReDrawLabel(Box8.Color, &Label38, 120, 50);
}
#line 734 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Tic_Tac_Toe.c"
void ButtonClick(TButton *Butt, char No){

 if (victory == 0){
 if (MyTurn == 0){
 MyTurn = XO_Turn;
 NVIC_IntEnable(IVT_INT_TIM5);
 }

 if (XO_turn == MyTurn){

 if (XO_Set_New_State(No)){

 XO_Process(No);

 if (RF_used){
 LED_G = 0;
 LED_R = 1;

 if (RF_Send_Move() == 0)
 RF_Send_Failed = 1;
 else
 RF_Send_Failed = 0;

 nRF_RX_Mode_Init(64);
 }
 else{

 MyTurn = XO_Turn;
 if (XO_Turn == 1){
 LED_G = 1;
 LED_B = 0;
 }
 else{
 LED_B = 1;
 LED_G = 0;
 }
 }

 Test_Victory();
 TestDraw();
 XO_First_Move ++;
 }
 }
 }
}
